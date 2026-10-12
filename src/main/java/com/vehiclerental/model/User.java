package com.vehiclerental.model;

public abstract class User {

    // private = hidden from other classes (encapsulation)
    private String userId;
    private String name;
    private String email;
    private String phone;
    private String password;

    public User(String userId, String name, String email, String phone, String password) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.password = password;
    }

    // Getters read a value, setters change it
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    // Each child class must say what its role is (polymorphism)
    public abstract String getUserRole();

    // Turns the object into one line of text for users.txt
    public String toFileString() {
        return userId + "|" + name + "|" + email + "|" + phone + "|" + password + "|" + getUserRole();
    }
}