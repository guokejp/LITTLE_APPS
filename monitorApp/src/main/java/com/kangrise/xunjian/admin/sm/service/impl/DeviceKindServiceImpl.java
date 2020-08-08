package com.kangrise.xunjian.admin.sm.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.admin.equip.mapper.EquipInfoMapper;
import com.kangrise.xunjian.admin.sm.entity.DeviceKind;
import com.kangrise.xunjian.admin.sm.mapper.DeviceKindMapper;
import com.kangrise.xunjian.admin.sm.service.IDeviceKindService;
import com.kangrise.xunjian.service.BaseServiceImpl;
@Service
public class DeviceKindServiceImpl extends BaseServiceImpl<DeviceKind, DeviceKindMapper>
implements IDeviceKindService{

	@Autowired
	private EquipInfoMapper equipInfoMapper;
	
	@Autowired
	@Override
	public void setMapper(DeviceKindMapper mapper) {
		// TODO Auto-generated method stub
		this.mapper = mapper;
	}

	/**
	 * 逻辑删除根据id
	 */
	@Override
	public int deleteLogicByKey(Integer id) {
		List<EquipInfo> equipIList = equipInfoMapper.selectByDeviceKindId(id);
		if(equipIList.size() == 0){
			return mapper.deleteByPrimaryKey(Long.valueOf(id.toString()));
		}else{
			return 0;
		}
		
	}

	@Override
	public List<DeviceKind> selectAll(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.selectAll(params);
	}

}
