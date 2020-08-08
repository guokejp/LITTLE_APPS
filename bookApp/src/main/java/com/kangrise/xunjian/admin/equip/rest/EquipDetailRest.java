package com.kangrise.xunjian.admin.equip.rest;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kangrise.xunjian.admin.equip.entity.EquipDetail;
import com.kangrise.xunjian.admin.equip.service.IEquipDetailService;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.utils.BaseUtiles;
import com.kangrise.xunjian.utils.PageUtils;

@Controller
@RequestMapping("equip/detail")
public class EquipDetailRest {
	@Autowired
	private IEquipDetailService equipDetailService;
	
	/**
	 * 返回设备配件列表
	 * @param infoid
	 * @return
	 */
	@RequestMapping("getDetails/{infoid}")
	@ResponseBody
	public List<EquipDetail> getDetail(@PathVariable Long infoid) {
		return equipDetailService.selectAllByInfoid(infoid);
	}
	
	/**
	 * 添加设备配件
	 * @param equipDetail
	 * @return {status:false,memo:"错误提示信息"}
	 */
	@RequestMapping("addDetail")
	@ResponseBody
	public Map<String, Object> addDetail(EquipDetail equipDetail,HttpServletRequest request) {
		equipDetail.setIsdel(0);
		Userinfo u = BaseUtiles.getLogInInfo(request);
		if(equipDetail.getOneself() == null){
			equipDetail.setOneself(0);
		}
		equipDetail.setCreatorId(u.getId());
		equipDetail.setCreateTime(new Date());
		Map<String, Object> map = new HashMap<String, Object>();
		//根据配件名称和规格(可以至判断一个)查询是否有相同配件
		List<EquipDetail> list = equipDetailService.isRepeatName(equipDetail.getName(),equipDetail.getSpecific(),equipDetail.getInfoid());
		
		if(list.size()>0)
		{
			map.put("status", true);
			map.put("memo", "抱歉，已存在(规格、配件名相同)该配件！");
			return map;
		}
		if (equipDetailService.insertSelective(equipDetail) > 0) {
			map.put("memo", "添加成功！");
			map.put("status", true);
		} else {
			map.put("status", true);
			map.put("memo", "抱歉，出现了一个未知的技术错误，请稍后重试");
		}
		return map;
	}
	/**
	 * 批量添加设备配件
	 * @param equipDetail
	 * @param devices {设备id}
	 * @return {status:false,memo:"错误提示信息"}
	 */
	@RequestMapping("addBatchDetail")
	@ResponseBody
	public Map<String, Object> addBatchDetail(EquipDetail equipDetail,@RequestParam String devices,HttpServletRequest request) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] ids = devices.split(",");
		
		
		try {
			//批量添加
			map = equipDetailService.addBatchDetail(equipDetail,ids,request);//批量添加配件
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("memo", "添加失败！");
			map.put("status", false);
		}
		
		return map;
	}
	
	/**
	 * 修改设备配件
	 * @param equipDetail
	 * @return {status:false,memo:"错误提示信息"}
	 */
	@RequestMapping("setDetail")
	@ResponseBody
	public Map<String, Object> setDetail(@RequestBody EquipDetail equipDetail) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		EquipDetail e = equipDetailService.selectByPrimaryKey(equipDetail.getId());
		if(!e.getName().equals(equipDetail.getName()))
		{
			//根据配件名称和规格(可以至判断一个)查询是否有相同配件
			List<EquipDetail> list = equipDetailService.isRepeatName(equipDetail.getName(),equipDetail.getSpecific(),equipDetail.getInfoid());
			
			if(list.size()>0)
			{
				map.put("status", true);
				map.put("memo", "抱歉，已存在(规格、配件名相同)该配件！");
				return map;
			}
		}
		
		//修改如果是本身配件要修改该设备名称
		if (equipDetailService.updateByPrimaryKeySelective(equipDetail) > 0) {
			map.put("status", true);
			map.put("memo", "修改成功！");
		} else {
			map.put("status", true);
			map.put("memo", "抱歉，出现了一个未知的技术错误，请稍后重试");
		}
		return map;
	}
	/**
	 * 删除设备配件
	 * @param equipDetail
	 * @return {status:false,memo:"错误提示信息"}
	 */
	@RequestMapping("delDetail")
	@ResponseBody
	public void delDetail(@RequestBody Map<String,Object> params,HttpServletResponse response) 
	{
		JSONObject json = new JSONObject();
		try {
			equipDetailService.delBatchEqD(params);//批量删除
			json.put("success", true);
			PageUtils.ResponseString(response, json.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	/**
	 * 查询所有配件
	 * @return
	 */
	@RequestMapping("getAll")
	@ResponseBody
	public List<EquipDetail> getAll() {
		return equipDetailService.listAll();
	}
	
	/**
	 * 根据配件id查询
	 * @param id
	 * @return
	 */
	@RequestMapping("findIfirmByDetailid/{id}")
	@ResponseBody
	public Map<String, String> findIfirmByDetailid(@PathVariable Long id) {
		Map<String, String> dataMap = new HashMap<String, String>();
		dataMap.put("ifirm", equipDetailService.findIfirmByDetailId(id));
		return dataMap; 
	}
	
	/**
	 * 根据设备ids查询配件名称和规格
	 * @param devices
	 * @return
	 */
	@RequestMapping("getPartsByDevices")
	@ResponseBody
	public List<Map<String,Object>> getPartsByDevices(@RequestParam String devices)
	{
		List<Map<String,Object>> data = new ArrayList<Map<String,Object>>();
		String[] ids = devices.split(",");
		try {
			//根据设备id批量查询配件规格和编号并排重
			List<EquipDetail> list = equipDetailService.getBatchPartsByDevices(ids);
			Set<String> names = new TreeSet<String>();
			
			for(EquipDetail equipDetail:list)
			{
				names.add(equipDetail.getName());
			}
			for(String name:names)
			{
				List<String> dspecifics = new ArrayList<String>();
				for(EquipDetail equipDetail:list)
				{
					if(name.equals(equipDetail.getName()))
					{
						if(!StringUtils.isEmpty(equipDetail.getSpecific()))
						{
							dspecifics.add(equipDetail.getSpecific());
						}
					}
				}
				Map<String,Object> param = new HashMap<String, Object>();
				param.put("name", name);
				param.put("dspecifics", dspecifics);
				
				data.add(param);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return data;
	}
	/**
	 * 批量删除设备配件---除自身和其他配件
	 * @param equipDetail
	 * @param devices {设备id}
	 * @return {status:false,memo:"错误提示信息"}
	 */
	@RequestMapping("delBatchDetail")
	@ResponseBody
	public Map<String, Object> delBatchDetail(EquipDetail equipDetail,@RequestParam String devices,HttpServletRequest request) {

		Map<String, Object> map = new HashMap<String, Object>();
		
		String[] ids = devices.split(",");//--设备id
		try {
			//批量删除
			int count = equipDetailService.delBatchDetail(equipDetail,ids,request);//批量删除配件
			if(count>0)
			{
				map.put("memo", "操作成功！");
				map.put("status", true);
			}
			else
			{
				map.put("memo", "操作失败！");
				map.put("status", false);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			map.put("memo", "操作失败！");
			map.put("status", false);
		}
		
		return map;
	}
	
	
}
