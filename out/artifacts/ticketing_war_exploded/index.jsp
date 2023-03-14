<%--
  Created by IntelliJ IDEA.
  User: QwQ
  Date: 2023/3/5
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>飞机票购票系统</title>
  <style>

    .background {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-image: url("./static/img/bg5.jpg");
      background-repeat: no-repeat;
      background-size: 105% 800px;
      z-index: -1;
    }

    body {
      background-color: #f2f2f2;
      font-weight: bold;
      font-family: "Lucida Console", "Courier New", monospace;
    }
    ::placeholder {
      font-family: "Lucida Console", "Courier New", monospace;
      font-weight: bold;
      color: #999;
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

    h1 {
      text-align: center;
      font-size: 36px;
      margin-top: 50px;
      margin-bottom: 50px;
      color: #F06292;
      text-shadow: 5px 5px 5px #21497a;
    }

    form {
      width: 20%;
      margin: 0 auto;
      background-color: #BBDEFB;
      padding: 20px;
      border-radius: 20px;
      box-shadow: #60b4fc 0px 19px 38px,
      #72bcf8 0px 15px 12px;
    }

    label {
      display: inline-block;
      width: 120px;

      color: #FF80AB;
    }

    input[type="text"],
    input[type="date"] {
      outline: none;
      padding: 5px;
      border: none;
      border-radius: 5px;
      width: 100%;

    }

    input[type="submit"] {
      background-color: #FF80AB;
      color: white;
      padding: 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    input[type="submit"]:hover {
      background-color: #F06292;
    }

    .input-all{
      box-sizing: content-box;
      position: relative;
      width: 85%;
      height: 42px;
      padding: 6px;
      margin-left: 22px;
      border-radius: 25px;
      background-color: white;
      display: flex;
      -webkit-box-align: center;
      align-items: center;
      -webkit-box-pack: justify;
      justify-content: space-between;
      box-shadow: #fdafca 0px 19px 38px,
      #f8bacd 0px 15px 12px;
    }

    .input-all:hover{
      box-shadow: #fa8bb1 0px 19px 38px,
      #f59bb8 0px 15px 12px;
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

  </style>
</head>
<body>
<h1>飞机票购票系统</h1>

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

<form action="./search_result" method="get">

  <div>
    <div class="input-all">
      <label for="from">出发地:</label>
      <input type="text" name="from" id="from" required>
    </div>
    <br><br>

    <div class="input-all">
      <label for="to">目的地:</label>
      <input type="text" name="to" id="to" required>
    </div>
    <br><br>
  </div>

  <div class="input-all">
    <label for="date">日期:</label>
    <input type="date" name="date" id="date" required>
  </div>
  <br><br>

  <input type="submit" value="查询航班">
</form>
</body>
</html>
