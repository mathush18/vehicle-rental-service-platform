package com.vehiclerental.controller;

import com.vehiclerental.model.Admin;
import com.vehiclerental.model.CardPayment;
import com.vehiclerental.model.CashPayment;
import com.vehiclerental.model.Payment;
import com.vehiclerental.model.Rental;
import com.vehiclerental.model.User;
import com.vehiclerental.service.PaymentService;
import com.vehiclerental.service.UserService;
import com.vehiclerental.util.RentalLookup;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Handles all Payment Management web pages.
 * Customers pay for their own rentals and see their payment history.
 * Admins see every payment and can correct, refund or delete them.
 */
@Controller
public class PaymentController {

    private static final String SESSION_USER = "loggedUser";

    private final PaymentService paymentService = new PaymentService();
    private final UserService userService = new UserService();

    // =============== READ: ADMIN LIST ===============

    @GetMapping("/payments")
    public String listPayments(@RequestParam(defaultValue = "") String keyword,
                               @RequestParam(defaultValue = "") String status,
                               HttpSession session,
                               Model model) {
        User user = loggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        if (!isAdmin(user)) {
            return "redirect:/payments/history";
        }
        model.addAttribute("payments", paymentService.searchPayments(keyword, status));
        model.addAttribute("keyword", keyword);
        model.addAttribute("status", status);
        addUserNames(model);
        return "payment/paymentList";
    }

    // =============== READ: PAYMENT HISTORY (customer) ===============

    @GetMapping("/payments/history")
    public String paymentHistory(HttpSession session, Model model) {
        User user = loggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        if (isAdmin(user)) {
            return "redirect:/payments";
        }
        model.addAttribute("payments", paymentService.getPaymentsByUser(user.getUserId()));
        return "payment/paymentHistory";
    }

    // =============== READ: DETAILS ===============

    @GetMapping("/payments/{id}")
    public String showDetails(@PathVariable("id") String id,
                              HttpSession session,
                              Model model,
                              RedirectAttributes redirect) {
        User user = loggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        Payment payment = paymentService.getPaymentById(id);
        if (payment == null || !canAccess(user, payment)) {
            redirect.addFlashAttribute("error", "Payment not found.");
            return "redirect:/payments";
        }
        model.addAttribute("payment", payment);
        model.addAttribute("customer", userService.getUserById(payment.getUserId()));
        model.addAttribute("isAdmin", isAdmin(user));
        return "payment/paymentDetails";
    }

    // =============== CREATE (customer pays for a rental) ===============

    @GetMapping("/payments/add")
    public String showAddForm(@RequestParam(defaultValue = "") String rentalId,
                              HttpSession session,
                              Model model,
                              RedirectAttributes redirect) {
        User user = loggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        Rental rental = payableRental(user, rentalId, redirect);
        if (rental == null) {
            return "redirect:/rentals/mine?userId=" + user.getUserId();
        }
        model.addAttribute("rental", rental);
        model.addAttribute("method", "CARD");
        return "payment/addPayment";
    }

    @PostMapping("/payments/add")
    public String addPayment(@RequestParam String rentalId,
                             @RequestParam String method,
                             @RequestParam(defaultValue = "") String cardNumber,
                             @RequestParam(defaultValue = "") String receiptNumber,
                             HttpSession session,
                             Model model,
                             RedirectAttributes redirect) {
        User user = loggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        Rental rental = payableRental(user, rentalId, redirect);
        if (rental == null) {
            return "redirect:/rentals/mine?userId=" + user.getUserId();
        }
        try {
            Payment payment;
            if ("CASH".equals(method)) {
                payment = new CashPayment("", rentalId, user.getUserId(), 0, null, "", receiptNumber.trim());
            } else {
                // Only the last 4 digits of the card are ever saved
                String digits = cardNumber.replaceAll("\\s", "");
                if (!digits.matches("\\d{16}")) {
                    throw new IllegalArgumentException("Card number must have 16 digits.");
                }
                payment = new CardPayment("", rentalId, user.getUserId(), 0, null, "",
                        digits.substring(12));
            }
            Payment saved = paymentService.addPayment(payment);
            redirect.addFlashAttribute("success", "Payment " + saved.getPaymentId() + " was successful.");
            return "redirect:/payments/" + saved.getPaymentId();
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("rental", rental);
            model.addAttribute("method", method);
            model.addAttribute("receiptNumber", receiptNumber);
            return "payment/addPayment";
        }
    }

