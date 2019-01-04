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
    <title>Title</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/h-ui/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/h-ui.admin/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/Hui-iconfont/iconfont.css" />
</head>
<body>
<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i>首页 <span
        class="c-gray en">&gt;</span>订单管理<span class="c-gray en">&gt;</span>
    统计订单 <a class="btn btn-success radius r"
            style="line-height: 1.6em; margin-top: 3px" href="" title="刷新"> <i
            class="Hui-iconfont">&#xe68f;</i></a></nav>
<br>
<div class="page-container">
    <div class="">
        <form class="Huiform" method="post" action="" target="_self">
                    <span class="select-box" style="width:200px"> <select class="select" name="brandclass" size="1">
                            <option value="1" selected>编程类</option>
                            <option value="0">小说类</option>
                            <option value="0">科幻类</option>
                            <option value="0">漫画类</option>
                    </select>
                    </span>
            <button type="button" class="btn btn-success" id="" name="" onClick="picture_colume_add(this);">
                <i class="Hui-iconfont">&#xe665;</i>查询
            </button>
        </form>
    </div>
    <div>
        <span class="r">共有数据：<strong>100</strong>条</span>
    </div>
    <table class="table table-border table-bordered table-bg">
        <thead>
        <tr>
            <th colspan="2"  scope="col" >今日图书销售信息汇总表</th>
        </tr>
        <tr class="text-c">
            <th>图书类别</th>
            <th>订单量</th>
        </tr>
        </thead>
        <tbody>
        <tr class="text-c">
            <td>编程类</td>
            <td>10000</td>
        </tr>
        <tr class="text-c">
            <td>小说类</td>
            <td>10000</td>
        </tr>
        <tr class="text-c">
            <td>科幻类</td>
            <td>10000</td>
        </tr>
        <tr class="text-c">
            <td>漫画类</td>
            <td>10000</td>
        </tr>
        </tbody>
    </table>

</div>
</body>
</html>
