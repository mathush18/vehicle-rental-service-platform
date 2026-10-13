
package com.vehiclerental.model;

public class Review {
    private String reviewId;
    private String userId;
    private String vehicleId;
    private int rating;
    private String comment;

    public Review(String reviewId, String userId, String vehicleId,
                  int rating, String comment) {
        this.reviewId = reviewId;
        this.userId = userId;
        this.vehicleId = vehicleId;

        if (rating >= 1 && rating <= 5) {
            this.rating = rating;
        } else {
            this.rating = 0;
        }

        this.comment = comment;
    }

    public String getReviewId() {
        return reviewId;
    }

    public String getUserId() {
        return userId;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public int getRating() {
        return rating;
    }

    public String getComment() {
        return comment;
    }

    public void setRating(int rating) {
        if (rating >= 1 && rating <= 5) {
            this.rating = rating;
        }
    }

    public void setComment(String comment) {
        this.comment = comment;
    }
}
