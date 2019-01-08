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
     * 查询物流状态
     * @param orderStatus
     * @return
     */
    OrderStatus findStatusNameByOrderStatus(Integer orderStatus);

    public void removeOrdersByorderId(Integer status_id);

    OrderStatus selectBystatusName(String keyword);

    List<Orders> selectByOrderStatus(Integer orderStatus);
}
