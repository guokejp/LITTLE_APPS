package com.kangrise.xunjian.admin.sm.rest;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kangrise.xunjian.admin.sm.entity.DeviceKind;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.admin.sm.service.IDeviceKindService;
import com.kangrise.xunjian.utils.BaseUtiles;
import com.kangrise.xunjian.utils.Constant;
import com.kangrise.xunjian.utils.PageUtils;

@Controller
@RequestMapping("/sm/deviceKindRest")
public class DeviceKindRest 
{
	final Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private IDeviceKindService deviceKindService;
	
	/**
	 * 查询所有设备并分页
	 * @param response
	 * @param params
	 */
	@RequestMapping("getPageBy")
	@ResponseBody
	public void getPageBy(@RequestBody(required=false) Map<String, Object> params,HttpServletResponse response) 
	{
		JSONObject json = new JSONObject();
		Integer page = PageUtils.GetParamByNameInt(params, "page");
		Integer rows = PageUtils.GetParamByNameInt(params, "rows");
		try 
		{
			JSONArray jsonArray = new JSONArray();
			
			List<DeviceKind> list = deviceKindService.selectAll(params);//查询所有设备种类
			if(!StringUtils.isEmpty(rows)&&rows!=0)
			{
				PageHelper.startPage(page, rows);
				PageInfo<DeviceKind> pageInfo = new PageInfo<DeviceKind>(list);
				jsonArray.add(pageInfo);
				json.put("list",jsonArray);
			}
			else
			{
				jsonArray.addAll(list);
				json.put("list",jsonArray);
				json.put("total",list.size());
			}
			PageUtils.ResponseString(response,json.toString());
			
		} catch (Exception e) {
			log.debug(e);
		}
	}
	
	/**
	 * 添加
	 * @param response
	 * @param params
	 */
	@RequestMapping("add")
	public void add(DeviceKind deviceKind,HttpServletResponse response,HttpServletRequest request) 
	{
		JSONObject json = new JSONObject();
		try 
		{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("name2", deviceKind.getName());
			//查询是否存在
			List<DeviceKind> list = deviceKindService.selectAll(map);
			if(list.size()>0)
			{
				json.put("success", true);
				json.put("msg","该种类已经存在！");
				PageUtils.ResponseString(response,json.toString());
				return;
			}
			Userinfo u = BaseUtiles.getLogInInfo(request);
			deviceKind.setCreateTime(new Date());
			deviceKind.setIsdel(0);
			deviceKind.setCreatorId(u.getId());
			
			int num = deviceKindService.insertSelective(deviceKind);
			if(num>0)
			{
				json.put("success", true);
				json.put("msg",Constant.ADD_MEG);
			}
			else
			{
				json.put("success", false);
				json.put("msg",Constant.HANDLE_MSG);
			}
			PageUtils.ResponseString(response,json.toString());
			
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 修改
	 * @param response
	 * @param params
	 */
	@RequestMapping("set")
	public void set(DeviceKind deviceKind,HttpServletResponse response) 
	{
		JSONObject json = new JSONObject();
		try 
		{
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("name2", deviceKind.getName());
			//查询是否存在
			List<DeviceKind> list = deviceKindService.selectAll(map);
			if(list.size()>0)
			{
				json.put("success", true);
				json.put("msg","该种类已经存在！");
				PageUtils.ResponseString(response,json.toString());
				return;
			}
			int num = deviceKindService.updateByPrimaryKeySelective(deviceKind);
			if(num>0)
			{
				json.put("success", true);
				json.put("msg",Constant.SET_MEG);
			}
			else
			{
				json.put("success", false);
				json.put("msg",Constant.HANDLE_MSG);
			}
			PageUtils.ResponseString(response,json.toString());
			
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 删除
	 * @param response
	 * @param params
	 */
	@RequestMapping("del/{id}")
	public void del(@PathVariable Integer id,HttpServletResponse response) 
	{
		JSONObject json = new JSONObject();
		try 
		{
			int num = deviceKindService.deleteLogicByKey(id);
			if(num>0){
				json.put("success", true);
				json.put("msg",Constant.DEL_MEG);
			}else if(num == 0){
				json.put("success", false);
				json.put("msg",Constant.KIND_NOT_EMPTY);
			} else {
				json.put("success", false);
				json.put("msg",Constant.HANDLE_MSG);
			}
			PageUtils.ResponseString(response,json.toString());
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 查询所有设备种类
	 * @param response
	 */
	@RequestMapping("getAll")
	public void getAll(HttpServletResponse response) 
	{
		JSONObject json = new JSONObject();
		try 
		{
			Map<String,Object> params = new HashMap<String, Object>();
			List<DeviceKind> list = deviceKindService.selectAll(params);
			JSONArray jsonArray = JSONArray.fromObject(list);
			json.put("list", jsonArray);
			PageUtils.ResponseString(response,json.toString());
		} catch (Exception e) {
			log.debug(e);
		}
	}
}
