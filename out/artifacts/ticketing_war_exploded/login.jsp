<%--
  Created by IntelliJ IDEA.
  User: QwQ
  Date: 2023/3/6
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
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

        .nocount {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
            color: #999;
        }

        .nocount a {
            color: #FF80AB;
            text-decoration: none;
            font-weight: bold;
        }

        .nocount a:hover {
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

        #code{
            width: 85%;
        }

    </style>
</head>
<body>

<a class="home" href="./index.jsp"><img src="./static/img/home.png" alt="首页" title="首页"></a>

<div class="background"></div>

<h1>登录</h1>
<form action="login" method="post">

    <div class="input-all">
        <img class="inputimg" src="./static/img/userphone.png" alt="手机号">
        <input type="text" name="username" id="phone" placeholder="请输入手机号" required>
    </div>
    <br><br>

    <div class="input-all">
        <img class="inputimg" src="./static/img/userpass.png" alt="密码:">
        <input type="password" name="password" id="password" placeholder="请输入密码" required>
    </div>
    <br><br>

    <div class="input-all">
        <%--        验证码                --%>
        <img id="codeImg" style="width: 85%;height: 30px" src="getCode" alt="">
        <input type="text" name="inputCode" id="code" placeholder="请输入验证码">
    </div>
    <br><br>

    <input id="submit" type="button" value="登录">

    <div class="nocount">
        还没有账号？<a href="./register.jsp">立即注册</a>
    </div>
</form>

</body>
<script src="static/js/jquery.js"></script>
<script>
    //点击验证码切换图片
    $("#codeImg").click(function () {
        //给img标签的src重新赋值  getCode获取验证码的请求
        //重复的调用同一个接口可能会触发浏览器懒加载，多次请求都会被认定为同一个请求，可以在每次请求时设置不同的参数
        $("#codeImg").attr("src","getCode?time="+new Date())
    })

    //点击登录按钮
    $("#submit").click(function () {
        $.ajax({
            url:"login",//后端登录地址
            type:"POST",
            data:{ //向后端提交的参数
                userPhone:$("#phone").val(),
                userPass:$("#password").val(),
                inputCode:$("#code").val()
            },
            //如果表单中的输入框过多，可以通过将表单序列化成json数据，name是对应输入框标签的name,
            // data:$("#form").serialize(),
            success:function (res) {
                if(res=="success"){
                    var prevUrl = document.referrer;
                    if (prevUrl!=""){
                        if (prevUrl.indexOf("login")==-1&&prevUrl.indexOf("register")==-1){
                            location.href = prevUrl;
                        }
                        else {
                            location.href = "./index.jsp";
                        }
                    }else {
                        location.href = "./index.jsp";
                    }
                }else{
                    alert(res);
                    //刷新验证码
                    $("#codeImg").attr("src","getCode?time="+new Date())
                }
            }
        })
    })
</script>
</html>
