package com.kangrise.xunjian.admin.equip.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.kangrise.xunjian.admin.equip.entity.EquipDetail;
import com.kangrise.xunjian.service.IBaseService;

public interface IEquipDetailService extends IBaseService<EquipDetail>{
	/**
	 * 根据父类设备id查询所有子类设备
	 * @param infoid
	 * @return
	 */
	List<EquipDetail> selectAllByInfoid(Long infoid);

	/**
	 * 根据infoid删除
	 * @param ids 1,2,3,4
	 */
	int deleteByInfoId(String ids);
	
	void delBatchEqD(Map<String,Object> params);//批量删除

	List<Map<String,Object>> selectAllByIds(List<Long> ids);//批量查询二维码

	List<Map<String,Object>> selectAll();//所有二维码
	
	List<EquipDetail> isRepeatName(String name,String dspecific,Long infoid);//根据配件名称和规格(可以至判断一个)查询是否有相同配件
	
	int setNameByInfoid(Map<String,Object> parmas);//根据设备名称和设备id查询修改设备本身配件
	
	/**
	 * 查询所有配件
	 * @return
	 */
	List<EquipDetail> listAll();
	
	/**
	 * 根据配件id查询厂商
	 * @param id
	 * @return
	 */
	String findIfirmByDetailId(Long id);

	/**
	 * 批量添加配件
	 * @param equipDetail--配件
	 * @param ids--设备id
	 * @return
	 */
	Map<String, Object> addBatchDetail(EquipDetail equipDetail, String[] ids,HttpServletRequest request) throws Exception;

	/**
	 * 根据设备id批量查询配件规格和编号并排重
	 * @param ids
	 * @return
	 */
	List<EquipDetail> getBatchPartsByDevices(String[] devices);

	/**
	 * 批量删除设备配件--除自身和其他配件
	 * @param equipDetail
	 * @param ids--设备id
	 * @param request
	 * @return
	 */
	int delBatchDetail(EquipDetail equipDetail, String[] ids,
			HttpServletRequest request);

}
