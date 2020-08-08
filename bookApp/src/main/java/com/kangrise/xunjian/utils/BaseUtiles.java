package com.kangrise.xunjian.utils;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.kangrise.xunjian.admin.equip.entity.EquipInfo;
import com.kangrise.xunjian.admin.equip.resFidleColumn.EquipFieldColumn;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;

public class BaseUtiles {
	private static final Log logger = LogFactory.getLog(BaseUtiles.class);
	public static volatile List<Map<String, Object>> allEquipInfoList;
	
	
	/**
	 * 获得登录的userinfo信息,当前使用session，分布式时改为cookie+redis；登录方法同步修改
	 * @param request
	 * @return
	 */
	public static Userinfo getLogInInfo(HttpServletRequest request){
		HttpSession session = request.getSession();
		Userinfo loginUser = null;
		if(session != null){
			loginUser = (Userinfo) session.getAttribute("loginAccount");
		}
		/*Userinfo loginUser = new Userinfo();
		user.setId((long) 1);
		user.setName("XXX");*/
		return loginUser;
	}
	
	/**
	 * 得到设备要显示的字段表，特别是胶带机和分拣机
	 * 根据dbid，或是map中key值拿取
	 * @return Map<String, EquipFieldColumn>
	 */
	public static Map<String, EquipFieldColumn> getEquipInfoColumnsMap(Long rootid){
		Map<String, EquipFieldColumn> retMap = new HashMap<String, EquipFieldColumn>();
		
		String srootid = rootid.toString();
		String mapKeyTable = srootid+"table";
		String mapKeyInfo = srootid+"info";
		Map<String, EquipFieldColumn> map = SysLoadUtils.getEquipFieldColumnMap();
		if(map.get(mapKeyTable) == null){
			retMap.put("0table", map.get("0table"));
		}else{
			retMap.put(mapKeyTable, map.get(mapKeyTable));
		}
		if(map.get(mapKeyInfo) == null){
			retMap.put("0info", map.get("0info"));
		}else{
			retMap.put(mapKeyInfo, map.get(mapKeyInfo));
		}
		
		return retMap;
	}
	/**
	 * 生成设备tree格式的工具方法，用于前端tree结构
	 * @param listmap
	 * @param pid
	 * @return
	 */
	public static List<Map<String, Object>> makeTreemap(List<Map<String, Object>> listmap,Integer pid) {
		List<Map<String, Object>> list = null;
		for (Map<String, Object> map : listmap) {
			Integer mapPid = Integer.valueOf(map.get("pid").toString());
			Integer id = Integer.valueOf(map.get("id").toString());
			Integer rootid = Integer.valueOf(map.get("rootid").toString());
			Integer dkindid = Integer.valueOf(map.get("dkindid").toString());
			if(mapPid.intValue() == pid.intValue()){
				Map<String, Object> treeMap = new HashMap<String, Object>();
				treeMap.put("text", map.get("name"));
				treeMap.put("id", id);
				treeMap.put("dkindname", map.get("dkindname"));
				treeMap.put("rootid", rootid);
				treeMap.put("dkindid", dkindid);
				treeMap.put("selectable", true);
				List<Map<String, Object>> childMapList = makeTreemap(listmap,id);
				if(childMapList != null ){
					if(treeMap.get("nodes") != null){
						((List<Object>) treeMap.get("nodes")).addAll(childMapList);
					}else{
						List<Map<String, Object>> newlist = new ArrayList<Map<String,Object>>();
						newlist.addAll(childMapList);
						treeMap.put("nodes", newlist);
					}
				}
				if(list == null){
					list = new ArrayList<Map<String,Object>>();
				}
				list.add(treeMap);
			}
		}
		return list;	
	}
	
	/**
	 * 
	 * @param Msg
	 * @return
	 */
	public static JSONObject successDo(String Msg){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("statusCode", "1");
		jsonObject.put("statusMsg", "success");
		jsonObject.put("Msg", Msg);
		return jsonObject;
		
	}
	
	/**
	 * 
	 * @param Msg
	 * @return
	 */
	public static JSONObject errorDo(String Msg){
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("statusCode", "0");
		jsonObject.put("statusMsg", "error");
		jsonObject.put("Msg", Msg);
		return jsonObject;
	}
	
	/**
	 * 根据当前id查询所有的父级节点
	 * @使用 List<EquipInfo> list2 = equipInfoService.selectAll();//查询所有菜单
	 *		List<String> data = BaseUtiles.getPname(list2,3l);
	 * @param list
	 * @param id
	 * @return
	 */
	public static List<String> getPname(List<EquipInfo> list,Long id)
	{
		List<String> data = new ArrayList<String>();
		recursion(id,list,data);
		return data;
	}
	//所有设备的父级节点--递归
	public static void recursion(Long pid,List<EquipInfo> eList,List<String> data)
	{
		String name = "";
		for(EquipInfo equipInfo:eList)
		{
			if(pid.equals(equipInfo.getId()))
			{
				name = equipInfo.getName();
				data.add(name);
				recursion(equipInfo.getPid(),eList,data);
			}
		}
	}
	
	
	/**
     * 生成MD5密文
     * @param password 原始密码
     * @return pwd MD5加密后的密码
     */
	public static String makeMD5(String password) {
		MessageDigest md;
		try {
			// 生成一个MD5加密计算摘要
			md = MessageDigest.getInstance("MD5");
			// 计算md5函数
			md.update(password.getBytes());
			// digest()最后确定返回md5 hash值，返回值为8为字符串。因为md5 hash值是16位的hex值，实际上就是8位的字符
			// BigInteger函数则将8位的字符串转换成16位hex值，用字符串来表示；得到字符串形式的hash值
			String pwd = new BigInteger(1, md.digest()).toString(16);
			return pwd;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}
}
