package com.vehiclerental.model;

public class Admin extends User {

    private String department;

    public Admin(String userId, String name, String email, String phone,
                 String password, String department) {
        super(userId, name, email, phone, password);
        this.department = department;
    }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    @Override
    public String getUserRole() { return "ADMIN"; }

    @Override
    public String toFileString() {
        return super.toFileString() + "|" + department;
    }
}