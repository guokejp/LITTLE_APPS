package com.kangrise.xunjian.admin.area.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.area.entity.StuInfo;
import com.kangrise.xunjian.admin.area.mapper.StuInfoMapper;
import com.kangrise.xunjian.admin.area.service.IStuInfoService;
import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.exception.LoginaccountExistException;
import com.kangrise.xunjian.admin.sm.mapper.ActionLogMapper;
import com.kangrise.xunjian.service.BaseServiceImpl;
import com.kangrise.xunjian.utils.BaseUtiles;

@Service
public class StuInfoServiceImpl extends
		BaseServiceImpl<StuInfo, StuInfoMapper> implements IStuInfoService {

	@Autowired
	@Override
	public void setMapper(StuInfoMapper mapper) {
		this.mapper = mapper;
	}
	
	@Autowired
	private ActionLogMapper actionLogMapper;

	/**
	 * 用户信息分页列表
	 * 
	 * @param StuInfo
	 *            查询条件
	 * @param page
	 * @param pageSize
	 * @return
	 */
	@Override
	public List<StuInfo> listStuInfo(StuInfo StuInfo) {
		return mapper.listStuInfo(StuInfo);
	}

	/**
	 * 用户信息分页列表
	 * 
	 * @return
	 */
	@Override
	public List<StuInfo> listStuInfo() {
		StuInfo u = new StuInfo();
		//u.setRole(new Role());
		return listStuInfo(u);
		//return listStuInfo(null);
	}

	/**
	 * 添加用户
	 * 
	 * @param StuInfo
	 * @return
	 * @throws LoginaccountExistException
	 *             账号已存在
	 */
	@Override
	public boolean addUser(StuInfo StuInfo,HttpServletRequest request) throws LoginaccountExistException {
		List<StuInfo> records = mapper.getStuInfoByLoginaccount(StuInfo.getStunum());
		if (records.size() > 0) {
			throw new LoginaccountExistException("学号已存在");
		} else {
			StuInfo.setIsdel(0);
			StuInfo.setCreateTime(new Date());
			StuInfo.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
			return mapper.insertSelective(StuInfo) > 0 ? true : false;
		}
	}

	/**
	 * 删除用户(当前采用逻辑删除)
	 * 
	 * @param StuInfo
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
	 * @param StuInfo
	 * @return
	 */
	@Override
	public boolean updateUser(StuInfo StuInfo) {
		
		//StuInfo.setLoginpasswd(BaseUtiles.makeMD5(StuInfo.getLoginpasswd()));
		return mapper.updateByPrimaryKeySelective(StuInfo) > 0 ? true : false;
	}

	@Override
	public StuInfo getStuInfoByName(String name) {
		return mapper.getStuInfoByName(name);
	}

	@Override
	public List<StuInfo> listOtherGroupStuInfos(Long groupid) {
		return mapper.listOtherGroupStuInfos(groupid);
	}

	@Override
	public List<StuInfo> selectByAccAndPwd(StuInfo StuInfo) {
		return this.mapper.listStuInfo(StuInfo);
	}

	@Override
	public List<StuInfo> selectBygroupId(Long gid) {
		return mapper.selectBygroupId(gid);
	}

	/**
	 * 批量查询用户
	 */
	@Override
	public List<StuInfo> selectByPrimaryKeys(List<Long> userIds) {
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

	@Override
	public StuInfo selectByNum(String num) {
		return mapper.selectByNum(num);
	}
	
}
