package com.vehiclerental.service;

import com.vehiclerental.model.CardPayment;
import com.vehiclerental.model.CashPayment;
import com.vehiclerental.model.Payment;
import com.vehiclerental.model.Rental;
import com.vehiclerental.util.RentalLookup;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles all reading and writing of data/payments.txt.
 * Each line:  paymentId|rentalId|userId|amount|METHOD|paymentDate|status|detail
 * (detail = receipt number for CASH, last 4 card digits for CARD)
 */
public class PaymentService {

    private static final Path FILE_PATH = Paths.get("data", "payments.txt");

    // ---------- CREATE ----------

    /**
     * Saves a new payment. The service decides the ID, the amount (always the rental total),
     * today's date and the status PAID, so a customer cannot type a different amount.
     */
    public synchronized Payment addPayment(Payment payment) {
        Rental rental = RentalLookup.find(payment.getRentalId());
        if (rental == null) {
            throw new IllegalArgumentException("Rental not found.");
        }
        if (!rental.getUserId().equals(payment.getUserId())) {
            throw new IllegalArgumentException("You can only pay for your own rentals.");
        }
        if (RentalLookup.isCancelled(rental)) {
            throw new IllegalArgumentException("A cancelled rental cannot be paid.");
        }
        List<Payment> payments = getAllPayments();
        if (findPaidForRental(payments, rental.getRentalId(), null) != null) {
            throw new IllegalArgumentException("This rental has already been paid.");
        }

        payment.setPaymentId(generateNextId(payments));
        payment.setAmount(rental.getTotalAmount());
        payment.setPaymentDate(LocalDate.now());
        payment.setStatus(Payment.STATUS_PAID);
        validate(payment);

        payments.add(payment);
        writeAll(payments);
        return payment;
    }

    // ---------- READ ----------

    /** Returns every payment. An empty or missing file gives an empty list. */
    public synchronized List<Payment> getAllPayments() {
        List<Payment> payments = new ArrayList<>();
        ensureFileExists();

        try (BufferedReader reader = Files.newBufferedReader(FILE_PATH, StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                Payment payment = parseLine(line);
                if (payment != null) {
                    payments.add(payment);
                }
            }
        } catch (IOException e) {
            throw new UncheckedIOException("Could not read payments file", e);
        }
        return payments;
    }

    /** Finds one payment by ID, or returns null if not found. */
    public synchronized Payment getPaymentById(String paymentId) {
        for (Payment payment : getAllPayments()) {
            if (payment.getPaymentId().equalsIgnoreCase(paymentId)) {
                return payment;
            }
        }
        return null;
    }

    /** All payments made by one customer. */
    public synchronized List<Payment> getPaymentsByUser(String userId) {
        List<Payment> results = new ArrayList<>();
        for (Payment payment : getAllPayments()) {
            if (payment.getUserId().equals(userId)) {
                results.add(payment);
            }
        }
        return results;
    }

    /** The PAID payment of a rental, or null if the rental is not paid. */
    public synchronized Payment getPaidPaymentForRental(String rentalId) {
        return findPaidForRental(getAllPayments(), rentalId, null);
    }

    /** Search by payment, rental or user ID, and/or by status. Blank arguments are ignored. */
    public synchronized List<Payment> searchPayments(String keyword, String status) {
        String key = (keyword == null) ? "" : keyword.trim().toLowerCase();
        List<Payment> results = new ArrayList<>();
        for (Payment payment : getAllPayments()) {
            boolean matchesKeyword = key.isEmpty()
                    || payment.getPaymentId().toLowerCase().contains(key)
                    || payment.getRentalId().toLowerCase().contains(key)
                    || payment.getUserId().toLowerCase().contains(key);
            boolean matchesStatus = status == null || status.isBlank()
                    || payment.getStatus().equalsIgnoreCase(status.trim());
            if (matchesKeyword && matchesStatus) {
                results.add(payment);
            }
        }
        return results;
    }

    // ---------- UPDATE ----------

    /** Replaces the saved payment that has the same ID (used by the admin to correct or refund). */
    public synchronized boolean updatePayment(Payment updated) {
        validate(updated);
        List<Payment> payments = getAllPayments();

        for (int i = 0; i < payments.size(); i++) {
            if (payments.get(i).getPaymentId().equals(updated.getPaymentId())) {
                if (Payment.STATUS_PAID.equals(updated.getStatus())
                        && findPaidForRental(payments, updated.getRentalId(), updated.getPaymentId()) != null) {
                    throw new IllegalArgumentException("This rental already has another paid payment.");
                }
                payments.set(i, updated);
                writeAll(payments);
                return true;
            }
        }
        return false;
    }

