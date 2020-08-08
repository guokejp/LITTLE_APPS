<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">
    <title>智慧校园视频监控管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- Bootstrap -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">
    <!-- font-awesome -->
    <link href="public/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- frame -->
    <link href="views/admin/css/frame.css" rel="stylesheet">
    <link href="views/admin/css/layui.css" rel="stylesheet">
	<link rel="stylesheet" href="https://a.amap.com/jsapi_demos/static/demo-center/css/demo-center.css"/>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
    	#container {
            height: 100%;
            width: 100%;
        }
    </style>
</head>

<body>
    <div class="layui-layout layui-layout-admin">
        <div class="layui-header header">
            <div class="layui-main">
                <a class="logo" href="index.jsp">
                    <img src="views/admin/images/frame/logo.png" alt="" />
                    <span class="logo-title" style="font-size:11">智慧校园视频监控管理系统</span>
                </a>

                <ul class="header-nav-box list-unstyled">
                    <li class="header-nav-item">
						 <input type="text" class="argumentsContainer" id="spotlocate" value="">
                    </li>
                    <li class="header-nav-item">
                        <div class="dropdown">
                            <a href="javascript:;" class="header-user dropdown-toggle" data-toggle="dropdown"
                               id="dropdownMenu1">
                                <span id="main_name"></span>
                                <span id="main_uid" style="display:none;"></span>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                                <li>
                                    <a class="quit" href="javascript:void(0);" onclick="resetPass()">重置密码</a>
                                    <a class="quit" href="javascript:void(0);" onclick="logOut()">退出</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="layui-side layui-bg-black">
            <div class="layui-side-scroll nano has-scrollbar">
                <div class="main_menu content" id="left_click_menu"></div>
                <div class="pane" style="opacity: 1; visibility: visible;">
                    <div class="slider" style="height: 316px; top: 0px;"></div>
                </div>
            </div>
        </div>

        <div class="layui-body iframe-container">
            <iframe class="admin-iframe" id='rt_frame_conent' name='rt_frame_conent'></iframe>
        </div>
    </div>

    <!--右下侧微信图标开始-->
    <!--<div class="image-custom" id="wx_icon" ondblclick="$('#modal-custom').show();">
        <img src="views/admin/images/icon.png" alt="图片" width="40" height="40"/>
    </div>-->
    <!--右下侧微信图标结束-->

    <!--------------以下是模态框信息-------------->
    <!-- system modal start -->
    <div id="com-alert" class="modal" style="z-index:9999;display: none;">
        <div class="modal-dialog modal-sm modal-alert">
            <div class="modal-content">
                <div class="modal-header">
                   <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">
                        <i></i> [Title]
                    </h5>
                </div>
                <div class="modal-body small">
                    <p class="tips-content">[Message]</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn ok gui-btn-ok" data-dismiss="modal">[BtnOk]</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>
    <!-- system modal end -->
    <!-- 重置密码  begin -->
    <div class="modal fade" id="mdf_pass_form">
        <div class="modal-dialog modal-md">
            <div class="modal-content mdf_pass_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">重置密码</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <form class="form-inline modal-md-form">
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="reset_password">原密码：</label>
                                &nbsp;&nbsp;&nbsp;&nbsp;<input type="password" class="form-control" id="former_password" placeholder="请输入新的密码">
                            </div>
                        </div>
                        <br/>
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="reset_password">新的密码：</label>
                                <input type="password" class="form-control" id="reset_password" placeholder="请输入新的密码">
                            </div>
                        </div>
                        <br/>
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="re_reset_password">再次输入：</label>
                                <input type="password" class="form-control" id="re_reset_password" placeholder="请再次输入新的密码">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="resetPassBtn">保存</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 重置密码  end -->
    <!-- system modal start -->
    <%--<div class="modal-content modal-custom" id="modal-custom">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" id="close-modal" onclick="$(this).parents('#modal-custom').hide();">
                <span aria-hidden="true" style="color:#00A279;font-size:12px;">收起</span><span class="sr-only">Close</span>
            </button>
            <h5 class="modal-title"></h5>
        </div>
        <div class="modal-body small messageBox"></div>
    --%></div>
    <!-- system modal end -->

    <!-- 展示获取位置 begin -->
    <div class="modal fade" id="fjxt_point_equipmentDiagram">
        <div class="modal-dialog modal-llg">
            <div class="modal-content">
            	<div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h5 class="modal-title">系统设备示意图</h5>
                </div>
                <div class="modal-body" style="max-height: 480px !important;overflow-y: auto;padding: 0;">
                    <div id="area" style="padding: 2px 6px;">
                        <div id="container"></div>
                    </div>
                </div>
                
                <div class="modal-footer" id="sureBtn" style="padding: 10px 0;">
                    <button type="button" class="btn gui-btn-ok ok" id="locationOk" data-dismiss="modal">确定</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 展示获取位置 end -->

    <script type="text/javascript">
        var ROOTPATH = '<%=basePath %>';
    </script>
    <script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
    <script src="public/js/bootstrap.min.js"></script>
    <script src="public/js/modalwindow.js"></script>
    <script src="views/admin/js/common.js"></script>
    <script src="views/admin/js/mmenu.js"></script>
    <script src="views/admin/js/main.js"></script>
    <script type="text/javascript" src="https://webapi.amap.com/maps?v=1.4.14&key=0055a4a5e06d4d2978101c4cb915f47a"></script>
    <script>
        var marker, map = new AMap.Map("container", {
            resizeEnable: true,
            center: [116.397428, 39.90923],
            zoom: 13
        });

        // 实例化点标记
        function addMarker(x,y) {
        	clearMarker();
            marker = new AMap.Marker({
                icon: "//a.amap.com/jsapi_demos/static/demo-center/icons/poi-marker-red.png",
                position: [x,y],
                offset: new AMap.Pixel(-13, -30)
            });
            marker.setMap(map);
        }
        
        function clearMarker() {
            if (marker) {
                marker.setMap(null);
                marker = null;
            }
        }
        var clickEventListener = map.on('click', function(e) {
        	addMarker(e.lnglat.getLng(),e.lnglat.getLat());
        	$("#spotlocate").val(e.lnglat.getLng()+","+e.lnglat.getLat());
        });
        

        /*以下2点请勿移动*/
        /*1、showIframeModal方法是irame子页面调用的方法*/
        function showIframeModal(option) {
        	clearMarker();
        	$("#sureBtn").show();
            $('#fjxt_point_equipmentDiagram').modal('show');
            if(option){
            	$("#sureBtn").hide();
            }
            var spotlocate = rt_frame_conent.window.document.getElementById("spotlocate").value;
            console.log(spotlocate);
            var newSpotlocate = spotlocate.split(",");
            var x  = newSpotlocate[0];
            var y = newSpotlocate[1] ;
            marker = new AMap.Marker({
                map: map,
                position: new AMap.LngLat(x, y),   // 经纬度
            });
        }
        /*2、点击调用所有设备子页面方法*/
        $("#locationOk").click(function () {
            rt_frame_conent.window.backParameters();
        });
        
        
    </script>
</body>
</html>
