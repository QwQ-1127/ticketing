package com.flight.service;

import com.flight.bean.Flight;
import com.flight.dao.FlightDao;

import java.sql.SQLException;
import java.util.List;

public class FlightService {
    private FlightDao flightDao = new FlightDao();

    public List<Flight> searchFlights(String from, String to, String date) {
        try {
            return flightDao.searchFlights(from, to, date);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
