package com.vehiclerental.service;

import com.vehiclerental.model.Admin;
import com.vehiclerental.model.Customer;
import com.vehiclerental.model.User;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.UncheckedIOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Handles all reading and writing of data/users.txt.
 * Each line:  userId|name|email|phone|password|ROLE|extra
 * (extra = licenseNumber for CUSTOMER, department for ADMIN)
 */
public class UserService {

    // Relative path, so it works on every team member's computer
    private static final Path FILE_PATH = Paths.get("data", "users.txt");

    // ---------- CREATE ----------

    /** Adds a new user. The ID (U001, U002...) is generated automatically. */
    public synchronized User addUser(User user) {
        validate(user);
        List<User> users = getAllUsers();

        if (findByEmail(users, user.getEmail()) != null) {
            throw new IllegalArgumentException("This email is already registered.");
        }

        user.setUserId(generateNextId(users));
        users.add(user);
        writeAll(users);
        return user;
    }

    // ---------- READ ----------

    /** Returns every user in the file. An empty or missing file gives an empty list. */
    public synchronized List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        ensureFileExists();

        try (BufferedReader reader = Files.newBufferedReader(FILE_PATH, StandardCharsets.UTF_8)) {
            String line;
            while ((line = reader.readLine()) != null) {
                User user = parseLine(line);
                if (user != null) {
                    users.add(user);
                }
            }
        } catch (IOException e) {
            throw new UncheckedIOException("Could not read users file", e);
        }
        return users;
    }

    /** Finds one user by ID, or returns null if not found. */
    public synchronized User getUserById(String userId) {
        for (User user : getAllUsers()) {
            if (user.getUserId().equalsIgnoreCase(userId)) {
                return user;
            }
        }
        return null;
    }

    /** Searches by ID, name or email (part of the text is enough). */
    public synchronized List<User> searchUsers(String keyword) {
        List<User> results = new ArrayList<>();
        if (keyword == null || keyword.isBlank()) {
            return getAllUsers();
        }
        String key = keyword.trim().toLowerCase();
        for (User user : getAllUsers()) {
            if (user.getUserId().toLowerCase().contains(key)
                    || user.getName().toLowerCase().contains(key)
                    || user.getEmail().toLowerCase().contains(key)) {
                results.add(user);
            }
        }
        return results;
    }

    /** Used by the login page. Returns the user if email and password match, otherwise null. */
    public synchronized User login(String email, String password) {
        if (email == null || password == null) {
            return null;
        }
        User user = findByEmail(getAllUsers(), email);
        if (user != null && user.getPassword().equals(password)) {
            return user;
        }
        return null;
    }

    // ---------- UPDATE ----------

    /** Replaces the saved user that has the same ID. Returns false if the ID does not exist. */
    public synchronized boolean updateUser(User updated) {
        validate(updated);
        List<User> users = getAllUsers();

        for (int i = 0; i < users.size(); i++) {
            if (users.get(i).getUserId().equals(updated.getUserId())) {
                User sameEmail = findByEmail(users, updated.getEmail());
                if (sameEmail != null && !sameEmail.getUserId().equals(updated.getUserId())) {
                    throw new IllegalArgumentException("This email is already used by another user.");
                }
                users.set(i, updated);
                writeAll(users);
                return true;
            }
        }
        return false;
    }

    // ---------- DELETE ----------

    /** Removes the user with this ID. Returns false if the ID does not exist. */
    public synchronized boolean deleteUser(String userId) {
        List<User> users = getAllUsers();
        boolean removed = users.removeIf(u -> u.getUserId().equals(userId));
        if (removed) {
            writeAll(users);
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
            throw new UncheckedIOException("Could not create users file", e);
        }
    }

    /** Rewrites the whole file from the list. */
    private void writeAll(List<User> users) {
        ensureFileExists();
        try (BufferedWriter writer = Files.newBufferedWriter(FILE_PATH, StandardCharsets.UTF_8)) {
            for (User user : users) {
                writer.write(user.toFileString());
                writer.newLine();
            }
        } catch (IOException e) {
            throw new UncheckedIOException("Could not write users file", e);
        }
    }

    /** Turns one text line into a Customer or Admin. Bad lines return null and are skipped. */
    private User parseLine(String line) {
        if (line == null || line.isBlank()) {
            return null;
        }
        String[] p = line.split("\\|", -1);
        if (p.length != 7) {
            return null;
        }
        String role = p[5].trim();
        if (role.equals("CUSTOMER")) {
            return new Customer(p[0], p[1], p[2], p[3], p[4], p[6]);
        } else if (role.equals("ADMIN")) {
            return new Admin(p[0], p[1], p[2], p[3], p[4], p[6]);
        }
        return null;
    }

    /** Next ID after the biggest one in the list: U001, U002, ... */
    private String generateNextId(List<User> users) {
        int max = 0;
        for (User user : users) {
            String id = user.getUserId();
            if (id != null && id.matches("U\\d+")) {
                max = Math.max(max, Integer.parseInt(id.substring(1)));
            }
        }
        return String.format("U%03d", max + 1);
    }

    private User findByEmail(List<User> users, String email) {
        for (User user : users) {
            if (user.getEmail().equalsIgnoreCase(email)) {
                return user;
            }
        }
        return null;
    }

    /** Stops empty values and the | character (it is the separator in the file). */
    private void validate(User user) {
        if (user == null) {
            throw new IllegalArgumentException("User cannot be empty.");
        }
        checkField("Name", user.getName());
        checkField("Email", user.getEmail());
        checkField("Phone", user.getPhone());
        checkField("Password", user.getPassword());

        if (!user.getEmail().matches("^[^@\\s|]+@[^@\\s|]+\\.[^@\\s|]+$")) {
            throw new IllegalArgumentException("Please enter a valid email address.");
        }
        if (!user.getPhone().matches("\\d{9,12}")) {
            throw new IllegalArgumentException("Phone number must contain 9 to 12 digits.");
        }
        if (user.getPassword().length() < 6) {
            throw new IllegalArgumentException("Password must be at least 6 characters.");
        }
        if (user instanceof Customer) {
            checkField("License number", ((Customer) user).getLicenseNumber());
        } else if (user instanceof Admin) {
            checkField("Department", ((Admin) user).getDepartment());
        }
    }

    private void checkField(String label, String value) {
        if (value == null || value.isBlank()) {
            throw new IllegalArgumentException(label + " is required.");
        }
        if (value.contains("|")) {
            throw new IllegalArgumentException(label + " cannot contain the | character.");
        }
    }
}