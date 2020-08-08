package com.kangrise.xunjian.admin.sm.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kangrise.xunjian.admin.sm.entity.Role;
import com.kangrise.xunjian.admin.sm.service.IRoleService;

@Controller
@RequestMapping("sm/role")
public class RoleRest {
	
	@Autowired
	private IRoleService roleService;
	
	/**
	 * 列出所有角色
	 * @return [{"id":"1","rolename":"xxx"},{...}]
	 */
	@RequestMapping("listRole")
	@ResponseBody
	public List<Role> listRole() {
		return roleService.listRole();
	}
	
}
