package com.kangrise.xunjian.admin.sm.mapper;

import java.util.List;
import java.util.Map;

import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface ActionLogMapper extends BaseMapper<ActionLog>{

	List<ActionLog> getActionLogPageBy(Map<String, Object> params);

	long getActionLogCount(Map<String, Object> params);
	
}
