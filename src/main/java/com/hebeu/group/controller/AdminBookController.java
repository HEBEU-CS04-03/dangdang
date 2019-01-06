package com.hebeu.group.controller;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.service.BookService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author 言立慧
 * @date 2019/1/6 10:29
 * 管理员图书管理部分
 */
@Controller
@RequestMapping("/adminBook")
public class AdminBookController {
    private BookService bookService;

    @Autowired
    public AdminBookController(BookService bookService) {
        this.bookService = bookService;
    }

    /**
     * 跳转到图书列表
     *
     * @param model
     * @return
     */
    @RequestMapping("/toBookList")
    public String toBookList(Model model) {
        List<Book> books = bookService.selectAllBook();
        model.addAttribute("books", books);
        model.addAttribute("dateUtil", new DateUtil());
        model.addAttribute("count", books.size());
        return "admin/book_list";
    }

    /**
     * 去添加图书的页面
     *
     * @return
     */
    @RequestMapping(value = "/toAddBook")
    public String toAddBook() {
        return "admin/book_add";
    }

    /**
     * 添加图书
     *
     * @param book
     * @return
     */
    @RequestMapping(value = "/addBook")
    public String addBook(Book book) {
        bookService.addBook(book);
        //重定向列表请求
        return "redirect:/adminBook/toBookList";
    }

    /**
     * 通过id查询图书
     * 去修改图书的页面
     *
     * @return
     */
    @RequestMapping(value = "/findBookById")
    public String findBookById(String bId, Model model) {
        Book book1 = bookService.selectBookById(bId);
        model.addAttribute("booktype", book1);
        return "admin/book_edit";
    }

    /**
     * 修改图书信息
     *
     * @param book
     * @return
     */
    @RequestMapping(value = "/updateBook")
    public String updateBook(Book book) {
        System.out.println("进入到controller修改请求");
        //执行修改操作
        bookService.updateBook(book);

        return "redirect:/adminBook/toBookList";
    }

    /**
     * 根据id删除图书
     *
     * @param bId
     * @return
     */
    @RequestMapping(value = "/deleteBookById")
    public String deleteBookById(String bId) {
        // 如果是批量删除
        if (bId.contains("-")) {
            String[] ids = bId.split("-");
            for (String id : ids) {
                bookService.deleteBookById(id);
            }
        } else {
            bookService.deleteBookById(bId);
        }
        return "redirect:/adminBook/toBookList";
    }
}
