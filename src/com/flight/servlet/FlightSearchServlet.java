package com.flight.servlet;

import com.flight.bean.Flight;
import com.flight.service.FlightService;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search_result")
public class FlightSearchServlet extends HttpServlet {
    FlightService flightService = new FlightService();

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String from = req.getParameter("from");
        String to = req.getParameter("to");
        String date = req.getParameter("date");
//        System.out.println(from+"--"+to+"--"+date);
        List<Flight> flights = flightService.searchFlights(from,to,date);
        req.setAttribute("flights", flights);
        req.getRequestDispatcher("search_result.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}