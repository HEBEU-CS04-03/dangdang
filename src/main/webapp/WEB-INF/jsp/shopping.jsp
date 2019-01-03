<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<head>
    <meta charset="utf-8"/>
    <title>当当网购物车页面</title>
    <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
</head>

<body>
<div id="header"></div>
<!--中间部分开始-->
<div id="main">
    <div>&nbsp;&nbsp;<img src="${pageContext.request.contextPath}/static/images/shopping_myshopping.gif" alt="shopping"> <a href="#">全场免运费活动中</a></div>
    <!--为您推荐商品开始-->
    <div class="shopping_commend">
        <div class="shopping_commend_left">根据您挑选的商品，当当为您推荐</div>
        <div class="shopping_commend_right"><img src="${pageContext.request.contextPath}/static/images/shopping_arrow_up.gif" alt="shopping"
                                                 id="shopping_commend_arrow" onClick="shopping_commend_show()"></div>
    </div>
    <div id="shopping_commend_sort">
        <div class="shopping_commend_sort_left">
            <c:forEach items="${firstBookList}" var="firstBookList">
                <ul>
                    <li class="shopping_commend_list_1">
                        ·<a href="${pageContext.request.contextPath}/book/toBookMessage?bookId=${firstBookList.bId}" class="blue">${firstBookList.bName}</a></li>
                    <li class="shopping_commend_list_2">￥
                        <fmt:formatNumber type="number" value="${firstBookList.bPrice * 1.2}" maxFractionDigits="2"/>
                    </li>
                    <li class="shopping_commend_list_3">￥${firstBookList.bPrice}</li>
                    <li class="shopping_commend_list_4"><button onclick="addShopCart(${firstBookList.bId})">购买</button> </li>
                </ul>
            </c:forEach>

        </div>
        <div class="shopping_commend_sort_mid"></div>
        <div class="shopping_commend_sort_left">
            <c:forEach items="${secondBookList}" var="secondBookList">
                <ul>
                    <li class="shopping_commend_list_1">
                        ·<a href="${pageContext.request.contextPath}/book/toBookMessage?bookId=${secondBookList.bId}" class="blue">${secondBookList.bName}</a></li>
                    <li class="shopping_commend_list_2">￥
                        <fmt:formatNumber type="number" value="${secondBookList.bPrice *1.2}" maxFractionDigits="2"/>
                    </li>
                    <li class="shopping_commend_list_3">￥${secondBookList.bPrice}</li>
                    <li class="shopping_commend_list_4"><button onclick="addShopCart(${secondBookList.bId})">购买</button></li>
                </ul>
            </c:forEach>
        </div>
    </div>

    <div class="shopping_list_top">您已选购以下商品</div>
    <div class="shopping_list_border">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr class="shopping_list_title">
                <td class="shopping_list_title_1">商品名</td>
                <td class="shopping_list_title_2">单品积分</td>
                <td class="shopping_list_title_3">市场价</td>
                <td class="shopping_list_title_4">当当价</td>
                <td class="shopping_list_title_5">数量</td>
                <td class="shopping_list_title_6">操作</td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="myTableProduct">
            <c:forEach items="${shopCartList}" var="shopCartList">
                <tr class="shopping_product_list" id="shoppingProduct_01" onMouseOver="productOver('shoppingProduct_01')"
                    onMouseOut="productOut('shoppingProduct_01')">
                    <td class="shopping_product_list_1">
                        <input type="checkbox" name="" value="" checked="checked"/>
                        <a href="${pageContext.request.contextPath}/book/toBookMessage?bookId=${shopCartList.bId}" class="blue" >${shopCartList.bName}</a>
                    </td>
                    <td class="shopping_product_list_2">
                        <label><fmt:formatNumber type="number" value="${shopCartList.bPrice}" maxFractionDigits="0"/></label>
                    </td>
                    <td class="shopping_product_list_3">
                        ￥<label><fmt:formatNumber type="number" value="${shopCartList.bPrice * 1.2}" maxFractionDigits="2"/></label>
                    </td>
                    <td class="shopping_product_list_4">
                        ￥<label><fmt:formatNumber type="number" value="${shopCartList.bPrice}" maxFractionDigits="2"/></label>(8折)
                    </td>
                    <td class="shopping_product_list_5">
                        <input id="bNumber" type="text" value="${shopCartList.bNumber}" onchange="productCount(${shopCartList.sId},this.value,${shopCartList.bId})">
                    </td>
                    <td class="shopping_product_list_6">
                        <a href="${pageContext.request.contextPath}/shopCart/deleteBookFormShopCart?sid=${shopCartList.sId}" class="blue">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <div class="ordersmessage" style="margin-top: 30px;margin-left: 700px;">
            <ul class="floatclear">
                <li class="ordersmessageli shopping_product_list_6">收货地址:</li>
                <li class="ordersmessageli">
                    <input type="text" id="address" value="${loginCustomer.cAddress}" name=""/>
                </li>
            </ul>
            <ul class="floatclear">
                <li class="ordersmessageli shopping_product_list_6">收货人:</li>
                <li class="ordersmessageli">
                    <input type="text" id="receiver" value="${loginCustomer.cName}" name=""/>
                </li>
            </ul>
            <ul class="floatclear">
                <li class="ordersmessageli shopping_product_list_6">电话:</li>
                <li class="ordersmessageli">
                    <input type="text" id="phone" value="${loginCustomer.cPhone}" name=""/>
                </li>
            </ul>
        </div>
        <div class="shopping_list_end floatclear">
            <input type="hidden" id="total" value="${totalMoney}">
            <ul>
                <li class="shopping_list_end_1">
                    <input name="" type="image" src="${pageContext.request.contextPath}/static/images/shopping_balance.gif" onclick="balance()">
                </li>
                <li class="shopping_list_end_2">
                    ￥<label id="product_total"></label>
                </li>
                <li class="shopping_list_end_3">
                    商品金额总计：<fmt:formatNumber type="number" value="${totalMoney}" maxFractionDigits="2"/>
                </li>
                <li class="shopping_list_end_4">
                    您共节省金额：<fmt:formatNumber type="number" value="${totalMoney*0.2}" maxFractionDigits="2"/>￥<label class="shopping_list_end_yellow" id="product_save"></label>
                    <br/>
                    可获商品积分：<fmt:formatNumber  type="number" value="${totalMoney}" maxFractionDigits="0"/><label class="shopping_list_end_yellow" id="product_integral"></label>
                </li>
            </ul>
        </div>


    </div>


