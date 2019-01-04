<%--
  Created by IntelliJ IDEA.
  User: Tianz
  Date: 2019/1/1
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8" />
    <title>当当网注册页面</title>
    <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/register.js"></script>
</head>

<body>
<div id="header">
    <div id="register_header">
        <div class="register_header_left"><img src="${pageContext.request.contextPath}/static/images/logo.gif" alt="logo"></div>
        <div class="register_header_right"><a href="index.jsp" class="blue">首页</a> | <a href="${pageContext.request.contextPath}/product.jsp" class="blue">商品展示页</a>  | <a href="shopping.jsp" class="blue">购物车</a> |  <a href="login.jsp" class="blue">登录</a></div>
    </div>
</div>
<div id="main">
    <div class="register_content">
        <div class="register_top_bg"></div>
        <div class="register_mid_bg">
            <ul>
                <li class="register_mid_right">完成注册</li>
            </ul>
        </div>
        <div class="register_top_bg_mid">
            <div class="register_top_bg_two_left"></div>
            <div class="register_top_bg_two_right"></div>
            <div class="register_title_bg"><img src="images/register_pic_02.gif" alt="注册成功"><br>您所提供的资料不会做其他用途，敬请安心填写。</div>
        </div>
        <div class="register_dotted_bg"></div>
        <div class="register_message">
                <dl class="register_row">
                    <dd><font size="9">注册成功</font></dd><a href="${pageContext.request.contextPath}/customer/loginTo"><font size="9"color="red">返回登陆</font></a>
                </dl>
        </div>
    </div>
</div>
<div id="footer">
</div>
</body>
</html>
