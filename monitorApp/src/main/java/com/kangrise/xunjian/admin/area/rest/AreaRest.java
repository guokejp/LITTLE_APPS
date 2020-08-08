package com.kangrise.xunjian.admin.area.rest;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kangrise.xunjian.admin.area.entity.Area;
import com.kangrise.xunjian.admin.area.service.IAreaService;
import com.kangrise.xunjian.admin.equip.entity.EquipDetail;
import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.admin.equip.service.IEquipDetailService;
import com.kangrise.xunjian.admin.equip.service.impl.IEquipInfoService;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.utils.BaseUtiles;
import com.kangrise.xunjian.utils.Constant;
import com.kangrise.xunjian.utils.PageUtils;
import com.kangrise.xunjian.utils.SortUtil;

@Controller
@RequestMapping("area/areaRest")
public class AreaRest 
{
	final Log log = LogFactory.getLog(this.getClass());
	@Autowired
	private IAreaService areaService;
	
	@Autowired
	private IEquipInfoService equipInfoService;
	
	@Autowired 
	private IEquipDetailService equipDetailService;
	
	/**
	 * 跳转设备管理界面
	 * @param req
	 * @param rep
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("getPage")
	public void getUser(HttpServletRequest req,HttpServletResponse rep)
	{
		try 
		{	
			req.getRequestDispatcher("/loginAndout/toPage?path=admin/area/regionmanage_sbqy").forward(req, rep);
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 查询所有设备区域
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getRegion")
	public List<Area> getRegion()
	{
		List<Area> list = new ArrayList<Area>();
		try 
		{
			list = areaService.selectAll();//查询所有区域
		} catch (Exception e) {
			log.debug(e);
		}
		return list;
	}
	
	/**
	 * 添加区域设备是查询设备名称和父级菜单
	 * @param response
	 */
	@RequestMapping(value="getNameAndPname",method=RequestMethod.POST)
	public void getNameAndPname(HttpServletResponse response)
	{
		JSONArray json = new JSONArray();
		try 
		{
			List<Map<String,Object>> list = equipInfoService.getNameAndPname();
			json.add(list);
			PageUtils.ResponseString(response,json.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 查询设备名称和父级菜单--去重复和空值
	 * @param response
	 */
	@RequestMapping(value="getNameAndPname2",method=RequestMethod.POST)
	public void getNameAndPname2(HttpServletResponse response)
	{
		JSONObject json = new JSONObject();
		try 
		{
			List<Map<String,Object>> list = equipInfoService.getNameAndPname();
			JSONArray njson = new JSONArray(); //设备名称
			JSONArray ijson = new JSONArray();//设备编号
			for(Map<String,Object> map:list)
			{
				JSONObject jsonObject = new JSONObject();
				JSONObject jsonObject2 = new JSONObject();
				if(!StringUtils.isEmpty(map.get("name"))) 
				{
					jsonObject.put("name", map.get("name"));
					njson.add(jsonObject);
				}
				if(!StringUtils.isEmpty(map.get("identify")))
				{
					jsonObject2.put("identify", map.get("identify"));
					ijson.add(jsonObject2);
				}
			}
			njson = SortUtil.repetition(njson);//排重
			ijson = SortUtil.repetition(ijson);
			
			json.put("njson", njson);
			json.put("ijson", ijson);
			PageUtils.ResponseString(response,json.toString());

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 添加设备区域
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="addRegion",method=RequestMethod.POST)
	public Map<String,Object> addArea(@RequestBody Map<String,Object> param,HttpServletRequest request)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		try 
		{
			String name = param.get("name").toString();
			//查询是否存在
			List<Area> list = areaService.selectByName(name);
			if(list.size()<=0)
			{
				Userinfo u = BaseUtiles.getLogInInfo(request);
				Area area = new Area();
				area.setName(param.get("name").toString());
				area.setCreateTime(new Date());
				area.setCreatorId(u.getId());
				areaService.insertSelective(area);
				map.put("msg", Constant.ADD_MEG);
			}
			else
			{
				map.put("msg", "该区域已存在！");
			}
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("msg", Constant.HANDLE_MSG);
		}
		return map;
	}
	/**
	 * 修改设备区域
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="setRegion",method=RequestMethod.POST)
	public Map<String,Object> setArea(@RequestBody Map<String,Object> param)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		try 
		{
			String name = param.get("name").toString();
			Long id = Long.valueOf(param.get("id").toString());
			//查询是否存在
			List<Area> list = areaService.selectByName(name);
			if(list.size()<=0)
			{
				Area area = new Area();
				area.setName(name);
				area.setId(id);
				areaService.updateByPrimaryKeySelective(area);
				map.put("msg", Constant.SET_MEG);
			}
			else
			{
				map.put("msg", "该区域已存在！");
			}
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("msg", Constant.HANDLE_MSG);
		}
		return map;
	}
	/**
	 * 删除设备区域
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="delRegion",method=RequestMethod.POST)
	public Map<String,Object> delArea(@RequestBody Map<String,Object> param)
	{
		Map<String,Object> map = new HashMap<String, Object>();
		try 
		{
			Long id = Long.valueOf(param.get("id").toString());
			areaService.deleteByPrimaryKey(id);//删除区域
			map.put("msg", Constant.DEL_MEG);
			map.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			map.put("success", false);
			map.put("msg", Constant.HANDLE_MSG);
		}
		return map;
	}
	
	/**
	 * 根据区域id查询设备信息
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="getDeviceByArea",method=RequestMethod.POST)
	public void getDeviceByArea(@RequestBody Map<String,Object> param,HttpServletResponse response)
	{
		int page = PageUtils.GetParamByNameInt(param, "page");
		int rows = PageUtils.GetParamByNameInt(param, "rows");
		JSONObject jsonObject = new JSONObject();
		JSONArray json = new JSONArray();
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		try {
			list = areaService.getDeviceByArea(PageUtils.GetParam(param));
			List<Map<String,Object>> list2 = areaService.getDeviceCountByArea(PageUtils.GetParam(param));//根据区域查询总页数
			json.addAll(list);
			jsonObject.put("list",json);
			jsonObject.put("pages", PageUtils.GetPages(rows, list2.size()));//总页数
			jsonObject.put("curpage", page);//当前页
			PageUtils.ResponseString(response,jsonObject.toString());
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 查询设备详情信息
	 * @param param
	 * @param response
	 */
	@RequestMapping(value="getDeviceData",method=RequestMethod.POST)
	public void getDeviceData(@RequestBody Map<String,Object> params,HttpServletResponse response)
	{
		JSONObject jsonObject = new JSONObject();
		try {
			
			List<String> data = new ArrayList<String>();
			if(!StringUtils.isEmpty(params.get("id")))
			{
				Long id = Long.valueOf(params.get("id").toString());
				List<EquipInfo> list2 = equipInfoService.selectAll();//查询所有菜单          
				data = BaseUtiles.getPname(list2,id); //所有父级菜单 
			}
			//查询
			List<EquipInfo> equipInfo = equipInfoService.selectByKeys(params);//查询菜单详情信息
			jsonObject.put("equipInfo", equipInfo.get(0));
			jsonObject.put("list", equipInfo);
			jsonObject.put("menus", data);
			
			PageUtils.ResponseString(response,jsonObject.toString());
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 根据父类id查询子类设备信息
	 * @param param
	 * @param response
	 */
	@RequestMapping(value="getDeviceDetails/{id}",method=RequestMethod.POST)
	public void getDeviceDetails(@PathVariable Long id,HttpServletResponse response)
	{
		JSONObject jsonObject = new JSONObject();
		try {
			List<EquipInfo> list = equipInfoService.selectAll();//查询所有菜单          
			List<String> data = BaseUtiles.getPname(list,id); //所有父级菜单 
			
			List<EquipDetail> list2 = equipDetailService.selectAllByInfoid(id);//根据父类id查询子类设备         
			
			jsonObject.put("devices", list2);
			jsonObject.put("menus", data);
			PageUtils.ResponseString(response,jsonObject.toString());
		} catch (Exception e) {
			log.debug(e);
		}
	}
	/**
	 * 修改设备区域---区域id，设备id 
	 * @return
	 */
	@RequestMapping(value="setDeviceRegion/{id}")
	public void setDeviceRegion(@PathVariable Long id,@RequestParam Long areaid,HttpServletResponse response)//设备id
	{
		JSONObject json = new JSONObject();
		try {
			EquipInfo e = new EquipInfo();
			e.setAreaId(areaid);
			e.setId(id);
			equipInfoService.updateByPrimaryKeySelective(e);
			json.put("msg", Constant.SET_MEG);
			json.put("success", true);
			PageUtils.ResponseString(response,json.toString());
		} catch (Exception e) {
			json.put("msg", Constant.HANDLE_MSG);
			json.put("success", false);
			log.debug(e);
		}	
	}
	/**
	 * 查询所有根节点
	 * @return
	 */
	@RequestMapping(value="getRootName")
	public String getRootName()
	{
		JSONArray json = new JSONArray();
		try {
			List<Map<String,Object>> list = areaService.getRootName();
			json.add(list);
		} catch (Exception e) {
			log.debug(e);
		}
		return json.toString();
	}
	/**
	 * 根据所属设备和设备名称查询设备信息
	 */
	public String getDeviceByRootOrName(@RequestParam Map<String,Object> params)
	{
		JSONArray json = new JSONArray();
		try {
			List<Map<String,Object>> list = areaService.getDeviceByRootOrName(params);
			json.add(list);
		} catch (Exception e) {
			log.debug(e);
		}
		return json.toString();
	}
	
	/**
	 * 添加设备区域
	 * @return
	 * @throws IOException 
	 */
	@ResponseBody
	@RequestMapping(value="addDeviceGoArea",method=RequestMethod.POST)
	public void addDeviceGoArea(@RequestBody Map<String,Object> params,HttpServletResponse response) throws IOException
	{
		JSONObject json = new JSONObject();
		try 
		{
			equipInfoService.updateEquipinfos(params);
			
			json.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
		}
		PageUtils.ResponseString(response, json.toString());
	}
	
	
	
	

}
