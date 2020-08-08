package com.kangrise.xunjian.admin.equip.service.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.service.IBaseService;

public interface IEquipInfoService extends IBaseService<EquipInfo> {

	List<EquipInfo> selectByKeys(Map<String,Object> params);//根据id查询所有信息关联查询区域
	/**
	 * 获取设备的树形结构mapList
	 * @return
	 */
	List<Map<String, Object>> getEquipTree();

	/**
	 * 添加设备树形结构部分
	 * @param reqMap
	 */
	JSONObject addEquipTree(Map<String, Object> reqMap,HttpServletRequest request) throws Exception;
	
	/**
	 * 查询所有菜单
	 * @return
	 */
	List<EquipInfo> selectAll();

	/**
	 * 根据pid删除
	 * @param valueOf
	 * @return
	 */
	Integer deleteByPrimaryKeyOfPid(Long pid);

	/**
	 * 查询它的tableleaf子类ids
	 * @param valueOf
	 * @return 1,2,3,4
	 */
	String selectTableLeafIdsByPid(Long valueOf);

	/**
	 * 根据pid查询table的数据
	 * @param pid
	 * @return  List<EquipInfo>
	 */
	List<Map<String, Object>> getEquipTableByPid(Long pid);

	
	/**
	 * 查询所有设备和其父级菜单 
	 * @return List<Map<String,Object>>
	 */
	public List<Map<String, Object>> getNameAndPname();

	void updateEquipinfos(Map<String, Object> params);//批量修改区域
	
	//条件查询
	List<EquipInfo> getEquipTableLeafByParams(Map<String, Object> map);
	
	/**
	 * 条件查询设备 --有limit
	 * @param map
	 * @return
	 */
	List<EquipInfo> getEquipTableLeafByParams2(Map<String, Object> map);
	
	//根据区域修改区域
	void updateByPrimaryArea(Map<String, Object> param);
	
	/**
	 * 根据条件获取设备叶子节点
	 * @param reqMap
	 * @return
	 */
	List<EquipInfo> getEquipTableBydkkind(Map<String, Object> reqMap);
	
	List<String> getIfirm();//查询所有设备厂商
	
	List<String> getTaskIdBy(Map<String, Object> params);//根据设备id和频率查询异常设备任务 id
	List<Map<String,Object>> getAbnormalIdentBy(Map<String, Object> params);//根据设备id和频率查询异常编号
	/**
	 * 根据id逻辑删除
	 * @param id
	 */
	Integer logicDeleteByPrimaryKey(Long id);
	
	/**
	 * 获取所有设备和其区域
	 * @return
	 */
	List<Map<String, Object>> getEquipinfo();
	
	/***
	 * 设备种类分组查询
	 * @return
	 */
	List<Map<String, Object>> getDeviceGroupKind();
	
	/***
	 * 设备区域分组查询
	 * @return
	 */
	List<Map<String, Object>> getAreaCompared();
	
	int getWarnDevice();//查询所有预警设备
	
	/**
	 * 当前预警
	 * @param map
	 * @return
	 */
	Integer countBeforeWarningEquip(Map<String,Object> map);
	
	
	/**
	 * 根据条件获取tree结构的叶子节点
	 * @param reqMap
	 * @return
	 */
	List<EquipInfo> getEquipTreeLeafBydkkind(Map<String, Object> reqMap);
	
	/**
	 * 获取某设备的设备信息
	 * @param object 
	 * @return
	 */
	List<Map<String, Object>> getEquipKindInfo(Long id);
	
	/**
	 * 条件查询
	 * @param equipInfo
	 * @return
	 */
	List<EquipInfo> selectByKeys(EquipInfo equipInfo);
	
	/**
	 * 根据pid获取设备的table
	 * @param pid
	 * @return
	 */
	List<Map<String, Object>> selectTableLeafByPid(Long pid);
	
	/**
	 * 根据名称模糊查找设备table数据
	 * 
	 * @param equipName
	 * @return
	 */
	List<EquipInfo> selectEquipTableLeafByname(String equipName);
	
	Integer bowrbook(EquipInfo equip);
	
	Integer backbook(EquipInfo equip) ;

}
