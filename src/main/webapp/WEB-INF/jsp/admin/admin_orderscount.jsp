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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>订单管理</title>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/H-ui.min.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/css/H-ui.admin.css"/>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/static/Hui-iconfont/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ligerui-dialog.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/font-awesome.min.css"/>
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.min.js"></script>

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
    <script type="text/javascript">
        $(function () {
            /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
            $("tr[id^='data_']").hover(function () {
                $(this).css("backgroundColor", "#99ccff");
            }, function () {
                $(this).css("backgroundColor", "#ffffff");
            })
        })
    </script>
</head>

<body>
<div class="page-content clearfix">
    <div id="Member_Ratings">
        <div class="d_Confirm_Order_style">
            <br>
            <div>
                请选择图书类型：<span class="select-box" style="width:200px">
            <select id="typeS" class="select" name="brandclass" size="1" onchange="searchType()">
                <option value="0">所有类型</option>
                <c:forEach items="${booktypes}" var="type">
                    <option value="${type.tId}">${type.tType}</option>
                </c:forEach>
            </select>
        </span>
            </div>
            <div>
                <span class="r">共有数据：<strong>${bookTypetotal}</strong>条</span>
            </div>
            <br>
            <!---->
            <div class="table_menu_list">
                <table class="table table-border table-bordered table-bg" id="sample-table">
                    <thead>
                    <tr class="text-c">
                        <th colspan="2" scope="col"><h5><strong>今日图书销售信息汇总表</strong></h5></th>
                    </tr>
                    <tr class="text-c">
                        <th>图书类别</th>
                        <th>订单量</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${bookTypeCounts}" var="typeCount" varStatus="stat">
                        <tr class="text-c" id="data_${stat.index}">
                            <td>${typeCount.tType}</td>
                            <td>${typeCount.count}</td>
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

    function searchType() {
        var type = document.getElementById("typeS").value;
        // alert(type);
        window.location.href = "${pageContext.request.contextPath}/admin/selectbooktype?brandclass=" + type;
        // window.open("http://localhost:8080/admin/selectbooktype?brandclass=" + type);
    }

    laydate({
        elem: '#start',
        event: 'focus'
    });

</script>