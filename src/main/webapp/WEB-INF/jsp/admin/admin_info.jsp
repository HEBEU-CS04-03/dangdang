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
    <![endif]-->
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/jquery.dataTables.bootstrap.js"></script>

    <title>个人信息管理</title>
</head>

<body>
<div class="clearfix">
    <div class="admin_info_style">
        <div class="admin_modify_style" id="Personal">
            <div class="type_title">管理员信息</div>
            <div class="xinxi">
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right">用户名： </label>
                    <div class="col-sm-9"><input type="text" name="adminName" id="website-title"
                                                 value="${adminInfo.adminName}"
                                                 class="col-xs-7 text_info" disabled="disabled">
                        &nbsp;&nbsp;&nbsp;<a href="javascript:ovid()" onclick="change_Password()"
                                             class="btn btn-warning btn-xs">修改密码</a></div>

                </div>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right">移动电话： </label>
                    <div class="col-sm-9"><input type="text" name="移动电话" id="website-title" value="${adminInfo.phone}"
                                                 class="col-xs-7 text_info" disabled="disabled"></div>
                </div>
                <c:if test="${adminInfo.authorityLevel eq 1}">
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">管理等级： </label>
                        <div class="col-sm-9"><input type="text" name="管理员等级" id="website-title" value="超级管理员"
                                                     class="col-xs-7 text_info" disabled="disabled"></div>
                    </div>
                </c:if>

                <c:if test="${adminInfo.authorityLevel eq 0}">
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">管理等级： </label>
                        <div class="col-sm-9"><input type="text" name="管理员等级" id="website-title" value="普通管理员"
                                                     class="col-xs-7 text_info" disabled="disabled"></div>
                    </div>
                </c:if>
                <div class="form-group"><label class="col-sm-3 control-label no-padding-right">注册时间： </label>
                    <div class="col-sm-9"><span>${adminInfo.attendTime}</span></div>
                </div>

                <c:if test="${adminInfo.adminStatus eq 0}">
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">账号状态： </label>
                        <div class="col-sm-9"><span>正常</span></div>
                    </div>
                </c:if>

                <c:if test="${adminInfo.adminStatus eq 1}">
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">账号状态： </label>
                        <div class="col-sm-9"><span>已锁定</span></div>
                    </div>
                </c:if>

                <div class="form-group"><label class="col-sm-3 control-label no-padding-right">最后登录时间： </label>
                    <div class="col-sm-9"><span>${adminInfo.lastLoginTime}</span></div>
                </div>


            </div>
        </div>
    </div>
</div>
<!--修改密码样式-->
<div class="change_Pass_style" id="change_Pass">
    <ul class="xg_style">
        <li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="oldPassword" type="password" class=""
                                                                          id="password"></li>
        <li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="newPassword" type="password" class=""
                                                                          id="Nes_pas"></li>
        <li><label class="label_name">确认密码</label><input name="newPassword2" type="password" class="" id="c_mew_pas">
        </li>

    </ul>
    <!--       <div class="center"> <button class="btn btn-primary" type="button" id="submit">确认修改</button></div>-->
</div>
</body>
</html>
<script>

    //按钮点击事件
    function modify() {
        $('.text_info').attr("disabled", false);
        $('.text_info').addClass("add");
        $('#Personal').find('.xinxi').addClass("hover");
        $('#Personal').find('.btn-success').css({'display': 'block'});
    };

    function save_info() {
        var num = 0;
        var str = "";
        $(".xinxi input[type$='text']").each(function (n) {
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

            layer.alert('修改成功！', {
                title: '提示框',
                icon: 1,
            });
            $('#Personal').find('.xinxi').removeClass("hover");
            $('#Personal').find('.text_info').removeClass("add").attr("disabled", true);
            $('#Personal').find('.btn-success').css({'display': 'none'});
            layer.close(index);

        }
    };
    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发  
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });

    //修改密码
    function change_Password() {
        layer.open({
            type: 1,
            title: '修改密码',
            area: ['300px', '300px'],
            shadeClose: true,
            content: $('#change_Pass'),
            btn: ['确认修改'],
            yes: function (index, layero) {
                if ($("#password").val() == "") {
                    layer.alert('原密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if ($("#Nes_pas").val() == "") {
                    layer.alert('新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }

                if ($("#c_mew_pas").val() == "") {
                    layer.alert('确认新密码不能为空!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                    layer.alert('密码不一致!', {
                        title: '提示框',
                        icon: 0,

                    });
                    return false;
                }
                else {
                    var oldPassword = $("#password").val();
                    var newPassword = $("#Nes_pas").val();
                    //发送ajax修改密码
                    $.ajax({
                        url: "/admin/admin?method=changePassword",
                        data: "oldPassword=" + oldPassword + "&newPassword=" + newPassword,
                        type: "POST",
                        success: function () {
                            layer.alert('修改成功！', {
                                title: '提示框',
                                icon: 1,
                            });
                            layer.close(index);
                        },
                        error: function () {
                            layer.alert('修改失败,您输入的旧密码错误！', {
                                title: '提示框',
                                icon: 1,
                            });
                            layer.close(index);
                        }
                    });
                }
            }
        });
    }
</script>
<script>
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 2, 3, 4, 5, 6]}// 制定列不参与排序
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
    });</script>
