package com.flight.bean;

public class Cart {
    private Integer id;
    private Integer flightId;
    private Integer userId;
    private Integer ticketNum;
    private double price;
    private String bookingTime;

    @Override
    public String toString() {
        return "Booking{" +
                "id=" + id +
                ", flightId=" + flightId +
                ", userId=" + userId +
                ", ticketNum=" + ticketNum +
                ", price=" + price +
                ", bookingTime='" + bookingTime + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFlightId() {
        return flightId;
    }

    public void setFlightId(Integer flightId) {
        this.flightId = flightId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTicketNum() {
        return ticketNum;
    }

    public void setTicketNum(Integer ticketNum) {
        this.ticketNum = ticketNum;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(String bookingTime) {
        this.bookingTime = bookingTime;
    }
}
