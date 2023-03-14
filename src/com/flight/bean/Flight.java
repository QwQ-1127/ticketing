package com.flight.bean;

public class Flight {
    private Integer  id;
    private String flightNo;
    private String origin;
    private String destination;
    private String departureTimed;
    private String departureTimet;
    private String arrivalTime;
    private Double price;

    @Override
    public String toString() {
        return "Flight{" +
                "id=" + id +
                ", flightNo='" + flightNo + '\'' +
                ", origin='" + origin + '\'' +
                ", destination='" + destination + '\'' +
                ", departureTimed='" + departureTimed + '\'' +
                ", departureTimet='" + departureTimet + '\'' +
                ", arrivalTime='" + arrivalTime + '\'' +
                ", price=" + price +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFlightNo() {
        return flightNo;
    }

    public void setFlightNo(String flightNo) {
        this.flightNo = flightNo;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDepartureTimed() {
        return departureTimed;
    }

    public void setDepartureTimed(String departureTimed) {
        this.departureTimed = departureTimed;
    }

    public String getDepartureTimet() {
        return departureTimet;
    }

    public void setDepartureTimet(String departureTimet) {
        this.departureTimet = departureTimet;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}