package com.kangrise.xunjian.admin.sm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kangrise.xunjian.admin.sm.entity.UserApply;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface UserApplyMapper extends BaseMapper<UserApply> {
	/**
	 * 请假申请列表
	 * @param uid
	 * @param fristRow
	 * @param rows
	 * @return
	 */
	List<Map<String, Object>> listUserApplyByUid(@Param("uid") Long uid,
			@Param("fristRow") int fristRow, @Param("rows") int rows);

	/**
	 * 请假申请数量
	 * @param uid
	 * @return
	 */
	Integer countUserApplyByUid(@Param("uid") Long uid);
	
	/**
	 * 获取最后插入的id
	 * @return
	 */
	Long getLastInsertId();
}