<%--
  Created by IntelliJ IDEA.
  User: 91074
  Date: 2019/1/3
  Time: 13:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/Hui-iconfont/iconfont.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/h-ui.admin/skin/default/skin.css"
          id="skin" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/h-ui.admin/css/style.css" />
    <title>Title</title>
</head>

<body>
<iframe rows="80,*" cols="*" frameborder="no" border="0" framespacing="0">
    <iframe src="${pageContext.request.contextPath}/top" name=title scrolling="no" noresize="noresize" ></iframe>
    <iframe cols="220,*" frameborder="no" border="0" framespacing="0"></iframe>
    <iframe src="${pageContext.request.contextPath}/tree" name=tree scrolling="no" marginheight="0" marginwidth="0"></iframe>
    <iframe src="${pageContext.request.contextPath}/right" name=main scrolling="yes" frameborder="0" marginwidth="0" marginheight="0" noresize="noresize">
    </iframe>
</iframe>


<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/layer/2.4/layer.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/h-ui/js/H-ui.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/h-ui.admin/js/H-ui.admin.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/js/jquery.contextmenu.r2.js"></script>
</body>
</html>
