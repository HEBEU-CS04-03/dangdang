<%--
  Created by IntelliJ IDEA.
  User: 91074
  Date: 2019/1/3
  Time: 15:09
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
<aside class="Hui-aside">
    <div class="menu_dropdown bk_2">
        <dl id="">
            <dt>
                <i class="Hui-iconfont">&#xe616;</i>订单管理<i
                    class="Hui-iconfont menu_dropdown-arrow">&#xe6d5;</i>
            </dt>
            <dd>
                <ul>
                    <li><a href="${pageContext.request.contextPath}/admin/selectbooktype" title="统计订单" target="main">统计订单</a></li>
                    <li><a data-href="admin_ordersstatus.jsp" data-title="物流状态" href="javascript:void(0)">物流状态</a></li>
                </ul>
            </dd>
        </dl>
    </div>
</aside>
<div class="dislpayArrow hidden-xs">
    <a class="pngfix" href="javascript:void(0);"
       onclick="displaynavbar(this)"></a>
</div>
<section class="Hui-article-box">
    <div id="Hui-tabNav" class="Hui-tabNav hidden-xs">
        <div class="Hui-tabNav-wp">
            <ul id="min_title_list" class="acrossTab cl">
                <li class="active"><span title="我的桌面">我的桌面</span>
                    <em> </em></li>
            </ul>
        </div>

    </div>
    <div id="iframe_box" class="Hui-article">
        <div class="show_iframe">
            <div style="display: none" class="loading"></div>
            <iframe scrolling="yes" frameborder="0" src="/admin/welcome"></iframe>
        </div>
    </div>
</section>

<div class="contextMenu" id="Huiadminmenu">
    <ul>
        <li id="closethis">关闭当前</li>
        <li id="closeall">关闭全部</li>
    </ul>
</div>

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
