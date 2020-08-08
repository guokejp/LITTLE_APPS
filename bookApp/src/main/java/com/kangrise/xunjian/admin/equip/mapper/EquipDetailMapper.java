package com.kangrise.xunjian.admin.equip.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kangrise.xunjian.admin.equip.entity.EquipDetail;
import com.kangrise.xunjian.mapper.BaseMapper;

public interface EquipDetailMapper extends BaseMapper<EquipDetail>{

	/**
	 * 根据父类设备id查询所有子类设备
	 * @param infoid
	 * @return
	 */
	List<EquipDetail> selectAllByInfoid(Long infoid);
	
	/**
	 * 根据父类设备id查询所有子类设备
	 * @param infoid
	 * @return
	 */
	List<EquipDetail> selectAllByInfoidapp(Long infoid);

	/**
	 * 根据infoid删除
	 * @param ids 1,2,3,4
	 * @return 
	 */
	int deleteByInfoId(String ids);
	
	void delBatchEqD(Map<String,Object> params);//批量删除

	/**
	 * 根据infoid逻辑删除
	 * @param ids 1,2,3,4
	 * @return 
	 */
	int logicDeleteByInfoId(String ids);

	void logicDelBatchEqD(Map<String, Object> params);//批量逻辑删除
	
	List<Map<String,Object>> selectAllByIds(List<Long> ids);//批量查询二维码
	
	List<Map<String,Object>> selectAll();//所有二维码
	
	List<EquipDetail> isRepeatName(@Param("name")String name,@Param("dspecific")String dspecific,@Param("infoid")Long infoid);//根据配件名称和规格(可以至判断一个)查询是否有相同配件
	
	int setNameByInfoid(Map<String,Object> parmas);//根据和设备id查询修改设备本身配件
	
	/**
	 * 查询所有配件
	 * @return
	 */
	List<EquipDetail> listAll();
	/**
	 * 根据配件id查询设备厂商
	 * @param id
	 * @return
	 */
	String findIfirmByDetailId(@Param("detailId") Long id);

	/**
	 * 根据设备id批量查询配件规格和编号并排重
	 * @param devices
	 * @return
	 */
	List<EquipDetail> getBatchPartsByDevices(String[] devices);

	/**
	 * 批量删除设备配件--除自身和其他配件
	 * @param equipDetail
	 * @param ids--设备id
	 * @return
	 */
	int delBatchDetail(@Param("equipDetail")EquipDetail equipDetail, @Param("devices")String[] ids);
}
