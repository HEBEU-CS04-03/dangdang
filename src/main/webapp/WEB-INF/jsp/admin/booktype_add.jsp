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
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css" />
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/static/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/static/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
    <title>新增图书分类页面</title>
</head>
<body>
    <div style="width: 80%;margin: 20px auto">
        <form id="dishAddId"  method="post" >
            <%--<div class="col-lg-6 form-group">--%>
                <%--<input type="text" style="width: 60%"  class="form-control" name="tId" placeholder="分类编号">--%>
            <%--</div>--%>
            <div class="col-lg-6 form-group">
                <input type="text" style="width: 60%" value="" class="form-control" id="tType" name="tType" placeholder="分类名称">
            </div>
        </form>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button id="add_type" onclick="submit_form()" class="btn btn-default">添加</button>
    </div>
<script>
    function submit_form() {
        var tType = document.getElementById("tType").value;
        if (tType === "") {
            alert("图书分类不能为空");
            return false;
        }
        var frm = document.getElementById("dishAddId");
        frm.action = "/bookType/addBookType";
        frm.submit();
    }
</script>
</body>
</html>
