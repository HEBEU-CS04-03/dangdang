package com.hebeu.group.controller;

import com.hebeu.group.pojo.Admin;
import com.hebeu.group.service.AdminService;
import com.hebeu.group.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    public Admin login(String name, String password) {
        userService.login(name,password);

        // 返回值
        return adminService.getAdminById(1);
    }

    @RequestMapping("/logout")
    public String logout() {
        return "index";
    }
}
