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
        <li class="register_mid_left">填写注册信息</li>
        <li class="register_mid_right">2. 完成注册</li>
    </ul>
    </div>
    <div class="register_top_bg_mid">
    <div class="register_top_bg_two_left"></div>
    <div class="register_top_bg_two_right"></div>
    <div class="register_title_bg"><img src="${pageContext.request.contextPath}/static/images/register_pic_02.gif" alt="欢迎注册"><br>您所提供的资料不会做其他用途，敬请安心填写。</div>
    </div>
    <div class="register_dotted_bg"></div>
    <div class="register_message">
    <form action="${pageContext.request.contextPath}/customer/register" method="post" id="myform" onSubmit="return checkRegister()">
     
      <dl class="register_row">
         <dt>用户名：</dt>
         <dd><input id="nickName" type="text" class="register_input" name="cName" value="${customer.cName}"></dd>
        <dd><div id="nickName_prompt"><font color="red">${username}</font> </div></dd>
      </dl>
     <dl class="register_row">
         <dt>密码：</dt>
         <dd><input onclick="nameCompare()" id="pwd0" type="password" class="register_input" name="cPass" value="${customer.cPass}"></dd>
         <dd><div id="pwd_prompt"><font color="red">${password}</font></div></dd>
     </dl>
        <dl class="register_row">
            <dt>确认密码：</dt>
            <dd><input id="pwd1" type="password" class="register_input" name="cPass1" value="" ></dd>
            <dd><div id="pwd_prompt1"><font color="red">${password}</font></div></dd>
        </dl>
     <dl class="register_row">
        <dt>邮箱：</dt>
        <dd><input onclick="pwdCompare()" id="email" type="text" class="register_input" name="cEmail" value="${customer.cEmail}"></dd>
        <dd><div id="email_prompt"><font color="red">${email}</font> </div></dd>
      </dl>
        <dl class="register_row">
            <dt>电话：</dt>
            <dd><input onclick="pwdCompare()" id="phone" type="text" class="register_input" name="cPhone" value="${customer.cPhone}"></dd>
        </dl>
      <div class="registerBtn"><input class="tzz" type="image" src="${pageContext.request.contextPath}/static/images/register_btn_out.gif">
      </div>
        <dd ><font size="3" color="red">${masg}</font> </dd>
        <dd ><font size="3" color="red">${masg1}</font> </dd>
   </form>
    </div>
  </div>
  </div>
<script>
    function pwdCompare() {
        var pwd0 = document.getElementById("pwd0").value;
        var pwd1 = document.getElementById("pwd1").value;
        if(pwd0!=pwd1){
            alert("两次密码不相同");
        }
    }
</script>
</body>

</html>
