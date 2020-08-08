package com.kangrise.xunjian.admin.area.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kangrise.xunjian.admin.area.entity.StuInfo;
import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.exception.LoginaccountExistException;
import com.kangrise.xunjian.service.IBaseService;

public interface IStuInfoService extends IBaseService<StuInfo> {
	/**
	 * 用户信息分页列表
	 * 
	 * @param StuInfo 查询条件
	 * @return
	 */
	public List<StuInfo> listStuInfo(StuInfo StuInfo);
	
	/**
	 * 用户信息分页列表
	 * @return
	 */
	public List<StuInfo> listStuInfo();
	
	/**
	 * 添加用户
	 * @param StuInfo
	 * @return
	 * @throws LoginaccountExistException 账号已存在
	 */
	public boolean addUser(StuInfo StuInfo,HttpServletRequest request) throws LoginaccountExistException;
	
	/**
	 * 删除用户
	 * @param StuInfo
	 * @return
	 */
	public boolean deleteUser(Long id);
	
	/**
	 * 更新用户
	 * @param StuInfo
	 * @return
	 */
	public boolean updateUser(StuInfo StuInfo);
	
	/**
	 * 根据用户姓名查找用户
	 * @param name
	 * @return
	 */
	public StuInfo getStuInfoByName(String name);

	/**
	 * 查询不是本组的所有人员
	 * @param groupid
	 * @return
	 */
	public List<StuInfo> listOtherGroupStuInfos(Long groupid);

	/**
	 * 登录
	 * @param StuInfo
	 * @return
	 */
	public List<StuInfo> selectByAccAndPwd(StuInfo StuInfo);

	/**
	 * 根据组id查询所有人员
	 * @param id 
	 * @return
	 */
	public List<StuInfo> selectBygroupId(Long id);

	/**
	 * 批量查询用户
	 * @param userIds
	 * @return
	 */
	public List<StuInfo> selectByPrimaryKeys(List<Long> userIds);

	public List<ActionLog> getActionLogPageBy(Map<String, Object> params);

	public long getActionLogCount(Map<String, Object> params);

	public StuInfo selectByNum(String num);
}