package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.*;
import com.hebeu.group.pojo.*;
import com.hebeu.group.service.AdminService;
import com.hebeu.group.util.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/20 15:25
 */
@Service
public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper;
    private OrdersMapper ordersMapper;
    private OrderRecordMapper orderRecordMapper;
    private BookMapper bookMapper;
    private BookTypeMapper bookTypeMapper;
    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper,OrdersMapper ordersMapper, OrderRecordMapper orderRecordMapper, BookMapper bookMapper, BookTypeMapper bookTypeMapper) {
        this.adminMapper = adminMapper;
        this.ordersMapper = ordersMapper;
        this.orderRecordMapper = orderRecordMapper;
        this.bookMapper = bookMapper;
        this.bookTypeMapper = bookTypeMapper;
    }

    @Override
    public Admin login(String username, String passwrod) {
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andANameEqualTo(username);
        criteria.andAPassEqualTo(passwrod);
        return adminMapper.selectByExample(adminExample).get(0);
    }

    @Override
    public Admin getAdminById(Integer id) {
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andAIdEqualTo(id);
        return adminMapper.selectByExample(adminExample).get(0);
    }

}
