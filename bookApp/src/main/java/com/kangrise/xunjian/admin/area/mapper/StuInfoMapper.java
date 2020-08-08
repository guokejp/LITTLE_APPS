package com.kangrise.xunjian.admin.area.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kangrise.xunjian.admin.area.entity.StuInfo;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface StuInfoMapper extends BaseMapper<StuInfo> {
	/**
	 * 分页用户列表 （联结角色表）
	 * 
	 * @param StuInfo
	 *            查询条件
	 * @return
	 */
	List<StuInfo> listStuInfo(@Param("userinfo") StuInfo StuInfo);
	
	/**
	 * 根据用户名查询用户是否存在
	 * @param loginaccount
	 * @return
	 */
	List<StuInfo> getStuInfoByLoginaccount(String loginaccount);
	
	/**
	 * 根据用户姓名模糊查询
	 * @param name
	 * @return
	 */
	StuInfo getStuInfoByName(@Param("name") String name);

	/**
	 * 查询不是本组的所有人员
	 * @param groupid
	 * @return
	 */
	List<StuInfo> listOtherGroupStuInfos(Long groupid);

	/**
	 * 根据组id查询所有人员
	 * @param gid
	 * @return
	 */
	List<StuInfo> selectBygroupId(Long gid);
	
	/**
	 * 根据组id查询所有未逻辑删除人员
	 * @param gid
	 * @return
	 */
	List<StuInfo> selectBygroupIdOrIsdel(Long gid);
	

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
	List<StuInfo> selectByPrimaryKeys(List<Long> userIds);

	/**
	 * 根据分组id批量查询人员
	 * @return
	 */
	List<StuInfo> selectBygroupIds(List<Long> groupids);

	StuInfo selectByNum(@Param("num") String num);
	
}