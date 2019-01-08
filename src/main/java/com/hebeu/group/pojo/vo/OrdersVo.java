package com.hebeu.group.pojo.vo;

import com.hebeu.group.pojo.Orders;

/**
 * 订单视图
 */
public class OrdersVo extends Orders {
    String orderStatusName;
    Integer id;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderStatusName() {
        return orderStatusName;
    }

    public void setOrderStatusName(String orderStatusName) {
        this.orderStatusName = orderStatusName;
    }

    @Override
    public String toString() {
        return "OrdersVo{" +
                "id='" + id +'\''+
                ", orderStatusName='" + orderStatusName + '\'' +
                '}';
    }
}
