package com.kangrise.xunjian.admin.sm.mapper;

import java.util.List;

import com.kangrise.xunjian.admin.sm.entity.Role;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface RoleMapper extends BaseMapper<Role>{
	/**
	 * 列出所有角色
	 * @return
	 */
	List<Role> listRole();
	
}