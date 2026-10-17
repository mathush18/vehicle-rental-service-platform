package com.vehiclerental.util;

import com.vehiclerental.model.Rental;
import com.vehiclerental.service.RentalService;

import java.util.ArrayList;
import java.util.List;

/**
 * Small helper used by the Payment and Review modules to ask "which rentals exist?".
 * It only uses getAllRentals() and the plain getters of Rental, so it works with the
 * Rental module as it is written by the Rental member, whatever else that module adds.
 */
public final class RentalLookup {

    private RentalLookup() {
    }

    /** Every rental in the file. Returns an empty list if the file cannot be read. */
    public static List<Rental> all() {
        try {
            List<Rental> rentals = new RentalService().getAllRentals();
            return rentals == null ? new ArrayList<>() : rentals;
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }

    /** The rental with this ID, or null. */
    public static Rental find(String rentalId) {
        if (rentalId == null) {
            return null;
        }
        for (Rental rental : all()) {
            if (rentalId.equals(rental.getRentalId())) {
                return rental;
            }
        }
        return null;
    }

    /** All rentals of one customer. */
    public static List<Rental> forUser(String userId) {
        List<Rental> result = new ArrayList<>();
        for (Rental rental : all()) {
            if (rental.getUserId() != null && rental.getUserId().equals(userId)) {
                result.add(rental);
            }
        }
        return result;
    }

    public static boolean isCancelled(Rental rental) {
        return rental != null && "CANCELLED".equalsIgnoreCase(rental.getStatus());
    }

    /** True if this customer has a rental of this vehicle that was not cancelled. */
    public static boolean hasRented(String userId, String vehicleId) {
        for (Rental rental : forUser(userId)) {
            if (vehicleId != null && vehicleId.equals(rental.getVehicleId()) && !isCancelled(rental)) {
                return true;
            }
        }
        return false;
    }
}
