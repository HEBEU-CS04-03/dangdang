package com.hebeu.group.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.hebeu.group.common.DangConstants;
import com.hebeu.group.pojo.Admin;
import com.hebeu.group.service.AdminService;

/**
 * @author 王慧
 * @date 2018/12/20 16:59
 * 管理员管理器
 */


@Controller//1
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired//2
	private AdminService adminService;
	/**
	 * 去登录页面
	 * @return
	 */
	@RequestMapping("/toLogin")//3
	public String toLogin() {
		return "admin/admin_login";
		// ${username}
	}
	
	
	/**
	 * 处理登录请求
	 * @param String loginname  登录名
	 * @param String password 密码
	 * @return 跳转的视图
	 * */
	@RequestMapping("/login")
	public String login(Model model, String username, String password) {
		//调用接口方法，返回对象接收
		Admin admin=adminService.login(username,password);
		//判断该返回的对象是否存在
		//不存在返回登录页面
		if(admin==null){
			model.addAttribute("msg","用户名或密码错误");
			return "houtai/admin/admin_login";
		}
		//存在转向主页面
		model.addAttribute("username", username);
		return "admin/main";
		// ${username}
	}
	
		/**
		 * 处理退出请求
		 */
		@RequestMapping("/logout")
		public String logout(String username) {
		
			return "admin/admin_login";

		}
	
}