    // =============== UPDATE (admin) ===============

    @GetMapping("/payments/{id}/edit")
    public String showEditForm(@PathVariable("id") String id,
                               HttpSession session,
                               Model model,
                               RedirectAttributes redirect) {
        String denied = adminOnly(session, redirect);
        if (denied != null) {
            return denied;
        }
        Payment payment = paymentService.getPaymentById(id);
        if (payment == null) {
            redirect.addFlashAttribute("error", "Payment not found.");
            return "redirect:/payments";
        }
        model.addAttribute("payment", payment);
        return "payment/editPayment";
    }

    @PostMapping("/payments/{id}/edit")
    public String editPayment(@PathVariable("id") String id,
                              @RequestParam String method,
                              @RequestParam String detail,
                              @RequestParam String status,
                              HttpSession session,
                              Model model,
                              RedirectAttributes redirect) {
        String denied = adminOnly(session, redirect);
        if (denied != null) {
            return denied;
        }
        Payment existing = paymentService.getPaymentById(id);
        if (existing == null) {
            redirect.addFlashAttribute("error", "Payment not found.");
            return "redirect:/payments";
        }
        // The amount, rental, customer and date stay the same. Only method, detail and status can change.
        Payment updated;
        if ("CASH".equals(method)) {
            updated = new CashPayment(id, existing.getRentalId(), existing.getUserId(), existing.getAmount(),
                    existing.getPaymentDate(), status.trim(), detail.trim());
        } else {
            updated = new CardPayment(id, existing.getRentalId(), existing.getUserId(), existing.getAmount(),
                    existing.getPaymentDate(), status.trim(), detail.trim());
        }
        try {
            paymentService.updatePayment(updated);
            redirect.addFlashAttribute("success", "Payment " + id + " was updated.");
            return "redirect:/payments/" + id;
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("payment", updated);
            return "payment/editPayment";
        }
    }

    // =============== DELETE (admin) ===============

    @PostMapping("/payments/{id}/delete")
    public String deletePayment(@PathVariable("id") String id,
                                HttpSession session,
                                RedirectAttributes redirect) {
        String denied = adminOnly(session, redirect);
        if (denied != null) {
            return denied;
        }
        if (paymentService.deletePayment(id)) {
            redirect.addFlashAttribute("success", "Payment " + id + " was deleted.");
        } else {
            redirect.addFlashAttribute("error", "Payment not found.");
        }
        return "redirect:/payments";
    }

    // =============== Helper methods (private) ===============

    /**
     * Returns the rental if this customer may pay for it now, otherwise null
     * (with an error message for the next page).
     */
    private Rental payableRental(User user, String rentalId, RedirectAttributes redirect) {
        if (isAdmin(user)) {
            redirect.addFlashAttribute("error", "Only customers can make a payment.");
            return null;
        }
        Rental rental = RentalLookup.find(rentalId);
        if (rental == null || !rental.getUserId().equals(user.getUserId())) {
            redirect.addFlashAttribute("error", "Rental not found.");
            return null;
        }
        if (RentalLookup.isCancelled(rental)) {
            redirect.addFlashAttribute("error", "A cancelled rental cannot be paid.");
            return null;
        }
        if (paymentService.getPaidPaymentForRental(rentalId) != null) {
            redirect.addFlashAttribute("error", "This rental has already been paid.");
            return null;
        }
        return rental;
    }

    private void addUserNames(Model model) {
        Map<String, String> userNames = new LinkedHashMap<>();
        for (User user : userService.getAllUsers()) {
            userNames.put(user.getUserId(), user.getName());
        }
        model.addAttribute("userNames", userNames);
    }

    /** The logged-in user stored in the session by the login page, or null. */
    private User loggedIn(HttpSession session) {
        Object value = session.getAttribute(SESSION_USER);
        return (value instanceof User) ? (User) value : null;
    }

    private boolean isAdmin(User user) {
        return user instanceof Admin;
    }

    /** An admin can open any payment. A customer can only open their own. */
    private boolean canAccess(User user, Payment payment) {
        return isAdmin(user) || payment.getUserId().equals(user.getUserId());
    }

    private String adminOnly(HttpSession session, RedirectAttributes redirect) {
        User user = loggedIn(session);
        if (user == null) {
            return "redirect:/login";
        }
        if (!isAdmin(user)) {
            redirect.addFlashAttribute("error", "Only administrators can do that.");
            return "redirect:/payments/history";
        }
        return null;
    }
}
