package com.hebeu.group.service;

import com.hebeu.group.pojo.Customer;

import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * @author 田梓钊
 * @date 2018/12/27
 */
public interface CustomerService {

    /**
     * 用户登录方法
     * @param loginName
     * @param password
     */
    Customer login(String loginName,String password);

    /**
     * 用户注册方法
     *
     */
    Customer register(Customer customer);

    /**
     * 用户信息修改
     */
    Customer updateCustomer(Customer customer);

    /**
     * 查询根据姓名查询用户
     * @param cName
     * @return
     */
    Customer selectCustomer(String cName);

    Customer selectCustomerByEmail(Customer customer);

	List<Customer> selectCustomerCount();

}

