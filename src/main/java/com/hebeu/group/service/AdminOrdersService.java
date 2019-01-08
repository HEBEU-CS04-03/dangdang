package com.hebeu.group.service;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.OrderRecord;
import com.hebeu.group.pojo.Orders;
import org.springframework.stereotype.Service;
import java.util.*;

public interface AdminOrdersService {
    /**
     * 查询所有图书类型信息
     * @return
     */
    List<BookType> findAllBookType();

    /**
     * 通过当天时间查询订单
     * @return
     */
    List<Orders> findOrdersByorderTime();

    /**
     * 通过订单id查询订单记录
     * @param OrderId
     * @return
     */
    List<OrderRecord> findOrderRecordByOrderId(String OrderId);

    /**
     * 通过bId查询图书
     * @param bId
     * @return
     */
    Book findBookBybId(String bId);

    /**
     * 通过tId查询图书类型
     * @param tId
     * @return
     */
    BookType findBookType(Integer tId);

}
