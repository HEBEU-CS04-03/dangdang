package com.hebeu.group.service;

import com.hebeu.group.pojo.OrderStatus;
import com.hebeu.group.pojo.Orders;

import java.util.List;

public interface OrdersStatusService {

    /**
     * 查询所有订单
     */
    List<Orders> findAllOrders();

    /**
     * 通过状态id查询状态名称
     *
     * @param orderStatus
     * @return
     */
    OrderStatus findStatusNameByOrderStatus(Integer orderStatus);

    /**
     * 根据订单编号删除订单
     *
     * @param orderId
     */
    void deleteOrderByOrderId(String orderId);
}
