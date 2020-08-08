package com.kangrise.xunjian.utils;

public class Constant 
{
	public final static String DROP_DOWN = "全部";//下拉框
	
	//分配巡检
	public final static String ALLOT_STATE1 = "新增";
	public final static String ALLOT_STATE2 = "已驳回";
	
	
	//设备种类
	public final static String DEVICE_POLLING_2 = "巡检设备";
	public final static String DEVICE_IT_1= "信息技术";
	public final static String DEVICE_OTHER_0 = "其他设备";
	
	public final static String ADD_MEG = "添加成功！";
	public final static String SET_MEG = "修改成功！";
	public final static String DEL_MEG = "删除成功！";
	
	public final static String HANDLE_MSG = "操作失败！";

	public final static String KIND_NOT_EMPTY = "请先删除设备种类下的设备";
	
	public static void main(String[] args) {
		System.out.println(Constant.DEVICE_IT_1);
	}
}
