package com.flight.servlet;

import cn.dsna.util.images.ValidateCode;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/getCode")
public class GetCodeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //参数：宽  高   字符数量  线条数量
        ValidateCode vc = new ValidateCode(100, 30, 5, 5);
        String code = vc.getCode();
        //将code存到session中
        HttpSession session = req.getSession();
        session.setAttribute("code",code);
        System.out.println("验证码>>>>>"+code);
        vc.write(resp.getOutputStream());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
