package com.kangrise.xunjian.admin.sm.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.entity.Role;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.admin.sm.exception.LoginaccountExistException;
import com.kangrise.xunjian.admin.sm.mapper.ActionLogMapper;
import com.kangrise.xunjian.admin.sm.mapper.UserinfoMapper;
import com.kangrise.xunjian.admin.sm.service.IUserInfoService;
import com.kangrise.xunjian.service.BaseServiceImpl;
import com.kangrise.xunjian.utils.BaseUtiles;

@Service
public class UserInfoServiceImpl extends
		BaseServiceImpl<Userinfo, UserinfoMapper> implements IUserInfoService {

	@Autowired
	@Override
	public void setMapper(UserinfoMapper mapper) {
		this.mapper = mapper;
	}
	
	@Autowired
	private ActionLogMapper actionLogMapper;

	/**
	 * 用户信息分页列表
	 * 
	 * @param userinfo
	 *            查询条件
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@Override
	public List<Userinfo> listUserinfo(Userinfo userinfo) {
		return mapper.listUserinfo(userinfo);
	}

	/**
	 * 用户信息分页列表
	 * 
	 * @return
	 */
	@Override
	public List<Userinfo> listUserinfo() {
		Userinfo u = new Userinfo();
		u.setRole(new Role());
		return listUserinfo(u);
		//return listUserinfo(null);
	}

	/**
	 * 添加用户
	 * 
	 * @param userinfo
	 * @return
	 * @throws LoginaccountExistException
	 *             账号已存在
	 */
	@Override
	public boolean addUser(Userinfo userinfo,HttpServletRequest request) throws LoginaccountExistException {
		List<Userinfo> records = mapper.getUserinfoByLoginaccount(userinfo
				.getLoginaccount());
		if (records.size() > 0) {
			throw new LoginaccountExistException("账号已存在");
		} else {
			userinfo.setIsdel(0);
			userinfo.setCreateTime(new Date());
			userinfo.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
			userinfo.setLoginpasswd(BaseUtiles.makeMD5(userinfo.getLoginpasswd()));
			return mapper.insertSelective(userinfo) > 0 ? true : false;
		}
	}

	/**
	 * 删除用户(当前采用逻辑删除)
	 * 
	 * @param userinfo
	 * @return
	 */
	@Override
	public boolean deleteUser(Long id) {
		return mapper.logicDeleteByPrimaryKey(id) > 0 ? true : false;
		//return mapper.deleteByPrimaryKey(id) > 0 ? true : false;
	}

	/**
	 * 更新用户
	 * 
	 * @param userinfo
	 * @return
	 */
	@Override
	public boolean updateUser(Userinfo userinfo) {
		
		userinfo.setLoginpasswd(BaseUtiles.makeMD5(userinfo.getLoginpasswd()));
		return mapper.updateByPrimaryKeySelective(userinfo) > 0 ? true : false;
	}

	@Override
	public Userinfo getUserinfoByName(String name) {
		return mapper.getUserinfoByName(name);
	}

	@Override
	public List<Userinfo> listOtherGroupUserinfos(Long groupid) {
		return mapper.listOtherGroupUserinfos(groupid);
	}

	@Override
	public List<Userinfo> selectByAccAndPwd(Userinfo userinfo) {
		return this.mapper.listUserinfo(userinfo);
	}

	@Override
	public List<Userinfo> selectBygroupId(Long gid) {
		return mapper.selectBygroupId(gid);
	}

	/**
	 * 批量查询用户
	 */
	@Override
	public List<Userinfo> selectByPrimaryKeys(List<Long> userIds) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKeys(userIds);
	}
	
	@Override
	public List<ActionLog> getActionLogPageBy(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return actionLogMapper.getActionLogPageBy(params);
	}

	@Override
	public long getActionLogCount(Map<String, Object> params) {
		return actionLogMapper.getActionLogCount(params);
	}
	
}
