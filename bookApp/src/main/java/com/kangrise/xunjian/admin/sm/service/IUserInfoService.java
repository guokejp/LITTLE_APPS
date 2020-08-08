package com.kangrise.xunjian.admin.sm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.admin.sm.exception.LoginaccountExistException;
import com.kangrise.xunjian.service.IBaseService;

public interface IUserInfoService extends IBaseService<Userinfo> {
	/**
	 * 用户信息分页列表
	 * 
	 * @param userinfo 查询条件
	 * @return
	 */
	public List<Userinfo> listUserinfo(Userinfo userinfo);
	
	/**
	 * 用户信息分页列表
	 * @return
	 */
	public List<Userinfo> listUserinfo();
	
	/**
	 * 添加用户
	 * @param userinfo
	 * @return
	 * @throws LoginaccountExistException 账号已存在
	 */
	public boolean addUser(Userinfo userinfo,HttpServletRequest request) throws LoginaccountExistException;
	
	/**
	 * 删除用户
	 * @param userinfo
	 * @return
	 */
	public boolean deleteUser(Long id);
	
	/**
	 * 更新用户
	 * @param userinfo
	 * @return
	 */
	public boolean updateUser(Userinfo userinfo);
	
	/**
	 * 根据用户姓名查找用户
	 * @param name
	 * @return
	 */
	public Userinfo getUserinfoByName(String name);

	/**
	 * 查询不是本组的所有人员
	 * @param groupid
	 * @return
	 */
	public List<Userinfo> listOtherGroupUserinfos(Long groupid);

	/**
	 * 登录
	 * @param userinfo
	 * @return
	 */
	public List<Userinfo> selectByAccAndPwd(Userinfo userinfo);

	/**
	 * 根据组id查询所有人员
	 * @param id 
	 * @return
	 */
	public List<Userinfo> selectBygroupId(Long id);

	/**
	 * 批量查询用户
	 * @param userIds
	 * @return
	 */
	public List<Userinfo> selectByPrimaryKeys(List<Long> userIds);

	public List<ActionLog> getActionLogPageBy(Map<String, Object> params);

	public long getActionLogCount(Map<String, Object> params);
}