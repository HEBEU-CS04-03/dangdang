<%--
  Created by IntelliJ IDEA.
  User: Tianz
  Date: 2019/1/1
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>当当用户个人详细信息</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"/>

</head>
<body>
<div id="booktop">
    <div class="widthmid">

            <span id="nickname">你好，<a dd_name="欢迎" href="javascript:PageToPersonCenter();" target="_self"
                                      rel="nofollow"
                                      class="login_link">${customer.cName}</a>
            &nbsp;&nbsp;<a dd_name="退出登录"
                           href="${pageContext.request.contextPath}/customer/loginOut">退出登录</a></span>


        <ul class="topbox">
            <li class="boxlia">
                <a target="_blank" href="http://giftcard.dangdang.com/giftcardCompany">企业采购</a>
            </li>
            <li class="boxlia">
                <a href="">我的当当</a>
            </li>
            <li class="boxlia">
                <a target="_blank" href="http://t.dangdang.com/20130220_ydmr">手机当当</a>
            </li>
            <li class="boxlia">
                <a href="http://book.dangdang.com/20181101_fqcu">当当出版</a>
            </li>
        </ul>

    </div>
</div>
<!--搜索开始-->
<div id="booksearch" style="margin-left: 200px">
    <a href="" class="logo">
        <img src="${pageContext.request.contextPath}/static/img/logo.jpg" style="border: none;">
    </a>
    <ul class="header_fun header_funina" style="margin-left: 630px">
        <li class="icon">&nbsp;</li>
        <li class="header_cart">
            <a href="${pageContext.request.contextPath}/shopCart/toShopCart" name="购物车" target="_blank">
                购物车
            </a>
        </li>
        <li class="icon2">&nbsp;</li>
        <li class="header_order">
            <a href="javascript:void(0)" id="headerMyOrder">
                我的订单
            </a>
        </li>
    </ul>
</div>
<div id="bookmenu" style="width: 75%;margin: auto">
    <ul class="uloutw">
        <li class="onimg">
            <img src="${pageContext.request.contextPath}/static/img/menua.png"/>
        </li>
        <li class="on">
            <a href="${pageContext.request.contextPath}/book/toIndex">首页</a>
        </li>
        <li class="phoneshow">
            <a target="_blank" href="http://t.dangdang.com/20130220_ydmr">手机看书</a>
        </li>
        <li class="for_hot_nav">
            <a target="_blank" href="http://book.dangdang.com/20161128_zl3t">当当阅读器</a>
        </li>
        <li class="want_to_recharge">
            <a href="" target="_blank">我要充值</a>
        </li>
        <li class="writer_sys">
            <a href="http://pbook-shequ.dangdang.com/welcome/" target="_blank">作者后台</a>
        </li>
    </ul>
</div>
<div id="bookout" class="widthmid">

    <p>用户积分：${customer.cScore}</p>
    <p>用户邮箱：${customer.cEmail}</p>
    <p>用户电话：${customer.cPhone}</p>
    <p>用户余额：${customer.cBlance}</p>
    <p>用户地址：${customer.cAddress}</p>

    <form action="${pageContext.request.contextPath}/customer/updateCustomer" method="post">
        <table>
            <dl class="login_content">
                <input id="name" type="hidden" class="login_content_input" value="${customer.cName}" name="cName"></dd>
            </dl>
            <dl class="login_content">
                <input id="password0" type="hidden" class="login_content_input" value="${customer.cPass}"
                       name="cPass"></dd>
            </dl>
            <dl class="login_content">
                <input id="score" type="hidden" class="login_content_input" value="${customer.cScore}"
                       name="cScore"></dd>
            </dl>
            <dl class="login_content">
                <input id="blance" type="hidden" class="login_content_input" value="${customer.cBlance}"
                       name="cBlance"></dd>
            </dl>
            <tr class="login_content">
                <td>用户电话修改：<input id="phone" type="text" class="login_content_input" value="${customer.cPhone}"
                                  name="cPhone"></td>
            </tr>
            <tr class="login_content">
                <td>用户邮箱修改：<input id="email" type="text" class="login_content_input" value="${customer.cEmail}"
                                  name="cEmail"></td>
            </tr>
            <tr class="login_content">
                <td>用户地址修改：<input id="address" type="text" class="login_content_input" value="${customer.cAddress}"
                                  name="cAddress"></td>
            </tr>
            <tr class="login_content">
                <td>用户密码修改
                    <input onclick="pwdUpdate()" type="radio" class="login_content_input">
                </td>
            </tr>
            <tr id="pwd1" class="login_content" hidden>
                <td>请输入原密码：<input id="password1" type="password" class="login_content_input"></td>
            </tr>
            <tr id="pwd2" class="login_content" hidden>
                <td> 请修改后密码：<input onclick="pwdCompare1()" id="password2" type="password" class="login_content_input">
                </td>
            </tr>
            <tr id="pwd3" class="login_content" hidden>
                <td> 请您确认密码：<input id="password3" type="password" class="login_content_input" name="cPass1"></td>
            </tr>
            <tr class="login_content">
                <td><input onclick="pwdCompare2()" id="btn" value="确认修改" type="submit" class="login_btn_out"
                           onmouseover="this.className='login_btn_over'" onmouseout="this.className='login_btn_out'">
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
<script>
    function pwdUpdate() {
        document.getElementById("pwd1").removeAttribute("hidden");
        document.getElementById("pwd2").removeAttribute("hidden");
        document.getElementById("pwd3").removeAttribute("hidden");
    }

    function pwdCompare1() {
        var password0 = document.getElementById("password0").value;
        var password1 = document.getElementById("password1").value;
        if (password0 != password1) {
            alert("原密码输入错误");
        }
    }

    function pwdCompare2() {
        var password2 = document.getElementById("password2").value;
        var password3 = document.getElementById("password3").value;
        if (password2 != password3) {
            alert("确认密码不一致");
        }
        if (password3.value.length > 20) {
            alert("密码长度必须小于20位")
        }
        else if (password3.value.length < 3) {
            alert("密码长度必须大于3位")
        }
    }

</script>
</html>
