package com.hebeu.group.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Service;

import com.hebeu.group.mapper.OrderRecordMapper;
import com.hebeu.group.mapper.OrdersMapper;
import com.hebeu.group.pojo.Orders;
import com.hebeu.group.pojo.OrdersExample;
import com.hebeu.group.pojo.ShopCart;
import com.hebeu.group.pojo.ShopCartExample;
import com.hebeu.group.pojo.OrdersExample.Criteria;
import com.hebeu.group.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private OrderRecordMapper orderItemMapper;

	@Override
	public List<Orders> selectAllOrders() {
		OrdersExample oe = new OrdersExample();
		Criteria criteria = oe.createCriteria();
		criteria.andOrderIdIsNotNull();
		return ordersMapper.selectByExample(oe);
	}

	@Override
	public Orders selectOrdersById(String orderId) {
		return ordersMapper.selectByPrimaryKey(orderId);
	}

	@Override
	public void deleteorders(String orderId) {
		try {
			ordersMapper.deleteByPrimaryKey(orderId);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("删除订单失败！");
		}
	}
    @Override
    public List<Orders> selectOrdersByCName(String cName) {
        OrdersExample ordersExample = new OrdersExample();
        Criteria criteria =  ordersExample.createCriteria();
        criteria.andOrderIdEqualTo(cName);
        return ordersMapper.selectByExample( ordersExample);
    }
}

