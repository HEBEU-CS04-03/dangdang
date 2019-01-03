package com.hebeu.group.controller;

import com.hebeu.group.pojo.Customer;
import com.hebeu.group.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/customer")
public class CustomerController {
    private CustomerService customerService;


    @Autowired
    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @RequestMapping("/loginTo")
    public String loginTo() {
        return "/login";
    }

    /**
     * 处理登录请求
     *
     * @param loginName 登录名
     * @param password  密码
     * @return 跳转的视图
     */
    @RequestMapping("/login")
    public String login(Model model, String loginName, String password, HttpSession session) {
        //调用接口方法，返回对象接收
        Customer customer = customerService.login(loginName, password);
        //判断该返回的对象是否存在
        //不存在返回登录页面
        if (customer == null) {
            model.addAttribute("msg", "用户名或密码错误");
            return "/login";
        }
        model.addAttribute("loginName", loginName);
        session.setAttribute("loginCustomer", customer);
        return "redirect:/book/toIndex";
    }

    /**
     * 跳转到个人信息界面
     */
    @RequestMapping("/showCustomer")
    public String showCustomer(HttpSession session, Model model) {
        Customer customer = (Customer) session.getAttribute("loginCustomer");
        model.addAttribute("customer", customer);
        return "/showCustomer";
    }

    /**
     * 处理修改请求
     *
     * @return
     */
    @RequestMapping("/updateCustomer")
    public String updateCustomer(Customer customer, HttpSession session) {
        customerService.updateCustomer(customer);
        Customer customer1 = customerService.selectCustomer(customer.getcName());
        session.setAttribute("loginCustomer", customer1);
        return "/showCustomer";
    }

    /**
     * 处理退出请求
     */
    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "redirect:/book/toIndex";
    }

    @RequestMapping("/registerTo")
    public String registerTo() {
        return "/register";
    }
    /**
     * 处理注册请求
     *
     * @return 跳转的视图
     */
    @RequestMapping("/register")
    public String register(Model model, Customer customer, HttpSession session) {
        /**
         * 判断用户名，密码，邮箱是否合乎鬼规范
         */
        Customer customer1=customerService.selectCustomer(customer.getcName());
        Customer customer2=customerService.selectCustomerByEmail(customer);
        String username = customer.getcName();
        int i=0;
        if (username == null || username.trim().isEmpty()) {
            model.addAttribute("username", "用户名不能为空");i=1;
        } else if (username.length() < 3 || username.length() > 20) {
            model.addAttribute("username", "用户名长度必须在3~20之间！");  i=1;
        }
        String password = customer.getcPass();
        if (password == null || password.trim().isEmpty()) {
            model.addAttribute("password", "密码不能为空！"); i=1;
        } else if (password.length() < 3 || password.length() > 20) {
            model.addAttribute("password", "密码长度必须在3~20之间！");i=1;
        }
        String email = customer.getcEmail();
        if (email == null || email.trim().isEmpty()) {
            model.addAttribute("email", "Email不能为空！");i=1;
        } else if (!email.matches("\\w+@\\w+\\.\\w+")) {
            model.addAttribute("email", "Email格式错误！");  i=1;
        }
        if(customer1==null&&i==0&&customer2==null) {
        customerService.register(customer);
        return "/registerDid";
        }
        else if (customer1!=null&&customer2==null){
            model.addAttribute("masg","该用户名被注册请重新注册");
        }
        else if (customer2!=null&&customer1==null){
            model.addAttribute("masg","该邮箱已被注册请重新注册");
        }
        return "/register";
    }
}



