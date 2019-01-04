package com.hebeu.group.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hebeu.group.mapper.BookMapper;
import com.hebeu.group.pojo.Book;
import com.hebeu.group.pojo.BookExample;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.BookTypeExample;
import com.hebeu.group.pojo.CommentExample;
import com.hebeu.group.service.H_BookService;

/**
* @author 作者 王慧
* @version 创建时间：上午9:49:552019年1月2日
* 后台图书管理
*/

@Service
public class H_BookServiceImpl implements H_BookService {
    private BookMapper bookMapper;

    @Autowired
    public H_BookServiceImpl(BookMapper bookMapper) {
        this.bookMapper = bookMapper;
    }

    /**
	 * 查询所有图书种类
	 */
	@Transactional(readOnly=true)
    @Override
	public List<Book> selectBookByBookId() {
		//定义一个新的Example对象
				BookExample bookExample = new BookExample();
				BookExample.Criteria criteria = bookExample.createCriteria();
			criteria.andBIdIsNotNull();
				//得到该用户的结果集，是一个list集合
			List<Book> book = bookMapper.selectByExample(bookExample);
				//如果存在则集合长度不为0
				return book;
	}
	
	
	/**
	 * 添加图书种类
	*/ 
	@Override
	public void addBook(Book book){
		bookMapper.insert(book);
	}
	
	/**
	 * 通过id查询图书
	 */
	@Override
	public Book findBookById(String bId) {
		// TODO Auto-generated method stub
		 return bookMapper.selectByPrimaryKey(bId);
	}

	
	
	
	
	/**
	 * 更新数据库的分类信息
	 */
	@Override
	public void updateBook(Book book){
		bookMapper.updateByPrimaryKeySelective(book);
	}
	/**
	 * 根据id删除分类
	 */
	@Override
	public void deleteBookById(String bId) {
		// TODO Auto-generated method stub
		
		bookMapper.deleteByPrimaryKey(bId);
		
	}
	
}