<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8"/>
    <title>当当书城-首页</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"/>

</head>

<body>

<!--头部-->
<div id="booktop">
    <div class="widthmid">
        <c:if test="${username eq null}">
            <span id="nickname">欢迎光临当当，请<a dd_name="登录" href="javascript:PageTopLogIn();" target="_self" rel="nofollow"
                                           class="login_link">登录</a></span>
        </c:if>
        <c:if test="${username != null}">
            <span id="nickname">你好，<a dd_name="欢迎" href="javascript:PageToPersonCenter();" target="_self"
                                      rel="nofollow"
                                      class="login_link">${username}</a></span>
        </c:if>
        <ul class="topbox">
            <li class="boxlia">
                <a target="_blank" href="http://giftcard.dangdang.com/giftcardCompany">企业采购</a>
            </li>
            <li class="boxlia">
                <a href="">我的当当</a>
            </li>
            <li class="boxlia">
                <a target="_blank" href="http://t.dangdang.com/20130220_ydmr">手机当当</a>
            </li>
            <li class="boxlia">
                <a href="http://book.dangdang.com/20181101_fqcu">当当出版</a>
            </li>
        </ul>

    </div>
</div>
<!--头部end-->

<div id="bookout" class="widthmid">

    <!--搜索开始-->
    <div id="booksearch">
        <a href="" class="logo">
            <img src="${pageContext.request.contextPath}/static/img/logo.jpg" style="border: none;">
        </a>
        <div class="searchdiv">
            <input type="text" placeholder="作品、作者、出版社" class="searchtext">
            <span type="button" value="提交" class="searchbtn"></span>
        </div>

        <ul class="header_fun header_funina">
            <li class="icon">&nbsp;</li>
            <li class="header_cart">
                <a href="javascript:void(0)" name="购物车">
                    购物车0
                </a>
            </li>
            <li class="icon2">&nbsp;</li>
            <li class="header_order">
                <a href="javascript:void(0)" id="headerMyOrder">
                    我的订单
                </a>
            </li>

        </ul>

    </div>
    <!--搜索end-->

    <!--横向菜单开始-->
    <div id="bookmenu">
        <ul class="uloutw">
            <li class="onimg">
                <img src="${pageContext.request.contextPath}/static/img/menua.png"/>
            </li>
            <li class="on">
                <a href="${pageContext.request.contextPath}/book/toIndex">首页</a>
            </li>
            <li class="phoneshow">
                <a target="_blank" href="http://t.dangdang.com/20130220_ydmr">手机看书</a>
            </li>
            <li class="for_hot_nav">
                <a target="_blank" href="http://book.dangdang.com/20161128_zl3t">当当阅读器</a>
            </li>
            <li class="want_to_recharge">
                <a href="" target="_blank">我要充值</a>
            </li>
            <li class="writer_sys">
                <a href="http://pbook-shequ.dangdang.com/welcome/" target="_blank">作者后台</a>
            </li>
        </ul>
    </div>
    <!--横向菜单end-->

    <!--中间纵向菜单和滚动开始-->
    <div id="booktree">

        <!--纵向菜单开始-->
        <div class="booktreeleft">
            <dl class="dttree">
                <dt class="booktype">图书分类</dt>
                <c:forEach items="${bookTypes}" var="type">
                    <dd class="booktypedd booktypeindiv">
                        <a target="_blank" href="${pageContext.request.contextPath}/book/toSort?typeId=${type.tId}"
                           class="wy">${type.tType}</a>
                    </dd>
                </c:forEach>
            </dl>
        </div>
        <!--纵向菜单end-->

        <!--滚动菜单开始-->
        <div class="booktreemid">
            <div class="booktreemidtop">
                <img src="${pageContext.request.contextPath}/static/img/midimg.png"
                     style="width: 100%; height: 150px;"/>
            </div>
            <div class="booktreemidend">
                <img src="${pageContext.request.contextPath}/static/img/midgg.png" style="width: 100%; height: 120px;"/>
            </div>

        </div>
        <!--滚动菜单end-->
    </div>
    <!--中间纵向菜单和滚动end-->

    <div id="bookbodym" class="clearfloat ">
        <div class="weekdaytitle booktypebody">
            <span class="bodytitlespan">新书上市</span>
        </div>
        <c:forEach items="${bookByTime}" var="book">
            <div class="bookshow ">
                <img class="bookshowleftimg" src="${pageContext.request.contextPath}/static/img/${book.bImage}"/>
                <ul class="bookshowrightul">
                    <li class="bookname">${book.bName}</li>
                    <li class="bookauthor">${book.bAuthor}</li>
                    <li class="bookimg"><img src="${pageContext.request.contextPath}/static/img/xingxing.png"></li>
                    <li class="bookprice">￥${book.bPrice}</li>
                    <li class="bookmes">${book.bDescription}</li>
                    <li class="bookxiangxi">
                        <a class="bookxiangxia" target="_blank"
                           href="${pageContext.request.contextPath}/book/toBookMessage?bookId=${book.bId}">查看详细</a>
                    </li>
                </ul>
            </div>
        </c:forEach>

    </div>

    <div id="bookbodyr" class="clearfloat ">
        <div class="weekdaytitle booktypebody">
            <span class="bodytitlespan">性价比推荐</span>
        </div>
        <c:forEach items="${bookByPrice}" var="book">
            <div class="bookshow ">
                <img class="bookshowleftimg" src="${pageContext.request.contextPath}/static/img/${book.bImage}"/>
                <ul class="bookshowrightul">
                    <li class="bookname">${book.bName}</li>
                    <li class="bookauthor">${book.bAuthor}</li>
                    <li class="bookimg"><img src="${pageContext.request.contextPath}/static/img/xingxing.png"></li>
                    <li class="bookprice">￥${book.bPrice}</li>
                    <li class="bookmes">${book.bDescription}</li>
                    <li class="bookxiangxi">
                        <a class="bookxiangxia" target="_blank"
                           href="${pageContext.request.contextPath}/book/toBookMessage?bookId=${book.bId}">查看详细</a>
                    </li>
                </ul>
            </div>
        </c:forEach>
    </div>

    <!--底部开始-->

    <div class="publicfootmod clearfloat">
        <div class="kong">

        </div>
        <div class="inner">
            <ul>
                <li class="func focusOn clearfix">
                    <div class="left">
                        <img src="${pageContext.request.contextPath}/static/img/footer_share.jpg" alt="" class="icon">
                    </div>
                    <div class="right">
                        <p class="title">关注我们</p>
                        <p class="desc">最受欢迎的阅读产品</p>
                        <p class="subtitle">关注我们：</p>

                    </div>
                </li>
                <li class="func author clearfix">
                    <div class="left">
                        <img src="${pageContext.request.contextPath}/static/img/footer_author.jpg" alt="" class="icon">
                    </div>
                    <div class="right">
                        <p class="title">作者后台</p>
                        <p class="desc">加入当当原创网，尊享作者</p>
                        <p class="subtitle">福利，成就网文大神</p>
                    </div>
                </li>
                <li class="func about_us clearfix">
                    <div class="left">
                        <img src="${pageContext.request.contextPath}/static/img/footer_us.jpg" alt="" class="icon">
                    </div>
                    <div class="right">
                        <p class="title">关于我们</p>
                        <p class="desc">欢迎反馈宝贵意见给我们</p>
                        <p class="subtitle">客服书吧：当当读书5.0问答</p>
                    </div>
                </li>
            </ul>
        </div>

    </div>
    <!--底部end-->

</div>
</body>

</html>