<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<title>当当书城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/order.css" type="text/css" />
</head>
<%System.out.print("退出后"); %>


<body class="main">
	<p:user/>

	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0px">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/customer/showCustomer">我的账户</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/orders/toOrderList">我的订单</a>&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;订单详细信息
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="0">
									<tr>
										<td>
											<p>订单编号:${oId}</p>
										</td>
									</tr>
									<tr>
										<td>
											<table cellspacing="1" class="carttable" width="100%">
												<tr>
													<td width="10%">用户名称</td>
													<td width="5%">书籍ID</td>
													<td width="10%">书籍名称</td>
													<td width="5%">书籍价格</td>
													<td width="10%">书籍数目</td>
													<td width="10%">合计</td>
												</tr>
											</table> 
											<c:forEach items="${orderRecord}" var="orderrecord" >
												<table width="100%" border="0" cellspacing="0">
													<tr>
														<td width="10%">${orderrecord.cName}</td>
														<td width="5%">${orderrecord.bId}</td>
														<td width="10%">${orderrecord.bName}</td>
														<td width="5%">${orderrecord.bPrice}</td>
														<td width="10%">${orderrecord.bNumber}</td>
														<td width="10%">${orderrecord.bTotalcost}</td>
													</tr>
												</table>
											</c:forEach>
											<hr>
										</td>
									</tr>
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
