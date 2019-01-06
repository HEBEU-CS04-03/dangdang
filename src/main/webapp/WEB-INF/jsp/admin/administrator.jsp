<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css"/>
    <link href="${pageContext.request.contextPath}/static/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="../static/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/static/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="../static/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>管理员</title>
</head>

<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <!--操作-->
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" id="administrator_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加管理员</a>
        <a href="javascript:ovid()" class="btn btn-danger" id="delete_selected"><i class="fa fa-trash"></i> 批量删除</a>
       </span>
                <span class="r_f">共：<b>${count}</b>人</span>
            </div>
            <!--管理员列表-->
            <div class="clearfix administrator_style" id="administrator">
                <table class="table table-striped table-bordered table-hover" id="sample_table">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </th>
                        <th width="80px">编号</th>
                        <th width="250px">登录名</th>
                        <th width="100px">手机</th>
                        <th width="100px">角色</th>
                        <th width="70px">状态</th>
                        <th width="200px">加入时间</th>
                        <th width="200px">最后登录时间</th>
                        <th width="200px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${administrators}" var="admin">
                        <tr>
                            <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                            <td>${admin.id}</td>
                            <td>${admin.adminName}</td>
                            <td>${admin.phone}</td>
                                <%--判断管理员级别,1为超级管理员,0为普通管理员--%>
                            <c:if test="${admin.authorityLevel eq 1}">
                                <td>超级管理员</td>
                            </c:if>
                            <c:if test="${admin.authorityLevel eq 0}">
                                <td>普通管理员</td>
                            </c:if>
                            <c:if test="${admin.adminStatus eq 1}">
                                <td class="td-status">
                                    <span class="label label-success radius">已锁定</span>
                                </td>
                            </c:if>
                            <c:if test="${admin.adminStatus eq 0}">
                                <td class="td-status">
                                    <span class="label label-success radius">正常</span>
                                </td>
                            </c:if>
                            <td>${admin.attendTime}</td>
                            <td>${admin.lastLoginTime}</td>
                            <td>
                                <c:if test="${admin.adminStatus eq 0}">
                                    <a onClick="member_stop(this,'${admin.id}')" href="javascript:;" title="用户锁定"
                                       class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>
                                </c:if>
                                <c:if test="${admin.adminStatus eq 1}">
                                    <a onClick="member_unlock(this,${admin.id})" href="javascript:;" title="解除锁定"
                                       style="text-decoration:none" class="btn btn-xs btn-success"><i
                                            class="fa fa-check  bigger-120"></i></a>
                                </c:if>
                                <c:if test="${admin.authorityLevel eq 0}">
                                    <a title="将此人设置为超级管理员" onclick="up_level(${admin.id})" href="javascript:;"
                                       class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>
                                </c:if>
                                <c:if test="${admin.authorityLevel eq 1}">
                                    <a title="将此人设置为普通管理员" onclick="down_level(${admin.id})" href="javascript:;"
                                       class="btn btn-xs btn-info"><i class="fa fa-edit bigger-120"></i></a>
                                </c:if>
                                    <%--<a onClick="member_stop(this,'10001')" href="javascript:;" title="停用"
                                               class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>--%>
                                <a title="删除" href="javascript:;" onclick="member_del(this,'${admin.id}')"
                                   class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!--添加管理员-->
    <div id="add_administrator_style" class="add_menber" style="display:none">
        <form action="/admin/admin?method=insertAdmin" method="post" id="form-admin-add">
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>管理员：</label>
                <div class="formControls">
                    <input type="text" class="input-text" value="" placeholder="" id="user-name" name="adminName"
                           datatype="*2-16" nullmsg="用户名不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label"><span class="c-red">*</span>初始密码：</label>
                <div class="formControls">
                    <input type="password" placeholder="密码" name="userpassword" autocomplete="off" value=""
                           class="input-text" datatype="*6-20" nullmsg="密码不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>确认密码：</label>
                <div class="formControls ">
                    <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error"
                           errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="userpassword"
                           id="newpassword2" name="newpassword2">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <%--<div class="form-group">
                <label class="form-label "><span class="c-red">*</span>性别：</label>
                <div class="formControls  skin-minimal">
                    <label><input name="sex" type="radio" class="ace" checked="checked" value="男"><span class="lbl">男</span></label>&nbsp;&nbsp;
                    <label><input name="sex" type="radio" class="ace" value="男"><span class="lbl">女</span></label>
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>--%>
            <div class="form-group">
                <label class="form-label "><span class="c-red">*</span>手机：</label>
                <div class="formControls ">
                    <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="phone"
                           datatype="m" nullmsg="手机不能为空">
                </div>
                <div class="col-4"><span class="Validform_checktip"></span></div>
            </div>
            <div class="form-group">
                <label class="form-label">角色：</label>
                <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="adminLevel" size="1">
					<option value="1">超级管理员</option>
					<option value="0">普通管理员</option>
				</select>
				</span></div>
            </div>
            <div>
                <input class="btn btn-primary radius" type="submit" id="Add_Administrator"
                       value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </form>
    </div>
