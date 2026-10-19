package com.vehiclerental.model;

import java.time.LocalDate;

/**
 * Card payment. Only the LAST 4 digits of the card are saved, never the full number.
 */
public class CardPayment extends Payment {

    private String cardLast4;

    public CardPayment(String paymentId, String rentalId, String userId, double amount,
                       LocalDate paymentDate, String status, String cardLast4) {
        super(paymentId, rentalId, userId, amount, paymentDate, status);
        this.cardLast4 = cardLast4;
    }

    public String getCardLast4() { return cardLast4; }
    public void setCardLast4(String cardLast4) { this.cardLast4 = cardLast4; }

    @Override
    public String getMethod() { return "CARD"; }

    @Override
    public String getDetailLabel() { return "Card (last 4 digits)"; }

    @Override
    public String getDetailValue() { return cardLast4; }

    @Override
    public String getSummary() { return "Card ending " + cardLast4; }
}
