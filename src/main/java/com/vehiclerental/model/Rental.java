package com.vehiclerental.model;

import java.time.LocalDate;

public class Rental {

    private String rentalId;
    private String userId;
    private String vehicleId;
    private LocalDate startDate;
    private LocalDate endDate;
    private int numberOfDays;
    private double totalAmount;
    private String status;

    public Rental(String rentalId, String userId,
                  String vehicleId, LocalDate startDate,
                  LocalDate endDate, int numberOfDays,
                  double totalAmount, String status) {

        this.rentalId = rentalId;
        this.userId = userId;
        this.vehicleId = vehicleId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.numberOfDays = numberOfDays;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public String getRentalId() {
        return rentalId;
    }

    public String getUserId() {
        return userId;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public int getNumberOfDays() {
        return numberOfDays;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public void setNumberOfDays(int numberOfDays) {
        this.numberOfDays = numberOfDays;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
