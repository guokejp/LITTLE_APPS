package com.kangrise.xunjian.admin.equip.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.admin.equip.mapper.EquipDetailMapper;
import com.kangrise.xunjian.admin.equip.mapper.EquipInfoMapper;
import com.kangrise.xunjian.admin.sm.entity.DeviceKind;
import com.kangrise.xunjian.admin.sm.mapper.DeviceKindMapper;
import com.kangrise.xunjian.service.BaseServiceImpl;
import com.kangrise.xunjian.utils.BaseUtiles;

@Service
public class EquipInfoServiceImpl extends BaseServiceImpl<EquipInfo, EquipInfoMapper> implements IEquipInfoService {

	@Autowired
	@Override
	public void setMapper(EquipInfoMapper mapper) {
		this.mapper = mapper;
		
	}
	
	@Autowired
	private DeviceKindMapper deviceKindMapper;
	
	@Autowired
	private EquipDetailMapper equipDetailMapper;
	
	
	/**
	 * 根据id查询所有信息关联查询区域
	 */
	@Override
	public List<EquipInfo> selectByKeys(Map<String,Object> params) {
		// TODO Auto-generated method stub
		return mapper.selectByKeys(params);
	}
	/**
	 * 获取设备树形结构list
	 */
	@Override
	public List<Map<String, Object>> getEquipTree() {
		List<Map<String, Object>> selectList = this.mapper.getAllEquipType();
		List<DeviceKind> DKList = deviceKindMapper.selectAll(new HashMap<String, Object>());
		List<Map<String, Object>> mapList = BaseUtiles.makeTreemap(selectList, 0);
		
		List<Map<String, Object>> retList = new ArrayList<Map<String,Object>>();
		for (DeviceKind dk : DKList) {
			Map<String, Object> treeMap = new HashMap<String, Object>();
			treeMap.put("text", dk.getName());
			treeMap.put("dkindid", dk.getId());
			//treeMap.put("selectable", false);
			List<Object> ls = new ArrayList<Object>();
			for (Map<String, Object> map : mapList) {
				if(dk.getId() == Integer.valueOf(map.get("dkindid").toString())){
					ls.add(map);
				}
			}
			treeMap.put("nodes", ls);
			retList.add(treeMap);
			
		}
		
		return retList;
		
	}

	/**
	 * 添加设备树形结构部分
	 */
	@Override
	public JSONObject addEquipTree(Map<String, Object> reqMap,HttpServletRequest request) throws Exception {
		JSONObject  nodeObj = new JSONObject();
		
		EquipInfo equip = new EquipInfo();
		equip.setCreateTime(new Date());
		equip.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
		equip.setIstreeleaf(1);
		equip.setIstableleaf(0);
		equip.setIsdel(0);

		long pid = 0;
		long rootid = 0;
		long dkindid = 0;
		if(reqMap.get("pid") != null){
			pid = Long.valueOf(reqMap.get("pid").toString());
			equip.setPid(pid);
		}
		if(reqMap.get("rootid") != null){
			rootid = Long.valueOf(reqMap.get("rootid").toString());
			equip.setRootid(rootid);
		}
		if(reqMap.get("name") != null){
			equip.setName(reqMap.get("name").toString());
		}
		if(reqMap.get("dkindid") != null){
			dkindid = Long.valueOf(reqMap.get("dkindid").toString());
			equip.setDkindid(dkindid);
		}
		//判断是否有相同名称设备
		Integer getSame = this.mapper.checkSameEquip(equip);
		if(getSame > 0){
			nodeObj.put("errMsg", "已存在此设备");
			return nodeObj;
		}
		
		this.mapper.insertSelective(equip);
		if(pid == 0){//pid=0 添加的是顶级菜单，需要把rootid改为现有id
			equip.setRootid(equip.getId());
			this.mapper.updateByPrimaryKeySelective(equip);
		}
		
		//查询上一级是否标识为树节点的叶子，如果是，需要把它下属的类转到这一级
		EquipInfo pEquipInfo = this.mapper.selectByPrimaryKey(pid);
		if(pEquipInfo != null && pEquipInfo.getIstreeleaf() == 1){
			this.mapper.setTableLeafPid(pEquipInfo.getId(),equip.getId());
		}
		//将上一级istreeleaf改为0
		if(pEquipInfo != null){
			pEquipInfo.setIstreeleaf(0);
			this.mapper.updateByPrimaryKeySelective(pEquipInfo);
		}
		
		//id,pid,rootid,name,identify,
		nodeObj.put("id", equip.getId());
		nodeObj.put("pid", equip.getPid());
		nodeObj.put("rootid", equip.getRootid());
		nodeObj.put("text", equip.getName());
		nodeObj.put("dkindid", equip.getDkindid());
		return nodeObj;
		
	}

	@Override
	public List<EquipInfo> selectAll() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	/**
	 * 根据pid删除
	 */
	@Override
	public Integer deleteByPrimaryKeyOfPid(Long pid) {
		return this.mapper.logicDeleteByPrimaryKeyOfPid(pid);
		//return this.mapper.deleteByPrimaryKeyOfPid(pid);
	}

