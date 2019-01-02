package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.AdminMapper;
import com.hebeu.group.pojo.Admin;
import com.hebeu.group.pojo.AdminExample;
import com.hebeu.group.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author 言立慧
 * @date 2018/12/20 15:25
 */
@Service
public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper;

    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public Admin getAdminById(Integer id) {
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andAIdEqualTo(id);
        return adminMapper.selectByExample(adminExample).get(0);
    }
}
