package com.hebeu.group.service.impl;

import com.hebeu.group.mapper.AdminMapper;
import com.hebeu.group.pojo.Admin;
import com.hebeu.group.pojo.AdminExample;
import com.hebeu.group.service.AdminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author 言立慧
 * @date 2018/12/20 15:25
 */
@Service
public class AdminServiceImpl implements AdminService {
   /**
    * 自动注入数据层（Dao）
    */
	private AdminMapper adminMapper;

	
	
	/**********************************管理员服务接口实现*************************************/
	/**
	 * AdminServiceImpl接口login方法实现
	 *  @see { AdminService }
	 * */
	@Transactional(readOnly=true)
    @Override
	public Admin login(String loginname, String password) {
		// TODO Auto-generated method stub
		//定义一个新的Example对象
		AdminExample adminExample = new AdminExample();
		//不知道
		AdminExample.Criteria criteria = adminExample.createCriteria();
		//判断用户名密码是否正确
		criteria.andANameEqualTo(loginname);
		criteria.andAPassEqualTo(password);
		
		//得到该用户的结果集，是一个list集合
		List<Admin> admins = adminMapper.selectByExample(adminExample);
		//如果存在则集合长度不为0
		if (admins.size() != 0) {
			//得到第一条数据就是一个用户
			return admins.get(0);
		}
		//不存在就为空
		return null;
	}
    
    
    @Autowired
    public AdminServiceImpl(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }
/**
 * 通过id查询
 */
    @Override
    public Admin getAdminById(Integer id) {
        AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andAIdEqualTo(id);
        return adminMapper.selectByExample(adminExample).get(0);
    }

/**
 * 修改信息
 */
	@Override
	public void updateAdmin(Admin admin) {
		// TODO Auto-generated method stub
		AdminExample adminExample = new AdminExample();
        AdminExample.Criteria criteria = adminExample.createCriteria();
        criteria.andAIdEqualTo(admin.getaId());
		adminMapper.updateByExampleSelective(admin,adminExample);
	}
}
