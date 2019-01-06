package com.hebeu.group.service;

import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookType;

import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/25 8:44
 */

public interface BookService {
    /**
     * 查询所有的书籍分类
     * @return
     */
    List<BookType> selectBookType();

    /**
     * 查看最新出版的图书，按照时间排序
     * @return
     */
    List<Book> selectBookByTime();

    /**
     * 查看图书，按照价格从低到高排序
     * @return
     */
    List<Book> selectBookByPrice();

    /**
     * 通过图书分类的id查询图书分类
     * @param typeId
     * @return
     */
    BookType selectBookTypeById(Integer typeId);

    /**
     * 通过图书分类id查询图书
     * @param typeId
     * @return
     */
    List<Book> selectBooksByType(Integer typeId);

    /**
     * 通过id查询图书详情
     * @param bookId
     * @return
     */
    Book selectBookById(String bookId);

    /**
     * 通过图书名查询图书
     * @param keyword
     * @return
     */
    List<Book> selectBookByName(String keyword);

    /**
     * 通过作者查询图书
     * @param keyword
     * @return
     */
    List<Book> selectBookByAuthor(String keyword);

    /**
     * 通过出版社查询图书
     * @param keyword
     * @return
     */
    List<Book> selectBookByPress(String keyword);

    /**
     * 查询多条书籍
     * @return
     */
    List<Book> selectAllBook();

    /**
     * 更新图书
     * @param book
     */
    void updateBook(Book book);

    /**
     * 删除图书通过id
     * @param id
     */
    void deleteBookById(String id);

    /**
     * 新增图书
     * @param book
     */
    void addBook(Book book);
}
