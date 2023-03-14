<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: QwQ
  Date: 2023/3/5
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>航班搜索结果</title>
  <style>
    body {
      font-size: 16px;
      line-height: 1.6;
      color: #333;
      background-color: #f8f8f8;
      margin: 0;
      font-family: "Lucida Console", "Courier New", monospace;
    }

    h1 {
      font-size: 36px;
      text-align: center;
      margin-top: 40px;
      margin-bottom: 30px;
      color: #F06292;
      text-shadow: 5px 5px 5px #21497a;
    }

    table {
      border-collapse: collapse;
      width: 100%;
      max-width: 900px;
      margin: 40px auto 0;
      background-color: rgba(255, 255, 255, 0.5);
      box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
    }

    th,
    td {
      padding: 10px 20px;
      text-align: left;
      vertical-align: middle;
    }

    th {
      background-color: #f2f2f2;
      font-weight: bold;
    }

    /*tr:nth-child(even) {*/
    /*  background-color: #f9f9f9;*/
    /*}*/

    a {
      display: inline-block;
      text-decoration: none;
      color: #fff;
      background-color: #FF80AB;
      padding: 8px 16px;
      border-radius: 4px;
      transition: background-color 0.2s ease;
      margin: 4px;
    }

    a:hover {
      background-color: #F06292;
    }

    .background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url("./static/img/bg1.jpg");
      background-repeat: no-repeat;
      background-size: 105% 800px;
      z-index: -1;
    }

    .landr {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      color: #333;
      font-size: 16px;
      font-weight: bold;
      padding: 5px 10px;
      border-radius: 5px;
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      box-shadow: #fdafca 0px 19px 38px, #f8bacd 0px 15px 12px;
    }
    .landr img {
      width: 30px;
      height: 30px;
    }
    .landr:hover {
      background-color: #ddd;
    }

    a.abutton {
      display: inline-block;
      padding: 5px;
      background-color: #FF80AB;
      color: white;
      text-align: center;
      text-decoration: none;
      border-radius: 5px;
    }

    a.abutton:hover {
      background-color: white;
    }

    div.login-register {
      position: absolute;
      top: 0;
      right: 0;
      margin-top: 20px;
      margin-right: 50px;
    }

    div.login-register a:hover {
      color: #F06292;
    }

    .home {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      text-decoration: none;
      color: #333;
      font-size: 16px;
      font-weight: bold;
      padding: 5px 10px;
      border-radius: 5px;
      background-color: #f2f2f2;
      border: 1px solid #ccc;
      position: absolute;
      top: 0;
    }
    .home img {
      width: 30px;
      height: 30px;
    }
    .home:hover {
      background-color: #ddd;
    }

  </style>
</head>
<body>
<h1>航班搜索结果</h1>

<a class="home" href="./index.jsp"><img src="./static/img/home.png" alt="首页" title="首页"></a>

<div class="background"></div>

<div class="login-register" >
  <c:choose>
    <c:when test="${sessionScope.loginUser!=null}">
      <span style="outline: none;font-size: 20px; color: #F06292;text-shadow: 5px 5px 5px #21497a;">欢迎，${sessionScope.loginUser.username}</span>
      <a  class="abutton" href="exitLogin" target="_top">退出登录</a>
    </c:when>
    <c:otherwise>
      <a class="landr" href="./login.jsp"><img src="./static/img/login.png" alt="登录" title="登录"></a>
      <a class="landr" href="./register.jsp"><img src="./static/img/register.png" alt="注册" title="注册"></a>
    </c:otherwise>
  </c:choose>
</div>

<table>
  <thead>
  <tr>
    <th>航班编号</th>
    <th>出发地</th>
    <th>目的地</th>
    <th>出发时间</th>
    <th>到达时间</th>
    <th>价格</th>
    <th>是否购票</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach items="${flights}" var="flights">
    <tr>
      <td>${flights.flightNo}</td>
      <td>${flights.origin}</td>
      <td>${flights.destination}</td>
      <td>${flights.departureTimed}&nbsp${flights.departureTimet}</td>
      <td>${flights.arrivalTime}</td>
      <td id="payprice${flights.id}">${flights.price}</td>
      <td id="pid${flights.id}" style="display: none;">${flights.id}</td>
      <td><a id="buy" onclick="buy(${flights.id})">购买</a></td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</body>
<script src="static/js/jquery.js"></script>
<script>
  function buy(id) {
    event.preventDefault();
    $.ajax({
      url:"add_cart",
      type:"POST",
      data:{
        pId:$("#pid"+id).text(),
        buyPrice:$("#payprice"+id).text()
      },
      success:function (res) {
        alert(res);
      }
    })
  }
</script>
</html>
