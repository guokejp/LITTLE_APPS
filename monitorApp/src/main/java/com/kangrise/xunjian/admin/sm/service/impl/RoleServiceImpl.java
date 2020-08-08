package com.kangrise.xunjian.admin.sm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.sm.entity.Role;
import com.kangrise.xunjian.admin.sm.mapper.RoleMapper;
import com.kangrise.xunjian.admin.sm.service.IRoleService;
import com.kangrise.xunjian.service.BaseServiceImpl;

@Service
public class RoleServiceImpl extends BaseServiceImpl<Role, RoleMapper>
		implements IRoleService {

	@Autowired
	@Override
	public void setMapper(RoleMapper mapper) {
		this.mapper = mapper;
	}

	/**
	 * 列出所有角色
	 * @return
	 */
	@Override
	public List<Role> listRole() {
		return mapper.listRole();
	}
}
