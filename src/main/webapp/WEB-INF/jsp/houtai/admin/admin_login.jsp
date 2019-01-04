<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>
<![endif]-->

<link href="${pageContext.request.contextPath}/static/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/static/css/iconfont.css" rel="stylesheet" type="text/css" />

<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->

<title>当当后台登录</title>
</head>
<body>
	<input type="hidden" id="TenantId" name="TenantId" value="" />
<div class="header"><h1><font face="楷体" color="ffffff">&nbsp;&nbsp;&nbsp;&nbsp;欢迎您登陆--当当书城后台</font></h1></div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="login" method="post">
      <div class="row cl">
      
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        
        <p color="ff0000">&nbsp;&nbsp;&nbsp;${requestScope.msg} </p>
        <div class="formControls col-xs-8">
          <input id="" name="username" type="text" placeholder="账户" class="input-text size-L" value=${username}>
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="" name="password" type="password" placeholder="密码" class="input-text size-L" >
        </div>
      </div>
      
      <!-- 验证码 -->
     <!--   
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input class="input-text size-L" type="text" placeholder="验证码" onblur="if(this.value==''){this.value='验证码:'}" onclick="if(this.value=='验证码:'){this.value='';}" value="验证码:" style="width:150px;">
          <img src=""> <a id="kanbuq" href="javascript:;">看不清，换一张</a> </div>
      </div>
      -->
      
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <label for="online">
            <input type="checkbox" name="online" id="online" value="">
            使我保持登录状态</label>
        </div>
      </div>
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 当当书城-第三组</div>
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script>
<!--此乃百度统计代码，请自行删除-->
<script>
	var _hmt = _hmt || [];
	(function() {
	  var hm = document.createElement("script");
	  hm.src = "https://hm.baidu.com/hm.js?080836300300be57b7f34f4b3e97d911";
	  var s = document.getElementsByTagName("script")[0]; 
	  s.parentNode.insertBefore(hm, s);
	})();
</script>

</body>
</html>