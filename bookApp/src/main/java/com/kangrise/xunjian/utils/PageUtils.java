package com.kangrise.xunjian.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.util.StringUtils;

public class PageUtils 
{
	/**
	 * Object->String
	 * @param params
	 * @param name
	 * @return
	 */
	public static String GetParamByNameStr(Map<String, Object> params, String name)
	{
		String value = "";
		if(!StringUtils.isEmpty(params.get(name)))
		{
			value = params.get(name).toString();
		}
		return (value == null) ? "" : value;
	}
	/**
	 * Object->Int
	 * @param params
	 * @param name
	 * @return
	 */
	public static int GetParamByNameInt(Map<String, Object> params, String name)
	{
		String value = "";
		if(!StringUtils.isEmpty(params.get(name)))
		{
			value = params.get(name).toString();
		}
		return (value == null || value.isEmpty()) ? 0 : Integer.parseInt(value);
	}
	/**
	 * limit 数据
	 * @param params
	 * @return
	 */
	public static Map<String, Object> GetParam(Map<String, Object> params)
	{
		int page = PageUtils.GetParamByNameInt(params, "page");
		int rows = PageUtils.GetParamByNameInt(params, "rows");
		page = page * rows;
		params.put("page", page);
		params.put("rows", rows);
		return params;
	}
	/**
	 * 总页数计算
	 * @param params
	 * @return
	 */
	public static int GetPages(int rows,int total)
	{
		int num = total % rows;
		if(num>0) num = total / rows + 1;
		else num = total / rows;
		return num;
	}
	/**
	 * 返回内容到页面
	 * @param response
	 * @param data
	 * @throws IOException
	 */
	public static void ResponseString(HttpServletResponse response, String data) throws IOException
	{
		try {
			// 设置浏览器信息
			response.setContentType("text/json; charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			data = data.replace(":null",":\"\"");
			// 返回给客户端
			PrintWriter out = response.getWriter();
			out.print(data);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
}
