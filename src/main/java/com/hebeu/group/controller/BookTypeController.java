package com.hebeu.group.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.service.AdminService;
import com.hebeu.group.service.BookTypeService;

/**
* @author 作者 王慧
* @version 创建时间：上午9:40:212018年12月27日
* 图书种类管理器
*/

@Controller
@RequestMapping(value="/bookType")
public class BookTypeController {
	/**
	 * 自动注入
	 */
	@Autowired
	private BookTypeService booktypeService;
	/**
	 * 查询所有的图书种类
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/selectBookType")
	 public String selectBookType(Model model){
		List<BookType> bookType = booktypeService.findAllBookType();
		//返回前端的信息
		model.addAttribute("bookType", bookType);
		model.addAttribute("bookTypeCount", bookType.size());
		//图书种类页面
		return "admin/book_type_list";
	}
	/**
	 * 搜索功能通过名称搜索，模糊查询
	 * @return
	 */
	@RequestMapping(value="/selectBookTypeByname")
	public String selectBookTypeByname(String keyword,Model model){
		System.out.println("进到搜所controller");
		 // 3.1 查询图书名称
        List<BookType> booktype = booktypeService.selectBookTypeByName("%" + keyword + "%");
		
		System.out.println("查询的参数是：" + keyword);
		model.addAttribute("booktype", booktype);
		
		return "admin/booktype_list";
		
	}
	/**
	 * 去添加图书种类的页面
	 * @return
	 */
	@RequestMapping(value="/toaddBookType")
	public String toaddBookType(){
		return "admin/booktype_add";
	}
	/**
	 * 添加图书种类
	 * @param model
	 * @return
	*/
	@RequestMapping(value="/addBookType")
	public String addBookType(BookType booktype){
		booktypeService.addBookType(booktype);
		//重定向列表请求  
		return "redirect:/admin/selectBookType";  //图书种类页面
		
	}
		
	/**
	 * 去修改图书种类的页面
	 * @return
	 */
	@RequestMapping(value="/findBookTypeById")
	public String findBookTypeById(String id,Model model,BookType booktype){
		// 分解id字符串
				String[] idArray = id.split(",");
				for(String id1 : idArray){
					// 根据id查询
					BookType booktype1 = booktypeService.findBookTypeById(Integer.parseInt(id1));
					model.addAttribute("booktype", booktype1);
				}
		return "admin/booktype_edit";
		
	}
	
	 /**
	  * 修改图书种类信息
	  * @param model
	  * @param booktype
	  * @return
	  */
	@RequestMapping(value="/updateBookType")
	public String updateBookType(BookType booktype){
		System.out.println("进入到controller修改请求");
			//执行修改操作
			booktypeService.updateBookType(booktype);
				
			return "redirect:/admin/selectBookType";
	}
	
	/**
	 * 根据id删除分类
	 * @param tId
	 * @return
	 */
	@RequestMapping(value="/deleteBookTypeById")
	public String deleteBookTypeById(String tId){
			// 根据id删除分类
			booktypeService.deleteBookTypeById(Integer.parseInt(tId));
		return "redirect:/admin/selectBookType";
	}

}
