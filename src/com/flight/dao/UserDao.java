package com.flight.dao;

import com.flight.bean.User;
import com.flight.util.C3p0Util;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;
import java.util.Date;

public class UserDao {
    public User getUserByPhone(String userPhone) throws SQLException {
        String sql = "select * from user where phone=?";
        BeanHandler<User> beanHandler = new BeanHandler<>(User.class);
        return C3p0Util.getQr().query(sql,beanHandler,userPhone);
    }

    public void regist(String userName,String userPhone, String userPass, Date date) throws SQLException {
        String sql = "insert into user(username,password,phone,user_regtime)values(?,?,?,?)";
        C3p0Util.getQr().update(sql,userName,userPass,userPhone,date);
    }

    public User login(String userPhone, String userPass) throws SQLException {
        String sql = "select * from user where phone=? and password=?";
        BeanHandler<User> beanHandler = new BeanHandler<>(User.class);
        return C3p0Util.getQr().query(sql,beanHandler,userPhone,userPass);
    }
}
