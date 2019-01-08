package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.*;
import com.hebeu.group.pojo.*;
import com.hebeu.group.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CustomerServicelmpl implements CustomerService {
    /**
     * 自动注入数据层（Dao）
     */
    private CustomerMapper customerMapper;

    @Autowired
    public CustomerServicelmpl(CustomerMapper customerMapper) {
        this.customerMapper = customerMapper;
    }
    /**********************************Customer服务接口实现*************************************/

    /**
     * CustomerServiceImpl接口login方法实现 登陆
     *  @see { CustomerService }
     * */
    @Transactional(readOnly=true)
    @Override
    public Customer login(String loginName, String password){
        // TODO Auto-generated method stub
        //定义一个新的Example对象
        CustomerExample customerExample = new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        //判断用户名密码是否正确
        criteria.andCNameEqualTo(loginName);
        criteria.andCPassEqualTo(password);
        //得到该用户的结果集，是一个list集合
        List<Customer> customers = customerMapper.selectByExample(customerExample);
        if(customers!=null) {
            //如果存在则集合长度不为0
            if (customers.size() != 0) {
                //得到第一条数据就是一个用户
                return customers.get(0);
            }
        }

        //不存在就为空
        return null;
    }

    /**
     *  CustomerServiceImpl接口updateCustomer方法实现 修改顾客信息
     * @return
     */
    @Override
    public Customer updateCustomer(Customer customer){
//        CustomerExample customerExample= new CustomerExample();
//        CustomerExample.Criteria criteria = customerExample.createCriteria();
//        criteria.andCNameEqualTo(customer.getcName());
        customerMapper.updateByPrimaryKeySelective(customer);
        return null;
    }
    @Override
    public Customer selectCustomer(String cName){
        Customer customer=customerMapper.selectByPrimaryKey(cName);
        return customer;
    }


    /**
     * 通过邮箱查询用户信息
     * @param cEmail
     * @return
     */
    @Override
    public Customer selectCustomerByEmail(Customer customer){
        CustomerExample customerExample= new CustomerExample();
        CustomerExample.Criteria criteria = customerExample.createCriteria();
        criteria.andCEmailEqualTo(customer.getcEmail());
        List<Customer> customers=customerMapper.selectByExample(customerExample);
        if(customers!=null) {
            //如果存在则集合长度不为0
            if (customers.size() != 0) {
                //得到第一条数据就是一个用户
                return customers.get(0);
            }
        }
        return null;
    }
    /**
     * CustomerServiceImpl接口register方法实现注册
     * */
    @Override
    public Customer register(Customer customer) {
        customerMapper.insert(customer);
        return null;
    }
/**
 * 查询用户数量
 */
	@Override
	public List<Customer> selectCustomerCount() {
		// TODO Auto-generated method stub
		 CustomerExample customerExample= new CustomerExample();
	     CustomerExample.Criteria criteria = customerExample.createCriteria();
	     criteria.andCNameIsNotNull();
	     List<Customer> customer = customerMapper.selectByExample(customerExample);
		return customer;
	}






}
