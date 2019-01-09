<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: 91074
  Date: 2019/1/5
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/Hui-iconfont/iconfont.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.2.1.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <!-- <![endif]-->

    <!--[if IE]>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <![endif]-->

    <!--[if !IE]> -->
    <script type="text/javascript">
        window.jQuery || document.write("<script src='${pageContext.request.contextPath}/static/assets/js/jquery-2.0.3.min.js'>" + "<" + "/script>");
    </script>
    <!-- <![endif]-->

    <!--[if IE]>
    <script type="text/javascript">
        window.jQuery || document.write("<script src='${pageContext.request.contextPath}/static/assets/js/jquery-1.10.2.min.js'>" + "<" + "/script>");
    </script>
    <![endif]-->

    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/static/assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="${pageContext.request.contextPath}/static/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>

    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>物流查询</title>
    <script type="text/javascript">
        $(function () {
            /** 获取上一次选中的部门数据 */
            var boxs = $("input[type='checkbox'][id^='box_']");
            /** 给全选按钮绑定点击事件  */
            $("#checkAll").click(function () {
                // this是checkAll  this.checked是true
                // 所有数据行的选中状态与全选的状态一致
                boxs.attr("checked", this.checked);
            })
        })
    </script>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <br>
            <div class="cl pd-5 bg-1 bk-gray mt-20">
    <span class="l_f">
        <a href="javascript:void()" class="btn btn-danger" id="delete_selected"><i class="icon-trash bigger-120"></i>批量删除</a>
    </span>
                <span class="r">共有数据：<strong>${orderstotal}</strong>条</span>
            </div>
            <br>
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace" id="checkAll"><span class="lbl"></span></label>
                        </th>
                        <th width="150">订单编号</th>
                        <th width="80">下单时间</th>
                        <th width="80">收货人</th>
                        <th width="100">收货地址</th>
                        <th width="70">总金额</th>
                        <th width="80">物流状态</th>
                        <th style="display: none;"></th>
                        <th style="display: none;"></th>
                        <th style="display: none;"></th>
                        <th width="180">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.ordersVosList}" var="order" varStatus="stat">
                        <tr id="data_${stat.index}">
                            <td><label><input type="checkbox" class="ace" id="box_${stat.index}"><span
                                    class="lbl"></span></label></td>
                            <td>${order.orderId}</td>
                            <td>
                                <fmt:formatDate value="${order.orderTime}"
                                                pattern="yyyy-MM-dd HH:mm:ss"/>
                            </td>
                            <td style="display: none"></td>
                            <td style="display: none"></td>
                            <td style="display: none"></td>
                            <td>${order.orderUser}</td>
                            <td>${order.orderAdress}</td>
                            <td>${order.orderSum}元</td>
                            <td class="td-status">
                                <span class="label label-success radius">${order.orderStatusName}</span>
                            </td>
                            <td class="td-manage">
                                <a onClick="member_go(this,'${order.orderId}')" href="javascript:void()" title="删除订单"
                                   class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></a>
                                <a onclick="update_go(this,'${order.orderId}')" href="javascript:void()" title="修改订单"
                                   class="btn btn-xs btn-success"><i class="icon-edit bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 8, 9]}// 制定列不参与排序
            ]
        });


        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    })

    /*订单删除*/
    function member_go(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: "/admin/deleteOrdersByOrderId",
                data: "orderId=" + id,
                type: "POST",
                success: function (result) {
                    layer.msg('删除成功!', {icon: 6, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/selectallorders'", "1500");
        });
    }


    //批量删除
    $("#delete_selected").click(function () {
        //遍历每一个被选中的元素
        var order_id = "";
        var del_idstr = "";
        $.each($(".ace:checked"), function () {
            order_id += $(this).parents("tr").find("td:eq(1)").text() + ",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //删除多余的，
        order_id = order_id.substring(0, order_id.length - 1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        layer.confirm('确认要删除' + '[' + order_id + ']' + '吗？', function () {
            $.ajax({
                url: "/adminBook/deleteOrdersByOrderId",
                data: "orderId=" + del_idstr,
                type: "POST",
                success: function () {
                    layer.msg('删除成功!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/selectallorders'", "1500");
        });
    });


    laydate({
        elem: '#start',
        event: 'focus'
    });

</script>