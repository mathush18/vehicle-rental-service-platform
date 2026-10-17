
package com.vehiclerental.service;

import com.vehiclerental.model.Rental;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.List;

public class RentalService {

    private final Path filePath = Paths.get("data", "rentals.txt");

    public RentalService() {
        try {
            if (filePath.getParent() != null) {
                Files.createDirectories(filePath.getParent());
            }
            if (Files.notExists(filePath)) {
                Files.createFile(filePath);
            }
        } catch (IOException e) {
            throw new RuntimeException("Could not create rentals file", e);
        }
    }

    public int calculateDays(LocalDate startDate, LocalDate endDate) {
        if (startDate == null || endDate == null
                || !endDate.isAfter(startDate)) {
            throw new IllegalArgumentException(
                    "End date must be after start date");
        }

        return (int) ChronoUnit.DAYS.between(startDate, endDate);
    }

    public double calculateTotal(int days, double pricePerDay) {
        if (days <= 0 || pricePerDay < 0) {
            throw new IllegalArgumentException("Invalid rental amount");
        }

        return days * pricePerDay;
    }

    public void createRental(Rental rental) throws IOException {
        List<Rental> rentals = getAllRentals();

        for (Rental existing : rentals) {
            if (existing.getRentalId().equals(rental.getRentalId())) {
                throw new IllegalArgumentException("Rental ID already exists");
            }
        }

        String line = toLine(rental);

        Files.writeString(
                filePath,
                line + System.lineSeparator(),
                StandardOpenOption.CREATE,
                StandardOpenOption.APPEND
        );
    }

    public List<Rental> getAllRentals() throws IOException {
        List<Rental> rentals = new ArrayList<>();

        if (Files.notExists(filePath)) {
            return rentals;
        }

        for (String line : Files.readAllLines(filePath)) {
            if (line.isBlank()) {
                continue;
            }

            String[] data = line.split(",", -1);

            if (data.length != 8) {
                continue;
            }

            rentals.add(new Rental(
                    data[0],
                    data[1],
                    data[2],
                    LocalDate.parse(data[3]),
                    LocalDate.parse(data[4]),
                    Integer.parseInt(data[5]),
                    Double.parseDouble(data[6]),
                    data[7]
            ));
        }

        return rentals;
    }

    public Rental getRentalById(String rentalId) throws IOException {
        for (Rental rental : getAllRentals()) {
            if (rental.getRentalId().equals(rentalId)) {
                return rental;
            }
        }

        return null;
    }

    public List<Rental> getRentalsByUserId(String userId)
            throws IOException {
        List<Rental> result = new ArrayList<>();

        for (Rental rental : getAllRentals()) {
            if (rental.getUserId().equals(userId)) {
                result.add(rental);
            }
        }

        return result;
    }

    public void updateRental(Rental updatedRental) throws IOException {
        List<Rental> rentals = getAllRentals();
        boolean found = false;

        for (int i = 0; i < rentals.size(); i++) {
            Rental current = rentals.get(i);

            if (current.getRentalId().equals(updatedRental.getRentalId())) {
                if (!current.getStatus().equals("CONFIRMED")) {
                    throw new IllegalStateException(
                            "Only confirmed rentals can be updated");
                }

                rentals.set(i, updatedRental);
                found = true;
                break;
            }
        }

        if (!found) {
            throw new IllegalArgumentException("Rental not found");
        }

        saveAllRentals(rentals);
    }

    public void cancelRental(String rentalId) throws IOException {
        List<Rental> rentals = getAllRentals();
        boolean found = false;

        for (Rental rental : rentals) {
            if (rental.getRentalId().equals(rentalId)) {
                if (!rental.getStatus().equals("CONFIRMED")) {
                    throw new IllegalStateException(
                            "Only confirmed rentals can be cancelled");
                }

                rental.setStatus("CANCELLED");
                found = true;
                break;
            }
        }

        if (!found) {
            throw new IllegalArgumentException("Rental not found");
        }

        saveAllRentals(rentals);
    }

    public void completeRental(String rentalId) throws IOException {
        List<Rental> rentals = getAllRentals();
        boolean found = false;

        for (Rental rental : rentals) {
            if (rental.getRentalId().equals(rentalId)) {
                if (!rental.getStatus().equals("CONFIRMED")) {
                    throw new IllegalStateException(
                            "Only confirmed rentals can be completed");
                }

                rental.setStatus("COMPLETED");
                found = true;
                break;
            }
        }

        if (!found) {
            throw new IllegalArgumentException("Rental not found");
        }

        saveAllRentals(rentals);
    }

    private void saveAllRentals(List<Rental> rentals) throws IOException {
        List<String> lines = new ArrayList<>();

        for (Rental rental : rentals) {
            lines.add(toLine(rental));
        }

        Files.write(
                filePath,
                lines,
                StandardOpenOption.CREATE,
                StandardOpenOption.TRUNCATE_EXISTING
        );
    }

    private String toLine(Rental rental) {
        return rental.getRentalId() + ","
                + rental.getUserId() + ","
                + rental.getVehicleId() + ","
                + rental.getStartDate() + ","
                + rental.getEndDate() + ","
                + rental.getNumberOfDays() + ","
                + rental.getTotalAmount() + ","
                + rental.getStatus();
    }
}
