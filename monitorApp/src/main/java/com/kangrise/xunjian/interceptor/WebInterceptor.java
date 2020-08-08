package com.kangrise.xunjian.interceptor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kangrise.xunjian.admin.sm.entity.ActionLog;
import com.kangrise.xunjian.admin.sm.entity.Userinfo;
import com.kangrise.xunjian.admin.sm.service.IActionLogService;
import com.kangrise.xunjian.utils.AppContext;
import com.kangrise.xunjian.utils.BaseUtiles;

public class WebInterceptor extends HandlerInterceptorAdapter {

	final Log logger = LogFactory.getLog(WebInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws IOException {
		String uri = req.getRequestURI();
		if (uri.equals(req.getContextPath() + "/") || uri.indexOf("/sm/userinfo/login") >= 0 || uri.indexOf("/loginAndout/toView") >= 0
				|| uri.indexOf("/login.jsp") >= 0 || uri.indexOf("/usersRest/checklogin") >= 0 || uri.indexOf("/plogin.jsp") >= 0
				|| uri.indexOf(req.getContextPath() + "/resources/") >= 0
				|| uri.indexOf(req.getContextPath() + "/phone/index/appIndexRest/getVerison") >= 0) {
			return true;

		}
		if (uri.indexOf("userImg") >= 0 || uri.indexOf("public/img") >= 0) {
			return true;
		}
		if (BaseUtiles.getLogInInfo(req) != null) {
			Userinfo u = BaseUtiles.getLogInInfo(req);
			
			ActionLog actionLog = new ActionLog();
			actionLog.setUserName(u.getName());
			actionLog.setRequestIp(getIpAddress(req));
			actionLog.setRequestDate(new Date());
			String url = "http://" + req.getServerName() + ":" + req.getServerPort() + req.getRequestURI();
			String queryurl = req.getQueryString();
			if (null != queryurl) {
				url += "?" + queryurl;
			}
			actionLog.setRequestUrl(url);
			actionLog.setBrowserInfo(req.getHeader("user-agent"));
			IActionLogService actionLogService = AppContext.getBean(IActionLogService.class);
			actionLogService.insertSelective(actionLog);

			return true;
		}

		// 异步请求
		if (req.getHeader("x-requested-with") != null && req.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")
				&& uri.indexOf("/loginAndout/toPage") < 0) {
			resp.setHeader("sessionstatus", "timeout");

			req.setCharacterEncoding("UTF-8");
			resp.setContentType("text/html;charset=UTF-8");

			PrintWriter out = resp.getWriter();
			StringBuilder builder = new StringBuilder();
			builder.append("alert(\"页面过期，请重新登录\");");
			builder.append("window.top.location.href=\"");
			builder.append(req.getContextPath());
			builder.append("/login.jsp");
			builder.append("\";");
			out.print(builder.toString());
			out.close();
			return false;
		}

		this.redirect(req, resp, "/login.jsp");
		return false;
	}

	private void redirect(HttpServletRequest req, HttpServletResponse resp, String jumpUrl) throws IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		StringBuilder builder = new StringBuilder();
		builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");
		builder.append("alert(\"页面过期，请重新登录\");");
		builder.append("window.top.location.href=\"");
		builder.append(req.getContextPath());
		builder.append(jumpUrl);
		builder.append("\";</script>");
		out.print(builder.toString());
		out.close();
	}

	public String getIpAddress(HttpServletRequest request) {
		String ip = request.getHeader("X-Real-IP");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Forwarded-For");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

}
