package com.flight.servlet;

import com.flight.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 获取手机号、密码、验证码
        String userPhone = req.getParameter("userPhone");
        String userPass = req.getParameter("userPass");
        String inputCode = req.getParameter("inputCode");
        UserService userService = new UserService();
        String msg = userService.login(req, userPhone, userPass, inputCode);
        resp.setCharacterEncoding("utf-8");
        //响应返回结果
        resp.getWriter().write(msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
