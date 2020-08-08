package com.kangrise.xunjian.admin.equip.rest;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kangrise.xunjian.admin.equip.entity.EquipDetail;
import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.admin.equip.resFidleColumn.EquipFieldColumn;
import com.kangrise.xunjian.admin.equip.service.IEquipDetailService;
import com.kangrise.xunjian.admin.equip.service.impl.IEquipInfoService;
import com.kangrise.xunjian.utils.BaseUtiles;
import com.kangrise.xunjian.utils.PageUtils;

@Controller
@RequestMapping("equip/equipRest")
public class EquipRest {
	
	@Autowired
	private IEquipInfoService equipInfoService;
	
	@Autowired
	private IEquipDetailService equipDetailService;
	
	
	
	@RequestMapping("equipMain")
	public void equipMain(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/loginAndout/toPage?path=admin/equip/devicemanage_fjxt").forward(request, response);
	}
	@RequestMapping("getEquipTree")
	public void getEquipTree(HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		List<Map<String, Object>> list = equipInfoService.getEquipTree();
		JSONArray jArr = JSONArray.fromObject(list);
		response.getWriter().write(jArr.toString());

	}
	
	@RequestMapping("installTableAndInfodataHead/{rootid}")
	public void installTableAndInfodataHead(HttpServletRequest request,HttpServletResponse response,@PathVariable Long rootid) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		Map<String, EquipFieldColumn> map = BaseUtiles.getEquipInfoColumnsMap(rootid);
		JSONObject jsonmap = JSONObject.fromObject(map);
		List<Map<String, Object>>  maps = BaseUtiles.allEquipInfoList;
		System.out.println();
		response.getWriter().write(BaseUtiles.successDo(jsonmap.toString()).toString());
	}
	
	
	@RequestMapping("addEquip")
	public void addEquip(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		response.setContentType("text/json;charset=utf-8");
		if(reqMap.get("pid") == null || reqMap.get("name") == null){
			response.getWriter().print(BaseUtiles.errorDo("没有选择到父节点").toString());
		}else{
			JSONObject nodeObj = equipInfoService.addEquipTree(reqMap,request);
			if(nodeObj != null){
				if(nodeObj.get("errMsg") != null){
					response.getWriter().print(BaseUtiles.errorDo(nodeObj.get("errMsg").toString()).toString());
					return;
				}
				response.getWriter().print(BaseUtiles.successDo(nodeObj.toString()).toString());
			}else{
				BaseUtiles.errorDo("添加失败");
			}
			
		}
		
	}
	
	@RequestMapping("updateEquip")
	public void updateEquip(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		JSONObject json = new JSONObject();
		
		if(reqMap.get("id") == null || reqMap.get("name") == null){
			
		}else{
			/*if(Integer.valueOf(reqMap.get("id").toString()) == 1){
				response.getWriter().print(BaseUtiles.errorDo("系统默认，不能删除").toString());
				return;
			}*/
			EquipInfo equip = new EquipInfo();
			equip.setId(Long.valueOf(reqMap.get("id").toString()));
			equip.setName(reqMap.get("name").toString());
			equipInfoService.updateByPrimaryKeySelective(equip);
			
			response.getWriter().print((BaseUtiles.successDo("操作成功")).toString());
		}
		
	}
	
	@RequestMapping("deleteEquip")
	public void deleteEquip(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		JSONObject json = new JSONObject();
		
		if(reqMap.get("id") == null){
			response.getWriter().print(BaseUtiles.errorDo("没有选择到节点").toString());
		}else{
			if(Integer.valueOf(reqMap.get("id").toString()) == 1){
				response.getWriter().print(BaseUtiles.errorDo("系统默认，不能删除").toString());
				return;
			}
			/** * 删除它的属于tableleaf的子类设备的详情数据*/
			//查询它的tableleaf子类ids
			String ids = equipInfoService.selectTableLeafIdsByPid(Long.valueOf(reqMap.get("id").toString()));
			
			//逻辑删除它的tableleaf子类对应的设备维护表数据
			//maintainService.logicDeleteMaintainByequipIds(ids);
			//逻辑删除详情表中数据
			//equipDetailService.deleteByInfoId(ids);
			//逻辑删除它的属于tableleaf的子类设备
			equipInfoService.deleteByPrimaryKeyOfPid(Long.valueOf(reqMap.get("id").toString()));
			//逻辑删除自己
			equipInfoService.logicDeleteByPrimaryKey(Long.valueOf(reqMap.get("id").toString()));
			response.getWriter().print(BaseUtiles.successDo("操作成功"));
		}
		
	}
	@RequestMapping("deleteEquipTable")
	public void deleteEquipTable(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		JSONObject json = new JSONObject();
		Long id = Long.valueOf(reqMap.get("id").toString());
		if(reqMap.get("id") == null){
			response.getWriter().print(BaseUtiles.errorDo("没有选择到节点").toString());
		}else{
			/** * 删除它的属于tableleaf的子类设备的详情数据*/
			//逻辑删除详情表中数据
			//equipDetailService.deleteByInfoId(reqMap.get("id").toString());
			//逻辑删除它对应的设备维护表数据
			//maintainService.logicDeleteMaintainByequipIds(reqMap.get("id").toString());
			//逻辑删除自己
			equipInfoService.logicDeleteByPrimaryKey(id);
			response.getWriter().print(BaseUtiles.successDo("操作成功"));
		}
		
	}
	
	@RequestMapping("getEquipTableByPid")
	public void getEquipTableByPid(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		//JSONObject json = new JSONObject();
		
		if(reqMap.get("id") == null){
			response.getWriter().print(BaseUtiles.errorDo("没有选择到节点").toString());
		}else{
			Long pid = Long.valueOf(reqMap.get("id").toString());
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pid", pid);
			if(reqMap.get("key") != null && !"".equals(reqMap.get("key").toString())){
				map.put("key", reqMap.get("key").toString());
			}
			
			JSONObject jsonObject = new JSONObject();
			
			Integer page = Integer.valueOf(reqMap.get("page").toString());
			Integer rows = Integer.valueOf(reqMap.get("rows").toString());
			//PageHelper.startPage(page, rows);
			map.put("page", page-1);
			map.put("rows", rows);
			List<EquipInfo> list2 = equipInfoService.getEquipTableLeafByParams(map);
			map = PageUtils.GetParam(map);
			List<EquipInfo> selectlist = equipInfoService.getEquipTableLeafByParams2(map);
			JSONArray json = new JSONArray();
			json.addAll(selectlist);
			jsonObject.put("list",json);
			jsonObject.put("pages", PageUtils.GetPages(rows, list2.size()));//总页数
			jsonObject.put("pageNum", page);//当前页
			response.getWriter().print(jsonObject.toString());
			//PageInfo<EquipInfo> pageInfo = new PageInfo<EquipInfo>(selectlist);
			//response.getWriter().print(JSONObject.fromObject(pageInfo).toString());
		}
		
	}
	@RequestMapping("addEquipTable")
	public void addEquipTable(@RequestParam(value = "file", required = false) MultipartFile file, 
			HttpServletRequest request,HttpServletResponse response,EquipInfo equip,@RequestParam Map<String, Object> map) throws Exception{
		JSONObject json = new JSONObject();
		equip.setCreateTime(new Date());
		equip.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
		equipInfoService.insertSelective(equip);
		String fileName = "equipTable"+equip.getId();
		
		//获取后缀名
		if(file != null){
			String path = request.getSession().getServletContext().getRealPath("/equipImg");
			File dir = new File(path);
			if(!dir.exists()){
				dir.mkdir();
			}
			String oldName  = file.getOriginalFilename();
			int dot = oldName.lastIndexOf('.');   
	        String doName = oldName.substring(dot);
	        String realname = fileName+doName;
			File newfile = new File(dir, realname);
			file.transferTo(newfile);
			equip.setInfourl("equipImg/"+realname);
		}
		
		equipInfoService.updateByPrimaryKeySelective(equip);
		
		//将设备本身当做部件插入详情
		EquipDetail ed = new EquipDetail();
		ed.setInfoid(equip.getId());
		ed.setIsdel(0);
		ed.setName(equip.getName());
		ed.setDetailidentify(equip.getIdentify());
		ed.setSpecific(equip.getIspecific());
		ed.setDunit(equip.getUnit());
		ed.setAmount(1);
		ed.setOneself(1);
		ed.setCreateTime(new Date());
		ed.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
		equipDetailService.insertSelective(ed);
		
		//添加一个其他配件
		EquipDetail ed2 = new EquipDetail();
		ed2.setInfoid(equip.getId());
		ed2.setIsdel(0);
		ed2.setName("其他配件");
		ed2.setDunit(equip.getUnit());
		ed2.setAmount(1);
		ed2.setOneself(2);
		ed2.setCreateTime(new Date());
		ed2.setCreatorId(BaseUtiles.getLogInInfo(request).getId());
		equipDetailService.insertSelective(ed2);
		
		response.getWriter().print(BaseUtiles.successDo("").toString());
	}
	
	
	@RequestMapping("editEquipTable")
	public void editEquipTable(@RequestParam(value = "file", required = false) MultipartFile file, 
			HttpServletRequest request,HttpServletResponse response,EquipInfo equip) throws Exception{
		JSONObject json = new JSONObject();
		
		if(file != null){
			String fileName = "equipTable"+equip.getId();
			String path = request.getSession().getServletContext().getRealPath("/equipImg");
			File dir = new File(path);
			if(!dir.exists()){
				dir.mkdir();
			}
			String oldName  = file.getOriginalFilename();
			int dot = oldName.lastIndexOf('.');   
	        String doName = oldName.substring(dot);
	        String realname = fileName+doName;
			File newfile = new File(dir, realname);
			if(newfile.exists()){
				newfile.delete();
			}
			file.transferTo(newfile);
			equip.setInfourl("equipImg/"+realname);
		}
		equipInfoService.updateByPrimaryKeySelective(equip);
		
		response.getWriter().print(BaseUtiles.successDo("").toString());
	}
	
	@RequestMapping("getEquipTableBydkkind")
	public void getEquipTableBydkkind(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		JSONArray jarr = null;
		
		List<EquipInfo> list = equipInfoService.getEquipTableBydkkind(reqMap);
		if(list != null){
			jarr = JSONArray.fromObject(list);
		}else{
			jarr = new JSONArray();
		}
		
		response.getWriter().print(BaseUtiles.successDo(jarr.toString()).toString());
	}
	
	@RequestMapping("getEquipTreeLeafBydkkind")
	public void getEquipTreeLeafBydkkind(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		JSONArray jarr = null;
		
		List<EquipInfo> list = equipInfoService.getEquipTreeLeafBydkkind(reqMap);
		if(list != null){
			jarr = JSONArray.fromObject(list);
		}else{
			jarr = new JSONArray();
		}
		
		response.getWriter().print(BaseUtiles.successDo(jarr.toString()).toString());
	}
	
	@RequestMapping("getIfirm")
	public void getIfirm(HttpServletResponse response)
	{
		JSONObject json = new JSONObject();
		try {
			List<String> list = equipInfoService.getIfirm();
			
			json.put("list", list);
			PageUtils.ResponseString(response, json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	

	@RequestMapping("getEquipKindInfo")
	@ResponseBody
	public List<Map<String, Object>> getEquipKindInfo(HttpServletResponse response){
			List<Map<String, Object>> list = equipInfoService.getEquipKindInfo(null);
			return list;
	}
	
	/**
	 * 根据条件查询设备
	 * @param equipInfo
	 * @param response
	 * @return
	 */
	@RequestMapping("selectByKeys")
	@ResponseBody
	public List<EquipInfo> selectByKeys(EquipInfo equipInfo,HttpServletResponse response){
			List<EquipInfo> list = equipInfoService.selectByKeys(equipInfo);
			return list;
	}
	
	@RequestMapping("selectTableLeafByPid")
	@ResponseBody
	public List<Map<String, Object>> selectTableLeafByPid(Long pid){
			List<Map<String, Object>> list = equipInfoService.selectTableLeafByPid(pid);
			return list;
	}
	
	//借出
	
	@RequestMapping("bowrbook")
	@ResponseBody
	public Map<String, Object> bowrbook(EquipInfo equip){
		 Integer bowrbook = equipInfoService.bowrbook(equip);
			 Map<String, Object> map = new HashMap<String, Object>();
			 map.put("success", "true");
			 return map;
	}
	
	
	@RequestMapping("backBook")
	@ResponseBody
	public Map<String, Object> backBook(EquipInfo equip){
		 Integer bowrbook = equipInfoService.backbook(equip);
			 Map<String, Object> map = new HashMap<String, Object>();
			 map.put("success", "true");
			 return map;
	}
	
	@RequestMapping("goMonitorMain")
	public void goMonitorMain(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/loginAndout/toPage?path=admin/equip/goMonitorMain").forward(request, response);
	}
	
	@RequestMapping("goMonitorChunchu")
	public void goMonitorChunchu(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/loginAndout/toPage?path=admin/equip/goMonitorSet").forward(request, response);
	}
	
	@RequestMapping("goEquipMap")
	public void goEquipMap(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/loginAndout/toPage?path=admin/equip/equipMap").forward(request, response);
	}
	
	@RequestMapping("getAllEquip")
	public void getAllEquip(HttpServletRequest request,HttpServletResponse response,@RequestParam Map<String, Object> reqMap) throws Exception{
		response.setContentType("text/html;charset=utf-8");
			Map<String, Object> map = new HashMap<String, Object>();
			JSONObject jsonObject = new JSONObject();
			List<EquipInfo> list2 = equipInfoService.getEquipTableLeafByParams(map);
			JSONArray json = new JSONArray();
			json.addAll(list2);
			jsonObject.put("list",json);
			response.getWriter().print(jsonObject.toString());
		
		
	}
	@RequestMapping("equipMainJygh")
	public void equipMainJygh(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException{

		request.getRequestDispatcher("/loginAndout/toPage?path=admin/equip/devicemanage_jygh").forward(request, response);
	}
	
	
	
}
