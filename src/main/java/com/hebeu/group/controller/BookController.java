package com.hebeu.group.controller;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.Comment;
import com.hebeu.group.pojo.Customer;
import com.hebeu.group.service.BookService;
import com.hebeu.group.service.CommentService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/25 8:43
 */
@Controller
@RequestMapping("/book")
public class BookController {
    private BookService bookService;
    private CommentService commentService;

    @Autowired
    public BookController(BookService bookService, CommentService commentService) {
        this.bookService = bookService;
        this.commentService = commentService;
    }
    
    /**
     * 跳转到首页，查询图书及个人相关信息
     *
     * @return
     */

    @RequestMapping("/toIndex")
    public String toIndex(Model model, HttpSession session) {
        //1. 获取用户信息，如果用户信息不为空的话
        Object user = session.getAttribute("loginCustomer");
        if (user != null) {
            // 强制类型转换
            Customer customer = (Customer) user;
            model.addAttribute("loginName", customer.getcName());
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
        model.addAttribute("bookType", "分类：" + bookType.gettType() + "下的图书");
        // 3.查询此分类的图书
        List<Book> books = bookService.selectBooksByType(typeId);
        model.addAttribute("books", books);

        return "bookList";
    }

    /**
     * 跳转到图书详细信息页面
     *
     * @param bookId
     * @param model
     * @param session
     * @return
     */

    @RequestMapping("/toBookMessage")
    public String toBookMessage(String bookId, Model model, HttpSession session) {
        //1. 获取用户信息，如果用户信息不为空的话
        Object user = session.getAttribute("user");
        if (user != null) {
            // 强制类型转换
            Customer customer = (Customer) user;
            model.addAttribute("username", customer.getcName());
        }
        DateUtil dateUtil = new DateUtil();
        model.addAttribute("dateUtil", dateUtil);
        Book book = bookService.selectBookById(bookId);
        model.addAttribute("book", book);
        //2. 查询图书评论
        List<Comment> comments = commentService.selectCommentByBookId(bookId);
        model.addAttribute("comments", comments);
        return "goodsmessage";
    }

    /**
     * 搜索图书
     *
     * @param keyword
     * @param model
     * @param session
     * @return
     */

    @RequestMapping("/searchBook")
    public String searchBook(String keyword, Model model, HttpSession session) {
        //1. 获取用户信息，如果用户信息不为空的话
        Object user = session.getAttribute("user");
        if (user != null) {
            // 强制类型转换
            Customer customer = (Customer) user;
            model.addAttribute("username", customer.getcName());
        }

        // 2. 设置信息关键字
        model.addAttribute("bookType", "关键字：" + keyword);
        // 3. 查询图书
        List<Book> books = new ArrayList<>();
        // 3.1 查询图书名称
        List<Book> bookList1 = bookService.selectBookByName("%" + keyword + "%");
        books.addAll(bookList1);
        // 3.2 查询图书作者
        List<Book> bookList2 = bookService.selectBookByAuthor("%" + keyword + "%");
        for (Book book : bookList2) {
            if (!books.contains(book)) {
                books.add(book);
            }
        }
        // 3.3 查询出版社
        List<Book> bookList3 = bookService.selectBookByPress("%" + keyword + "%");
        for (Book book : bookList3) {
            if (!books.contains(book)) {
                books.add(book);
            }
        }
        model.addAttribute("books", books);
        return "bookList";
    }

    /**
     * 异步查询图书库存
     * @param bId 图书id
     * @return 库存数量
     */
    @RequestMapping("/findBookQuantity")
    @ResponseBody
    public Integer findBookQuantity(String bId){

        //查询图书信息
        Book book = bookService.selectBookById(bId);

        return book.getbQuantity();
    }
}