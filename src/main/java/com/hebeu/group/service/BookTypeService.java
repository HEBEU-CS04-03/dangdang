package com.hebeu.group.service;

import java.util.List;

import com.hebeu.group.pojo.BookType;

/**
* @author 作者 王慧
* @version 创建时间：上午9:59:402018年12月27日
* 图书种类接口
*/
public interface BookTypeService {
	/**
	 * 查询所有图书种类
	 */
	List<BookType> findAllBookType();

	void addBookType(BookType booktype);


	BookType findBookTypeById(Integer tId);

	void updateBookType(BookType booktype);

	void deleteBookTypeById(Integer tId);

	List<BookType> selectBookTypeByName(String keyword);
}
