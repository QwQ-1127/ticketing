package com.flight.servlet;

import com.flight.service.CartService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/add_cart")
public class AddCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String pId = req.getParameter("pId");
        String buyPrice = req.getParameter("buyPrice").replaceAll("\\.0", "");;
        CartService cartService = new CartService();
        resp.setCharacterEncoding("utf-8");
        String msg = cartService.addCart(pId,buyPrice,req);
        resp.getWriter().write(msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
