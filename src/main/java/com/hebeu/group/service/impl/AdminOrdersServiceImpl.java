package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.*;
import com.hebeu.group.pojo.*;
import com.hebeu.group.service.AdminOrdersService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
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
    public List<BookType> findAllBookType() {
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
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd 00:00:00 E");
        Date orderTime = new Date();
        Date start = new Date();
        Date end = new Date();
        try {
            start = dateFormat.parse(DateUtil.formateTime(orderTime) + " 00:00:00");
            end = dateFormat.parse(DateUtil.formateTime(orderTime) + " 23:59:59");
        } catch (ParseException e) {
            System.out.println("时间转换错误，默认为当天时间");
        }
        criteria.andOrderTimeBetween(start, end);
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
