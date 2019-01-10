<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>当当书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/order.css" type="text/css" />
</head>

<body class="main">
	<!-- 使用了自定义标签 -->
	<p:user/>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/customer/showCustomer">&nbsp;我的帐户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;
						订单查询
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td style="padding:20px"><p><b>我的订单</b></p>
								<p>
									共有<font style="color:#FF0000" >${orders.size()}</font>订单
								</p>
								<table width="100%" border="0" cellspacing="0" class="tableopen">
									<tr>
										<td bgcolor="#A3E6DF" class="tableopentd01">订单号</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">支付方式</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">地址</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">邮箱</td>
										<td bgcolor="#A3E6DF" class="tableopentd01">用户</td>
										<td bgcolor="#A3D7E6" class="tableopentd01">订单时间</td>
										<td bgcolor="#A3CCE6" class="tableopentd01">订单金额</td>
										<td bgcolor="#A3B6E6" class="tableopentd01">订单状态</td>
										<td bgcolor="#A3E2E6" class="tableopentd01">操作</td>
									</tr>
									<c:forEach items="${orders}" var="orders">
										<tr>
											<td class="tableopentd02">${orders.orderId}</td>
											<td class="tableopentd02">${orders.orderPayment}</td>
											<td class="tableopentd02">${orders.orderAdress}</td>
											<td class="tableopentd02">${orders.orderEmail}</td>
											<td class="tableopentd02">${orders.orderUser}</td>
											<td class="tableopentd02">${dateUtil.formateTime(orders.orderTime)}</td>
											<td class="tableopentd02">${orders.orderSum}</td>
											<td class="tableopentd02">${orders.orderStatus==1?"未支付":"已支付"}</td>
											<td class="tableopentd03">
												<a target="_blank" href="${pageContext.request.contextPath}/orders/OrderRecord?orderId=${orders.orderId}">查 看</a>&nbsp;&nbsp;

												<c:if test="${orders.orderStatus!=2 }">
													<a target="_blank" href="${pageContext.request.contextPath}/orders/toPay?id=${orders.orderId}">支付</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>

</body>
</html>
