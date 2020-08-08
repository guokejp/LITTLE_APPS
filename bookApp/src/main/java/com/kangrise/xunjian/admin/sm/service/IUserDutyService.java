package com.kangrise.xunjian.admin.sm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kangrise.xunjian.admin.sm.entity.UserDuty;
import com.kangrise.xunjian.service.IBaseService;

public interface IUserDutyService extends IBaseService<UserDuty> {
	/**
	 * 用户值班列表
	 * @param userDuty
	 * @return
	 */
	public List<UserDuty> listUserDuty(UserDuty userDuty);
	
	/**
	 * 添加值班
	 * @param userDuty
	 * @return
	 */
	public boolean addUserDuty(UserDuty userDuty,HttpServletRequest request);

	/**
	 * 根据日期删除
	 * @param year
	 * @param month
	 * @param day
	 */
	public void deleByYearMonthDay(Integer year, Integer month, Integer day);

	public List<Map<String, Object>> listUserDutyResultMap(UserDuty userDuty);
	
	/**
	 * 分配巡检查询值班管理
	 * @param params
	 * @return
	 */
	List<Map<String,Object>> getAllotClass(Map<String,Object> params);
	
	/**
	 * 查询当日值班人员
	 * @param query_time
	 * @return
	 */
	List<Map<String, Object>> getAllotClassByDate(String query_time);

	
	/**
	 * 根据时间和人员获得排班
	 * @param thedate
	 * @param userid
	 */
	public List<UserDuty> getUserDutyByDateAndUser(String thedate, Long userid);

	/**
	 * 查询用户上一次值班时间
	 * @param params
	 * @return
	 */
	String getLastTimeBy(Map<String,Object> params);
}
