package com.vehiclerental.model;

import java.time.LocalDate;
import java.util.Locale;

/**
 * A payment for one rental. This is an ABSTRACT class: a payment is always
 * either a CashPayment or a CardPayment (inheritance + abstraction).
 *
 * Saved in data/payments.txt as:
 *   paymentId|rentalId|userId|amount|METHOD|paymentDate|status|detail
 * (detail = receipt number for CASH, last 4 card digits for CARD)
 */
public abstract class Payment {

    public static final String STATUS_PAID = "PAID";
    public static final String STATUS_REFUNDED = "REFUNDED";

    // Encapsulation: private fields, used only through getters and setters
    private String paymentId;
    private String rentalId;    // the rental being paid (ID from rentals.txt)
    private String userId;      // the customer who paid (ID from users.txt)
    private double amount;
    private LocalDate paymentDate;
    private String status;

    public Payment(String paymentId, String rentalId, String userId, double amount,
                   LocalDate paymentDate, String status) {
        this.paymentId = paymentId;
        this.rentalId = rentalId;
        this.userId = userId;
        this.amount = amount;
        this.paymentDate = paymentDate;
        this.status = status;
    }

    public String getPaymentId() { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

    public String getRentalId() { return rentalId; }
    public void setRentalId(String rentalId) { this.rentalId = rentalId; }

    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public LocalDate getPaymentDate() { return paymentDate; }
    public void setPaymentDate(LocalDate paymentDate) { this.paymentDate = paymentDate; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    // ---- Abstract methods: every child class MUST provide its own version ----

    /** "CASH" or "CARD" */
    public abstract String getMethod();

    /** Name of the extra detail, for example "Receipt number" */
    public abstract String getDetailLabel();

    /** Value of the extra detail, as saved in the file */
    public abstract String getDetailValue();

    /** Text shown on pages, for example "Card ending 4321". Each child writes it differently (polymorphism). */
    public abstract String getSummary();

    /** One line of text exactly as it is saved in data/payments.txt */
    public String toFileString() {
        return paymentId + "|" + rentalId + "|" + userId + "|" + String.format(Locale.ROOT, "%.2f", amount) + "|"
                + getMethod() + "|" + paymentDate + "|" + status + "|" + getDetailValue();
    }
}
