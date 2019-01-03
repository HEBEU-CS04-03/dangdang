package com.hebeu.group.controller;

import com.hebeu.group.pojo.*;
import com.hebeu.group.service.BookService;
import com.hebeu.group.service.ShopCartService;
import com.hebeu.group.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author 雷宇飞
 * @date 2018-12-24 15:53
 * 购物车相关控制器
 */
@Controller
@RequestMapping("/shopCart/")
public class ShopCartController {

    private ShopCartService shopCartService;
    private BookService bookService;

    @Autowired
    public ShopCartController(ShopCartService shopCartService, BookService bookService) {
        this.shopCartService = shopCartService;
        this.bookService = bookService;
    }

    /**
     * 跳转到购物车页面
     * @param session session
     * @param model model
     * @return 购物车页面
     */
    @RequestMapping("toShopCart")
    public String toShopCart(HttpSession session, Model model){
        //获取session中的登录用户信息
        Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        //判断是否登录
        if(loginCustomer==null){
            model.addAttribute("message","您还未登录，请先登录！");
            return "login";
        }else {

            List<ShopCart> shopCartList = shopCartService.selectShopCartByCName(loginCustomer.getcName());
            Double totalMoney = 0.0;
            for(ShopCart shopCart:shopCartList){
                totalMoney+=shopCart.getbPrice()*shopCart.getbNumber();
            }
            List<Book> bookList = bookService.selectAllBook();
            List<Book> firstBookList = new ArrayList<>();
            for(int i=0;i<4;i++){
                firstBookList.add(bookList.get(i));
            }
            List<Book> secondBookList = new ArrayList<>();
            for(int i=4;i<8;i++){
                secondBookList.add(bookList.get(i));
            }

            model.addAttribute("firstBookList",firstBookList);
            model.addAttribute("secondBookList",secondBookList);
            model.addAttribute("loginCustomer",loginCustomer);
            model.addAttribute("shopCartList",shopCartService.selectShopCartByCName(loginCustomer.getcName()));
            model.addAttribute("totalMoney",totalMoney);
        }
        return "shopping";
    }

    /**
     * 向购物车中添加图书
     * @param bId 图书id
     * @param session session
     */
    @RequestMapping("addBookToShopCart")
    @ResponseBody
    public boolean addBookToShopCart(String bId,Integer bNumber, HttpSession session){
        //获取session中的登录用户信息
        Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        if (loginCustomer == null){
            return false;
        }
        ShopCart oldShopCart = shopCartService.selectShopCartByCNameAndBId(loginCustomer.getcName(), bId);
        //判断该图书是否已在购物车中
        if(oldShopCart == null){
            try {
                ShopCart shopCart = new ShopCart();
                shopCart.setbId(bId);
                shopCart.setcName(loginCustomer.getcName());
                shopCart.setbNumber(bNumber);
                shopCartService.addBookToShopCart(shopCart);
            }catch (Exception e){
                e.printStackTrace();
            }
        }else {
            oldShopCart.setbNumber(oldShopCart.getbNumber()+bNumber);
            try {
                shopCartService.updateShopCart(oldShopCart);
            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return true;
    }

    /**
     * 更新购物车中图书数量
     * @param sid 购物车sid
     * @param number 数量
     */
    @RequestMapping("updateShopCart")
    public String updateBookNumFromShopCart(Integer sid, Integer number){
        if (number <= 0){
            try {
                shopCartService.deleteBookFromShopCart(sid);
            }catch (Exception e){
                e.printStackTrace();
            }
            return "redirect:/shopCart/toShopCart";
        }
        //更新购物车信息
        ShopCart shopCart = new ShopCart();
        shopCart.setbNumber(number);
        shopCart.setsId(sid);
        try {
            shopCartService.updateShopCart(shopCart);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/shopCart/toShopCart";
    }

    /**
     * 删除购物车中某种图书
     * @param sid sid
     */
    @RequestMapping("deleteBookFormShopCart")
    public String deleteBookFormShopCart(Integer sid){
        try {
            shopCartService.deleteBookFromShopCart(sid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return "redirect:/shopCart/toShopCart";
    }

    /**
     * 清空购物车
     * @param session session
     */
    @RequestMapping("deleteAllFromShopCart")
    @ResponseBody
    public void deleteAllFromShopCart(HttpSession session){
        //获取session中的登录用户信息
        Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        //通过用户名查询购物车信息
        List<ShopCart> shopCartList = shopCartService.selectShopCartByCName(loginCustomer.getcName());
        for (ShopCart shopCart:shopCartList){
            try {
                //删除购物车信息
                shopCartService.deleteBookFromShopCart(shopCart.getsId());
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    /**
     * 查询购物车列表
     * @param session session
     * @return 购物车列表
     */
    @RequestMapping("findShopCartInfo")
    @ResponseBody
    public List<ShopCart> findShopCartInfo(HttpSession session){
        //获取session中的登录用户信息
        Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        return shopCartService.selectShopCartByCName(loginCustomer.getcName());
    }

    /**
     * 提交订单
     * @param cAddress 地址
     * @param receiver 收件人
     * @param cPhone 电话
     * @param total 总价
     * @return
     */
    @RequestMapping("submitOrder")
    public String submitOrder(String cAddress,String receiver,String cPhone,Float total,HttpSession session){

        //获取session中的登录用户信息
        Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
        if (loginCustomer == null){
            return "login";
        }
        try {
            Orders orders = new Orders();
            //生成orderId
            String orderId = UUIDUtil.getUUID();
            orders.setOrderId(orderId);
            orders.setOrderAdress(cAddress);
            orders.setOrderEmail(loginCustomer.getcEmail());
            orders.setOrderSum(total);
            orders.setOrderTime(new Date());
            orders.setOrderUser(receiver);
            //将付款方式改为电话
            orders.setOrderPayment(cPhone);
            //插入订单信息
            shopCartService.insertOrder(orders);
            //查询该用户的购物车
            List<ShopCart> shopCartList = shopCartService.selectShopCartByCName(loginCustomer.getcName());
            List<OrderRecord> orderRecordList = new ArrayList<>();
            //获取订单图书集合
            for (ShopCart shopCart : shopCartList){
                OrderRecord orderRecord = new OrderRecord();
                orderRecord.setbNumber(shopCart.getbNumber());
                orderRecord.setbId(shopCart.getbId());
                orderRecord.setbImage(shopCart.getbImage());
                orderRecord.setbName(shopCart.getbName());
                orderRecord.setbPrice(shopCart.getbPrice());
                orderRecord.setOrderId(orderId);
                orderRecord.setcName(loginCustomer.getcName());
                orderRecord.setbTotalcost(shopCart.getbNumber()*shopCart.getbPrice());
                orderRecordList.add(orderRecord);
            }
            //插入订单图书集合
            shopCartService.insertOrderRecord(orderRecordList);
            //删除购物车中信息
            for (ShopCart shopCart:shopCartList){
                try {
                    //删除购物车信息
                    shopCartService.deleteBookFromShopCart(shopCart.getsId());
                }catch (Exception e){
                    e.printStackTrace();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return "order";
    }

}
