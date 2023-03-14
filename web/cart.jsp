<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>飞机票购物车</title>
</head>
<body>
<h1>飞机票购物车</h1>

<%
  // 获取购物车数据
  List<String> cart = new ArrayList<String>();
  String user = "testuser"; // 用户名
  String pass = "testpass"; // 密码
  String url = "jdbc:mysql://localhost:3306/testdb?useSSL=false&serverTimezone=UTC";
  String driver = "com.mysql.jdbc.Driver";
  Connection con = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;
  try {
    Class.forName(driver);
    con = DriverManager.getConnection(url, user, pass);
    String sql = "SELECT * FROM cart WHERE username = ?";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, user);
    rs = pstmt.executeQuery();
    while(rs.next()) {
      String from = rs.getString("from_city");
      String to = rs.getString("to_city");
      String date = rs.getString("date");
      String flightNo = rs.getString("flight_no");
      int price = rs.getInt("price");
      String item = from + " - " + to + " (" + date + "): " + flightNo + " - " + price + "元";
      cart.add(item);
    }
  } catch(Exception e) {
    e.printStackTrace();
  } finally {
    try { if(rs != null) rs.close(); } catch(Exception e) {}
    try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
    try { if(con != null) con.close(); } catch(Exception e) {}
  }
  session.setAttribute("cart", cart);
%>

<h2>购物车</h2>
<%
  // 显示购物车内容
  cart = (List<String>) session.getAttribute("cart");
  if(cart.isEmpty()) {
    out.println("<p>购物车是空的</p>");
  } else {
    out.println("<ul>");
    for(String item : cart) {
      out.println("<li>" + item + "</li>");
    }
    out.println("</ul>");
  }
%>
</body>
</html>