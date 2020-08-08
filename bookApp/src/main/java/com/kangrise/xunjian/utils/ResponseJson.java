package com.kangrise.xunjian.utils;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import org.springframework.util.StringUtils;

public class ResponseJson {
	//接口调用状态
	private boolean status;
	//返回码
	private int returnCode;
	//返回说明
	private String msg;
	//返回数据
	private Object data;

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public int getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(int returnCode) {
		this.returnCode = returnCode;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}
	
	/**
	 * 将value空值（null） 转为""
	 * @param map
	 */
	public static void delNull(Map<String,Object> map){
		boolean b = map.containsValue(null);
		if(b){
			Set<String> keys = map.keySet();
	        Iterator<String> it = keys.iterator();
	        while (it.hasNext()){
	             String key=it.next();
	            boolean a = StringUtils.isEmpty(map.get(key));
	            if(a){
	            	map.put(key, "");
	            }
            }
        }
	}
}
