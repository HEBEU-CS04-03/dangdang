package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.*;
import com.hebeu.group.pojo.OrderStatus;
import com.hebeu.group.pojo.OrderStatusExample;
import com.hebeu.group.pojo.Orders;
import com.hebeu.group.pojo.OrdersExample;
import com.hebeu.group.service.OrdersStatusService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrdersStatusServiceImpl implements OrdersStatusService {

    private OrdersMapper ordersMapper;
    private OrderStatusMapper orderStatusMapper;

    @Autowired
    public OrdersStatusServiceImpl( OrdersMapper ordersMapper, OrderStatusMapper orderStatusMapper) {
        this.ordersMapper = ordersMapper;
        this.orderStatusMapper = orderStatusMapper;
    }

    @Override
    public List<Orders> findAllOrders() {
        OrdersExample ordersExample = new OrdersExample();
        OrdersExample.Criteria criteria = ordersExample.createCriteria();
        criteria.andOrderIdIsNotNull();
        return  ordersMapper.selectByExample(ordersExample);
    }

    @Override
    public OrderStatus findStatusNameByOrderStatus(Integer orderStatus) {
        return orderStatusMapper.selectByPrimaryKey(orderStatus);
    }

    @Override
    public void deleteOrderByOrderId(String orderId) {
        ordersMapper.deleteByPrimaryKey(orderId);
    }

}
