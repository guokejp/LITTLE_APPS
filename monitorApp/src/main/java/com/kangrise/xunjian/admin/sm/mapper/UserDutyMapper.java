package com.kangrise.xunjian.admin.sm.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kangrise.xunjian.admin.sm.entity.UserDuty;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface UserDutyMapper extends BaseMapper<UserDuty>{
	/**
	 * 列出用户值班列表
	 * @param userDuty 查询条件
	 * @return
	 */
	List<UserDuty> listUserDuty(UserDuty userDuty);

	/**
	 * 根据日期删除
	 * @param year
	 * @param month
	 * @param day
	 */
	void deleByYearMonthDay(@Param("year")Integer year, @Param("month")Integer month, @Param("day")Integer day);

	/**
	 * 
	 * @param userDuty
	 * @return
	 */
	List<Map<String, Object>> listUserDutyResultMap(UserDuty userDuty);
	
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
	List<Map<String, Object>> getAllotClassByDate(@Param("query_time") String query_time);
	
	/**
	 * 获取用户自己的值班列表
	 * @param params
	 * @return
	 */
	List<UserDuty> listUserDutyByUser(Map<String, Object> params);
	
	/**
	 * 查询当天值班人员
	 * @param date
	 * @return
	 */
	List<Map<String, Object>> selectOtherWorker(@Param("date") Date date);

	/**
	 * 根据时间和人员获得排班
	 * @param thedate
	 * @param userid
	 */
	List<UserDuty> getUserDutyByDateAndUser(@Param("thedate") String thedate,@Param("userid")Long userid);
	
	/**
	 * 请假申请查询 那些天有该用户--开始，结束时间，用户
	 * @param params
	 * @return
	 */
	List<UserDuty> getDutyByDateAndUser(Map<String,Object> params);
	/**
	 * 查询当日值班人员(携带相同标签,排除自己)
	 * @param long1 
	 * @param query_time
	 * @return
	 */
	List<Map<String, Object>> getSameTageOfAllotClassByDate(@Param("uid") Long uid, @Param("query_time") String query_time);

	/**
	 * 查询用户上一次值班时间
	 * @param params
	 * @return
	 */
	String getLastTimeBy(Map<String,Object> params);
}