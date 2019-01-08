<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: 91074
  Date: 2018/12/31
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>订单管理</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/Hui-iconfont/iconfont.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.min.js"></script>

    <script type="text/javascript">
        $(function(){
        /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
        $("tr[id^='data_']").hover(function(){
            $(this).css("backgroundColor","#99ccff");
        },function(){
            $(this).css("backgroundColor","#ffffff");
        })
        })
    </script>
</head>
<body>
<br>
<div class="page-container">
    <div class="">
        请选择图书类型：<span class="select-box" style="width:200px">
            <select id="typeS" class="select" name="brandclass" size="1" onchange="searchType()">
                <option value="0">所有类型</option>
                <c:forEach items="${booktypes}" var="type">
                    <option value="${type.tId}">${type.tType}</option>
                </c:forEach>
            </select>
        </span>
        <%--<button class="btn btn-success" value="搜索" onclick="searchType()">--%>
        <%--<i class="Hui-iconfont">&#xe665;</i>搜索--%>
        <%--</button>--%>
    </div>
    <div>
        <span class="r">共有数据：<strong>${bookTypetotal}</strong>条</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr class="text-c">
            <th colspan="2" scope="col"><h5><strong>今日图书销售信息汇总表</strong></h5></th>
        </tr>
        <tr class="text-c">
            <th>图书类别</th>
            <th>订单量</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookTypeCounts}" var="typeCount" varStatus="stat">
            <tr class="text-c" id="data_${stat.index}">

                <td>${typeCount.tType}</td>
                <td>${typeCount.count}</td>
            </tr>
        </c:forEach>
        </tbody>
        <div style="width: 100%;text-align: center;">
            <div id="page"></div>
        </div>
    </table>

</div>
<script type="text/javascript">
    function searchType() {
        var type = document.getElementById("typeS").value;
        // alert(type);
        window.location.href = "${pageContext.request.contextPath}/admin/selectbooktype?brandclass=" + type;
        // window.open("http://localhost:8080/admin/selectbooktype?brandclass=" + type);
    }
</script>
</body>
</html>
