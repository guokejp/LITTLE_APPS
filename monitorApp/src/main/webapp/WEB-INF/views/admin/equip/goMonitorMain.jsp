<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'goMonitorMain.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/equip/demo.css">
<style type="text/css">
*{
	margin: 0 auto;
	padding: 0;
	list-style: none;
	border: 0;
	text-decoration: none;
	font-family: "microsoft yahei";
}

input{
	border: 0;
	margin: 0;
	padding: 0;
}
</style>
</head>

<body>
    	<div style="">
		<div class="wrap">
			<div class="all">               
                <div class="con">                	
                    <div class="con_r">
                        <div id="divPlugin" class="plugin"></div>
                        <div class="con_r_wrap">
                        	<div class="con_r_l">
                        		<h1><span>登录</span></h1>
                        		<div class="denglX">
                        		<p><span>IP地址</span><input id="loginip" type="text" class="txt" value="192.168.1.10" /></p>
                        		<p><span>端口号</span><input id="port" type="text" class="txt" value="80" /></p>
                        		<p><span>用户名</span><input id="username" type="text" class="txt" value="admin" /></p>
                        		<p><span>密码</span><input id="password" type="password" class="txt" value="12345" /></p>
                        		<p><span>设备端口号(可选参数)</span><input id="deviceport" type="text" class="txt" value="8000" /></p>
                        		<p>
                        			<span>窗口分割数</span>
                        			<select class="sel2" onchange="changeWndNum(this.value);">
										<option value="1">1x1</option>
										<option value="2" selected>2x2</option>
										<option value="3">3x3</option>
										<option value="4">4x4</option>
									</select>
                        		</p>                        			
                        		</div>
                        		<div class="anN_zu">
                        			<input type="submit" name="" id="clickLogin" value="登录" onclick="clickLogin();"/>
                        			<input type="button" name="" id="clickLogout" value="退出" onclick="clickLogout();" />
                        			<input type="button" name="" id="clickGetDeviceInfo" value="获取基本信息" onclick="clickGetDeviceInfo();" />
                        		</div>
                        		<div class="denglX">
	                        		<p>
	                        			<span>已登录设备</span>
	                        			<select id="ip" class="sel" onchange="getChannelInfo();"></select>
	                        		</p> 
	                        		<p>
	                        			<span>通道列表</span>
	                        			<select id="channels" class="sel"></select>
	                        		</p>                          			
                        		</div>
                        		<div style="display: none">
                        			<select id="channels" class="sel"></select>
                        			<select id="streamtype" class="sel">
										<option value="1">主码流</option>
										<option value="2">子码流</option>
										<option value="3">第三码流</option>
										<option value="4">转码码流</option>
									</select>
                        		</div>
                        		
                        		
                        	</div>
                        	<div class="con_r_r">
                        		<h1><span>操作信息</span></h1>
                        		<div id="opinfo" class="opinfo"></div>
                        		<h1><span>事件回调信息</span></h1>
                        		<div id="cbinfo" class="cbinfo"></div>
                        	</div>
	                        <div class="con_r_b">
	                            <div class="con_r_b_t">
	                                <div class="zuo">
	                                    <ul>
	                                    	<form action="" method="post">
		                                        <li>
	                                                <input type="button" value="变焦+" onmousedown="PTZZoomIn()" onmouseup="PTZZoomStop()"/>
	                                                <input type="hidden" name="" value="" />
		                                        </li>
		                                        <li>
	                                                <input type="hidden" name="" value="" />
	                                                <input type="button" value="变倍+" onmousedown="PTZZoomIn()" onmouseup="PTZZoomStop()"/>
		                                        </li>
		                                        <li>	                                            
		                                            <input type="hidden" name="" value="" />
		                                            <input type="button" value="光圈+" onmousedown="PTZZoomIn()" onmouseup="PTZZoomStop()"/>
		                                        </li>
		                                        <li>
	                                                <input type="hidden" name="" value="" />
	                                                <input type="button" value="开始录像" onclick="clickStartRecord();" "/>
		                                        </li>
	                                    	</form>
	                                    </ul>
	                                </div>
	                                <div class="zhong">
	                                    <div class="zhong_con">
		                               	 	<form action="" method="post">
			                                   	<ul>
			                                   	 	<li><input type="button" value="左上" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="上" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="右上" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="左" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="自动" style="border-radius: 100%;" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="右" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="左下"  onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();" /></li>
			                                   	 	<li><input type="button" value="下" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	 	<li><input type="button" value="右下" onmousedown="mouseDownPTZControl(5);" onmouseup="mouseUpPTZControl();"  /></li>
			                                   	</ul>
			                                   	<input class="zhuaT" type="button" value="抓图" onclick="clickCapturePic();"  />
		                                   	</form>	                                   	 
	                                    </div>
	                                </div>
	                                <div class="you">
	                                    <ul>
	                                        <form action="" method="post">
		                                        <li>
	                                                <input type="button" value="变焦-" onmousedown="PTZFocusIn()" onmouseup="PTZFoucusStop()"/>
	                                                <input type="hidden" name="" value="" />
		                                        </li>
		                                        <li>
	                                                <input type="hidden" name="" value="" />
	                                                <input type="button" value="变倍-" onmousedown="PTZFocusIn()" onmouseup="PTZFoucusStop()"/>
		                                        </li>
		                                        <li>	                                            
		                                            <input type="hidden" name="" value="" />
		                                            <input type="button" value="光圈-" onmousedown="PTZFocusIn()" onmouseup="PTZFoucusStop()"/>
		                                        </li>
		                                        <li>
	                                                <input type="hidden" name="" value="" />
	                                                <input type="button" value="停止录像"  onclick="clickStopRecord();" />
		                                        </li>
	                                    	</form>
	                                    </ul>
	                                </div>
	                            </div>
	                            <div class="con_r_b_c">
	                                <ul>
	                                    <li>
	                                        <form>
	                                            <input type="hidden" name="" value="" />
	                                            <input id="starttime" type="text" class="txt" value="2013-12-10 00:00:00" />
	                                        </form>
	                                    </li>
	                                    <li>
	                                        <form>
	                                            <input type="hidden" name="" value="" />
	                                            <input type="button" value="全屏" onclick="clickFullScreen()"/>
	                                        </form>
	                                    </li>
	                                    <li style="margin-right: 0;">
	                                        <form>
	                                            <input type="hidden" name="" value="" />
	                                            <!-- <input style="background: url(img/jk_47.png) no-repeat center center;" type="submit" value=" "/> -->
	                                            <input id="endtime" type="text" class="txt" value="2013-12-11 23:59:59" />
	                                        </form>
	                                    </li>
	                                </ul>
	                            </div>
	                            <div class="con_r_b_b">
	                                <ul>
	                                    <li>
	                                        <form>
	                                            <input type="hidden" name="" value="" />
	                                            <input type="button" value="开始预览" onclick="clickStartRealPlay();"/>
	                                        </form>
	                                    </li>
	                                    <li>
	                                        <form>
	                                            <input type="hidden" name="" value="" />
	                                            <input  type="button" value="停止预览" onclick="clickStopRealPlay();" />
	                                        </form>
	                                    </li>
	                                </ul>
	                            </div>
	                        </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    	</div>
</div>
</body>
<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/equip/webVideoCtrl.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/equip/demo.js"></script>
</html>
