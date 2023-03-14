package com.flight.dao;

import com.flight.bean.Flight;
import com.flight.util.C3p0Util;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class FlightDao {
    public List<Flight> searchFlights(String from, String to, String date) throws SQLException {
        String sql = "SELECT * FROM flight WHERE origin = ? AND destination = ? AND  departureTimed = ?";
        BeanListHandler<Flight> beanListHandler = new BeanListHandler<>(Flight.class);
        return C3p0Util.getQr().query(sql, beanListHandler, from, to, date);
    }

}