</div>

<!--网站版权部分开始-->
<div id="footer">
</div>

<script>
    function productCount(sId,bNumber,bId) {
        $.ajax({
            type:"POST",
            url: '/book/findBookQuantity',
            dataType:"json",
            data:{bId:bId},
            success:function (data){
                if(bNumber <= data){
                    location.href="${pageContext.request.contextPath}/shopCart/updateShopCart?sid="+sId+"&number="+bNumber+"";
                    alert("修改图书数量成功！");
                }else {
                    alert("图书库存不足！");
                    location.reload();
                }
            },
            error: function (msg) {    //服务器执行异常调用此方法，msg为异常是服务器返回的数据
                alert("服务器异常！");
            }
        })
    }
    
    function balance() {
        if (!confirm("您确定要提交订单么？")){
            alert("已取消！");
            return;
        }
        var address = document.getElementById("address").value;
        var receiver = document.getElementById("receiver").value;
        var phone = document.getElementById("phone").value;
        var total = document.getElementById("total").value;

        location.href="${pageContext.request.contextPath}/shopCart/submitOrder?cAddress="+address+"&receiver="+receiver+"&cPhone="+phone+"&total="+total+"";
    }

    function addShopCart(bId) {
        $.ajax({
            type:"POST",
            url:"/shopCart/addBookToShopCart",
            dataType:"json",
            data:{bId:bId,bNumber:1},
            success:function (data) {

                if (data == false) {
                    alert("请先登录！");
                    location.href="${pageContext.request.contextPath}/toLoginPage";
                }else {
                    alert("已添加图书到购物车");
                    location.reload();
                }

            },
            fail:function (msg) {
                alert("服务器错误");
            }
        })
    }


</script>
</body>
</html>
