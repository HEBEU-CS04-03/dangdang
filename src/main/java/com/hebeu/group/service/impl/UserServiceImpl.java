package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.AdminMapper;
import com.hebeu.group.mapper.OrderRecordMapper;
import com.hebeu.group.pojo.Admin;
import com.hebeu.group.pojo.AdminExample;
import com.hebeu.group.pojo.OrderRecord;
import com.hebeu.group.pojo.OrderRecordExample;
import com.hebeu.group.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author 言立慧
 * @date 2018/12/24 10:48
 */

public class UserServiceImpl implements UserService {
    private AdminMapper adminMapper;
    private OrderRecordMapper orderRecordMapper;

    @Autowired
    public UserServiceImpl(AdminMapper adminMapper, OrderRecordMapper orderRecordMapper) {
        this.adminMapper = adminMapper;
        this.orderRecordMapper = orderRecordMapper;
    }

    @Override
    public void login(String name, String password) {
        OrderRecordExample orderRecordExample = new OrderRecordExample();
        OrderRecordExample.Criteria criteria = orderRecordExample.createCriteria();
        criteria.andBNumberBetween(4,7);
        OrderRecord orderRecord = new OrderRecord();
        orderRecord.setbNumber(8);


        orderRecordMapper.updateByExampleSelective(orderRecord,orderRecordExample);

    }
}
