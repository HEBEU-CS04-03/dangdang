package com.hebeu.group.controller;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.Customer;
import com.hebeu.group.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/25 8:43
 */
@Controller
@RequestMapping("/book")
public class BookController {
    private BookService bookService;

    @Autowired
    public BookController(BookService bookService) {
        this.bookService = bookService;
    }

    /**
     * 跳转到首页，查询图书及个人相关信息
     *
     * @return
     */
    @RequestMapping("/toIndex")
    public String toIndex(Model model, HttpSession session) {
        //1. 获取用户信息，如果用户信息不为空的话
        Object user = session.getAttribute("user");
        if (user != null) {
            // 强制类型转换
            Customer customer = (Customer) user;
            model.addAttribute("username", customer.getcName());
        }
        // 2.查询图书分类
        List<BookType> bookTypes = bookService.selectBookType();
        model.addAttribute("bookTypes", bookTypes);
        // 3.查看图书
        List<Book> books1 = bookService.selectBookByTime();
        model.addAttribute("bookByTime", books1);
        List<Book> books2 = bookService.selectBookByPrice();
        model.addAttribute("bookByPrice", books2);
        return "index";
    }

    @RequestMapping("/toSort")
    public String toSort(Integer typeId, HttpSession session, Model model) {
        //1. 获取用户信息，如果用户信息不为空的话
        Object user = session.getAttribute("user");
        if (user != null) {
            // 强制类型转换
            Customer customer = (Customer) user;
            model.addAttribute("username", customer.getcName());
        }
        // 2.查询分类
        BookType bookType = bookService.selectBookTypeById(typeId);
        model.addAttribute("bookType", bookType.gettType());
        // 3.查询此分类的图书
        List<Book> books = bookService.selectBooksByType(typeId);
        model.addAttribute("books", books);

        return "bookList";
    }

    @RequestMapping("/toBookMessage")
    public String toBookMessage(String bookId, Model model, HttpSession session) {
        //1. 获取用户信息，如果用户信息不为空的话
        Object user = session.getAttribute("user");
        if (user != null) {
            // 强制类型转换
            Customer customer = (Customer) user;
            model.addAttribute("username", customer.getcName());
        }
        Book book = bookService.selectBookById(bookId);
        model.addAttribute("book", book);
        return "goodsmessage";
    }


    @RequestMapping("/toGoodsmessage")
    public String toGoodsMessage() {

        return "goodsmessage";
    }

    @RequestMapping("/toShopping")
    public String toShopping() {
        return "shopping";
    }
}
