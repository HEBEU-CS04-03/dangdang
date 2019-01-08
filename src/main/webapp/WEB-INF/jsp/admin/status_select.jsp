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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/H-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/H-ui.admin.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/Hui-iconfont/iconfont.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/ligerui-dialog.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.0.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-migrate-1.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/ligerDrag.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/ligerDialog.js" type="text/javascript"></script>
    <title>物流查询</title>
    <script type="text/javascript">
        $(function(){
            /** 获取上一次选中的部门数据 */
            var boxs  = $("input[type='checkbox'][id^='box_']");

            /** 给全选按钮绑定点击事件  */
            $("#checkAll").click(function(){
                // this是checkAll  this.checked是true
                // 所有数据行的选中状态与全选的状态一致
                boxs.attr("checked",this.checked);
            })

            /** 给数据行绑定鼠标覆盖以及鼠标移开事件  */
            $("tr[id^='data_']").hover(function(){
                $(this).css("backgroundColor","#99ccff");
            },function(){
                $(this).css("backgroundColor","#ffffff");
            })

            /** 删除员工绑定点击事件 */
            $("#delete").click(function(){
                /** 获取到用户选中的复选框  */
                var checkedBoxs = boxs.filter(":checked");
                if(checkedBoxs.length < 1){
                    $.ligerDialog.error("请选择一个需要删除的订单！");
                }else{
                    /** 得到用户选中的所有的需要删除的ids */
                    var ids = checkedBoxs.map(function(){
                        return this.value;
                    })

                    $.ligerDialog.confirm("确认要删除吗?","删除订单",function(r){
                        if(r){
                            // alert("删除："+ids.get());
                            // 发送请求
                            window.location = "${pageContext.request.contextPath}/admin/removeorders?ids=" + ids.get();
                        }
                    });
                }
            })
        })
    </script>
</head>
<body>

<div class="page-container">
    <div>
       物流状态： <input type="text" name="oStatus" id="oStatus"
               style="width: 120px" class="input-text">
        <button id="find_oStatus" class="btn btn-success" onclick="findOrders()">
            <i class="Hui-iconfont">&#xe665;</i> 查询
        </button>
    </div>

    <div class="cl pd-5 bg-1 bk-gray mt-20">
			<span class="1" ><input id="delete" type="button" value="&#xe6e2; 批量删除"
            class="btn btn-danger radius Hui-iconfont"/>
			</span> <span class="r">共有数据：<strong>${orderstotal}</strong>条
			</span>
    </div>
    <div class="mt-20">
        <table class="table table-border table-bordered table-bg table-sort">
            <thead>
            <tr class="text-c">
                <th width="20"><input type="checkbox" name="checkAll" id="checkAll"></th>
                <th width="30">订单编号</th>
                <th width="50">下单时间</th>
                <th width="50">收货人</th>
                <th width="100">收货地址</th>
                <th width="50">总金额</th>
                <th width="50">物流状态</th>
                <th width="100">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.ordersVosList}" var="order" varStatus="stat">
                <tr class="text-c" id="data_${stat.index}">
                    <td><input type="checkbox" id="box_${stat.index}" value="${order.orderStatus}"></td>
                    <td>${order.orderId}</td>
                    <td>
                        <fmt:formatDate value="${order.orderTime}"
                                       pattern="yyyy-MM-dd HH:mm:ss"/>
                    </td>
                    <td>${order.orderUser}</td>
                    <td>${order.orderAdress}</td>
                    <td>${order.orderSum}元</td>
                    <td class="td-status"><span
                            class="label label-success radius">${order.orderStatusName}</span></td>
                    <td class=""><a style="" onclick="" href="" title="编辑"> <i
                            class="Hui-iconfont">&#xe6df;</i></a><a style="" class="" onclick="delete"
                                                                    href="" title="删除"> <i class="Hui-iconfont">&#xe6e2;</i></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/Widget/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/Widget/datatables/1.10.0/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
    function findOrders() {
        var type = document.getElementById("oStatus").value;
        window.location.href = "${pageContext.request.contextPath}/admin/selectOrdersBystatus?keyword=" + type;
    }

</script>
</body>
</html>
