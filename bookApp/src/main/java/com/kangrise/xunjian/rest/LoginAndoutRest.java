package com.kangrise.xunjian.rest;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kangrise.xunjian.admin.equip.mapper.EquipInfoMapper;
import com.kangrise.xunjian.utils.BaseUtiles;


/**
 * 
 * @author Administrator
 *
 */

@Controller
@RequestMapping("loginAndout")
public class LoginAndoutRest {

	final Log log = LogFactory.getLog(this.getClass());
	
	@Autowired
	private EquipInfoMapper equipInfoMapper;
	
	/*
	 * 页面跳转方法
	 * @param request
	 * @param response
	 * @param path
	 * @return
	 */
	@RequestMapping(value = "toPage", method = RequestMethod.GET)
	public ModelAndView toPage(HttpServletRequest request,HttpServletResponse response,@RequestParam String path)
	{
		if(BaseUtiles.allEquipInfoList == null){
			new Thread(){
				@Override
				public void run() {
					List<Map<String, Object>> all = equipInfoMapper.getAllEquipType();
					BaseUtiles.allEquipInfoList = all;
				}
			}.start();
		}
		
		ModelAndView anv = new ModelAndView();
		if (path.indexOf("?") > 0) {
			String paramStr = path.substring(path.indexOf("?")+1);
			String[] params = paramStr.split("&");
			for (String param:params) {
				String paramName = param.split("=")[0];
				String paramValue = param.split("=")[1];
				anv.addObject(paramName,paramValue);
			}
			Map<String,String[]> map = request.getParameterMap();
			if(map!=null && map.size()>1){
				for(String key:map.keySet()){
					if("path".equals(key)){
						continue;
					}
					String value = map.get(key)[0];
					anv.addObject(key,value);
				}
			}
			anv.setViewName(path.substring(0,path.indexOf("?")));
		} else {
			anv.setViewName(path);
		}
		
		return anv;   
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @param response
	 * @return
	 * @throws ParseException
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) throws ParseException
	{
		ModelAndView anv = new ModelAndView();
		HttpSession session = request.getSession();
	
		session.setAttribute("loginAccount", null);

		anv.setViewName("redirect:/login.jsp");
		
		return anv;
	}
	
	
	
}
