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
<!-- Bootstrap -->
		<link href="public/css/bootstrap.min.css" rel="stylesheet">
		<!-- font-awesome -->
		<link href="public/font-awesome/css/font-awesome.min.css" rel="stylesheet">
		<!-- bootstrap-treeview -->
		<link rel="stylesheet" href="public/css/bootstrap-treeview.css">
		<!-- page -->
		<link rel="stylesheet" href="public/css/simplePagination.css">
		<!-- date picker -->
		<link rel="stylesheet" href="public/css/bootstrap-datepicker.css">
		 <!-- custom css -->
		<link rel="stylesheet" href="views/admin/css/common.css">
		<link rel="stylesheet" href="views/admin/equip/devicemanage_fjxt.css">

</head>

<body>
	<div class="left">
		<img alt="" src="${pageContext.request.contextPath}/views/admin/home/home.jpg" style='width: 100%;height: 100%;'>
	</div>
</body>
<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/home/home.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/bootstrap-treeview.js"></script>
<script src="public/js/simplePagination.js"></script>
<script src="public/js/bootstrap-datepicker.min.js"></script>
<script src="public/js/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<script src="public/js/bootbox.min.js"></script>
<script src="public/js/modalwindow.js"></script>
<script src="views/admin/js/common.js"></script>
<script src="public/utils/util.js"></script>
</html>
