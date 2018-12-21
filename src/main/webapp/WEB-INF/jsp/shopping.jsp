<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <meta charset="utf-8"/>
    <title>当当网购物车页面</title>
    <link href="${pageContext.request.contextPath}/static/css/global.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/layout.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/shopping.js"></script>
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
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">JavaScript DOM编程艺术</a></li>
                <li class="shopping_commend_list_2">￥39.00</li>
                <li class="shopping_commend_list_3">￥29.30</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">解禁（当当网独家首发）</a></li>
                <li class="shopping_commend_list_2">￥28.00</li>
                <li class="shopping_commend_list_3">￥19.40</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">地王之王（金融危机下房地产行...</a></li>
                <li class="shopping_commend_list_2">￥32.80</li>
                <li class="shopping_commend_list_3">￥25.10</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">逃庄</a></li>
                <li class="shopping_commend_list_2">￥36.00</li>
                <li class="shopping_commend_list_3">￥27.70</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
        </div>
        <div class="shopping_commend_sort_mid"></div>
        <div class="shopping_commend_sort_left">
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">深入浅出MySQL数据库开发、优...</a></li>
                <li class="shopping_commend_list_2">￥59.00</li>
                <li class="shopping_commend_list_3">￥47.20</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">大玩家（马未都、王刚推荐!央...</a></li>
                <li class="shopping_commend_list_2">￥34.80</li>
                <li class="shopping_commend_list_3">￥20.60</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">都市风水师--官场风水小说：一...</a></li>
                <li class="shopping_commend_list_2">￥39.80</li>
                <li class="shopping_commend_list_3">￥30.50</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
            <ul>
                <li class="shopping_commend_list_1">·<a href="#" class="blue">国戏（以麻将术语解读宦海沉浮...</a></li>
                <li class="shopping_commend_list_2">￥25.00</li>
                <li class="shopping_commend_list_3">￥17.30</li>
                <li class="shopping_commend_list_4"><a href="#" class="shopping_yellow">购买</a></li>
            </ul>
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
                <td class="shopping_list_title_6">删除</td>
            </tr>
        </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" id="myTableProduct">
            <tr class="shopping_product_list" id="shoppingProduct_01" onMouseOver="productOver('shoppingProduct_01')"
                onMouseOut="productOut('shoppingProduct_01')">
                <td class="shopping_product_list_1">
                    <input type="checkbox" name="" id="" value="" checked="checked"/>
                    <a href="#" class="blue">私募（首部披露资本博弈秘密的金融...</a></td>
                <td class="shopping_product_list_2"><label>189</label></td>
                <td class="shopping_product_list_3">￥<label>32.00</label></td>
                <td class="shopping_product_list_4">￥<label>18.90 </label>(59折)</td>
                <td class="shopping_product_list_5"><input type="text" value="1" onblur="productCount()"></td>
                <td class="shopping_product_list_6"><a href="javascript:deleteProduct('shoppingProduct_01')"
                                                       class="blue">删除</a></td>
            </tr>
            <tr class="shopping_product_list" id="shoppingProduct_02" onMouseOver="productOver('shoppingProduct_02')"
                onMouseOut="productOut('shoppingProduct_02')">
                <td class="shopping_product_list_1">
                    <input type="checkbox" name="" id="" value="" checked="checked"/>
                    <a href="#" class="blue"> 小团圆（张爱玲最神秘小说遗稿）</a></td>
                <td class="shopping_product_list_2"><label>173</label></td>
                <td class="shopping_product_list_3">￥<label>28.00</label></td>
                <td class="shopping_product_list_4">￥<label>17.30</label>(62折)</td>
                <td class="shopping_product_list_5"><input type="text" value="1" onBlur="productCount()"></td>
                <td class="shopping_product_list_6"><a href="javascript:deleteProduct('shoppingProduct_02')"
                                                       class="blue">删除</a></td>
            </tr>

            <tr class="shopping_product_list" id="shoppingProduct_03" onMouseOver="productOver('shoppingProduct_03')"
                onMouseOut="productOut('shoppingProduct_03')">
                <td class="shopping_product_list_1">
                    <input type="checkbox" name="" id="" value="" checked="checked"/>
                    <a href="#" class="blue">
                        不抱怨的世界(畅销全球80国的世界...</a></td>
                <td class="shopping_product_list_2"><label>154</label></td>
                <td class="shopping_product_list_3">￥<label>24.80</label></td>
                <td class="shopping_product_list_4">￥<label>15.40</label> (62折)</td>
                <td class="shopping_product_list_5"><input type="text" value="2" onBlur="productCount()"></td>
                <td class="shopping_product_list_6"><a href="javascript:deleteProduct('shoppingProduct_03')"
                                                       class="blue">删除</a></td>
            </tr>
            <tr class="shopping_product_list" id="shoppingProduct_04" onMouseOver="productOver('shoppingProduct_04')"
                onMouseOut="productOut('shoppingProduct_04')">
                <td class="shopping_product_list_1">
                    <input type="checkbox" name="" id="" value="" checked="checked"/>
                    <a href="#" class="blue">福玛特双桶洗衣机XPB20-07S</a></td>
                <td class="shopping_product_list_2"><label>358</label></td>
                <td class="shopping_product_list_3">￥<label>458.00</label></td>
                <td class="shopping_product_list_4">￥<label>358.00</label> (78折)</td>
                <td class="shopping_product_list_5"><input type="text" value="1" onBlur="productCount()"></td>
                <td class="shopping_product_list_6"><a href="javascript:deleteProduct('shoppingProduct_04')"
                                                       class="blue">删除</a></td>
            </tr>
            <tr class="shopping_product_list" id="shoppingProduct_05" onMouseOver="productOver('shoppingProduct_05')"
                onMouseOut="productOut('shoppingProduct_05')">
                <td class="shopping_product_list_1">
                    <input type="checkbox" name="" id="" value="" checked="checked"/>
                    <a href="#" class="blue">PHP和MySQL Web开发 （原书第4版）</a></td>
                <td class="shopping_product_list_2"><label>712</label></td>
                <td class="shopping_product_list_3">￥<label>95.00</label></td>
                <td class="shopping_product_list_4">￥<label>71.20</label> (75折)</td>
                <td class="shopping_product_list_5"><input type="text" value="1" onBlur="productCount()"></td>
                <td class="shopping_product_list_6"><a href="javascript:deleteProduct('shoppingProduct_05')"
                                                       class="blue">删除</a></td>
            </tr>
            <tr class="shopping_product_list" id="shoppingProduct_06" onMouseOver="productOver('shoppingProduct_06')"
                onMouseOut="productOut('shoppingProduct_06')">
                <td class="shopping_product_list_1">
                    <input type="checkbox" name="" id="" value="" checked="checked"/>
                    <a href="#" class="blue">法布尔昆虫记</a>（再买￥68.30即可参加“满199元减10元现金”活动）
                </td>
                <td class="shopping_product_list_2"><label>10</label></td>
                <td class="shopping_product_list_3">￥<label>198.00</label></td>
                <td class="shopping_product_list_4">￥<label>130.70</label> (66折)</td>
                <td class="shopping_product_list_5"><input type="text" value="1" onBlur="productCount()"></td>

                <td class="shopping_product_list_6"><a href="javascript:deleteProduct('shoppingProduct_06')"
                                                       class="blue">删除</a></td>
            </tr>
        </table>

        <div class="ordersmessage" style="margin-top: 10px;">
            <ul class="floatclear">
                <li class="ordersmessageli shopping_product_list_6">收货地址</li>
                <li class="ordersmessageli"><input type="text" id="" value="" name=""/></li>

            </ul>
            <ul class="floatclear">
                <li class="ordersmessageli shopping_product_list_6">收货人</li>
                <li class="ordersmessageli"><input type="text" id="" value="" name=""/></li>
            </ul>
            <ul class="floatclear">
                <li class="ordersmessageli shopping_product_list_6">电话</li>
                <li class="ordersmessageli"><input type="text" id="" value="" name=""/></li>
            </ul>
        </div>
        <div class="shopping_list_end floatclear">
            <ul>
                <li class="shopping_list_end_1"><input name="" type="image" src="${pageContext.request.contextPath}/static/images/shopping_balance.gif"></li>
                <li class="shopping_list_end_2">￥<label id="product_total"></label></li>
                <li class="shopping_list_end_3">商品金额总计：</li>
                <li class="shopping_list_end_4">您共节省金额：￥<label class="shopping_list_end_yellow"
                                                               id="product_save"></label><br/>
                    可获商品积分：<label class="shopping_list_end_yellow" id="product_integral"></label>
                </li>
            </ul>
        </div>


    </div>


</div>

<!--网站版权部分开始-->
<div id="footer">
</div>
</body>
</html>
