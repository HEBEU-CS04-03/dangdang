package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.*;
import com.hebeu.group.pojo.*;
import com.hebeu.group.service.AdminOrdersService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
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
        List<BookType> bookType = bookTypeMapper.selectByExample(bookTypeExample);
        return bookType;
    }

    @Override
    public List<Orders> findOrdersByorderTime() {
        OrdersExample ordersExample = new OrdersExample();
        OrdersExample.Criteria criteria = ordersExample.createCriteria();
        // 设置开始时间
        Calendar cal = Calendar.getInstance();
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.MILLISECOND, 0);
        // 设置结束时间
        Calendar cal1 = Calendar.getInstance();
        cal1.set(Calendar.HOUR_OF_DAY, 24);
        cal1.set(Calendar.SECOND, 0);
        cal1.set(Calendar.MINUTE, 0);
        cal1.set(Calendar.MILLISECOND, 0);
        // 设置查询
        Date start = cal.getTime();
        Date end = cal1.getTime();
        criteria.andOrderTimeBetween(start, end);
        return ordersMapper.selectByExample(ordersExample);
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
