<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- Bootstrap -->
<link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
<!-- frame -->
<!--<link href="${pageContext.request.contextPath}/views/admin/css/frame.css" rel="stylesheet">-->
<!-- bootstrap-treeview -->
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap-treeview.css">-->
<!-- page -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/simplePagination.css">
<!-- custom css -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/home/home.css">
<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css" />

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style>
html,body,#container {
	height: 100%;
	width: 100%;
}

.amap-icon img,.amap-marker-content img {
	width: 25px;
	height: 34px;
}

.marker {
	position: absolute;
	top: -20px;
	right: -118px;
	color: #fff;
	padding: 4px 10px;
	box-shadow: 1px 1px 1px rgba(10, 10, 10, .2);
	white-space: nowrap;
	font-size: 12px;
	font-family: "";
	background-color: #25A5F7;
	border-radius: 3px;
}

.input-card {
	width: 18rem;
	z-index: 170;
}

.input-card .btn {
	margin-right: .8rem;
}

.input-card .btn:last-child {
	margin-right: 0;
}
</style>
</head>

<div id="container"></div>

<script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.14&key=您申请的key值"></script>
<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<script type="text/javascript">
	var ROOTPATH = '<%=basePath %>';
	// 实例化点标记
	clearMarker();
	var marker,map;

	$.ajax({
		url : ROOTPATH+"/equip/equipRest/getAllEquip",
		data:{},
		dataType: 'json',
		type:'post',
		success:function(data){
			$.each(data.list,function(i,obj){
				var position = obj.spotlocate;
				console.log(obj);
				if(position){
					var status;
					if(obj.istatus == 10){
						status = '<b style="color:blue">正常</b>';
					}else if(obj.istatus == 20){
						status = '<b style="color:red">异常</b>';
					}
					var content = 	"名称:"+obj.name+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp状态:"+status+"<br>"
									+"安装位置:"+obj.ibrand+"<br>"
					var x = position.split(",")[0];
					var y = position.split(",")[1];
					
					if(!map){
						map = new AMap.Map("container", {
							resizeEnable : true,
							center : [ x, y ],
							zoom : 13
						});
					}
					
					
					
					
					
					addMarker(x, y,content);
					
				}
				
			})
		},
		error:function(){
			
		}
		
	})
	
	
	
	
	
	
	function addMarker(x, y,content) {
		marker = new AMap.Marker({
			icon : "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png",
			position : [ x, y ],
			offset : new AMap.Pixel(-13, -30)
		});
		marker.setMap(map);
		if(content){
			marker.setLabel({
				 offset: new AMap.Pixel(20, 20),  //设置文本标注偏移量
		        content: "<div class='info'>"+content+"</div>", //设置文本标注内容
		        direction: 'right' //设置文本标注方位
		    });
		}
	}

	function clearMarker() {
		if (marker) {
			marker.setMap(null);
			marker = null;
		}
	}
</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="${pageContext.request.contextPath}/public/js/bootstrap.min.js"></script>
<!--bootstrap-treeview script -->
<script src="${pageContext.request.contextPath}/public/js/bootstrap-treeview.js"></script>
<!-- page js -->
<script src="${pageContext.request.contextPath}/public/js/simplePagination.js"></script>
<!-- date time ctl -->
<script src="${pageContext.request.contextPath}/public/js/bootstrap-datepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/public/js/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- custom js -->
<script src="${pageContext.request.contextPath}/public/js/modalwindow.js"></script>
<script src="${pageContext.request.contextPath}/public/js/bootbox.min.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/js/common.js"></script>
<script src="${pageContext.request.contextPath}/public/utils/util.js"></script>
<script src="${pageContext.request.contextPath}/public/js/echarts.min.js"></script>

</body>
</html>
