package com.flight;

import com.flight.bean.Cart;
import com.flight.bean.Flight;
import com.flight.bean.User;
import com.flight.dao.CartDao;
import com.flight.dao.FlightDao;
import com.flight.dao.UserDao;
import com.flight.service.CartService;
import com.flight.service.FlightService;
import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public class test {
    public static void main(String[] args) throws SQLException {
        FlightDao flightDao = new FlightDao();
        List<Flight> flights = flightDao.searchFlights("武汉","上海","2023-06-01");
        System.out.println(flights);
    }
}