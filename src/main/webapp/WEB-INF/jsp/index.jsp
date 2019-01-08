<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8"/>
    <title>当当书城-首页</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"/>

</head>

<body>

<!-- 广告 -->
<div id="ad" style="position:absolute">
    <a href="/book/toIndex" title="有奖问答">
        <img style="height: 50px; width: 50px" src="${pageContext.request.contextPath}/static/img/youjiang.png"/>
    </a>
</div>

<!--头部-->
<div id="booktop">
    <div class="widthmid">
        <c:if test="${loginName eq null}">
            <span id="nickname">欢迎光临当当，请<a dd_name="登录" href="${pageContext.request.contextPath}/customer/loginTo"
                                           target="_self"
                                           rel="nofollow" class="login_link">登录</a></span>
        </c:if>
        <c:if test="${loginName ne null}">
            <span id="nickname">你好，<a dd_name="欢迎" href="${pageContext.request.contextPath}/customer/showCustomer"
                                      target="_self"
                                      rel="nofollow"
                                      class="login_link">${loginName}</a></span>
            <span id="nickname">&nbsp;&nbsp;<a dd_name="退出登录"
                                               href="${pageContext.request.contextPath}/customer/loginOut">退出登录</a></span>
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
            <input id="keyword" type="text" placeholder="作品、作者、出版社" class="searchtext">
            <span value="提交" class="searchbtn" onclick="search()"></span>
        </div>

        <ul class="header_fun header_funina">
            <li class="icon">&nbsp;</li>
            <li class="header_cart">
                <a href="${pageContext.request.contextPath}/shopCart/toShopCart" name="购物车" target="_blank">
                    购物车
                </a>
            </li>
            <li class="icon2">&nbsp;</li>
            <li class="header_order">
                <a href="${pageContext.request.contextPath}/orders/toOrderList" id="headerMyOrder">
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
                <a href="" target="_blank">积分管理</a>
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
                <a href="/book/toBookMessage?bookId=1002" target="_blank">
                    <img src="${pageContext.request.contextPath}/static/img/midimg.png"
                         style="width: 100%; height: 150px;"/>
                </a>
            </div>
            <div class="booktreemidend">
                <a href="/book/toBookMessage?bookId=1008" target="_blank">
                    <img src="${pageContext.request.contextPath}/static/img/midgg.png"
                         style="width: 100%; height: 120px;"/>
                </a>
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
            <div class="bookshow " onclick="toInfo(${book.bId})">
                <img class="bookshowleftimg" src="${pageContext.request.contextPath}/static/img/${book.bImage}"/>
                <div class="bookshowright">
                    <ul>
                        <li class="bookname">${book.bName}</li>
                        <li class="bookauthor">${book.bAuthor}</li>
                        <li class="bookimg"><img src="${pageContext.request.contextPath}/static/img/xingxing.png"></li>
                        <li class="bookprice">￥${book.bPrice}</li>
                        <li class="bookmes">${book.bDescription}</li>
                    </ul>
                </div>
            </div>
        </c:forEach>

    </div>

    <div id="bookbodyr" class="clearfloat ">
        <div class="weekdaytitle booktypebody">
            <span class="bodytitlespan">性价比推荐</span>
        </div>
        <c:forEach items="${bookByPrice}" var="book">
            <div class="bookshow " onclick="toInfo(${book.bId})">
                <img class="bookshowleftimg" src="${pageContext.request.contextPath}/static/img/${book.bImage}"/>
                <div class="bookshowright">
                    <ul>
                        <li class="bookname">${book.bName}</li>
                        <li class="bookauthor">${book.bAuthor}</li>
                        <li class="bookimg"><img src="${pageContext.request.contextPath}/static/img/xingxing.png"></li>
                        <li class="bookprice">￥${book.bPrice}</li>
                        <li class="bookmes"><p>${book.bDescription}</p></li>
                    </ul>
                </div>
            </div>
        </c:forEach>
    </div>

    <!--底部开始-->

    <div class="publicfootmod clearfloat">
        <div class="kong">

        </div>
        <div class="inner">
            <table class="footerTable">
                <tr>
                    <td>
                        <div class="footerTable footDiv">
                            <img src="${pageContext.request.contextPath}/static/img/footer_share.jpg" alt="" class="icon">
                            <span class="title">关注我们</span>
                        </div>
                    </td>
                    <td>
                        <div class="footerTable footDiv">
                            <img src="${pageContext.request.contextPath}/static/img/footer_author.jpg" alt="" class="icon">
                            <span class="title">作者后台</span>
                        </div>
                    </td>
                    <td>
                        <div class="footerTable footDiv">
                            <img src="${pageContext.request.contextPath}/static/img/footer_us.jpg" alt="" class="icon">
                            <span class="title">关于我们</span>
                        </div>
                    </td>
                </tr>
            </table>
        </div>

    </div>
    <!--底部end-->

</div>

<script>
    function search() {
        var keyword = document.getElementById("keyword");
        // alert("关键字：" + keyword.value);
        window.open("http://localhost:8080/book/searchBook?keyword=" + keyword.value);
    }

    var x = 50, y = 60;
    var xin = true, yin = true;
    var step = 1;
    var delay = 50;
    var obj = document.getElementById("ad");

    function floatAD() {
        var L = T = 0;
        var R = document.body.clientWidth - obj.offsetWidth;
        var B = document.body.clientHeight - obj.offsetHeight;
        obj.style.left = x + document.body.scrollLeft;
        obj.style.top = y + document.body.scrollTop;
        x = x + step * (xin ? 1 : -1);
        if (x < L) {
            xin = true;
            x = L
        }
        if (x > R) {
            xin = false;
            x = R
        }
        y = y + step * (yin ? 1 : -1);
        if (y < T) {
            yin = true;
            y = T
        }
        if (y > B) {
            yin = false;
            y = B
        }
    }

    var itl = setInterval("floatAD()", delay);
    obj.onmouseover = function floatStop() {
        clearInterval(itl);
    };
    obj.onmouseout = function () {
        itl = setInterval("floatAD()", delay)
    }

    function toInfo(bId) {
        location.href="${pageContext.request.contextPath}/book/toBookMessage?bookId="+bId+""
    }
</script>

</body>

</html>