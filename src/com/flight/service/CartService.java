package com.flight.service;

import com.flight.bean.Cart;
import com.flight.bean.User;
import com.flight.dao.CartDao;

import javax.servlet.http.HttpServletRequest;
import java.sql.SQLException;
import java.util.Date;


public class CartService {
    private CartDao cartDao = new CartDao();
    public String addCart(String pId, String buyPrice, HttpServletRequest req) {
        User user = (User)req.getSession().getAttribute("loginUser");
        if(user!=null){
            try {
                Cart cart = cartDao.getCartByUidAndPid(Integer.parseInt(pId),user.getId());
                int buyNum = 1;
                if(cart==null){
                    cartDao.addCart(Integer.parseInt(pId),user.getId(),buyNum,Integer.parseInt(buyPrice),new Date());
                }else{
                    buyNum++;
                    int buyP = Integer.parseInt(buyPrice);
                    buyP*=buyNum;
                    cartDao.updateCartNum(cart.getId(),buyNum,buyP);
                }
                return "添加成功";
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return "服务器异常";
        }else{
            return "用户未登录,请先登录";
        }
    }
}
