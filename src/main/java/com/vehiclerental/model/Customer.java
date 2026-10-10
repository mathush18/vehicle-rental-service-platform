package com.vehiclerental.model;

public class Customer extends User {

    private String licenseNumber;

    public Customer(String userId, String name, String email, String phone,
                    String password, String licenseNumber) {
        super(userId, name, email, phone, password);
        this.licenseNumber = licenseNumber;
    }

    public String getLicenseNumber() { return licenseNumber; }
    public void setLicenseNumber(String licenseNumber) { this.licenseNumber = licenseNumber; }

    @Override
    public String getUserRole() { return "CUSTOMER"; }

    @Override
    public String toFileString() {
        return super.toFileString() + "|" + licenseNumber;
    }
}