    // ---------- DELETE ----------

    /** Removes the payment with this ID. Returns false if the ID does not exist. */
    public synchronized boolean deletePayment(String paymentId) {
        List<Payment> payments = getAllPayments();
        boolean removed = payments.removeIf(p -> p.getPaymentId().equals(paymentId));
        if (removed) {
            writeAll(payments);
        }
        return removed;
    }

    // ---------- Helper methods (private) ----------

    private void ensureFileExists() {
        try {
            if (FILE_PATH.getParent() != null) {
                Files.createDirectories(FILE_PATH.getParent());
            }
            if (!Files.exists(FILE_PATH)) {
                Files.createFile(FILE_PATH);
            }
        } catch (IOException e) {
            throw new UncheckedIOException("Could not create payments file", e);
        }
    }

    /** Rewrites the whole file from the list. */
    private void writeAll(List<Payment> payments) {
        ensureFileExists();
        try (BufferedWriter writer = Files.newBufferedWriter(FILE_PATH, StandardCharsets.UTF_8)) {
            for (Payment payment : payments) {
                writer.write(payment.toFileString());
                writer.newLine();
            }
        } catch (IOException e) {
            throw new UncheckedIOException("Could not write payments file", e);
        }
    }

    /** Turns one text line into a CashPayment or CardPayment. Bad lines return null and are skipped. */
    private Payment parseLine(String line) {
        if (line == null || line.isBlank()) {
            return null;
        }
        String[] p = line.split("\\|", -1);
        if (p.length != 8) {
            return null;
        }
        try {
            double amount = Double.parseDouble(p[3]);
            LocalDate date = LocalDate.parse(p[5]);
            switch (p[4].trim()) {
                case "CASH":
                    return new CashPayment(p[0], p[1], p[2], amount, date, p[6], p[7]);
                case "CARD":
                    return new CardPayment(p[0], p[1], p[2], amount, date, p[6], p[7]);
                default:
                    return null;
            }
        } catch (NumberFormatException | DateTimeParseException e) {
            return null;
        }
    }

    /** Next ID after the biggest one in the list: P001, P002, ... */
    private String generateNextId(List<Payment> payments) {
        int max = 0;
        for (Payment payment : payments) {
            String id = payment.getPaymentId();
            if (id != null && id.matches("P\\d+")) {
                max = Math.max(max, Integer.parseInt(id.substring(1)));
            }
        }
        return String.format("P%03d", max + 1);
    }

    /** Finds a PAID payment for the rental. A payment with ignoreId is skipped (used when editing). */
    private Payment findPaidForRental(List<Payment> payments, String rentalId, String ignoreId) {
        for (Payment payment : payments) {
            if (payment.getRentalId().equals(rentalId)
                    && Payment.STATUS_PAID.equals(payment.getStatus())
                    && (ignoreId == null || !payment.getPaymentId().equals(ignoreId))) {
                return payment;
            }
        }
        return null;
    }

    /** Stops empty values, bad details and the | character (it is the separator in the file). */
    private void validate(Payment payment) {
        if (payment == null) {
            throw new IllegalArgumentException("Payment cannot be empty.");
        }
        if (payment.getAmount() <= 0) {
            throw new IllegalArgumentException("The amount must be more than 0.");
        }
        String status = payment.getStatus();
        if (!Payment.STATUS_PAID.equals(status) && !Payment.STATUS_REFUNDED.equals(status)) {
            throw new IllegalArgumentException("Status must be PAID or REFUNDED.");
        }
        String detail = payment.getDetailValue();
        if (detail == null || detail.isBlank()) {
            throw new IllegalArgumentException(payment.getDetailLabel() + " is required.");
        }
        if (detail.contains("|")) {
            throw new IllegalArgumentException(payment.getDetailLabel() + " cannot contain the | character.");
        }
        if (payment instanceof CardPayment && !detail.matches("\\d{4}")) {
            throw new IllegalArgumentException("Card last 4 digits must be exactly 4 numbers.");
        }
    }
}
