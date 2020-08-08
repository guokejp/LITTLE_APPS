package com.kangrise.xunjian.admin.sm.service;

import java.util.List;

import com.kangrise.xunjian.admin.sm.entity.Role;
import com.kangrise.xunjian.service.IBaseService;

public interface IRoleService extends IBaseService<Role> {
	
	/**
	 * 列出所有角色
	 * @return
	 */
	public List<Role> listRole();
	
}
