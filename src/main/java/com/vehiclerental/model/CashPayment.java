package com.vehiclerental.model;

import java.time.LocalDate;

/** Cash paid at a branch counter. Extra detail: the receipt number. */
public class CashPayment extends Payment {

    private String receiptNumber;

    public CashPayment(String paymentId, String rentalId, String userId, double amount,
                       LocalDate paymentDate, String status, String receiptNumber) {
        super(paymentId, rentalId, userId, amount, paymentDate, status);
        this.receiptNumber = receiptNumber;
    }

    public String getReceiptNumber() { return receiptNumber; }
    public void setReceiptNumber(String receiptNumber) { this.receiptNumber = receiptNumber; }

    @Override
    public String getMethod() { return "CASH"; }

    @Override
    public String getDetailLabel() { return "Receipt number"; }

    @Override
    public String getDetailValue() { return receiptNumber; }

    @Override
    public String getSummary() { return "Cash, receipt " + receiptNumber; }
}
