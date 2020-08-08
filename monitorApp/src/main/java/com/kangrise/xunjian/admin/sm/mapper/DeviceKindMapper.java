package com.kangrise.xunjian.admin.sm.mapper;

import java.util.List;
import java.util.Map;

import com.kangrise.xunjian.admin.sm.entity.DeviceKind;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface DeviceKindMapper extends BaseMapper<DeviceKind>{
	
	public int deleteLogicByKey(Long id);//逻辑删除根据id
	
	public List<DeviceKind> selectAll(Map<String, Object> params);//查询所有设备种类
}
