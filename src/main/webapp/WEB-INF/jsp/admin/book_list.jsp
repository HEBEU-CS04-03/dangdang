<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
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
    <script type="text/javascript" src="../static/js/H-ui.js"></script>
    <script type="text/javascript" src="../static/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>用户列表</title>
</head>

<body>

<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:void()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加图书</a>
        <a href="javascript:void()" class="btn btn-danger" id="delete_selected"><i class="icon-archive"></i>批量删除</a>

       </span>
                <span class="r_f">共：<b>${count}</b>条</span>
            </div>
            <!---->
            <div class="table_menu_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="80">ID</th>
                        <th width="150">书籍名称</th>
                        <th width="100">分类ID</th>
                        <th width="120">价格（元）</th>
                        <th width="100">库存量</th>
                        <th width="100">出版时间</th>
                        <th width="180">作者</th>
                        <th width="100">出版社</th>
                        <th width="70">图书状态</th>
                        <th width="180">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${books}" var="re">
                        <tr>
                            <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                            <td>${re.bId}</td>
                            <td><u style="cursor:pointer" class="text-primary">${re.bName}</u></td>
                            <td>${re.tId}</td>
                            <td>${re.bPrice}</td>
                            <td>${re.bQuantity}</td>
                            <td class="text-l">${dateUtil.formateTime(re.bTime)}</td>
                            <td>${re.bAuthor}</td>
                            <td>${re.bPress}</td>
                            <td class="td-status">
                                <span class="label label-success radius">审核通过</span>
                            </td>
                            <td class="td-manage">
                                <a onClick="member_go(this,'${re.bId}')" href="javascript:void()" title="删除图书"
                                   class="btn btn-xs btn-danger"><i class="icon-trash bigger-120"></i></a>
                                <a onclick="update_go(this,'${re.bId}')" href="javascript:void()" title="修改图书"
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
                {"orderable": false, "aTargets": [0, 8, 9]},// 制定列不参与排序
                // {"display": "none", "aTargets": [1]}
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

    /*-删除通过*/
    function member_go(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: "/adminBook/deleteBookById",
                data: "bId=" + id,
                type: "POST",
                success: function (result) {
                    layer.msg('删除成功!', {icon: 6, time: 1000});
                }
            });
            setTimeout("location.href = '/adminBook/toBookList'", "1500");
        });
    }

    function update_go(obj, id) {
        location.href = "/adminBook/findBookById?bId=" + id;
    }


    //批量删除
    $("#delete_selected").click(function () {
        //遍历每一个被选中的元素
        var userNames = "";
        var del_idstr = "";
        $.each($(".ace:checked"), function () {
            userNames += $(this).parents("tr").find("td:eq(2)").text() + ",";
            //组装员工id字符串
            del_idstr += $(this).parents("tr").find("td:eq(1)").text() + "-";
        });
        //删除多余的，
        userNames = userNames.substring(0, userNames.length - 1);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 1);
        layer.confirm('确认要删除' + '[' + userNames + ']' + '吗？', function () {
            $.ajax({
                url: "/adminBook/deleteBookById",
                data: "bId=" + del_idstr,
                type: "POST",
                success: function () {
                    layer.msg('删除成功!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/adminBook/toBookList'", "1500");
        });
    });

    $("#member_add").click(function () {
        location.href = "/adminBook/toAddBook";
    })

    laydate({
        elem: '#start',
        event: 'focus'
    });

</script>