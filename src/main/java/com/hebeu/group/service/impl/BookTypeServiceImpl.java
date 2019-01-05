package com.hebeu.group.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hebeu.group.mapper.BookTypeMapper;
import com.hebeu.group.pojo.BookType;
import com.hebeu.group.pojo.BookTypeExample;
import com.hebeu.group.service.BookTypeService;

/**
* @author 作者 王慧
* @version 创建时间：上午10:01:012018年12月27日
* 图书种类接口实现类
*/
@Service
public class BookTypeServiceImpl implements BookTypeService {
	/**
	 * 自动注入Dao层
	 */
	@Autowired
	private BookTypeMapper booktypeMapper;
	
	/**
	 * 查询所有图书种类
	 */
	@Transactional(readOnly=true)
    @Override
	public List<BookType> findAllBookType() {
		//定义一个新的Example对象
				BookTypeExample booktypeExample = new BookTypeExample();
				
				//不知道
				BookTypeExample.Criteria criteria = booktypeExample.createCriteria();
				criteria.andTIdIsNotNull();
				//得到该用户的结果集，是一个list集合
				List<BookType> booktype = booktypeMapper.selectByExample(booktypeExample);
				//如果存在则集合长度不为0
				return booktype;
	}
	
	/**
	 * 添加图书种类
	*/ 
	@Override
	public void addBookType(BookType booktype){
		booktypeMapper.insert(booktype);
	}
	
	/**
	 * 搜索功能通过id和名称查询
	 */
	@Override
	public BookType findBookTypeById(Integer tId) {
		// TODO Auto-generated method stub
		 return booktypeMapper.selectByPrimaryKey(tId);
	}

	/**
	 * 更新数据库的分类信息
	 */
	@Override
	public void updateBookType(BookType booktype){
		booktypeMapper.updateByPrimaryKeySelective(booktype);
	}
	/**
	 * 根据id删除分类
	 */
	@Override
	public void deleteBookTypeById(Integer tId) {
		// TODO Auto-generated method stub
		booktypeMapper.deleteByPrimaryKey(tId);
		
	}

	/**
	 * 通过名称查询图分类
	 */
	@Override
	public List<BookType> selectBookTypeByName(String keyword) {
		// TODO Auto-generated method stub
		BookTypeExample booktypeExample = new BookTypeExample();
		BookTypeExample.Criteria criteria = booktypeExample.createCriteria();
		criteria.andTTypeLike(keyword);
		return booktypeMapper.selectByExample(booktypeExample);
	}
	

}
