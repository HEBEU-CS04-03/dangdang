package com.hebeu.group.controller;

import com.hebeu.group.pojo.OrderStatus;
import com.hebeu.group.pojo.Orders;
import com.hebeu.group.pojo.vo.OrdersVo;
import com.hebeu.group.service.OrdersStatusService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 王煜
 */
@Controller
@RequestMapping("/admin")
public class OrdersStatusController {

    public OrdersStatusService ordersStatusService;

    @Autowired
    public OrdersStatusController(OrdersStatusService ordersStatusService) {
        this.ordersStatusService = ordersStatusService;
    }

    /**
     * 查询所有订单状态
     *
     * @param model
     * @return
     */
    @RequestMapping("/selectallorders")
    public String selectAllOrders(Model model) {
        List<Orders> orders = ordersStatusService.findAllOrders();

        List<OrdersVo> ordersVosList = new ArrayList<>();
        for (Orders orders1 : orders) {
            System.out.println("输出当前订单id：");
            System.out.println(orders1.getOrderId());
            // Orders _orders = new Orders();
            OrdersVo ordersVo = new OrdersVo();
            ordersVo.setOrderId(orders1.getOrderId());
            ordersVo.setOrderTime(orders1.getOrderTime());
            ordersVo.setOrderUser(orders1.getOrderUser());
            ordersVo.setOrderAdress(orders1.getOrderAdress());
            ordersVo.setOrderSum(orders1.getOrderSum());
            ordersVo.setOrderStatus(orders1.getOrderStatus());
            OrderStatus orderStatuses = ordersStatusService.findStatusNameByOrderStatus(orders1.getOrderStatus());
            ordersVo.setOrderStatusName(orderStatuses.getStatusName());
            System.out.println("输出statusname:");
            System.out.println(orderStatuses.getStatusName());
            ordersVosList.add(ordersVo);
        }
        model.addAttribute("orderstotal", ordersVosList.size());
        model.addAttribute("ordersVosList", ordersVosList);
        return "admin/status_select";
    }


    /**
     * 根据订单编号删除订单
     *
     * @param orderId
     * @return
     */
    @RequestMapping(value = "/deleteOrdersByOrderId")
    public String deleteOrdersByOrderId(String orderId) {
        // 如果是批量删除
        if (orderId.contains("-")) {
            String[] ids = orderId.split("-");
            for (String id : ids) {
                ordersStatusService.deleteOrderByOrderId(id);
            }
        } else {
            ordersStatusService.deleteOrderByOrderId(orderId);
        }
        return "redirect:/admin/selectallorders";
    }

}
