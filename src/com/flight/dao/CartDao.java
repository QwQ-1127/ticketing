package com.flight.dao;


import com.flight.bean.Cart;
import com.flight.util.C3p0Util;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;
import java.util.Date;

public class CartDao {
    public Cart getCartByUidAndPid(int pId, Integer id) throws SQLException {
        String sql = "select * from cart where flightId=? and userId=?";
        BeanHandler<Cart> beanHandler = new BeanHandler<>(Cart.class);
        return C3p0Util.getQr().query(sql,beanHandler,pId,id);
    }

    public void addCart(int pId, Integer id, int buyNum, int buyPrice, Date date) throws SQLException {
        String sql = "insert into cart(flightId,userId,ticketNum,price,bookingTime)values(?,?,?,?,?)";
        C3p0Util.getQr().update(sql,pId,id,buyNum,buyPrice,date);
    }

    public void updateCartNum(Integer id, int buyNum ,int bp) throws SQLException {
        String sql = "update cart set ticketNum=?,price=? where id=?";
        C3p0Util.getQr().update(sql,buyNum,bp,id);
    }
}

