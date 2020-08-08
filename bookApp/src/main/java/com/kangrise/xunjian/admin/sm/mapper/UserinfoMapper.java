package com.kangrise.xunjian.admin.sm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface UserinfoMapper extends BaseMapper<Userinfo> {
	/**
	 * 分页用户列表 （联结角色表）
	 * 
	 * @param userinfo
	 *            查询条件
	 * @return
	 */
	List<Userinfo> listUserinfo(@Param("userinfo") Userinfo userinfo);
	
	/**
	 * 根据用户名查询用户是否存在
	 * @param loginaccount
	 * @return
	 */
	List<Userinfo> getUserinfoByLoginaccount(String loginaccount);
	
	/**
	 * 根据用户姓名模糊查询
	 * @param name
	 * @return
	 */
	Userinfo getUserinfoByName(@Param("name") String name);

	/**
	 * 查询不是本组的所有人员
	 * @param groupid
	 * @return
	 */
	List<Userinfo> listOtherGroupUserinfos(Long groupid);

	/**
	 * 根据组id查询所有人员
	 * @param gid
	 * @return
	 */
	List<Userinfo> selectBygroupId(Long gid);
	
	/**
	 * 根据组id查询所有未逻辑删除人员
	 * @param gid
	 * @return
	 */
	List<Userinfo> selectBygroupIdOrIsdel(Long gid);
	

	/**
	 * 根据id逻辑删除用户
	 * @param id
	 * @return
	 */
	int logicDeleteByPrimaryKey(Long id);

	/**
	 * 批量查询用户
	 * @param userIds
	 * @return
	 */
	List<Userinfo> selectByPrimaryKeys(List<Long> userIds);

	/**
	 * 根据分组id批量查询人员
	 * @return
	 */
	List<Userinfo> selectBygroupIds(List<Long> groupids);
	
}