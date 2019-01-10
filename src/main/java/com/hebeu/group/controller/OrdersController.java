package com.hebeu.group.controller;

import com.hebeu.group.pojo.*;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hebeu.group.service.BookService;
import com.hebeu.group.service.CommentService;
import com.hebeu.group.service.OrdersService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 贺海洋
 */
@Controller
@RequestMapping("/orders")
public class OrdersController {
    private OrdersService ordersService;

    @Autowired
    public OrdersController(OrdersService ordersService, BookService bookService) {
        this.ordersService = ordersService;
    }

    /**
     * 我的订单
     */
    @RequestMapping("/toOrderList")
    public String toOrderList(HttpSession session, Model model) {
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        if (loginCustomer == null) {
            model.addAttribute("message", "您还未登录，请先登录！");
            return "login";
        } else {

            List<Orders> ordersList = ordersService.selectOrdersByorderUser(loginCustomer.getcName());
            model.addAttribute("orders", ordersService.selectOrdersByorderUser(loginCustomer.getcName()));
            model.addAttribute("dateUtil", new DateUtil());
        }

        return "orderlist";
    }

    /**
     * 查看订单详情
     * localhost:8080/orders/OrderRecord?orderId=?
     */
    @RequestMapping("/OrderRecord")
    public String OrderRecord(HttpSession session, Model model, String orderId) {
        List<OrderRecord> orderRecord = ordersService.selectOrdersByorderId(orderId);
        model.addAttribute("oId", orderId);
        model.addAttribute("orderRecord", orderRecord);
        return "orderRecord";
    }

    /**
     * 支付页面
     */
    @RequestMapping("/toPay")
    public String toPay(String id, HttpSession session) {
        session.setAttribute("orderId", id);
        return "pay";
    }

    /**
     * 支付成功
     */
    @RequestMapping("/PaySuccess")
    public String PaySuccess(HttpSession session) {
        String id = (String) session.getAttribute("orderId");
        ordersService.updateStatusById(id, 2);
        return "paysuccess";
    }
}