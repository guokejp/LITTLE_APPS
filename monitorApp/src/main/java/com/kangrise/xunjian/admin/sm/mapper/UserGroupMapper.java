package com.kangrise.xunjian.admin.sm.mapper;

import java.util.List;

import com.kangrise.xunjian.admin.sm.entity.UserGroup;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface UserGroupMapper extends BaseMapper<UserGroup> {
	/**
	 * 用户分组列表（无分页，不包含管理组）
	 * @param userGroup 如果传入userGroup则按照传入对象的属性进行查询
	 * 		userGroup.name 按名称模糊查询
	 *      userGroup.desc 按备注模糊查询
	 *      roleid 按角色id查询
	 * @return
	 */
	List<UserGroup> listUserGroup(UserGroup userGroup);

	/**
	 * 根据id逻辑删除
	 * @param id
	 */
	void logicDeleteByPrimaryKey(Long id);

	/**
	 * 用户分组列表（无分页）
	 * @param userGroup 如果传入userGroup则按照传入对象的属性进行查询
	 * 		userGroup.name 按名称模糊查询
	 *      userGroup.desc 按备注模糊查询
	 *      roleid 按角色id查询
	 * @return
	 */
	List<UserGroup> listAllUserGroup(Object object);

	int getCountGroup();//获取有几个组
	
}