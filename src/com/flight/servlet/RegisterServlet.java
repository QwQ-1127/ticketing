package com.flight.servlet;

import com.flight.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1. 接收ajax传递的用户名，手机号和密码
        String userName = req.getParameter("userName");//根据参数的name接收对应的value
        String userPhone = req.getParameter("userPhone");
        String userPass = req.getParameter("userPass");
        //2. 调用service的注册方法
        UserService userService = new UserService();
        String msg = userService.regist(userName,userPass,userPhone);
        //设置resp的编码
        resp.setCharacterEncoding("utf-8");
        //3. 使用response给注册页面返回响应值
        resp.getWriter().write(msg);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
