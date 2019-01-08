package com.hebeu.group.service.impl;

import java.util.List;

import com.hebeu.group.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hebeu.group.mapper.OrderRecordMapper;
import com.hebeu.group.mapper.OrdersMapper;
import com.hebeu.group.pojo.OrdersExample.Criteria;
import com.hebeu.group.service.OrdersService;

@Service
public class OrdersServiceImpl implements OrdersService {
	@Autowired
	private OrdersMapper ordersMapper;
	@Autowired
	private OrderRecordMapper orderRecordMapper;

	//    全部订单
	@Override
	public List<Orders> selectOrdersByorderUser(String orderUser) {
		OrdersExample ordersExample = new OrdersExample();
		OrdersExample.Criteria criteria = ordersExample.createCriteria();
		criteria.andOrderUserEqualTo(orderUser);
		return ordersMapper.selectByExample(ordersExample);
	}

	//    订单详情
	@Override
	public List<OrderRecord> selectOrdersByorderId(String orderId) {
		OrderRecordExample orderRecordExample = new OrderRecordExample();
		OrderRecordExample.Criteria criteria = orderRecordExample.createCriteria();
		criteria.andOrderIdEqualTo(orderId);
		return  orderRecordMapper.selectByExample(orderRecordExample);
	}

}



