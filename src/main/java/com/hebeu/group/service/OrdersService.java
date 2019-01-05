package com.hebeu.group.service;

import java.util.List;

import com.hebeu.group.pojo.Orders;
import com.hebeu.group.pojo.ShopCart;

/**
 * @author 贺海洋
 *
 */

public interface OrdersService {
	/**
	 * 查看所有订单
	 *
	 */
	List<Orders> selectAllOrders();

	/**
	 * 删除订单
	 * 
	 */
	void deleteorders(String orderId);

	/**
	 * 通过id查询订单
	 * 
	 */
	Orders selectOrdersById(String orderId);

	/**
	 * 通过用户名查询订单
	 * 
	 */
	List<Orders> selectOrdersByCName(String cName);

}