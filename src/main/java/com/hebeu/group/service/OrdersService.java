package com.hebeu.group.service;

import java.util.List;

import com.hebeu.group.pojo.OrderRecord;
import com.hebeu.group.pojo.Orders;

/**
 * @author 贺海洋
 *
 */

public interface OrdersService {
	/**
	 * 查看订单
	 *
	 */
	List<Orders> selectOrdersByorderUser(String orderUser);
	/**
	 * 查看订单详情
	 *
	 */
	List<OrderRecord> selectOrdersByorderId(String orderId);

	/**
	 * 通过id更新订单状态
	 * @param id
	 * @param i
	 */
    void updateStatusById(String id, int i);
}