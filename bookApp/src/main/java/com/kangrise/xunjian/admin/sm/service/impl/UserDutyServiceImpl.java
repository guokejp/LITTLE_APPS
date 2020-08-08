package com.kangrise.xunjian.admin.sm.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.sm.entity.UserDuty;
import com.kangrise.xunjian.admin.sm.mapper.UserDutyMapper;
import com.kangrise.xunjian.admin.sm.service.IUserDutyService;
import com.kangrise.xunjian.service.BaseServiceImpl;
import com.kangrise.xunjian.utils.BaseUtiles;

@Service
public class UserDutyServiceImpl extends
		BaseServiceImpl<UserDuty, UserDutyMapper> implements IUserDutyService {

	@Autowired
	@Override
	public void setMapper(UserDutyMapper mapper) {
		this.mapper = mapper;
	}

	/**
	 * 用户值班列表
	 * 
	 * @param userDuty
	 *            查询条件
	 * @return
	 */
	@Override
	public List<UserDuty> listUserDuty(UserDuty userDuty) {
		return mapper.listUserDuty(userDuty);
	}

	/**
	 * 添加值班
	 * 
	 * @param userDuty
	 * @return
	 */
	@Override
	public boolean addUserDuty(UserDuty userDuty,HttpServletRequest request) {
		userDuty.setCreateTime(new Date());
		userDuty.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
		return mapper.insertSelective(userDuty) > 0 ? true : false;
	}

	@Override
	public void deleByYearMonthDay(Integer year, Integer month, Integer day) {
		this.mapper.deleByYearMonthDay(year,month,day);
		
	}

	@Override
	public List<Map<String, Object>> listUserDutyResultMap(UserDuty userDuty) {
		return mapper.listUserDutyResultMap(userDuty);
	}

	/**
	 * 分配巡检查询值班管理
	 */
	@Override
	public List<Map<String, Object>> getAllotClass(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getAllotClass(params);
	}

	/**
	 * 查询当日值班人员
	 */
	@Override
	public List<Map<String, Object>> getAllotClassByDate(String query_time) {
		return mapper.getAllotClassByDate(query_time);
	}

	@Override
	public List<UserDuty> getUserDutyByDateAndUser(String thedate, Long userid) {
		
		return this.mapper.getUserDutyByDateAndUser(thedate, userid);
	}

	@Override
	public String getLastTimeBy(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getLastTimeBy(params);
	}

}
