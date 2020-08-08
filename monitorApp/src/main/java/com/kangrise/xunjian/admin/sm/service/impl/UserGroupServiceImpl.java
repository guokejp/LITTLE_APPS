package com.kangrise.xunjian.admin.sm.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.sm.entity.UserGroup;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.admin.sm.mapper.UserGroupMapper;
import com.kangrise.xunjian.admin.sm.service.IUserGroupService;
import com.kangrise.xunjian.admin.sm.service.IUserInfoService;
import com.kangrise.xunjian.service.BaseServiceImpl;
import com.kangrise.xunjian.utils.BaseUtiles;

@Service
public class UserGroupServiceImpl extends
		BaseServiceImpl<UserGroup, UserGroupMapper> implements
		IUserGroupService {

	@Autowired
	private IUserInfoService userInfoService;
	
	
	@Autowired
	@Override
	public void setMapper(UserGroupMapper mapper) {
		this.mapper = mapper;
	}

	/**
	 * 分组列表
	 * 
	 * @return
	 */
	@Override
	public List<UserGroup> listUserGroup() {
		return mapper.listUserGroup(null);
	}

	/**
	 * 根据分组名称查询分组列表
	 * 
	 * @param name
	 * @return
	 */
	@Override
	public List<UserGroup> listUserGroupByName(String name) {
		UserGroup userGroup = new UserGroup();
		userGroup.setName(name);
		return mapper.listUserGroup(userGroup);
	}

	/**
	 * 添加用户分组
	 * @param userGroup
	 * @return
	 */
	@Override
	public boolean addUserGroup(UserGroup userGroup,HttpServletRequest request) {
		userGroup.setIsdel(0);
		userGroup.setCreateTime(new Date());
		userGroup.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
		return mapper.insertSelective(userGroup) > 0 ? true : false;
	}

	/**
	 * 删除用户分组
	 * @param id
	 * @return
	 * 1:删除成功
	 * 0：存在用户
	 */
	@Override
	public Integer deleteUserGroup(Long id) {
		/**
		 * 查用户，
		 * 1：存在线上用户的不准删除，
		 * 2：不存在线上用户，存在已删除用户的的逻辑删
		 * 3：什么都没有的直接删      
		 */
		Integer unDelUser = 0;
		List<Userinfo> selectList = userInfoService.selectBygroupId(id);
		if(selectList.size() == 0){
			mapper.deleteByPrimaryKey(id);
			return 1;
		}else{
			for (Userinfo userinfo : selectList) {
				if(userinfo.getIsdel() == 0){
					unDelUser++ ;
				}
			}
			if(unDelUser > 0){
				return 0;
			}else{
				mapper.logicDeleteByPrimaryKey(id);
				return 1;
			}
			
			
		}
		
		
	}

	/**
	 * 更新用户分组
	 * @param userGroup
	 * @return
	 */
	@Override
	public boolean updataUserGroup(UserGroup userGroup) {
		return mapper.updateByPrimaryKeySelective(userGroup) > 0 ? true : false;
	}

	@Override
	public UserGroup getUserGroup(Long id) {
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public List<UserGroup> listAllUserGroup() {
		return mapper.listAllUserGroup(null);
	}
}
