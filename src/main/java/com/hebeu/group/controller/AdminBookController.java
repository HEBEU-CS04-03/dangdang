package com.hebeu.group.controller;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.vo.BookVo;
import com.hebeu.group.service.BookService;
import com.hebeu.group.util.DateUtil;
import com.hebeu.group.util.UUIDUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.Date;
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
    public String toAddBook(Model model) {
        List<BookType> bookTypes = bookService.selectBookType();
        model.addAttribute("bookType", bookTypes);
        return "admin/book_add";
    }

    /**
     * 添加图书
     *
     * @param book
     * @return
     */
    @RequestMapping(value = "/addBook")
    public String addBook(BookVo book, HttpSession session) {
        System.out.println(book.toString());
        // 上传文件路径
        String path = session.getServletContext().getRealPath(
                "/static/img/");
        System.out.println(path);
        // 上传文件名
        String fileName = book.getFile().getOriginalFilename();
        // 将上传文件保存到一个目标文件当中
        try {
            book.getFile().transferTo(new File(path + File.separator + fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

        List<Book> books = bookService.selectAllBook();
        Book book1 = books.get(books.size() - 1);
        int id = Integer.parseInt(book1.getbId());
        book.setbId(String.valueOf(id + 1));
        // 插入数据库
        // 设置fileName
        book.setbImage(fileName);
        // 插入数据库
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
        Book book = bookService.selectBookById(bId);
        List<BookType> bookTypes = bookService.selectBookType();
        model.addAttribute("bookType", bookTypes);
        model.addAttribute("dateUtil",new DateUtil());
        model.addAttribute("book", book);
        return "admin/book_edit";
    }

    /**
     * 修改图书信息
     *
     * @param book
     * @return
     */
    @RequestMapping(value = "/updateBook")
    public String updateBook(BookVo bookVo, HttpSession session) {

        // 插入数据库
        if (bookVo.getFile() != null) {
            // 上传文件路径
            String path = session.getServletContext().getRealPath(
                    "/static/img/");
            System.out.println(path);
            // 上传文件名
            String fileName = bookVo.getFile().getOriginalFilename();
            // 将上传文件保存到一个目标文件当中
            try {
                bookVo.getFile().transferTo(new File(path + File.separator + fileName));
            } catch (IOException e) {
                e.printStackTrace();
            }
            // 设置fileName
            bookVo.setbImage(fileName);
        }
        //执行修改操作
        bookService.updateBook(bookVo);
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
