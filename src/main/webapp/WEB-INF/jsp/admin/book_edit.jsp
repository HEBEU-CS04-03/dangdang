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

    <title>图书信息管理</title>
</head>

<body>
<div class="clearfix">
    <div class="admin_info_style">
        <div class="admin_modify_style" id="Personal">
            <div class="type_title">图书信息</div>
            <form id="book_form" action="/adminBook/updateBook" method="post" enctype="multipart/form-data">
                <div class="xinxi">
                    <input name="bId" value="${book.bId}" type="hidden"/>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">图书名称</label>
                        <div class="col-sm-9"><input type="text" name="bName" id="bName"
                                                     value="${book.bName}"
                                                     class="col-xs-7">
                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">图书类型</label>
                        <div class="col-sm-9">
                            <select class="select2-arrow" name="tId" id="tId">
                                <c:forEach items="${bookType}" var="type">
                                    <option value="${type.tId}" ${type.tId == book.tId ? 'selected="selected"' : ""}>${type.tType}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">图书价格</label>
                        <div class="col-sm-9"><input type="text" name="bPrice" id="bPrice"
                                                     value="${book.bPrice}"
                                                     class="col-xs-7">

                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">图书库存</label>
                        <div class="col-sm-9"><input type="text" name="bQuantity" id="bQuantity"
                                                     value="${book.bQuantity}"
                                                     class="col-xs-7">

                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">出版时间</label>
                        <div class="col-sm-9"><input type="text" name="bTime" id="bTime"
                                                     value="${dateUtil.formateTime(book.bTime)}"
                                                     class="col-xs-7">

                        </div>
                    </div>

                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">图书作者</label>
                        <div class="col-sm-9"><input type="text" name="bAuthor" id="bAuthor"
                                                     value="${book.bAuthor}"
                                                     class="col-xs-7">

                        </div>
                    </div>

                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">出版社</label>
                        <div class="col-sm-9"><input type="text" name="bPress" id="bPress"
                                                     value="${book.bPress}"
                                                     class="col-xs-7">

                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">书籍描述</label>
                        <div class="col-sm-9"><input type="text" name="bDescription" id="bDescription"
                                                     value="${book.bDescription}"
                                                     class="col-xs-7">

                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">书籍图片</label>
                        <div class="img-responsive">
                            <img src="${pageContext.request.contextPath}/static/img/${book.bImage}" alt=""/>
                        </div>
                    </div>
                    <div class="form-group"><label class="col-sm-3 control-label no-padding-right">替换图片</label>
                        <input type="file" name="file"/>
                    </div>
                </div>
                <div style="float: right">
                    <input type="reset" class="btn btn-danger"><i class="icon-archive"></i></input>
                    <a href="javascript:void()" id="member_add" class="btn btn-warning"><i class="icon-plus"></i>确认</a>
                </div>
            </form>
        </div>
    </div>
</div>
<!--修改密码样式-->
<%--<div class="change_Pass_style" id="change_Pass">--%>
<%--<ul class="xg_style">--%>
<%--<li><label class="label_name">原&nbsp;&nbsp;密&nbsp;码</label><input name="oldPassword" type="password" class=""--%>
<%--id="password"></li>--%>
<%--<li><label class="label_name">新&nbsp;&nbsp;密&nbsp;码</label><input name="newPassword" type="password" class=""--%>
<%--id="Nes_pas"></li>--%>
<%--<li><label class="label_name">确认密码</label><input name="newPassword2" type="password" class="" id="c_mew_pas">--%>
<%--</li>--%>

<%--</ul>--%>
<%--</div>--%>
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

    //初始化宽度、高度
    $(".admin_modify_style").height($(window).height());
    $(".recording_style").width($(window).width() - 400);
    //当文档窗口发生改变时 触发
    $(window).resize(function () {
        $(".admin_modify_style").height($(window).height());
        $(".recording_style").width($(window).width() - 400);
    });

    /* 新增图书 */
    $("#member_add").click(function () {
        var tId = document.getElementById("tId").value;
        var bName = document.getElementById("bName").value;
        var bPrice = document.getElementById("bPrice").value;
        var bQuantity = document.getElementById("bQuantity").value;
        var bDescription = document.getElementById("bDescription").value;
        var bTime = document.getElementById("bTime").value;
        var bAuthor = document.getElementById("bAuthor").value;
        var bPress = document.getElementById("bPress").value;
        console.log(tId + "," + bName + "," + bPrice + "," + bQuantity + ","
            + bDescription + "," + bTime + "," + bAuthor + "," + bPrice + "," + bPress);
        if (tId === "") {
            alert("类型不能为空");
            return false;
        }
        if (bName === "") {
            alert("图书名不能为空");
            return false;
        }
        if (bPrice === "") {
            alert("图书价格不能为空");
            return false;
        }
        if (bQuantity === "") {
            alert("图书库存不能为空");
            return false;
        }
        if (bDescription === "") {
            alert("图书描述不能为空");
            return false;
        }
        if (bTime === "") {
            alert("出版时间不能为空");
            return false;
        }
        if (bAuthor === "") {
            alert("作者不能为空");
            return false;
        }
        if (bPress === "") {
            alert("出版社不能为空");
            return false;
        }

        var frm = document.getElementById("book_form");
        frm.submit();

    });


</script>

