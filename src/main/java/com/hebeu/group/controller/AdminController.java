package com.hebeu.group.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import com.hebeu.group.pojo.Admin;
import com.hebeu.group.pojo.BookType;
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
		return "houtai/admin/admin_login";
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
			model.addAttribute("msg","用户名或密码错误！请重新输入！");
			return "admin/admin_login";
		}
		//存在转向主页面
//		session.setAttribute(DangConstants.USER_SESSION, admin);
		model.addAttribute("username", username);
<<<<<<< HEAD
		model.addAttribute("admin", admin);
		return "admin/index";
=======
		return "houtai/main";
>>>>>>> 41a3316e54f1bdf609b3bd22103bc441c596caab
		// ${username}
	}

		/**
		 * 处理退出请求
		 */
		@RequestMapping("/logout")
<<<<<<< HEAD
		public String logout(Model model,String username,HttpSession session) {
			session.removeAttribute(username);
=======
		public String logout(String username) {

>>>>>>> 41a3316e54f1bdf609b3bd22103bc441c596caab
			return "admin/admin_login";

		}
		
		/**
		 * 通过id查询用户管理员
		 * @return
		 */
		@RequestMapping(value="/findAdminById")
		public String findAdminById(Integer aId,Model model){
			// 分解id字符串
			Admin admin = adminService.getAdminById(aId);
						model.addAttribute("admin", admin);
					
			return "admin/admin_desc";
			
		}
		
		 /**
		  * 修改管理员信息
		  * @param model
		  * @param booktype
		  * @return
		  */
		@RequestMapping(value="/updateAdmin")
		public String updateAdmin(Admin admin){
			System.out.println("进入到controller修改请求");
				//执行修改操作
			adminService.updateAdmin(admin);
					
				return "redirect:/admin/findAdminById";
		}
	
}
