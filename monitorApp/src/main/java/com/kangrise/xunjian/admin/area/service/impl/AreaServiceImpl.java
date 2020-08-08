package com.kangrise.xunjian.admin.area.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kangrise.xunjian.admin.area.entity.Area;
import com.kangrise.xunjian.admin.area.mapper.AreaMapper;
import com.kangrise.xunjian.admin.area.service.IAreaService;
import com.kangrise.xunjian.admin.equip.mapper.EquipInfoMapper;
import com.kangrise.xunjian.service.BaseServiceImpl;

@Service
@Transactional
public class AreaServiceImpl extends BaseServiceImpl<Area, AreaMapper> implements IAreaService{

	@Autowired
	@Override
	public void setMapper(AreaMapper mapper) {
		this.mapper = mapper;
	}
	
	@Autowired
	private EquipInfoMapper equipInfoMapper;
	/**
	 * 删除设备区域--重写
	 */
	public int deleteByPrimaryKey(Long id)
	{
		int total = mapper.deleteByPrimaryKey(id);
		Map<String,Object> param = new HashMap<String, Object>();
		//将设备中有这个区域的设置为1
		param.put("areaId",1);
		param.put("id", id);
		equipInfoMapper.updateByPrimaryArea(param);
		
		return total;
	}
	/**
	 * 查询所有区域
	 */
	@Override
	public List<Area> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	/**
	 * 根据区域名称查询区域
	 */
	@Override
	public List<Area> selectByName(String name) {
		// TODO Auto-generated method stub
		return mapper.selectByName(name);
	}

	/**
	 * 通过设备区域id查询设备
	 */
	@Override
	public List<Map<String, Object>> getDeviceByArea(Map<String,Object> params) {
		// TODO Auto-generated method stub
		return mapper.getDeviceByArea(params);
	}
	/**
	 * 根据区域查询总页数
	 */
	@Override
	public List<Map<String, Object>> getDeviceCountByArea(
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getDeviceCountByArea(params);
	}
	
	/**
	 * 查询所有设备根节点
	 */
	@Override
	public List<Map<String, Object>> getRootName() {
		// TODO Auto-generated method stub
		return mapper.getRootName();
	}

	/**
	 * 根据所属设备和设备名称查询设备信息
	 */
	@Override
	public List<Map<String, Object>> getDeviceByRootOrName(
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getDeviceByRootOrName(params);
	}
}
