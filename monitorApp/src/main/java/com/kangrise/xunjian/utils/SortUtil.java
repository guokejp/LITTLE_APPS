package com.kangrise.xunjian.utils;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.util.StringUtils;

import com.sun.org.apache.bcel.internal.generic.NEW;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class SortUtil
{
	/**
	 * 
	 * @param ja json数组
	 * @param field 要排序的key
	 * @param isAsc 是否升序
	 */
	@SuppressWarnings("unchecked")
	public static void sort(JSONArray ja, final String field, boolean isAsc) {
		Collections.sort(ja, new Comparator<JSONObject>() 
		{
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			public int compare(JSONObject o1, JSONObject o2)
			{
				Object f1 = o1.get(field);
				Object f2 = o2.get(field);
				if(field.contains("time")||field.contains("date")){//时间类型
					try{
						Date date1 = format.parse(o1.getString(field));
						Date date2 = format.parse(o2.getString(field));
						if (date1.getTime() < date2.getTime()){ //根据date进行排序  
							return -1;
						} else if(date1.getTime() > date2.getTime()){
							return 1;  
						}else{
							return 0;  
						}
			              
					} catch (Exception e){
						e.printStackTrace();
					}
				}
				if (f1 instanceof Number && f2 instanceof Number){ //数值类型
					return ((Number) f1).intValue() - ((Number) f2).intValue();
				}else{
					return f1.toString().compareTo(f2.toString());
				}
			}
		});
		if (!isAsc) {
			Collections.reverse(ja);
		}
	}
	/**
	 * 去重复
	 * @param taskJsonArray
	 * @return
	 */
	public static JSONArray repetition(JSONArray taskJsonArray)
	{
		JSONArray task= new JSONArray();  
		@SuppressWarnings("unchecked")
		Iterator<JSONObject> it=taskJsonArray.iterator(); 
		while(it.hasNext())
		{  
			  JSONObject a=it.next();  
			  if(task.contains(a))
			  {  
				  it.remove();  
			  }  
			  else
			  {  
				  task.add(a);  
			  }  
		} 
		return task;
	}
	/**
	 * 去重复
	 * @param taskJsonArray
	 * @return
	 */
	public static List<Map<String,Object>> repetitionList(List<Map<String,Object>> taskList)
	{
		List<Map<String,Object>> task= new ArrayList<Map<String,Object>>();  
		Iterator<Map<String,Object>> it=taskList.iterator(); 
		while(it.hasNext())
		{  
			  Map<String,Object> a=it.next();  
			  if(task.contains(a))
			  {  
				  it.remove();  
			  }  
			  else
			  {  
				  task.add(a);  
			  }  
		} 
		return task;
	}
	/**
	 * 去重
	 * @param args
	 */
	public static List<Map<String,Object>> removeEqual(List<Map<String,Object>> list)
	{
		//userids
		List<Map<String,Object>> task= new ArrayList<Map<String,Object>>();  
		
		Iterator<Map<String,Object>> it = list.iterator(); 
		while(it.hasNext())
		{  	
			  Map<String,Object> map = it.next(); 
			  boolean falg = true;//是否有相等的值
			  for(Map<String,Object> params:task)
			  {
				  boolean a = map.get("id").equals(params.get("id"));
				  boolean b = map.get("time").equals(params.get("time"));
				  
				  if(a&&b)
				  {  
					  falg = false;
				  }  
			  }  
			  if(falg)
			  {
				  task.add(map);  
			  }
		} 
		return task;
	}
	/**
	 * 去重
	 * @param args
	 */
	public static List<Map<String,Object>> removeEqual2(List<Map<String,Object>> list)
	{
		//userids
		List<Map<String,Object>> task= new ArrayList<Map<String,Object>>();  
		
		Iterator<Map<String,Object>> it = list.iterator(); 
		while(it.hasNext())
		{  	
			  Map<String,Object> map = it.next(); 
			  boolean falg = true;//是否有相等的值
			  for(Map<String,Object> params:task)
			  {
				  boolean a = map.get("mainid").equals(params.get("mainid"));
				  boolean b = map.get("time").equals(params.get("time"));
				  
				  if(a&&b)
				  {  
					  falg = false;
				  }  
			  }  
			  if(falg)
			  {
				  task.add(map);  
			  }
		} 
		return task;
	}
	
	public static void main(String[] args) {
		String[] uid = {"10","20"};
		for(String i:uid)
		{
			System.out.println(i);
		}
	}
}
