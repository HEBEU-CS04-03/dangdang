package com.hebeu.group.controller;

import com.hebeu.group.pojo.*;
import com.hebeu.group.service.AdminOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.*;

/**
 * @author 王煜
 */

@Controller
@RequestMapping("/admin")
public class AdminOrdersController {

    @Autowired
    public AdminOrdersService adminOrdersService;

    @Autowired
    public AdminOrdersController(AdminOrdersService adminOrdersService) {
        this.adminOrdersService = adminOrdersService;
    }

    //查询所有的订单图书类型和数量
    @RequestMapping(value = "/selectbooktype")
    public String selectBookType(Model model) {
        //查询所有图书类型信息
        List<BookType> booktypes = adminOrdersService.findAllBookType();
        System.out.println("所有图书类型：");
        System.out.println(booktypes);
        model.addAttribute("booktypes", booktypes);
        //通过下单时间查询订单id
        List<Orders> orderitems = adminOrdersService.findOrdersByorderTime();
        System.out.println("订单信息：");
        System.out.println(orderitems);
        Map<String, Integer> bookTypeIntegerMap = new HashMap<>();
        List<BookTypeCount> bookTypeCounts = new ArrayList<>();
        // 计算所有type的数量 map集合
        for (Orders orders : orderitems) {
            List<OrderRecord> orderRecords = adminOrdersService.findOrderRecordByOrderId(orders.getOrderId());
            // 1. 查订单详细
            // 通过订单id查询订单详细
            for (OrderRecord record : orderRecords) {
                Book book = adminOrdersService.findBookBybId(record.getbId());
                BookType bookType = adminOrdersService.findBookType(book.gettId());

                if (bookTypeIntegerMap.containsKey(bookType.gettType())) {
                    bookTypeIntegerMap.put(bookType.gettType(), bookTypeIntegerMap.get(bookType.gettType()) + record.getbNumber());
                    System.out.println("输出订单该类图书的数量：");
                    System.out.println(record.getbNumber());
                } else {
                    bookTypeIntegerMap.put(bookType.gettType(), record.getbNumber());
                }
            }
        }
            // 把以上的map集合中的数据放入bootypeCounts中
            for (BookType bookType : booktypes) {
                BookTypeCount bookTypeCount = new BookTypeCount();
                bookTypeCount.settType(bookType.gettType());
                if (!bookTypeIntegerMap.containsKey(bookType.gettType())) {
                    bookTypeCount.setCount(0);
                } else {
                    bookTypeCount.setCount(bookTypeIntegerMap.get(bookType.gettType()));
                }
                bookTypeCounts.add(bookTypeCount);
            }

        model.addAttribute("bookTypetotal", bookTypeCounts.size());
        model.addAttribute("bookTypeCounts", bookTypeCounts);
        return "admin/admin_orderscount";

    }
}

