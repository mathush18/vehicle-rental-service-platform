
package com.vehiclerental.controller;

import com.vehiclerental.model.Rental;
import com.vehiclerental.service.RentalService;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.time.LocalDate;

@Controller
@RequestMapping("/rentals")
public class RentalController {

    private final RentalService rentalService;

    public RentalController() {
        this.rentalService = new RentalService();
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("rental", new Rental(
                "", "", "",
                LocalDate.now(),
                LocalDate.now().plusDays(1),
                1, 0.0, "CONFIRMED"
        ));
        return "rental/createRental";
    }

    @PostMapping("/create")
    public String createRental(
            @RequestParam String rentalId,
            @RequestParam String userId,
            @RequestParam String vehicleId,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
            LocalDate startDate,
            @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
            LocalDate endDate,
            @RequestParam double pricePerDay,
            Model model) {

        try {
            int days = rentalService.calculateDays(startDate, endDate);
            double total = rentalService.calculateTotal(days, pricePerDay);

            Rental rental = new Rental(
                    rentalId, userId, vehicleId,
                    startDate, endDate, days, total, "CONFIRMED"
            );

            rentalService.createRental(rental);
            return "redirect:/rentals/mine?userId=" + userId;

        } catch (IOException | IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            return "rental/createRental";
        }
    }

    @GetMapping("/mine")
    public String myRentals(@RequestParam String userId, Model model)
            throws IOException {
        model.addAttribute(
                "rentals", rentalService.getRentalsByUserId(userId));
        return "rental/myRentals";
    }

    @GetMapping("/{rentalId}")
    public String rentalDetails(@PathVariable String rentalId, Model model)
            throws IOException {
        Rental rental = rentalService.getRentalById(rentalId);

        if (rental == null) {
            return "redirect:/rentals/mine";
        }

        model.addAttribute("rental", rental);
        return "rental/rentalDetails";
    }

    @PostMapping("/{rentalId}/cancel")
    public String cancelRental(@PathVariable String rentalId)
            throws IOException {
        rentalService.cancelRental(rentalId);
        return "redirect:/rentals/" + rentalId;
    }

    @PostMapping("/{rentalId}/complete")
    public String completeRental(@PathVariable String rentalId)
            throws IOException {
        rentalService.completeRental(rentalId);
        return "redirect:/rentals/" + rentalId;
    }
}
