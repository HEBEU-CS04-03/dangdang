<%--
  Created by IntelliJ IDEA.
  User: Comack
  Date: 2018/7/8
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="../static/js/html5.js"></script>
    <script type="text/javascript" src="../static/js/respond.min.js"></script>
    <script type="text/javascript" src="../static/js/PIE_IE678.js"></script>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="../static/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link href="${pageContext.request.contextPath}/static/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <title>编辑菜品页面</title>
</head>
<body>
<div style="width: 80%;margin: 20px auto">
    <form id="dishAddId" method="post" action="${pageContext.request.contextPath}/admin/updateBookType">
        <input type="hidden" name="tId" value="${booktype.tId}">
        <div class="col-lg-6 form-group">
            <div class="form-inline">
                分类名称
                <input type="text" style="width: 60%"  class="form-control" name="tType"  value="${booktype.tType}">
            </div>
        </div>
        </div>
       <div>
       <tr>
       &nbsp;&nbsp; <button onclick="submitForm()" class="btn btn-default" style="float: left">添加</button>&nbsp;&nbsp;
            <input class="btn btn-default"  type="reset" value="重置 ">
        </tr>
       </div>
       <!-- 
        <div class="col-lg-12 form-group ">
            <div class="form-inline">
            菜品描述
            <textarea class="form-control" style="width: 80%"  rows="13" name="description">${DishEdit.description}</textarea>
            </div>
        </div>
        --> 
    </form>
</div>
<script>
    function submitForm(){
        if(confirm("您确定要提交此信息么？")){
            var loginForm = document.getElementById("dishAddId");
            loginForm.submit();
        }
    }
</script>
</body>
</html>
