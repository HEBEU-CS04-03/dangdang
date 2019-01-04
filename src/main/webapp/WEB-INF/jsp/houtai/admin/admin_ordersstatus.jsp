<%--
  Created by IntelliJ IDEA.
  User: 91074
  Date: 2018/12/31
  Time: 12:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

</head><title>物流状态</title>
<body>
<nav class="breadcrumb"> <i class="Hui-iconfont">&#xe67f;</i>首页 <span
        class="c-gray en">&gt;</span>订单管理<span class="c-gray en">&gt;</span>物流状态
    <a class="btn btn-success radius r"
       style="line-height: 1.6em; margin-top: 3px" href="" title="刷新"> <i
            class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
    <div>
        日期范围： <input type="text"
                     onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })"
                     id="logmin" class="input-text Wdate" style="width: 120px;">
        - <input type="text"
                 onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })"
                 id="logmax" class="input-text Wdate" style="width: 120px;">
        <input type="text" name="" id="" placeholder="订单编号"
               style="width: 250px" class="input-text">
        <button name="" id="" class="btn btn-success" type="submit">
            <i class="Hui-iconfont">&#xe665;</i> 查询
        </button>
    </div>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="1"><a href="" onclick="datadel()"
                               class="btn btn-danger radius"> <i class="Hui-iconfont">&#xe6e2;</i>批量删除
			</a></span> <span class="r">共有数据：<strong>54</strong>条
			</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="20"><input type="checkbox" name="" value=""></th>
                <th width="50">订单编号</th>
                <th width="50">下单时间</th>
                <th width="50">收货人</th>
                <th width="100">收货地址</th>
                <th width="50">总金额</th>
                <th width="50">物流状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr class="text-c">
                <td><input name="" type="checkbox" value=""></td>
                <td>1</td>
                <td>2018-12-30</td>
                <td>李四</td>
                <td>河北省邯郸市河北工程大学</td>
                <td>123.2</td>
                <td class="td-status"><span
                        class="label label-success radius">已发货</span></td>
                <td class=""><a style="" onclick="" href="" title="编辑"> <i
                        class="Hui-iconfont">&#xe6df;</i></a><a style="" class="" onclick=""
                                                                href="" title="删除"> <i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
            <tr class="text-c">
                <td><input name="" type="checkbox" value=""></td>
                <td>2</td>
                <td>2018-12-30</td>
                <td>李四</td>
                <td>河北省邯郸市河北工程大学</td>
                <td>133</td>
                <td class="td-status"><span
                        class="label label-success radius">未发货</span></td>
                <td class=""><a style="" onclick="" href="" title="编辑"> <i
                        class="Hui-iconfont">&#xe6df;</i></a><a style="" class="" onclick=""
                                                                href="" title="删除"> <i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
            <tr class="text-c">
                <td><input name="" type="checkbox" value=""></td>
                <td>3</td>
                <td>2018-12-30</td>
                <td>李四</td>
                <td>河北省邯郸市河北工程大学</td>
                <td>100</td>
                <td class="td-status"><span
                        class="label label-success radius">售书完成</span></td>
                <td class=""><a style="" onclick="" href="" title="编辑"> <i
                        class="Hui-iconfont">&#xe6df;</i></a><a style="" class="" onclick=""
                                                                href="" title="删除"> <i class="Hui-iconfont">&#xe6e2;</i></a></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
