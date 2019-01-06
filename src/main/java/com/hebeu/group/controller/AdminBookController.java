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

    @RequestMapping("/toBookList")
    public String toBookList(Model model) {
        List<Book> books = bookService.selectAllBook();
        model.addAttribute("books", books);
        model.addAttribute("dateUtil", new DateUtil());
        model.addAttribute("count", books.size());
        return "admin/book_list";
    }
}
