package com.vehiclerental.controller;

import com.vehiclerental.model.Admin;
import com.vehiclerental.model.Customer;
import com.vehiclerental.model.User;
import com.vehiclerental.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles all User Management web pages.
 * The controller receives the browser request, asks UserService to do the work,
 * then chooses which JSP page to show.
 */
@Controller
public class UserController {

    private static final String SESSION_USER = "loggedUser";

    private final UserService userService = new UserService();

    // =============== LOGIN / LOGOUT ===============

    @GetMapping("/login")
    public String showLogin() {
        return "user/login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        HttpSession session,
                        Model model) {
        User user = userService.login(email.trim(), password);
        if (user == null) {
            model.addAttribute("error", "Invalid email or password.");
            model.addAttribute("email", email);
            return "user/login";
        }
        session.setAttribute(SESSION_USER, user);
        return "redirect:/profile";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, RedirectAttributes redirect) {
        session.invalidate();
        return "redirect:/login?loggedOut";
    }

    // =============== CREATE: REGISTER ===============

    @GetMapping("/register")
    public String showRegister() {
        return "user/register";
    }

    @PostMapping("/register")
    public String register(@RequestParam String name,
                           @RequestParam String email,
                           @RequestParam String phone,
                           @RequestParam String licenseNumber,
                           @RequestParam String password,
                           @RequestParam String confirmPassword,
                           Model model,
                           RedirectAttributes redirect) {
        try {
            if (!password.equals(confirmPassword)) {
                throw new IllegalArgumentException("Passwords do not match.");
            }
            // Public registration always creates a Customer
            Customer customer = new Customer("", name.trim(), email.trim(), phone.trim(),
                    password, licenseNumber.trim());
            userService.addUser(customer);
            redirect.addFlashAttribute("success", "Registration successful. Please log in.");
            return "redirect:/login";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            // Send the typed values back so the user does not retype everything
            model.addAttribute("name", name);
            model.addAttribute("email", email);
            model.addAttribute("phone", phone);
            model.addAttribute("licenseNumber", licenseNumber);
            return "user/register";
        }
    }

    // =============== READ: PROFILE ===============

    @GetMapping("/profile")
    public String showProfile(HttpSession session, Model model) {
        User user = currentUser(session);
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("profile", user);
        return "user/profile";
    }

    // =============== UPDATE: EDIT PROFILE ===============

    @GetMapping("/profile/edit")
    public String showEditProfile(HttpSession session, Model model) {
        User user = currentUser(session);
        if (user == null) {
            return "redirect:/login";
        }
        model.addAttribute("profile", user);
        return "user/editProfile";
    }

    @PostMapping("/profile/edit")
    public String editProfile(@RequestParam String name,
                              @RequestParam String email,
                              @RequestParam String phone,
                              @RequestParam String extra,
                              @RequestParam(defaultValue = "") String newPassword,
                              HttpSession session,
                              Model model,
                              RedirectAttributes redirect) {
        User current = currentUser(session);
        if (current == null) {
            return "redirect:/login";
        }

        // A blank password box means "keep my old password"
        String password = newPassword.isBlank() ? current.getPassword() : newPassword;

        User updated;
        if (current instanceof Admin) {
            updated = new Admin(current.getUserId(), name.trim(), email.trim(), phone.trim(), password, extra.trim());
        } else {
            updated = new Customer(current.getUserId(), name.trim(), email.trim(), phone.trim(), password, extra.trim());
        }

        try {
            userService.updateUser(updated);
            session.setAttribute(SESSION_USER, updated);
            redirect.addFlashAttribute("success", "Profile updated successfully.");
            return "redirect:/profile";
        } catch (IllegalArgumentException e) {
            model.addAttribute("error", e.getMessage());
            model.addAttribute("profile", updated);
            return "user/editProfile";
        }
    }

    // =============== DELETE: OWN ACCOUNT ===============

    @PostMapping("/profile/delete")
    public String deleteOwnAccount(HttpSession session) {
        User user = currentUser(session);
        if (user == null) {
            return "redirect:/login";
        }
        userService.deleteUser(user.getUserId());
        session.invalidate();
        return "redirect:/login?deleted";
    }

    // =============== ADMIN: USER LIST, SEARCH, DELETE ===============

    @GetMapping("/users")
    public String listUsers(@RequestParam(defaultValue = "") String keyword,
                            HttpSession session,
                            Model model,
                            RedirectAttributes redirect) {
        User user = currentUser(session);
        if (user == null) {
            return "redirect:/login";
        }
        if (!(user instanceof Admin)) {
            redirect.addFlashAttribute("error", "Only administrators can view the user list.");
            return "redirect:/profile";
        }
        model.addAttribute("users", userService.searchUsers(keyword));
        model.addAttribute("keyword", keyword);
        return "user/userList";
    }

    @PostMapping("/users/{id}/delete")
    public String deleteUser(@PathVariable("id") String id,
                             HttpSession session,
                             RedirectAttributes redirect) {
        User user = currentUser(session);
        if (user == null) {
            return "redirect:/login";
        }
        if (!(user instanceof Admin)) {
            redirect.addFlashAttribute("error", "Only administrators can delete users.");
            return "redirect:/profile";
        }
        if (user.getUserId().equals(id)) {
            redirect.addFlashAttribute("error", "You cannot delete your own account from this list.");
            return "redirect:/users";
        }
        if (userService.deleteUser(id)) {
            redirect.addFlashAttribute("success", "User " + id + " was deleted.");
        } else {
            redirect.addFlashAttribute("error", "User " + id + " was not found.");
        }
        return "redirect:/users";
    }

    // =============== Helper ===============

    /** Returns the logged-in user (fresh from the file), or null if nobody is logged in. */
    private User currentUser(HttpSession session) {
        Object saved = session.getAttribute(SESSION_USER);
        if (!(saved instanceof User)) {
            return null;
        }
        User fresh = userService.getUserById(((User) saved).getUserId());
        if (fresh == null) {
            session.invalidate();   // account no longer exists
        }
        return fresh;
    }
}