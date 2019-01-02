package com.hebeu.group.controller;

import com.hebeu.group.pojo.Admin;
import com.hebeu.group.pojo.Customer;
import com.hebeu.group.service.AdminService;
import com.hebeu.group.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

/**
 * @author 言立慧
 * @date 2018/12/20 15:22
 */
@Controller
public class UserController {

    private AdminService adminService;
    private UserService userService;

    @Autowired
    public UserController(AdminService adminService, UserService userService) {
        this.adminService = adminService;
        this.userService = userService;
    }

    @RequestMapping("/toLoginPage")
    public String toLoginPage() {

        return "login";

    }

    /**
     * 登录测试
     * @return
     */
    @RequestMapping("/login")
    public String login(HttpSession session,String name, String password) {

        Customer customer = new Customer();
        customer.setcName("测试");
        customer.setcPhone("18832025733");
        customer.setcAddress("河北工程大学");
        session.setAttribute("loginCustomer",customer);

        // 返回值
        return "redirect:/book/toIndex";
    }

    @RequestMapping("/logout")
    public String logout() {

        return "index";
    }
}