</div>
</body>
</html>
<script type="text/javascript">
    jQuery(function ($) {
        var oTable1 = $('#sample_table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 7, 8,]}// 制定列不参与排序
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
    });

</script>
<script type="text/javascript">
    $(function () {
        $("#administrator").fix({
            float: 'left',
            //minStatue : true,
            skin: 'green',
            durationTime: false,
            spacingw: 50,//设置隐藏时的距离
            spacingh: 270,//设置显示时间距
        });
    });

    //字数限制
    function checkLength(which) {
        var maxChars = 100; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您输入的字数超过限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    //初始化宽度、高度
    $(".widget-box").height($(window).height() - 215);
    $(".table_menu_list").width($(window).width() - 260);
    $(".table_menu_list").height($(window).height() - 215);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".widget-box").height($(window).height() - 215);
        $(".table_menu_list").width($(window).width() - 260);
        $(".table_menu_list").height($(window).height() - 215);
    });
    /*laydate({
        elem: '#start',
        event: 'focus'
    });*/

    /*用户-锁定*/
    function member_stop(obj, id) {
        layer.confirm('确认要锁定吗？', function (index) {
            $.ajax({
                url: "/admin/admin",
                data: "method=lockAdmin&adminId=" + id + "&adminStatus=1",
                type: "POST",
                success: function (result) {
                    layer.msg('已锁定!', {icon: 6, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/admin?method=toAdminList'", "1500");
        });
    }

    /*用户-启用*/
    function member_unlock(obj, id) {
        layer.confirm('确认要解除锁定吗？', function (index) {
            $.ajax({
                url: "/admin/admin",
                data: "method=lockAdmin&adminId=" + id + "&adminStatus=0",
                type: "POST",
                success: function (result) {
                    layer.msg('已解锁!', {icon: 6, time: 1000});
                }

            });
            setTimeout("location.href = '/admin/admin?method=toAdminList'", "1500");
        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            $.ajax({
                url: "/admin/admin?method=deleteAdmin&adminId=" + id,
                type: "POST",
                success: function () {
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/admin?method=toAdminList'", "1500");
        });
    }

    //升级为超级管理员
    function up_level(id) {
        layer.confirm('确认要将此人设置为超级管理员吗？', function (index) {
            $.ajax({
                url: "/admin/admin?method=updateAdminLevel&adminId=" + id + "&level=1",
                type: "POST",
                success: function () {
                    layer.msg('已经升级为超管!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/admin?method=toAdminList'", "1500");
        });
    }

    //降为普通管理员
    function down_level(id) {
        layer.confirm('确认要将此人设置为普通管理员吗？', function (index) {
            $.ajax({
                url: "/admin/admin?method=updateAdminLevel&adminId=" + id + "&level=0",
                type: "POST",
                success: function () {
                    layer.msg('已经降为普通管理员!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/admin?method=toAdminList'", "1500");
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
        userNames = userNames.substring(0, userNames.length - 2);
        //去除删除的id多余的-
        del_idstr = del_idstr.substring(0, del_idstr.length - 2);
        layer.confirm('确认要删除' + '[' + userNames + ']' + '吗？', function () {
            $.ajax({
                url: "/admin/admin?method=deleteAdmin&adminId=" + del_idstr,
                type: "POST",
                success: function () {
                    layer.msg('已删除!', {icon: 1, time: 1000});
                }
            });
            setTimeout("location.href = '/admin/admin?method=toAdminList'", "1500");
        });
    });

    /*添加管理员*/
    $('#administrator_add').on('click', function () {
        layer.open({
            type: 1,
            title: '添加管理员',
            area: ['700px', ''],
            shadeClose: false,
            content: $('#add_administrator_style'),

        });
    });
    //表单验证提交
    $("#form-admin-add").Validform({

        tiptype: 2,

        callback: function (data) {
            //form[0].submit();
            alert("到这了");
            if (data.status == 1) {
                var frm = document.forms[0];
                //提交数据
                frm.submit();
                layer.msg(data.info, {icon: data.status, time: 1000}, function () {
                    location.reload();//刷新页面 
                });
            }
            else {
                layer.msg(data.info, {icon: data.status, time: 3000});
            }
            var index = parent.$("#iframe").attr("src");
            parent.layer.close(index);

            //
        }


    });
</script>

