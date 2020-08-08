package com.kangrise.xunjian.admin.equip.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface EquipInfoMapper extends BaseMapper<EquipInfo> {

	List<EquipInfo> selectByKeys(Map<String, Object> params);// 根据id查询所有信息关联查询区域

	/**
	 * 获取所有属于类的设备
	 * 
	 * @return
	 */
	List<Map<String, Object>> getAllEquipType();

	/**
	 * 设置新的pid
	 * 
	 * @param oldPid
	 * @param newPid
	 */
	void setTableLeafPid(Long oldPid, Long newPid);

	/**
	 * 查询所有菜单
	 * 
	 * @return
	 */
	List<EquipInfo> selectAll();

	/**
	 * 根据pid删除
	 * 
	 * @param pid
	 */
	Integer deleteByPrimaryKeyOfPid(Long pid);

	/**
	 * 查询它的tableleaf子类ids
	 * 
	 * @param pid
	 * @return
	 */
	String selectTableLeafIdsByPid(Long pid);

	/**
	 * 根据pid查询table的数据
	 * 
	 * @param pid
	 * @param page
	 * @param rows
	 * @return List<EquipInfo>
	 */
	List<Map<String, Object>> selectTableLeafByPid(Long pid);

	/**
	 * 查询所有设备和其父级菜单
	 * 
	 * @return List<Map<String,Object>>
	 */
	List<Map<String, Object>> getNameAndPname();

	void updateEquipinfos(Map<String, Object> params);// 批量修改区域

	void updateByPrimaryKeyWithBLOBs(EquipInfo equip);

	/**
	 * 条件查询设备
	 * 
	 * @param map
	 * @return
	 */
	List<EquipInfo> getEquipTableLeafByParams(Map<String, Object> map);

	/**
	 * 条件查询设备 --有limit
	 * 
	 * @param map
	 * @return
	 */
	List<EquipInfo> getEquipTableLeafByParams2(Map<String, Object> map);

	// 根据区域修改区域
	void updateByPrimaryArea(Map<String, Object> param);

	/**
	 * 根据条件获取设备叶子节点
	 * 
	 * @param reqMap
	 * @return
	 */
	List<EquipInfo> getEquipTableBydkkind(Map<String, Object> reqMap);

	/**
	 * 获取所有类型下的设备数量
	 * 
	 * @return
	 */
	List<Map<String, Object>> getCountGroupByDeviceKind();

	/**
	 * 根据区域和类型列出所有设备
	 * 
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> listEquipinfo(Map<String, Object> params);

	/**
	 * 获取所有设备和其区域
	 * 
	 * @return
	 */
	List<Map<String, Object>> getEquipinfo();

	/**
	 * 根据区域和类型查找到的设备总数
	 * 
	 * @param params
	 * @return
	 */
	Integer getTotalrowsForListEquipinfo(Map<String, Object> params);

	List<String> getIfirm();// 查询所有设备厂商

	List<String> getTaskIdBy(Map<String, Object> params);// 根据设备id和频率查询异常设备任务 id

	List<Map<String, Object>> getAbnormalIdentBy(Map<String, Object> params);// 根据设备id和频率查询异常编号

	/**
	 * 根据设备类型id查找数据
	 * 
	 * @param dkid
	 * @return
	 */
	List<EquipInfo> selectByDeviceKindId(Integer dkid);

	Integer logicDeleteByPrimaryKeyOfPid(Long pid);

	/**
	 * 根据id逻辑删除
	 * 
	 * @param id
	 * @return
	 */
	Integer logicDeleteByPrimaryKey(Long id);

	/***
	 * 设备种类分组查询
	 * 
	 * @return
	 */
	List<Map<String, Object>> getDeviceGroupKind();

	/***
	 * 设备区域分组查询
	 * 
	 * @return
	 */
	List<Map<String, Object>> getAreaCompared();

	int getWarnDevice();// 查询所有预警设备

	/**
	 * 查找是否有同名设备
	 * 
	 * @param equip
	 * @return
	 */
	Integer checkSameEquip(EquipInfo equip);

	/**
	 * 根据条件取得设备tree结构的叶子节点
	 * 
	 * @param reqMap
	 * @return
	 */
	List<EquipInfo> getEquipTreeLeafBydkkind(Map<String, Object> reqMap);

	/**
	 * 根据设备种类统计设备
	 * 
	 * @return
	 */
	List<Map<String, Object>> countEquipGroupByKind();

	/**
	 * 根据设备区域统计设备
	 * 
	 * @return
	 */
	List<Map<String, Object>> countEquipGroupByArea();

	List<Map<String, Object>> getEquipKindInfo(Long id);

	/**
	 * 条件查询
	 * 
	 * @param equipInfo
	 * @return
	 */
	List<EquipInfo> selectEntityByKeys(EquipInfo equipInfo);

	/**
	 * 根据名称模糊查找设备table数据
	 * 
	 * @param equipName
	 * @return
	 */
	List<EquipInfo> selectEquipTableLeafByname(@Param("equipName") String equipName);

}
