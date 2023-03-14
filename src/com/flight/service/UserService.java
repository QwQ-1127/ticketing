package com.flight.service;

import com.flight.bean.User;
import com.flight.dao.UserDao;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Date;

public class UserService {
    private UserDao userDao = new UserDao();
    public String regist(String userName,String userPhone, String userPass) {
        try {
            //1. 先根据userPhone查询用户是否存在
            User user = userDao.getUserByPhone(userPhone);
            if(user==null){
                //可以注册
                userDao.regist(userName,userPass,userPhone,new Date());
                return "success";
            }else{
                //不能注册，给出提示
                return "手机号已存在，请重新输入";
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return "服务器异常";
    }

    public String login(HttpServletRequest req, String userPhone, String userPass, String inputCode) {
        HttpSession session = req.getSession();
        String code = (String)session.getAttribute("code");
        //1. 先比较验证码
        //equalsIgnoreCase:忽略大小写比较
        if(code.equalsIgnoreCase(inputCode)){
            try {
                //2. 比较账号密码
                User user  = userDao.login(userPhone,userPass);
                if(user==null){
                    return "账号或密码输入错误";
                }else{
                    //将user放到session中
                    session.setAttribute("loginUser",user);
                    return "success";
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return "服务器异常";
        }else{
            return "验证码输入错误";
        }
    }
}
