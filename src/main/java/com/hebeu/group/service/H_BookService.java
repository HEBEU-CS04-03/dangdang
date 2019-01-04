package com.hebeu.group.service;

import java.util.List;

import com.hebeu.group.pojo.Book;


/**
* @author 作者 王慧
* @version 创建时间：上午9:57:242019年1月2日
* 类说明
*/
public interface H_BookService {
/**
 * 查询全部
 * @return
 */
	List<Book> selectBookByBookId();
	/**
	 * 添加
	 * @param book
	 */
	void addBook(Book book);
	/**
	 * 更新
	 * @param book
	 */
	void updateBook(Book book);
	/**
	 * 通过id条件查询
	 * @param tId
	 * @return
	 */
	Book findBookById(String bId);

	/**
	 * 通过id删除图书
	 * @param bId
	 */
	void deleteBookById(String bId);
}
