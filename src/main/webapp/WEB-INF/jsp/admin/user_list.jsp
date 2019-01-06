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
<%--
        <a href="javascript:ovid()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>添加用户</a>
--%>
        <a href="javascript:ovid()" class="btn btn-danger" id="delete_selected"><i class="icon-trash"></i>批量删除</a>
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
                        <th width="100">用户名</th>
                        <th width="80">性别</th>
                        <th width="120">手机</th>
                        <th width="150">年龄</th>
                        <th width="">地址</th>
                        <th width="180">加入时间</th>
                        <th width="100">身份证件号</th>
                        <th width="70">用户状态</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${userList}" var="user">
                        <tr>
                            <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                            <td>${user.userId}</td>
                            <td><u style="cursor:pointer" class="text-primary"
                                   <%--onclick="member_show('${user.userName}(${user.userId})','${pageContext.request.contextPath}/sys/member-show.jsp','10001','500','400')"--%>>${user.userName}</u>
                            </td>
                            <td>${user.sex}</td>
                            <td>${user.phone}</td>
                            <td>${user.age}</td>
                            <td class="text-l">${user.address}</td>
                            <td>${user.registerTime}</td>
                            <td>${user.identification}</td>
                            <c:if test="${user.userStatus eq 1}">
                                <td class="td-status">
                                    <span class="label label-success radius">已锁定</span>
                                </td>
                            </c:if>
                            <c:if test="${user.userStatus eq 0}">
                                <td class="td-status">
                                    <span class="label label-success radius">正常</span>
                                </td>
                            </c:if>
                            <td class="td-manage">
                                <c:if test="${user.userStatus eq 0}">
                                    <a onClick="member_stop(this,'${user.userId}')" href="javascript:;" title="用户锁定"
                                       class="btn btn-xs btn-success"><i class="icon-ok bigger-120"></i></a>
                                </c:if>
                                <c:if test="${user.userStatus eq 1}">
                                    <a style="text-decoration:none" class="btn btn-xs btn-success"
                                       onClick="member_unlock(this,${user.userId})" href="javascript:;" title="解除锁定"
                                       class="btn btn-xs btn-warning"><i class="icon-ok bigger-120"></i></a>
                                </c:if>
                                <a title="删除" href="javascript:;" onclick="member_del(this,'${user.userId}')"
                                   class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<!--添加用户图层-->
<div class="add_menber" id="add_menber_style" style="display:none">

    <ul class=" page-content">
        <li><label class="label_name">用&nbsp;&nbsp;户 &nbsp;名：</label><span class="add_name"><input value="" name="用户名"
                                                                                                   type="text"
                                                                                                   class="text_add"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">真实姓名：</label><span class="add_name"><input name="真实姓名" type="text"
                                                                                 class="text_add"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label><span class="add_name">
     <label><input name="form-field-radio" type="radio" checked="checked" class="ace"><span class="lbl">男</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">女</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio" type="radio" class="ace"><span class="lbl">保密</span></label>
     </span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">固定电话：</label><span class="add_name"><input name="固定电话" type="text"
                                                                                 class="text_add"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">移动电话：</label><span class="add_name"><input name="移动电话" type="text"
                                                                                 class="text_add"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">电子邮箱：</label><span class="add_name"><input name="电子邮箱" type="text"
                                                                                 class="text_add"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li class="adderss"><label class="label_name">家庭住址：</label><span class="add_name"><input name="家庭住址" type="text"
                                                                                                 class="text_add"
                                                                                                 style=" width:350px"/></span>
            <div class="prompt r_f"></div>
        </li>
        <li><label class="label_name">状&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;态：</label><span class="add_name">
     <label><input name="form-field-radio1" type="radio" checked="checked" class="ace"><span
             class="lbl">开启</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="form-field-radio1" type="radio" class="ace"><span class="lbl">关闭</span></label></span>
            <div class="prompt r_f"></div>
        </li>
    </ul>
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
    /*用户-添加*/
    $('#member_add').on('click', function () {
        layer.open({
            type: 1,
            title: '添加用户',
            maxmin: true,
            shadeClose: true, //点击遮罩关闭层
            area: ['800px', ''],
            content: $('#add_menber_style'),
            btn: ['提交', '取消'],
            yes: function (index, layero) {
                var num = 0;
                var str = "";
                $(".add_menber input[type$='text']").each(function (n) {
                    if ($(this).val() == "") {

                        layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                            title: '提示框',
                            icon: 0,
                        });
                        num++;
                        return false;
                    }
                });
                if (num > 0) {
                    return false;
                }
                else {
                    layer.alert('添加成功！', {
                        title: '提示框',
                        icon: 1,
                    });
                    layer.close(index);
                }
            }
        });
    });

    /*用户-查看*/
    function member_show(title, url, id, w, h) {
        layer_show(title, url + '#?=' + id, w, h);
    }

    /*用户-锁定*/
    function member_stop(obj, id) {
        layer.confirm('确认要锁定吗？', function (index) {
            $.ajax({
                url: "/admin/user",
                data: "method=lockUser&userId=" + id,
                type: "POST",
                success: function (result) {
                    layer.msg('已锁定!', {icon: 6, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/user?method=toUserList'", "1500");
        });
    }

    /*用户-启用*/
    function member_unlock(obj, id) {
        layer.confirm('确认要解除锁定吗？', function (index) {
            $.ajax({
                url: "/admin/user",
                data: "method=unlockUser&userId=" + id,
                type: "POST",
                success: function (result) {
                    layer.msg('已解锁!', {icon: 6, time: 1000});
                }

            });
            setTimeout("location.href = '/admin/user?method=toUserList'", "1500");
        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: "/admin/user?method=deleteUser&userId=" + id,
                type: "POST",
                success: function () {
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/user?method=toUserList'", "1500");
        });
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
        userNames = userNames.substring(1, userNames.length - 3);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(1, del_idstr.length - 3);
        layer.confirm('确认要删除' + '[' + userNames + ']' + '吗？', function () {
            $.ajax({
                url: "/admin/user?method=deleteUser&userId=" + del_idstr,
                type: "POST",
                success: function () {
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/user?method=toUserList'", "1500");
        });
    });

    laydate({
        elem: '#start',
        event: 'focus'
    });

</script>