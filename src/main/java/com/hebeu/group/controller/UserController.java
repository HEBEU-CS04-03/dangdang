package com.hebeu.group.controller;

import com.hebeu.group.pojo.Customer;
import com.hebeu.group.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

/**
 * @author 言立慧
 * @date 2018/12/20 15:22
 */
@Controller
public class UserController {

    private AdminService adminService;

    @Autowired
    public UserController(AdminService adminService) {
        this.adminService = adminService;

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
        customer.setcEmail("905008726@qq.com");
        session.setAttribute("loginCustomer",customer);

        // 返回值
        return "redirect:/book/toIndex";
    }

    @RequestMapping("/logout")
    public String logout() {

        return "index";
    }
}
