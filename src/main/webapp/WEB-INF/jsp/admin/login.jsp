<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-rtl.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <script src="${pageContext.request.contextPath}/static/assets/js/ace-extra.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <title>登陆</title>
</head>

<body class="login-layout">
<div class="logintop">
    <span>欢迎登录"当当书城"管理员后台系统</span>
    <ul>
        <li><a href="#">帮助</a></li>
        <li><a href="#">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">
            <h1>
                <i class="icon-leaf green"></i>
                <span class="orange">当当书城</span>
                <span class="white">后台管理系统</span>
            </h1>
            <h4 class="white">Dang Dang Background Management System</h4>
        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-coffee green"></i>
                            管理员登陆
                            <span style="color: red">${message}</span>
                        </h4>

                        <div class="login_icon"><img src="${pageContext.request.contextPath}/static/images/login.png"/>
                        </div>

                        <form class="" action="${pageContext.request.contextPath}/admin/login" method="post">
                            <fieldset>
                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="登录名"
                                                                   name="username" id="adminName">
															<i class="icon-user"></i>
														</span>
                                </label>

                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码"
                                                                   name="password" id="password">
															<i class="icon-lock"></i>
														</span>
                                </label>

                                <div class="space"></div>

                                <div class="clearfix">
                                    <label class="inline">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl">保存密码</span>
                                    </label>

                                    <button type="button" class="width-35 pull-right btn btn-sm btn-primary"
                                            id="login_btn">
                                        <i class="icon-key"></i>
                                        登陆
                                    </button>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                        <div class="social-or-login center">
                            <span class="bigger-110">通知</span>
                        </div>

                        <div class="social-login center">
                            本网站系统不再对IE8以下浏览器支持，请见谅。
                        </div>
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">


                    </div>
                </div><!-- /widget-body -->
            </div><!-- /login-box -->
        </div><!-- /position-relative -->
    </div>
</div>
<div class="loginbm">版权所有 2018 <a href="">计算机1604第三项目小组(组长:言立慧 组员:王慧 雷宇飞 田梓钊 贺海洋 王煜)</a></div>
<strong></strong>
</body>
</html>
<script>
    $('#login_btn').on('click', function () {
        var num = 0;
        var str = "";
        var adminName = document.getElementById("adminName").value;
        var password = document.getElementById("password").value;

        if (adminName === "") {
            layer.alert(str += "" + "用户名不能为空！\r\n", {
                title: '提示框',
                icon: 0,
            });
            return false;
        }

        if (password === "") {
            layer.alert(str += "" + "密码不能为空！\r\n", {
                title: '提示框',
                icon: 0,
            });
            return false;
        }

        // $("input[type$='text']").each(function (n) {
        //     if ($(this).val() == "") {
        //
        //         layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
        //             title: '提示框',
        //             icon: 0,
        //         });
        //         num++;
        //         return false;
        //     }
        // });

        //提交表单
        var frm = document.forms[0];
        frm.submit();
    })

</script>