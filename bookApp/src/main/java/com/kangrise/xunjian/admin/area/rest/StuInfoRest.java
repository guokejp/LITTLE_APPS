package com.kangrise.xunjian.admin.area.rest;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.kangrise.xunjian.admin.area.entity.StuInfo;
import com.kangrise.xunjian.admin.area.service.IStuInfoService;
import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.entity.DeviceKind;
import com.kangrise.xunjian.admin.sm.entity.Role;
import com.kangrise.xunjian.admin.sm.exception.LoginaccountExistException;
import com.kangrise.xunjian.admin.sm.service.IDeviceKindService;
import com.kangrise.xunjian.utils.BaseUtiles;
import com.kangrise.xunjian.utils.PageUtils;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("area/stuinfo")
public class StuInfoRest {

	@ExceptionHandler(LoginaccountExistException.class)
	@ResponseBody
	public Map<String, Object> hadleLoginaccountExistException(Exception exception) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("status", false);
		map.put("memo", "登录账号已存在！");
		return map;
	}
	
	@Autowired
	private IStuInfoService StuInfoService;
	

	/**
	 * 获取用户信息
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("getUser/{id}")
	@ResponseBody
	public StuInfo getStuInfo(@PathVariable long id) {
		return StuInfoService.selectByPrimaryKey(id);
	}
	
	@RequestMapping("getStuByNum/{num}")
	@ResponseBody
	public StuInfo getStuByNum(@PathVariable String num) {
		return StuInfoService.selectByNum(num);
	}

	/**
	 * 用户管理列表页面
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("listUser")
	public void listStuInfo(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		StuInfo condition = new StuInfo();
		List<StuInfo> userinfos = StuInfoService.listStuInfo(condition);
		request.setAttribute("userinfos", userinfos);
		request.getRequestDispatcher(
				"/loginAndout/toPage?path=admin/area/regionmanage_sbqy").forward(request,
				response);
	}
	
	/**
	 * 获取所有用户 json格式
	 * @return
	 */
	@RequestMapping("listUsreJson")
	@ResponseBody
	public List<StuInfo> listStuInfoJson() {
		List<StuInfo> StuInfos = StuInfoService.listStuInfo();
		return StuInfos;
	}

	/**
	 * 用户管理列表页面
	 * 
	 * @param request
	 * @param response
	 * @param page
	 * @param pageSize
	 * @throws ServletException
	 * @throws IOException
	 */
	@RequestMapping("searchUser")
	public void searchStuInfo(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(required = false) String name,
			@RequestParam(required = false) String rolename)
			throws ServletException, IOException {
		StuInfo condition = new StuInfo();
		if (name != null && !"".equals(name)){
			condition.setName(name);
		}
		/*
		 * condition.setRole(new Role()); if (rolename != null && !"".equals(rolename)){
		 * condition.getRole().setRolename(rolename); }
		 */
			
		List<StuInfo> StuInfos = StuInfoService.listStuInfo(condition);
		request.setAttribute("StuInfos", StuInfos);
		request.getRequestDispatcher(
				"/loginAndout/toPage?path=admin/sm/listuser").forward(request,
				response);
	}

	/**
	 * 添加用户
	 * 
	 * @param StuInfo
	 * @return {status:true,memo:"错误信息"}
	 * @throws LoginaccountExistException
	 *             账号已存在
	 */
	@RequestMapping(value = "addUser", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addUser(HttpServletRequest request,StuInfo StuInfo)
			throws LoginaccountExistException {
		Map<String, Object> map = new HashMap<String, Object>();
		if (StuInfoService.addUser(StuInfo,request)) {
			map.put("status", true);
		} else {
			map.put("status", false);
			map.put("memo", "抱歉，出现了一个未知的技术错误，请稍后重试");
		}
		return map;
	}

	/**
	 * 删除用户
	 * 
	 * @param id
	 * @return {status:true,memo:"错误信息"}
	 */
	@RequestMapping("deleteUser/{id}")
	@ResponseBody
	public Map<String, Object> deleteUser(@PathVariable long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(id == 1){
			map.put("status", false);
			map.put("memo", "系统默认用户，不能删除");
		}else{
			if (StuInfoService.deleteUser(id)) {
				map.put("status", true);
			} else {
				map.put("status", false);
				map.put("memo", "抱歉，出现了一个未知的技术错误，请稍后重试");
			}
		}
		return map;
	}

	/**
	 * 更新用户
	 * 
	 * @param StuInfo
	 * @return {status:true,memo:"错误信息"}
	 */
	@RequestMapping("updateUser")
	@ResponseBody
	public Map<String, Object> updateUser(StuInfo StuInfo) {
		Map<String, Object> map = new HashMap<String, Object>();
		if (StuInfoService.updateUser(StuInfo)) {
			map.put("status", true);
		} else {
			map.put("status", false);
			map.put("memo", "抱歉，出现了一个未知的技术错误，请稍后重试");
		}
		return map;
	}
	/**
	 * 重置用户
	 * 
	 * @param StuInfo
	 * @return {status:true,memo:"错误信息"}
	 */
	@RequestMapping("reset")
	@ResponseBody
	public Map<String, Object> resetUser(StuInfo StuInfo,@RequestParam String formerpasswd) {
		Map<String, Object> map = new HashMap<String, Object>();
		//查询用户信息
		StuInfo u = StuInfoService.selectByPrimaryKey(StuInfo.getId());
		String former = BaseUtiles.makeMD5(formerpasswd);//原密码
		
		return map;
	}
	/**
	 * 查询人员通过权限id
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="getUserByRoleId/{roleId}",method=RequestMethod.POST)
	public void getUserByRoleId(@PathVariable Long roleId,HttpServletResponse response) throws IOException
	{
		JSONObject json = new JSONObject();
		try 
		{
			StuInfo u = new StuInfo();
			//u.setRoleid(roleId);
			Role r = new Role();
			r.setId(roleId);
			//u.setRole(r);
			List<StuInfo> list = StuInfoService.listStuInfo(u);
			json.put("list", list);
			
			json.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
		}
		PageUtils.ResponseString(response, json.toString());
	}
	/**
	 * 查询所有人员
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value="getUserByRoleId",method=RequestMethod.POST)
	public void getUser(HttpServletResponse response) throws IOException
	{
		JSONObject json = new JSONObject();
		try 
		{
			List<StuInfo> list = StuInfoService.listStuInfo();
			json.put("list", list);
			
			json.put("success", true);
		} catch (Exception e) {
			e.printStackTrace();
			json.put("success", false);
		}
		PageUtils.ResponseString(response, json.toString());
	}
	/**
	 * 根据用户姓名模糊搜索用户（搜索单个用户）
	 * @param name
	 * @return
	 */
	@RequestMapping("getUserByName")
	@ResponseBody
	public StuInfo getUserByName(String name) {
		if (name == null || name.trim().equals("")) {
			return null;
		} else {
			return StuInfoService.getStuInfoByName(name);
		}
	}
	
	@RequestMapping("login")
	public void login(HttpServletRequest request,HttpServletResponse response ,StuInfo StuInfo) throws IOException {
		//StuInfo.setRole(new Role());
		//StuInfo.setLoginpasswd(BaseUtiles.makeMD5(StuInfo.getLoginpasswd()));
		List<StuInfo> selectList =  StuInfoService.selectByAccAndPwd(StuInfo);
		if(selectList.size() > 0){
			StuInfo vo = selectList.get(0);
			HttpSession session = request.getSession();
			session.setAttribute("loginAccount",vo);
			response.getWriter().print(BaseUtiles.successDo("登录成功"));
		}else{
			response.getWriter().print(BaseUtiles.errorDo("用户名或密码错误"));
		}
		
	}
	
	@RequestMapping("logout")
	public ModelAndView logout(HttpServletRequest request,HttpServletResponse response) throws IOException {
		ModelAndView anv = new ModelAndView();
		HttpSession session = request.getSession();
		session.setAttribute("loginAccount", null);
		anv.setViewName("redirect:/login.jsp");
		return anv;
	}
	/**
	 * 上传图片
	 * @param response
	 * @param request
	 * @param file
	 * @param StuInfo
	 */
	@RequestMapping("upload")
	public void upload(HttpServletResponse response,HttpServletRequest request,@RequestParam(value = "file", required = false) MultipartFile file
			,StuInfo StuInfo)
	{
		JSONObject json = new JSONObject();
		try {
			if(file != null){
				String fileName = "user_"+StuInfo.getId();
				String path = request.getSession().getServletContext().getRealPath("userImg");
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
				StuInfo.setUrlimage("/userImg/"+realname);
			}
			StuInfoService.updateByPrimaryKeySelective(StuInfo);
			json.put("success", true);
			PageUtils.ResponseString(response, json.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@RequestMapping("getSmallImg")
	public void getSmallImg(HttpServletRequest request,HttpServletResponse response,@RequestParam String url) throws IOException{
		
		OutputStream out = response.getOutputStream();		
		String strDirPath = request.getSession().getServletContext().getRealPath("/");
		String path = strDirPath+url;
		
		String filename = (url.split(url))[url.split(url).length - 1];
		response.setHeader("content-disposition", "attachment;filename="
				+ filename);
		
		
		
		out.flush();
		out.close();
	}
}
