package com.kangrise.xunjian.admin.sm.service;

import java.util.List;
import java.util.Map;

import com.kangrise.xunjian.admin.sm.entity.DeviceKind;
import com.kangrise.xunjian.service.IBaseService;

public interface IDeviceKindService extends IBaseService<DeviceKind>{
	
	/**
	 * 根据id删除，查找设备表，有设备逻辑删除，没有设备直接删除
	 * @param id
	 * @return
	 */
	public int deleteLogicByKey(Integer id);

	public List<DeviceKind> selectAll(Map<String, Object> params);//查询所有设备种类
}
