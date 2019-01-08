<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8"/>
    <title>${book.bName}详情页-当当书城</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/goodsmessage.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>

</head>

<body>

<!--头部-->
<div id="booktop">
    <div class="widthmid">

        <c:if test="${loginName eq null}">
            <span id="nickname">欢迎光临当当，请<a dd_name="登录" href="javascript:PageTopLogIn();" target="_self" rel="nofollow"
                                           class="login_link">登录</a></span>
        </c:if>
        <c:if test="${loginName != null}">
            <span id="nickname">你好，<a dd_name="欢迎" href="${pageContext.request.contextPath}/customer/showCustomer" target="_self"
                                      rel="nofollow"
                                      class="login_link">${loginName}</a></span>
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
        <a href="${pageContext.request.contextPath}/book/toIndex" class="logo">
            <img src="${pageContext.request.contextPath}/static/img/logo.jpg" style="border: none;">
        </a>
        <div class="searchdiv">
            <input id="keyword" type="text" placeholder="作品、作者、出版社" class="searchtext">
            <span onclick="search()" type="button" value="提交" class="searchbtn"></span>
        </div>

        <ul class="header_fun header_funina">
            <li class="icon">&nbsp;</li>
            <li class="header_cart">
                <a href="${pageContext.request.contextPath}/shopCart/toShopCart" name="购物车">
                    购物车
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
                <a href="" target="_blank">积分管理</a>
            </li>
            <li class="writer_sys">
                <a href="http://pbook-shequ.dangdang.com/welcome/" target="_blank">作者后台</a>
            </li>
        </ul>
    </div>
    <!--横向菜单end-->

    <div id="bookbodym" class="clearfloat ">
        <div class="goodsmessageout">
            <div class="goodsmessageoutleft">
                <img src="${pageContext.request.contextPath}/static/img/${book.bImage}"
                     style="width: 70%; height: 50%"/>
            </div>
            <div class="goodsmessageoutright">

                <div class="name_info" ddt-area="001">
                    <!-- 主标题 -->
                    <h3 title="">
                        ${book.bName} </h3>
                </div>

                <div class="messbox_info">
                    <span class="t1" id="author" dd_name="作者" ddt-area="002">作者：<a href="/book/searchBook?keyword=${book.bAuthor}" target="_blank"
                                                                                   dd_name="作者">${book.bAuthor}</a></span>&nbsp;&nbsp;
                    <br/>
                    <span class="t1" dd_name="出版社" ddt-area="003">出版社：<a href="/book/searchBook?keyword=${book.bPress}" target="_blank"
                                                                         dd_name="出版社">${book.bPress}</a></span>&nbsp;&nbsp;
                    <br/>
                    <span class="t1">出版时间：${dateUtil.formateTime(book.bTime)}&nbsp;</span>
                    <!-- 评论数 -->
                    <div class="pinglun">
                        <!-- 排名 -->
                        <span class="t1" id="pubbang" style="display:none" dd_name="图书排行榜排名"></span>
                        <!-- 星级 -->
                        <span class="t1">评分：&nbsp;</span>
                        <span class="star_box">
        	<span class="star" style="width:92.4%"><img
                    src="${pageContext.request.contextPath}/static/img/xingxing.png"/></span>
								</span>
                        <br/>
                        <span class="t1">评论数：&nbsp;</span>
                        <a href="javascript:void(0)" id="comm_num_down" dd_name="评论数">${comments.size()}</a> 条评论
                    </div>
                </div>

                <hr/>
                <div class="messbox_info">
                    <%--配送至 <input type="text" id="address" style="outline: none;" value=""/> 有货 满39元免运费--%>
                        价格：￥${book.bPrice}
                </div>
                <span class="hot" title="">
                            <a href="http://book.dangdang.com/20170612_nrsg">青春动漫传记分会场畅品3折起5折封</a>
                        </span>
                <hr style="color: #FFFFFF;border: 1px;"/>
                <div class="messbox_info">
                    <!-- 副标题、促销语 -->
                    <p class="bookDescription">
                        <span class="head_title_name" title="">
                            包邮！${book.bDescription}
                        </span>
                        <br/>

                        <span class="yushou" id="presale-title" style="display: none;"></span>
                    </p>
                    <ul style="position: absolute;bottom: 0;right: 0">
                        <li class="commonli">
                            <input type="button" id="v1" value="-" style="width: 20px;height: 30px;" onclick="numberDown()"/>
                        </li>
                        <li class="commonli">
                            <input type="text" style="width: 30px;height: 30px;text-align: center" id="num" value="1" readonly="readonly" />
                        </li>
                        <li class="commonli">
                            <input type="button" id="" value="+" style="width: 20px;height: 30px;" readonly="readonly" onclick="document.all.num.value=parseInt(document.all.num.value)+1"/>
                        </li>
                        <li class="commonli">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="image" src="${pageContext.request.contextPath}/static/img/addshop.png"  onclick="addShopCart(${book.bId})" />
                        </li>
                    </ul>

                </div>

            </div>

        </div>

    </div>

    <!-- 评论开始 -->
    <div id="commit" class="clearfloat ">
        <div class="weekdaytitle booktypebody">
            <span class="bodytitlespan">评论列表</span>
        </div>

        <c:forEach items="${comments}" var="comment">
            <div class="media">
                <h5 style="font-weight: bolder">${comment.cName}</h5>
                <div class="media-left">
                    <a href="#">
                        <img style="vertical-align: middle;height: 30px;width: 30px;border: 0;"
                             src="${pageContext.request.contextPath}/static/img/user.png" title="One movies" alt=" "/>
                    </a>
                </div>
                <div class="media-body">
                    <p>${comment.coMessage}</p>
                    <span style="color: red;">发布时间 :<a href="#"> ${comment.coTime} </a></span>
                </div>
            </div>
        </c:forEach>



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
    </script>
</div>
<script>
    function search() {
        var keyword = document.getElementById("keyword");
        // alert("关键字：" + keyword.value);
        window.open("http://localhost:8080/book/searchBook?keyword=" + keyword.value);
    }

    function addShopCart(bId) {
        var bNumber = document.getElementById("num").value;
        $.ajax({
            type:"POST",
            url:"/shopCart/addBookToShopCart",
            dataType:"json",
            data:{bId:bId,bNumber:bNumber},
            success:function (data) {
                if (data == false) {
                    alert("请先登录！");
                    location.href="${pageContext.request.contextPath}/customer/loginTo";
                }else {
                    alert("已添加"+bNumber+"件图书到购物车");
                }
            },
            fail:function (msg) {
                alert("服务器错误");
            }
        })
    }

    function numberDown() {
        var num = document.getElementById("num");
        if(num.value == 1){
            alert("数量最小为1！");
        }else{
            num.value = num.value - 1;
        }
    }
</script>

</body>

</html>