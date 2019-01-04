package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.BookMapper;
import com.hebeu.group.mapper.BookTypeMapper;
import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookExample;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.BookTypeExample;
import com.hebeu.group.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/25 8:44
 */
@Service
    public class BookServiceImpl implements BookService {
        private BookTypeMapper bookTypeMapper;
        private BookMapper bookMapper;

        @Autowired
        public BookServiceImpl(BookTypeMapper bookTypeMapper, BookMapper bookMapper) {
            this.bookTypeMapper = bookTypeMapper;
            this.bookMapper = bookMapper;
        }

    @Override
    public List<BookType> selectBookType() {
        // 查询所有
        BookTypeExample bookTypeExample = new BookTypeExample();
        BookTypeExample.Criteria criteria = bookTypeExample.createCriteria();
        criteria.andTIdIsNotNull();
        return bookTypeMapper.selectByExample(bookTypeExample);
    }

    @Override
    public List<Book> selectBookByTime() {
        List<Book> books;
        BookExample bookExample = new BookExample();
        bookExample.setOrderByClause("b_time desc");
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBIdIsNotNull();
        books = bookMapper.selectByExample(bookExample);
        System.out.println(books);
        // 只筛选前8个
        return books.subList(0, 8);
    }

    @Override
    public List<Book> selectBookByPrice() {
        List<Book> books;
        BookExample bookExample = new BookExample();
        bookExample.setOrderByClause("b_price desc");
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBIdIsNotNull();
        books = bookMapper.selectByExample(bookExample);
        System.out.println(books);
        // 只筛选前8个
        return books.subList(0, 8);
    }

    @Override
    public BookType selectBookTypeById(Integer typeId) {
        return bookTypeMapper.selectByPrimaryKey(typeId);
    }

    @Override
    public List<Book> selectBooksByType(Integer typeId) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andTIdGreaterThanOrEqualTo(typeId);
        return bookMapper.selectByExample(bookExample);
    }

    @Override
    public Book selectBookById(String bookId) {
        return bookMapper.selectByPrimaryKey(bookId);
    }

    @Override
    public List<Book> selectBookByName(String keyword) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBNameLike(keyword);
        return bookMapper.selectByExample(bookExample);
    }

    @Override
    public List<Book> selectBookByAuthor(String keyword) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBAuthorLike(keyword);
        return bookMapper.selectByExample(bookExample);
    }

    @Override
    public List<Book> selectBookByPress(String keyword) {
        BookExample bookExample = new BookExample();
        BookExample.Criteria criteria = bookExample.createCriteria();
        criteria.andBPressLike(keyword);
        return bookMapper.selectByExample(bookExample);
    }

    @Override
    public List<Book> selectAllBook() {
        BookExample bookExample = new BookExample();

        return bookMapper.selectByExample(bookExample);
    }
}
