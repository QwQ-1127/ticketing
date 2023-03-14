<%--
  Created by IntelliJ IDEA.
  User: QwQ
  Date: 2023/3/6
  Time: 22:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
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

        h1 {
            text-align: center;
            font-size: 36px;
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

        input[type="text"],
        input[type="password"] {
            outline: none;
            border: none;
            display: inline-block;
            /*border-radius: 5px;*/
            width: 85%; /* 输入框宽度 */
            height: 30px; /* 输入框高度 */
            vertical-align: middle; /* 垂直对齐方式 */
        }

        .inputimg{
            width: 30px; /* 图像宽度 */
            height: 30px; /* 图像高度 */
        }

        input[type="button"] {
            background-color: #FF80AB;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            box-shadow: #fdafca 0px 19px 38px,
            #f8bacd 0px 6px 12px;
        }

        input[type="button"]:hover {
            background-color: #F06292;
            box-shadow: #fa8bb1 0px 19px 38px,
            #f59bb8 0px 15px 12px;
        }

        div.nocount {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
            color: #999;
        }

        div.nocount a {
            color: #FF80AB;
            text-decoration: none;
            font-weight: bold;
        }

        div.nocount a:hover {
            text-decoration: underline;
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
        }
        .home img {
            width: 30px;
            height: 30px;
        }
        .home:hover {
            background-color: #ddd;
        }

        .input-all{
            box-sizing: content-box;
            position: relative;
            width: 85%;
            height: 42px;
            padding: 6px;
            margin-left: 10px;
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

    </style>
</head>
<body>

<a class="home" href="./index.jsp"><img src="./static/img/home.png" alt="首页" title="首页"></a>

<div class="background"></div>

<h1>注册</h1>
<form action="register" method="post">
    <div class="input-all">
        <img class="inputimg" src="./static/img/username.png" alt="用户名">
        <input type="text" name="username" id="username" placeholder="请输入用户名" required>
    </div>
    <br><br>

    <div class="input-all">
        <img class="inputimg" src="./static/img/userphone.png" alt="手机号">
        <input onblur="checkPhone()" type="text" name="phone" id="phone" placeholder="请输入手机号" required>
    </div>
    <br>
    <span id="phoneTips"></span><br><br>

    <div class="input-all">
        <img class="inputimg" src="./static/img/userpass.png" alt="密码:">
        <input onblur="checkPassword()" type="password" name="password" id="password" placeholder="请输入密码" required>
    </div>
    <br>
    <span id="passwordTips"></span><br><br>

    <div class="input-all">
        <img class="inputimg" src="./static/img/userpass.png" alt="确认密码:">
        <input onblur="checkRepeatPass()" type="password" name="confirm_password" id="confirm_password" placeholder="请再次输入密码" required>
    </div>
    <br>
    <span id="repasswordTips"></span><br><br>

    <input id="submit" type="button" value="注册">

    <div class="nocount">
        已有账号？<a href="./login.jsp">立即登录</a>
    </div>
</form>
</body>
<script src="static/js/jquery.js"></script>
<script>
    //手机号：以1开头，第二位：3 4 5 6 7  8  9 第三位-第十一位：普通数字
    //正则表达式:通常被用来检索、替换那些符合某个模式（规则）的文本
    // ^:以什么开头  [abc]:匹配a或者b或者c中的一个  \d:匹配任意一个数字，等价于[0-9]
    var reg = /^1[3-9]\d{9}$/ //定义手机号的正则
    //验证手机号
    function  checkPhone() {
        //1. 获取手机号的值
        var inputPhone = $("#phone").val();
        //2. 使用正则判断inputPhone是否满足规则:使用test函数，满足返回true,不满足返回false
        if(reg.test(inputPhone)){
            //给标签内部赋值:text()   输入框赋值:val()
            $("#phoneTips").text("√");//对应的是js中的innerText
            $("#phoneTips").css("color","green");
            return true;
        }else{
            $("#phoneTips").text("手机号格式不正确");
            $("#phoneTips").css("color","red");
            return false;
        }
    }

    //验证密码
    function checkPassword(){
        //1. 获取输入的密码
        var inputPass = $("#password").val();
        //密码是5-12位
        if(inputPass.length<5 || inputPass.length>12){
            $("#passwordTips").text("密码长度应在5-12位");
            $("#passwordTips").css("color","red");
            return false;
        }else{
            $("#passwordTips").text("√");
            $("#passwordTips").css("color","green");
            return true;
        }
    }
    //验证再次输入密码
    function checkRepeatPass() {
        //1. 获取再次输入密码的值
        var repassword = $("#confirm_password").val();
        if(repassword==""){
            $("#repasswordTips").text("请再次输入密码");
            $("#repasswordTips").css("color","red");
            return false;
        }else if(repassword!=$("#password").val()){
            $("#repasswordTips").text("密码输入不一致");
            $("#repasswordTips").css("color","red");
            return false;
        }else{
            $("#repasswordTips").text("√");
            $("#repasswordTips").css("color","green");
            return true;
        }
    }
    //点击注册按钮触发
    $("#submit").click(function () {
        //如果不失去焦点就不会触发上面的验证函数，那么可以手动调用该
        if(checkPhone()&&checkPassword()&&checkRepeatPass()){
            //将用户输入的手机号和密码使用ajax提交到后端
            $.ajax({
                url:"register",//提交到后端的地址
                type:"POST",//请求方式
                data:{      //向后端提交时携带的参数
                    userName:$("#username").val(),
                    userPhone:$("#phone").val(),
                    userPass:$("#password").val()
                },
                //success:当请求成功时执行的回调函数
                //res:后端Servlet返回的结果
                success:function (res) {
                    if(res=="success"){
                        //跳转到登录界面
                        location.href="./login.jsp"
                    }else{
                        alert(res)
                    }
                }
            })
        }else{
            alert("表单格式不正确");
        }

    })
</script>
</html>
