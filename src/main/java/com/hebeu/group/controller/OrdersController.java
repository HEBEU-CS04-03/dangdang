package com.hebeu.group.controller;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.Customer;
import com.hebeu.group.pojo.ShopCart;
import org.springframework.beans.factory.annotation.Autowired;
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
    private BookService bookService;

    @Autowired
    public OrdersController(OrdersService ordersService, BookService bookService) {
        this.ordersService = ordersService;
        this.bookService = bookService;
    }

    /**
     * 结算页面
     */
    @RequestMapping("/order-cart")
    public String showOrderCart() {
        return "order-cart";
    }

    /**
     * 跳转到我的订单
     *
     * @param session session
     * @param model   model
     * @return 购物车页面
     */
    @RequestMapping("toOrders")
    public String toShopCart(HttpSession session, Model model) {
        //获取session中的登录用户信息
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        //判断是否登录
        if (loginCustomer == null) {
            model.addAttribute("message", "您还未登录，请先登录！");
            return "login";
        } else {

            return "orderList";
        }


    }

    /**
     * \删除订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping("/deleteOrder")
    public String deleteOrder(String orderId) {
        ordersService.deleteorders(orderId);
        return "orderList";
    }
}