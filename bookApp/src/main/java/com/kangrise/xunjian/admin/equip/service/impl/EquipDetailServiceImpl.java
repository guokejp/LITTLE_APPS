package com.kangrise.xunjian.admin.equip.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.kangrise.xunjian.admin.equip.entity.EquipDetail;
import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.admin.equip.mapper.EquipDetailMapper;
import com.kangrise.xunjian.admin.equip.mapper.EquipInfoMapper;
import com.kangrise.xunjian.admin.equip.service.IEquipDetailService;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.service.BaseServiceImpl;
import com.kangrise.xunjian.utils.BaseUtiles;
@Service
@Transactional
public class EquipDetailServiceImpl extends BaseServiceImpl<EquipDetail, EquipDetailMapper> implements IEquipDetailService{

	@Autowired
	@Override
	public void setMapper(EquipDetailMapper mapper) {
		this.mapper = mapper;
		
	}
	
	@Autowired
	private EquipInfoMapper equipInfoMapper;
	/**
	 * 根据父类设备id查询所有子类设备
	 */
	@Override
	public List<EquipDetail> selectAllByInfoid(Long infoid) {
		// TODO Auto-generated method stub
		return mapper.selectAllByInfoid(infoid);
	}
	
	/**
	 * 根据infoid逻辑删除
	 * @param ids 1,2,3,4
	 */
	@Override
	public int deleteByInfoId(String ids) {
		if(ids == null || ids.length() == 0 || "null".equals(ids)){
			return 0;
		}
		return this.mapper.logicDeleteByInfoId(ids);
	}
	/**
	 * 批量删除
	 */
	@Override
	public void delBatchEqD(Map<String, Object> params) {
		//mapper.delBatchEqD(params);
		mapper.logicDelBatchEqD(params);
	}
	@Override
	public List<Map<String,Object>> selectAllByIds(List<Long> ids) {
		// TODO Auto-generated method stub
		return mapper.selectAllByIds(ids);
	}
	@Override
	public List<Map<String, Object>> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}
	@Override
	public List<EquipDetail> isRepeatName(String name,String dspecific,Long infoid) {
		// TODO Auto-generated method stub
		return mapper.isRepeatName(name,dspecific,infoid);
	}
	@Override
	public int setNameByInfoid(Map<String, Object> parmas) {
		// TODO Auto-generated method stub
		return mapper.setNameByInfoid(parmas);
	}
	
	/**
	 * //修改如果是本身配件要修改该设备名称
	 */
	@Override
	public int updateByPrimaryKeySelective(EquipDetail entity)
	{
		EquipDetail entDetail = mapper.selectByPrimaryKey(entity.getId());
		if(entDetail.getOneself().equals(1))//配件本身
		{
			EquipInfo e = new EquipInfo();
			e.setId(entDetail.getInfoid());
			e.setName(entity.getName());
			equipInfoMapper.updateByPrimaryKeySelective(e);
		}
		int count = mapper.updateByPrimaryKeySelective(entity);
		return count;
	}

	@Override
	public List<EquipDetail> listAll() {
		return mapper.listAll();
	}

	@Override
	public String findIfirmByDetailId(Long id) {
		return mapper.findIfirmByDetailId(id);
	}

	@Override
	public Map<String, Object> addBatchDetail(EquipDetail equipDetail,
			String[] ids,HttpServletRequest request) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<String, Object>();
		
		equipDetail.setIsdel(0);
		Userinfo u = BaseUtiles.getLogInInfo(request);
		if(equipDetail.getOneself() == null){
			equipDetail.setOneself(0);
		}
		equipDetail.setCreatorId(u.getId());
		equipDetail.setCreateTime(new Date());
		
		for(String id:ids)
		{
			if(!StringUtils.isEmpty(id))
			{
				equipDetail.setInfoid(Long.valueOf(id));
				//根据配件名称和规格(可以至判断一个)查询是否有相同配件
				List<EquipDetail> list = mapper.isRepeatName(equipDetail.getName(),equipDetail.getSpecific(),equipDetail.getInfoid());
				
				if(list.size()>0)
				{
					continue;
				}
				mapper.insertSelective(equipDetail);
			}			
		}
		map.put("memo", "添加成功！");
		map.put("status", true);
		return map;
	}

	@Override
	public List<EquipDetail> getBatchPartsByDevices(String[] devices) {
		// TODO Auto-generated method stub
		return mapper.getBatchPartsByDevices(devices);
	}

	/**
	 * 批量删除设备配件--除自身和其他配件
	 */
	@Override
	public int delBatchDetail(EquipDetail equipDetail,
			String[] ids, HttpServletRequest request) {
		// TODO Auto-generated method stub
		return mapper.delBatchDetail(equipDetail,ids);
	}
	
}
