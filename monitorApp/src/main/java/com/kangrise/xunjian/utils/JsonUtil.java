package com.kangrise.xunjian.utils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

/**
 * json转换
 * @project inspection
 *
 * @author gyw  2017-9-19
 *
 * @class JsonUtil.java
 */
public class JsonUtil
{
	 /**
     * 根据List获取到对应的JSONArray
     * @param list
     * @return
     */
    public static JSONArray getJSONArrayByList(List<?> list){
        JSONArray jsonArray = new JSONArray();
        if (list==null ||list.isEmpty()) {
            return jsonArray;//nerver return null
        }

        for (Object object : list) {
            jsonArray.add(object);
        }
        return jsonArray;
    }
    
    /**
     * 根据JSONArray获取到对应的List
     * @param list
     * @return
     */
    @SuppressWarnings("unchecked")
	public static List<Map<String,Object>> getListByJsonarry(JSONArray jsonArray)
    {
    	Map<String,Object> map = new HashMap<String, Object>();
		List<Map<String,Object>> list = JSONArray.toList(jsonArray,map,new JsonConfig());
		return list;
    }
    
}
