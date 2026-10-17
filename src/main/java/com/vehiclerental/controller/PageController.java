package com.vehiclerental.controller;

import jakarta.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

/** Task 1: view rendering only. No services, sessions, permissions or persistence. */
@Controller
public class PageController {
    @GetMapping({
        "/customer/dashboard",
        "/owner/dashboard",
        "/admin/dashboard",
        "/customer/vehicles",
        "/owner/vehicles",
        "/admin/vehicles",
        "/customer/vehicles/details",
        "/owner/vehicles/details",
        "/admin/vehicles/details",
        "/owner/vehicles/add",
        "/owner/vehicles/edit",
        "/admin/vehicles/add",
        "/admin/vehicles/edit",
        "/customer/rentals/create",
        "/customer/rentals/confirmation",
        "/customer/rentals",
        "/customer/rentals/details",
        "/owner/rental-requests",
        "/admin/rentals",
        "/customer/payments",
        "/owner/payments",
        "/admin/payments",
        "/owner/earnings",
        "/customer/reviews",
        "/customer/reviews/add",
        "/customer/reviews/edit",
        "/customer/branches",
        "/customer/profile",
        "/owner/profile",
        "/admin/profile",
        "/admin/users",
        "/admin/branches",
        "/admin/branches/add",
        "/admin/branches/edit",
        "/admin/branches/details",
        "/admin/reviews",
        "/admin/reports",
        "/instructions",
        "/",
        "/dashboard",
        "/rentals",
        "/payments",
        "/branches",
        "/reviews",
        "/vehicles/add",
        "/vehicles/edit",
        "/vehicles/details"
    })
    public String page(HttpServletRequest request) {
        String path = request.getRequestURI().substring(request.getContextPath().length());
        return switch (path) {
            case "/customer/dashboard" -> "customer/dashboard";
            case "/owner/dashboard" -> "owner/dashboard";
            case "/admin/dashboard" -> "admin/dashboard";
            case "/customer/vehicles" -> "customer/vehicles";
            case "/owner/vehicles" -> "owner/myVehicles";
            case "/admin/vehicles" -> "admin/vehicles";
            case "/customer/vehicles/details" -> "customer/vehicleDetails";
            case "/owner/vehicles/details" -> "owner/vehicleDetails";
            case "/admin/vehicles/details" -> "admin/vehicleDetails";
            case "/owner/vehicles/add" -> "owner/addVehicle";
            case "/owner/vehicles/edit" -> "owner/editVehicle";
            case "/admin/vehicles/add" -> "admin/addVehicle";
            case "/admin/vehicles/edit" -> "admin/editVehicle";
            case "/customer/rentals/create" -> "customer/createRental";
            case "/customer/rentals/confirmation" -> "customer/rentalConfirmation";
            case "/customer/rentals" -> "customer/myRentals";
            case "/customer/rentals/details" -> "customer/rentalDetails";
            case "/owner/rental-requests" -> "owner/rentalRequests";
            case "/admin/rentals" -> "admin/rentals";
            case "/customer/payments" -> "customer/payments";
            case "/owner/payments" -> "owner/payments";
            case "/admin/payments" -> "admin/payments";
            case "/owner/earnings" -> "owner/earnings";
            case "/customer/reviews" -> "customer/reviews";
            case "/customer/reviews/add" -> "customer/addReview";
            case "/customer/reviews/edit" -> "customer/editReview";
            case "/customer/branches" -> "customer/branches";
            case "/customer/profile" -> "customer/profile";
            case "/owner/profile" -> "owner/profile";
            case "/admin/profile" -> "admin/profile";
            case "/admin/users" -> "admin/users";
            case "/admin/branches" -> "admin/branches";
            case "/admin/branches/add" -> "admin/addBranch";
            case "/admin/branches/edit" -> "admin/editBranch";
            case "/admin/branches/details" -> "admin/branchDetails";
            case "/admin/reviews" -> "admin/reviews";
            case "/admin/reports" -> "admin/reports";
            case "/instructions" -> "auth/instructions";
            case "/" -> "auth/login";
            case "/dashboard" -> "customer/dashboard";
            case "/rentals" -> "customer/myRentals";
            case "/payments" -> "customer/payments";
            case "/branches" -> "customer/branches";
            case "/reviews" -> "customer/reviews";
            case "/vehicles/add" -> "owner/addVehicle";
            case "/vehicles/edit" -> "owner/editVehicle";
            case "/vehicles/details" -> "customer/vehicleDetails";
            default -> throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        };
    }
}
