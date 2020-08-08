package com.kangrise.xunjian.admin.area.mapper;

import java.util.List;
import java.util.Map;

import com.kangrise.xunjian.admin.area.entity.Area;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface AreaMapper extends BaseMapper<Area> {

	List<Area> selectAll();// 查询所有区域

	List<Area> selectByName(String name);// 根据区域名字查询区域

	List<Map<String, Object>> getDeviceByArea(Map<String, Object> params);// 根据区域id查询设备信息

	List<Map<String, Object>> getDeviceCountByArea(Map<String, Object> params);// 根据区域查询总页数

	List<Map<String, Object>> getRootName();// 查询设备所有根节点

	List<Map<String, Object>> getDeviceByRootOrName(Map<String, Object> params);// 根据所属设备和设备名称查询设备信息

}
