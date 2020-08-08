package com.kangrise.xunjian.admin.sm.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.mapper.ActionLogMapper;
import com.kangrise.xunjian.admin.sm.service.IActionLogService;
import com.kangrise.xunjian.service.BaseServiceImpl;

@Service
public class ActionLotServiceImpl extends BaseServiceImpl<ActionLog, ActionLogMapper> implements IActionLogService {

	@Autowired
	@Override
	public void setMapper(ActionLogMapper mapper) {
		this.mapper = mapper;
	}

}