	/**
	 * 查询它的tableleaf子类ids
	 * @param valueOf
	 * @return 1,2,3,4
	 */
	@Override
	public String selectTableLeafIdsByPid(Long pid) {
		return this.mapper.selectTableLeafIdsByPid(pid);
	}

	/**
	 * 根据pid查询table的数据
	 * @param pid
	 * @param page
	 * @param rows
	 * @return  List<EquipInfo>
	 */
	@Override
	public List<Map<String, Object>>  getEquipTableByPid(Long pid) {
		
		return this.mapper.selectTableLeafByPid(pid);
	}

	/**
	 * 查询所有设备和其父级菜单 
	 * @return List<Map<String,Object>>
	 */
	@Override
	public List<Map<String, Object>> getNameAndPname() {
		// TODO Auto-generated method stub
		return mapper.getNameAndPname();
	}

	/**
	 * 批量修改区域
	 */
	@Override
	public void updateEquipinfos(Map<String, Object> params) {
		// TODO Auto-generated method stub
		mapper.updateEquipinfos(params);
	}

	@Override
	public List<EquipInfo> getEquipTableLeafByParams(Map<String, Object> map) {
		return this.mapper.getEquipTableLeafByParams(map);
	}

	/**
	 * 根据区域修改区域
	 */
	@Override
	public void updateByPrimaryArea(Map<String, Object> param) {
		// TODO Auto-generated method stub
		mapper.updateByPrimaryArea(param);
	}
	
	/**
	 * 根据条件获取设备叶子节点
	 * @param reqMap
	 * @return
	 */
	@Override
	public List<EquipInfo> getEquipTableBydkkind(Map<String, Object> reqMap) {
		
		return this.mapper.getEquipTableBydkkind(reqMap);
	}
	
	@Override
	public List<String> getIfirm() {
		// TODO Auto-generated method stub
		return mapper.getIfirm();
	}
	
	@Override
	public List<String> getTaskIdBy(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getTaskIdBy(params);
	}
	@Override
	public List<Map<String,Object>> getAbnormalIdentBy(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return mapper.getAbnormalIdentBy(params);
	}
	@Override
	public Integer logicDeleteByPrimaryKey(Long id) {
		return mapper.logicDeleteByPrimaryKey(id);
	}
	@Override
	public List<Map<String, Object>> getEquipinfo() {
		// TODO Auto-generated method stub
		return mapper.getEquipinfo();
	}
	@Override
	public List<Map<String, Object>> getDeviceGroupKind() {
		// TODO Auto-generated method stub
		return mapper.getDeviceGroupKind();
	}
	@Override
	public List<Map<String, Object>> getAreaCompared() {
		// TODO Auto-generated method stub
		return mapper.getAreaCompared();
	}
	@Override
	public int getWarnDevice() {
		// TODO Auto-generated method stub
		return mapper.getWarnDevice();
	}
	

	
	@Override
	public List<EquipInfo> getEquipTreeLeafBydkkind(Map<String, Object> reqMap) {
		return this.mapper.getEquipTreeLeafBydkkind(reqMap);
	}
	
	/**
	 * 更新设备的同时更新本身配件
	 */
	@Override
	public int updateByPrimaryKeySelective(EquipInfo entity)
	{
		Map<String,Object> params = new HashMap<String, Object>();
		params.put("infoid",entity.getId());
		params.put("name",entity.getName());
		
		//根据id查询原来的名字
		EquipInfo e = mapper.selectByPrimaryKey(entity.getId());
		params.put("infoname",e.getName());
		
		//equipDetailMapper.setNameByInfoid(params);
		
		return mapper.updateByPrimaryKeySelective(entity);
	}
	@Override
	public List<Map<String, Object>> getEquipKindInfo(Long id) {
		return this.mapper.getEquipKindInfo(id);
		
	}
	@Override
	public List<EquipInfo> getEquipTableLeafByParams2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return this.mapper.getEquipTableLeafByParams2(map);
	}
	@Override
	public List<EquipInfo> selectByKeys(EquipInfo equipInfo) {
		// TODO Auto-generated method stub
		return mapper.selectEntityByKeys(equipInfo);
	}
	@Override
	public List<Map<String, Object>> selectTableLeafByPid(Long pid) {
		// TODO Auto-generated method stub
		return mapper.selectTableLeafByPid(pid);
	}
	@Override
	public List<EquipInfo> selectEquipTableLeafByname(String equipName) {
		return this.mapper.selectEquipTableLeafByname(equipName);
	}
	@Override
	public Integer countBeforeWarningEquip(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Integer bowrbook(EquipInfo equip) {
		equip.setOnlinedate(new Date());
		equip.setIstatus(20);
		return this.mapper.updateByPrimaryKeySelective(equip);
	}

	@Override
	public Integer backbook(EquipInfo equip) {
		equip.setIspecific("");
		equip.setUnit("");
		equip.setSpotlocate("");
		equip.setIbrand("");
		equip.setIstatus(10);
		return this.mapper.updateByPrimaryKeySelective(equip);
	}
	
	
}
