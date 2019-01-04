<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

	<head>
		<meta charset="utf-8" />
		
<title>当当网登录页面</title>
<link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/login.js"></script>
</head>

<body>
<div id="header">
   <div class="login_header_left"><img src="${pageContext.request.contextPath}/static/img/logo.jpg" alt="logo"></div>
   <div class="login_header_mid">我的生活我的当当</div>
   <div class="login_header_right"><a href="index.jsp" class="blue">首页</a> | <a href="product.html" class="blue">商品展示页</a>  | <a href="shopping.jsp" class="blue">购物车</a> | <a href="${pageContext.request.contextPath}/customer/registerTo;" class="blue">注册</a></div>
</div>

<div id="main">
  <div class="login_main_left">
     <div><img src="${pageContext.request.contextPath}/static/images/login_main_01.jpg" alt="中间图片">
          <img src="${pageContext.request.contextPath}/static/images/login_main_02.jpg" alt="中间图片">
          <img src="${pageContext.request.contextPath}/static/images/login_main_03.jpg" alt="中间图片">
    </div>
     <div class="login_main_end">
       <dl class="login_green">
          <dt>更多选择、更低价格</dt>
          <dd>100万种商品包含图书、数码、美妆、运动健康等，价格低于地面店20%以上</dd>
       </dl>
       
         <div class="login_main_dotted"></div>
       <dl class="login_green">
          <dt>全场免运费、货到付款</dt>
          <dd>免费送货上门、360个城市货到付款。另有网上支付、邮局汇款等多种支付方式</dd>
       </dl>
       
       <div class="login_main_dotted"></div>
      <dl class="login_green">
          <dt>真实、优质的商品评论</dt>
          <dd>千万用户真实、优质的商品评论，给您多角度、全方位的购物参考</dd>
       </dl>
    </div>
  </div>
  <div class="login_main_mid">
    <div class="login_content_top">请登录当当网</div>
    <div class="login_content_line"></div>
    <form action="${pageContext.request.contextPath}/customer/login" method="post" onSubmit="return checkLogin()">
    <dl class="login_content">
       <dt>用户名：</dt>
       <dd><input id="email" type="text" class="login_content_input" name="loginName" value="${loginName}"></dd>
    </dl>
     <dl class="login_content">
       <dt>密码：</dt>
       <dd><input id="pwd" type="password" class="login_content_input" name="password" value="${password}"></dd>
         <dd value="${msg}"><font color="red">${msg}</font> </dd>
    </dl>
     <dl class="login_content">
       <dt></dt>
       <dd><input id="btn" value=" 登    录 " type="submit" class="login_btn_out"  onmouseover="this.className='login_btn_over'"  onmouseout="this.className='login_btn_out'"></dd>
    </dl>
    </form>
    <div class="login_content_dotted"></div>
    <div class="login_content_end_bg">
     <div class="login_content_end_bg_top">
    <label class="login_content_bold">还不是当当网用户？</label>快捷方便的免费注册，让你立刻尽享当当网提供的条项优惠服务......
     </div>
     <div class="login_content_end_bg_end">
     <input  class="login_register_out" value=" " type="button" onmouseover="this.className='login_register_over'"  onmouseout="this.className='login_register_out'" onclick="toRegister()">
      </div>
    
    </div>
   
  </div>
  <div class="login_main_right"><img src="${pageContext.request.contextPath}/static/images/login_main_04.jpg" alt="右侧图片"></div>
</div>

<div id="footer">
</div>
<script type="text/javascript">
    function toRegister() {
        window.open("http://localhost:8080/customer/registerTo");
    }
</script>

</body>
</html>
