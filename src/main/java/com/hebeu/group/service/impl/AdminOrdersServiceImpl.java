package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.*;
import com.hebeu.group.pojo.*;
import com.hebeu.group.service.AdminOrdersService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

public class AdminOrdersServiceImpl implements AdminOrdersService {
    private AdminMapper adminMapper;
    private OrdersMapper ordersMapper;
    private OrderRecordMapper orderRecordMapper;
    private BookMapper bookMapper;
    private BookTypeMapper bookTypeMapper;

    @Autowired
    public AdminOrdersServiceImpl(AdminMapper adminMapper, OrdersMapper ordersMapper, OrderRecordMapper orderRecordMapper, BookMapper bookMapper, BookTypeMapper bookTypeMapper) {
        this.adminMapper = adminMapper;
        this.ordersMapper = ordersMapper;
        this.orderRecordMapper = orderRecordMapper;
        this.bookTypeMapper = bookTypeMapper;
        this.bookMapper = bookMapper;
    }
    @Override
    public List<BookType> findAllBookType(){
        BookTypeExample bookTypeExample = new BookTypeExample();
        BookTypeExample.Criteria criteria = bookTypeExample.createCriteria();
        criteria.andTIdIsNotNull();
        List<BookType> bookTypes = bookTypeMapper.selectByExample(bookTypeExample);
        return bookTypes;
    }

    @Override
    public List<Orders> findOrdersByorderTime() {
        OrdersExample ordersExample = new OrdersExample();
        OrdersExample.Criteria criteria = ordersExample.createCriteria();
        Date ordertime = new Date();
        criteria.andOrderTimeBetween(DateUtil.formateTime(ordertime)+" 00:00:00",DateUtil.formateTime(ordertime)+" 23:59:59");
        List<Orders> orders = ordersMapper.selectByExample(ordersExample);
        return orders;
    }

    @Override
    public List<OrderRecord> findOrderRecordByOrderId(String OrderId) {
        OrderRecordExample orderRecordExample = new OrderRecordExample();
        OrderRecordExample.Criteria criteria = orderRecordExample.createCriteria();
        criteria.andOrderIdEqualTo(OrderId);
        List<OrderRecord> orderRecords = orderRecordMapper.selectByExample(orderRecordExample);
        return orderRecords;
    }

    @Override
    public Book findBookBybId(String bId) {
        return bookMapper.selectByPrimaryKey(bId);
    }

    @Override
    public BookType findBookType(Integer tId) {
        return bookTypeMapper.selectByPrimaryKey(tId);
    }
}
