package com.hebeu.group.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hebeu.group.pojo.Admin;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.Customer;
import com.hebeu.group.service.AdminService;
import com.hebeu.group.service.BookTypeService;
import com.hebeu.group.service.CustomerService;

/**
 * @author 王慧
 * @date 2018/12/20 16:59
 * 管理员管理器
 */


@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private BookTypeService booktypeService;
    /**
     * 去登录页面
     *
     * @return
     */
    @RequestMapping("/toLogin")
    public String toLogin() {
    	System.out.println("进入toLogin");
        return "admin/login";
    }

    /**
     * 跳转到home页面
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("/toHome")
    public String toHome(Model model, HttpSession session) {
    	  List<Customer> customer = customerService.selectCustomerCount();
          model.addAttribute("customer", customer);
          model.addAttribute("customerCount", customer.size());
          List<BookType> bookType = booktypeService.findAllBookType();
          //返回前端的信息
          model.addAttribute("bookType", bookType);
          model.addAttribute("bookTypeCount", bookType.size());
        return "admin/home";
    }


    /**
     * 处理登录请求
     *
     * @param username 登录名
     * @param password 密码
     * @return 跳转的视图
     */
    @RequestMapping("/login")
    public String login(Model model, String username, String password, HttpSession session) {
        //调用接口方法，返回对象接收
        Admin admin = adminService.login(username, password);
        //判断该返回的对象是否存在
        //不存在返回登录页面
        if (admin == null) {
            model.addAttribute("message", "用户名或密码错误！请重新输入！");
            return "admin/login";
        }
        //存在转向主页面
        session.setAttribute("admin", admin);
        return "redirect:/admin/toIndex";
    }

    /**
     * 防止重复提交表单
     * @param model
     * @param session
     * @return
     */
    @RequestMapping("toIndex")
    public String toIndex(Model model, HttpSession session) {
        Admin admin = (Admin) session.getAttribute("admin");
        model.addAttribute("username", admin.getaName());
        model.addAttribute("admin_aId", admin.getaId());
        model.addAttribute("admin", admin);
        model.addAttribute("password", admin.getaPass());
        model.addAttribute("phone", admin.getaPhone());
        model.addAttribute("email", admin.getaEmail());
        return "admin/index";
    }

    /**
     * 处理退出请求
     */
    @RequestMapping("/logout")
    public String logout(Model model, String username, HttpSession session) {
        // 销毁session
    	System.out.println("又退出了");
        session.invalidate();
        return "admin/login";
    }

    /**
     * 通过id查询用户管理员
     *
     * @return
     */
    @RequestMapping(value = "/findAdminById")
    public String findAdminById(Integer aId, Model model) {
        // 分解id字符串
        Admin admin = adminService.getAdminById(aId);
        model.addAttribute("admin", admin);

        return "admin/admin_info";

    }

    /**
     * 修改管理员信息
     *
     * @param admin
     * @return
     */
    @RequestMapping(value = "/updateAdmin")
    public String updateAdmin(Admin admin, Model model) {
        System.out.println("进入到controller修改请求");
        //执行修改操作
        adminService.updateAdmin(admin);
        model.addAttribute("admin", admin);
        model.addAttribute("messge2", "请您在修改信息后重新登录！");
        return "redirect:/admin/logout";
    }

}
