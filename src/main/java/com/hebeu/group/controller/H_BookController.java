
/**
* @author 作者 王慧
* @version 创建时间：上午10:20:502019年1月2日
* 类说明：后台图书管理控制器
*/
package com.hebeu.group.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.service.H_BookService;

@Controller
@RequestMapping(value="/admin")
public class H_BookController {
	
		//注入service
		@Autowired
		private H_BookService bookService;
		/**
		 * 查询所有的图书
		 * @param model
		 * @return
		 */
		@RequestMapping(value="/selectBook")
		 public String selectBook(Model model){
			List<Book> book = bookService.selectBookByBookId();
			//返回前端的信息
			model.addAttribute("book", book);
			model.addAttribute("book_count", book.size());
			return "admin/book_list";  //图书页面
		}
		/**
		 * 搜索功能通过id和名称搜索，不是模糊查询
		 * 不会写
		 * 晚点写
		 * 
		 * @return
		 */
		@RequestMapping(value="/selectBookById")
		public String selectBookById(  ){
			
			
			return "redirect:/admin/selectBook";
			
		}
		/**
		 * 去添加图书的页面
		 * @return
		 */
		@RequestMapping(value="/toaddBook")
		public String toaddBook(){
			return "admin/book_add";
		}
		/**
		 * 添加图书
		 * @param model
		 * @return
		*/
		@RequestMapping(value="/addBook")
		public String addBook(Book book){
			bookService.addBook(book);
			//重定向列表请求  
			return "redirect:/admin/selectBook";  //图书种类页面
			
		}
			
		/**
		 * 通过id查询图书
		 * 去修改图书的页面
		 * @return
		 */
		@RequestMapping(value="/findBookById")
		public String findBookById(String bId,Model model,Book book){
						Book book1 = bookService.findBookById(bId);
						model.addAttribute("booktype", book1);
			return "admin/book_edit";
			
		}
		
		 /**
		  * 修改图书信息
		  * @param model
		  * @param booktype
		  * @return
		  */
		@RequestMapping(value="/updateBook")
		public String updateBook(Book book){
			System.out.println("进入到controller修改请求");
				//执行修改操作
				bookService.updateBook(book);
					
				return "redirect:/admin/selectBook";
		}
		
		/**
		 * 根据id删除图书
		 * @param tId
		 * @return
		 */
		@RequestMapping(value="/deleteBookById")
		public String deleteBookById(String bId){
				// 根据id删除分类
			System.out.println("进到删除");
				bookService.deleteBookById(bId);
				System.out.println("删除成功");
			return "redirect:/admin/selectBook";
		}

	
}
