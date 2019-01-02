package com.hebeu.group.service;

import com.hebeu.group.pojo.*;

import java.util.Date;
import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/20 15:24
 */

public interface AdminService {
	/**
	 * 用户登录
	 * @param  loginname
	 * @param  password
	 * @return User对象
	 * */
	Admin login(String username, String passwrod);
	
	/**
     * 通过id查询管理员
     * @param id
     * @return
     */
    Admin getAdminById(Integer id);
    /**
     * 获得所有的订单项
     */
    List<Orders> findOrdersByorderTime(Date orderTime);

    List<Book> findBookBybId(String bId);

    List<BookType> findBookType(Integer tId);

    List<OrderRecord> findOrderRecordByOrderId(String OrderId);
}
