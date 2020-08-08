package com.kangrise.xunjian.admin.area.service;

import java.util.List;
import java.util.Map;

import com.kangrise.xunjian.admin.area.entity.Area;
import com.kangrise.xunjian.service.IBaseService;

public interface IAreaService extends IBaseService<Area>
{
	public List<Area> selectAll();//查询所有区域
	
	List<Area> selectByName(String name);//根据区域名字查询区域
	
	List<Map<String,Object>> getDeviceByArea(Map<String,Object> param);//根据区域id查询设备信息
	public List<Map<String, Object>> getDeviceCountByArea(Map<String, Object> getParam);//根据区域查询总页数
	
	List<Map<String,Object>> getRootName();//查询设备所有根节点

	public List<Map<String, Object>> getDeviceByRootOrName(Map<String, Object> params);//根据所属设备和设备名称查询设备信息

}
