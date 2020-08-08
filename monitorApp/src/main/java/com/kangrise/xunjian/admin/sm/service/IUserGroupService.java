package com.kangrise.xunjian.admin.sm.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kangrise.xunjian.admin.sm.entity.UserGroup;
import com.kangrise.xunjian.service.IBaseService;

public interface IUserGroupService extends IBaseService<UserGroup> {
	/**
	 * 分组列表,不含管理组
	 * @return
	 */
	public List<UserGroup> listUserGroup();
	
	/**
	 * 根据分组名称查询分组列表
	 * @param name
	 * @return
	 */
	public List<UserGroup> listUserGroupByName(String name);
	
	/**
	 * 添加用户分组
	 * @param userGroup
	 * @return
	 */
	public boolean addUserGroup(UserGroup userGroup,HttpServletRequest request);
	
	/**
	 * 删除用户分组
	 * @param id
	 * @return
	 * 1:删除成功
	 * 0：存在用户
	 */
	public Integer deleteUserGroup(Long id);
	
	/**
	 * 更新用户分组
	 * @param userGroup
	 * @return
	 */
	public boolean updataUserGroup(UserGroup userGroup);
	
	/**
	 * 获取用户分组
	 * @param id
	 * @return
	 */
	public UserGroup getUserGroup(Long id);

	/**
	 * 列出所有分组
	 * @return
	 */
	public List<UserGroup> listAllUserGroup();
	
}
