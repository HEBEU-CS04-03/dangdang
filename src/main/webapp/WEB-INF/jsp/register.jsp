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
        <li class="register_mid_mid">2. 邮箱验证</li>
        <li class="register_mid_right">3. 完成注册</li>
    </ul>
    </div>
    <div class="register_top_bg_mid">
    <div class="register_top_bg_two_left"></div>
    <div class="register_top_bg_two_right"></div>
    <div class="register_title_bg"><img src="images/register_pic_02.gif" alt="欢迎注册"><br>您所提供的资料不会做其他用途，敬请安心填写。</div>
    </div>
    <div class="register_dotted_bg"></div>
    <div class="register_message">
    <form action="" method="post" id="myform" onSubmit="return checkRegister()">
     
      <dl class="register_row">
         <dt>用户名：</dt>
         <dd><input id="nickName" type="text" class="register_input" onFocus="nickNameFocus()" onBlur="nickNameBlur()"></dd>
        <dd><div id="nickName_prompt"></div></dd>
      </dl>
     <dl class="register_row">
         <dt>密码：</dt>
         <dd><input id="pwd" type="password" class="register_input" onFocus="pwdFocus()" onBlur="pwdBlur()"></dd>
         <dd><div id="pwd_prompt"></div></dd>
     </dl> 
     <dl class="register_row"> 
         <dt>电话：</dt>
         <dd><input id="repwd" type="password" class="register_input" onFocus="repwdFocus()" onBlur="repwdBlur()"></dd>
        <dd><div id="repwd_prompt"></div></dd>
     </dl>
     <dl class="register_row">
        <dt>地址：</dt>
        <dd><input id="email" type="text" class="register_input" onFocus="emailFocus()" onBlur="emailBlur()"></dd>
        <dd><div id="email_prompt"></div></dd>
      </dl>
     <dl class="register_row">
        <dt>性别：</dt>
        <dd><input name="sex" id="man" type="radio" value="男"> <label for="man">男</label></dd>
       <dd> <input name="sex" id="woman" type="radio" value="女"> <label for="woman">女</label></dd>
     </dl>
     <dl class="register_row">
        <dt>所在地区：</dt>
        <dd><select id="province" onChange="changeCity()" style="width:120px;">
              <option>请选择省/城市</option>
              </select>
             </dd>
        <dd><select id="city"  style="width:130px;">
            <option>请选择城市/地区</option>
          </select></dd>
      </dl>
      <div class="registerBtn">
          <input id="registerBtn" type="image" src="${pageContext.request.contextPath}/static/images/register_btn_out.gif" onMouseOver="btn_over()" onMouseOut="btn_out()"></div>
   </form>
    </div>
    
    
  </div>
  </div>
<!--网站版权部分开始-->
<div id="footer">
</div>
</body>
</html>
