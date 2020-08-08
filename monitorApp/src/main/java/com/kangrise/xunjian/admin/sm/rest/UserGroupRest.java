package com.kangrise.xunjian.admin.sm.rest;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kangrise.xunjian.admin.sm.entity.UserGroup;
import com.kangrise.xunjian.admin.sm.service.IUserGroupService;

@Controller
@RequestMapping("sm/group")
public class UserGroupRest {
	@Autowired
	private IUserGroupService userGroupService;

	/**
	 * 用户分组列表 （无分页）
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("listGroup")
	public void listGroup(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		List<UserGroup> userGroups = userGroupService.listAllUserGroup();
		request.setAttribute("userGroups", userGroups);
		request.getRequestDispatcher(
				"/loginAndout/toPage?path=admin/sm/listGroup").forward(request,
				response);
	}
	
	/**
	 * 用户分组列表json
	 * @return
	 */
	@RequestMapping("listGroupJson")
	@ResponseBody
	public List<UserGroup> listGroup() {
		return userGroupService.listUserGroup();
	}
	
	@RequestMapping("listAllGroupJson")
	@ResponseBody
	public List<UserGroup> listAllGroup() {
		return userGroupService.listAllUserGroup();
	}

	/**
	 * 查询用户分组
	 * @param request
	 * @param response
	 * @param name
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("searchGroup")
	public void searchGroup(HttpServletRequest request,
			HttpServletResponse response, @RequestParam String name)
			throws ServletException, IOException {
		List<UserGroup> userGroups = userGroupService.listUserGroupByName(name);
		request.setAttribute("userGroups", userGroups);
		request.getRequestDispatcher(
				"/loginAndout/toPage?path=admin/sm/listGroup").forward(
				request, response);
	}
	
	/**
	 * 添加用户分组
	 * @param userGroup
	 * @return {status:true,memo:"错误信息"}
	 */
	@RequestMapping("addGroup")
	@ResponseBody
	public Map<String, Object> addGroup(HttpServletRequest request,UserGroup userGroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userGroupService.addUserGroup(userGroup,request)) {
			map.put("status", true);
		} else {
			map.put("status", false);
			map.put("memo", "抱歉，出现了一个意料之外的技术错误，请稍后重试");
		}
		return map;
	}
	
	/**
	 * 删除用户分组
	 * @param id
	 * @return {status:true,memo:"错误信息"}
	 */
	@RequestMapping("deleteGroup/{id}")
	@ResponseBody
	public Map<String, Object> deleteGroup(@PathVariable long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer retStatus = userGroupService.deleteUserGroup(id);
		if (retStatus == 1) {
			map.put("status", true);
			map.put("Msg", "删除成功");
		} else {
			map.put("status", false);
			map.put("Msg", "本组存在用户,删除拒绝!");
		}
		return map;
	}
	
	/**
	 * 更新用户分组
	 * @param userGroup
	 * @return {status:true,memo:"错误信息"}
	 */
	@RequestMapping("updateGroup")
	@ResponseBody
	public Map<String, Object> updateGroup(UserGroup userGroup) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (userGroupService.updataUserGroup(userGroup)) {
			map.put("status", true);
		} else {
			map.put("status", false);
			map.put("memo", "抱歉，出现了一个意料之外的技术错误，请稍后重试");
		}
		return map;
	}
	
	/**
	 * 获取用户信息
	 * @param id
	 * @return {id:"1",name:"xxx",roleid:"xxx",desc:"xxx"}
	 */
	@RequestMapping("getGroup/{id}")
	@ResponseBody
	public UserGroup getGroup(@PathVariable long id) {
		return userGroupService.getUserGroup(id);
	}
	
}
