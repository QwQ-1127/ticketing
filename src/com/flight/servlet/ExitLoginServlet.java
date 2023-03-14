package com.flight.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/exitLogin")
public class ExitLoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //从session中将loginUser删掉
        req.getSession().removeAttribute("loginUser");
        //回到首页
//        req.getRequestDispatcher("index").forward(req,resp);//请求转发
        //重定向到首页
        resp.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}

