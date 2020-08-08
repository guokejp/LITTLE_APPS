<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>设备种类管理</title>

    <!-- Bootstrap -->
    <link href="public/css/bootstrap.min.css" rel="stylesheet">
    <!-- frame -->
    <link href="views/admin/css/frame.css" rel="stylesheet">
    <!-- bootstrap-treeview -->
    <link rel="stylesheet" href="public/css/bootstrap-treeview.css">
    <!-- page -->
    <link rel="stylesheet" href="public/css/simplePagination.css">
    <!-- custom css -->
    <link rel="stylesheet" href="views/admin/css/common.css">
    <link rel="stylesheet" href="views/admin/sm/systemmanage_kind.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <!--主体内容开始-->
    <div class="container-fluid">
        <div class="row">
            <!-- 查询表单 -->
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="search_add_div gui-iframe-header">
                        <div class="pull-left search-title-box">
                            <span class="search-title">设备种类名称：</span>
                        </div>
                        <div class="input-group search_div">
                            <input type="text" class="form-control input-sm search_input" id="fenzu_manage">
                            <div class="input-group-addon btn btn-primary glyphicon glyphicon-search search_btn" id="query_btn_submit"></div>
                        </div>

                        <div class="add_part add_part_no_cursor">
                            <div class="gui-btn-lgAdd" id="add_kind_btn" data-toggle="modal">
                                <span class="glyphicon glyphicon-plus"></span>
                                <span>添加设备种类</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 统计数据 -->
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="total-box">
                        <span class="total_item" id="table_title"></span>
                    </div>
                </div>
            </div>

            <!-- 表格内容 -->
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="deviceKindTable cgxj_table_div">
                        <!-- mask juhua start -->
                        <div class="mask_juhua_content">
                            <div id="img_juhua_content"><img src="views/admin/images/resource/wait.jpg" onclick="javascript:void(0);" /></div>
                        </div>
                        <!-- mask juhua end -->

                        <table class="table table-hover table_custom table_custom_cgxj">
                            <thead>
                            <tr>
                                <th>种类名称</th>
                                <th>描述</th>
                                <th style="width: 120px;">操作</th>
                            </tr>
                            </thead>
                            <tbody id="table_body"></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--主体内容开始结束-->

    <!----------以下是模态框信息----------->
    <!-- system modal start -->
    <div id="com-alert" class="modal" style="z-index:9999;display: none;" >
        <div class="modal-dialog modal-sm modal-alert">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h5 class="modal-title"><i></i> [Title]</h5>
                </div>
                <div class="modal-body small">
                    <p class="tips-content">[Message]</p>
                </div>
                <div class="modal-footer" >
                    <button type="button" class="btn gui-btn-ok ok" data-dismiss="modal">[BtnOk]</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>
    <!-- system modal end -->

    <!-- 添加/修改 设备种类  begin -->
    <div class="modal fade addDeviceModal" id="add_kind_form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="add_mdf_title">添加设备种类</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <form class="form-inline modal-md-form" style="margin: 20px auto;text-align: center;">
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="add_kind_name">设备种类名称：</label>
                                <input type="text" class="form-control" id="add_kind_name" placeholder="">
                            </div>
                        </div>
                        <div class="">
                            <div class="form-group">
                                <label for="add_kind_desc">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    描述：</label>
                                <textarea class="form-control" id="add_kind_desc" cols="22" rows="2" placeholder=""></textarea>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="addKindSubmitBtn">保存</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 添加设备种类  end -->
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="public/js/bootstrap.min.js"></script>
<!-- bootstrap-treeview script -->
<script src="public/js/bootstrap-treeview.js"></script>
<!-- page js -->
<script src="public/js/simplePagination.js"></script>

<!-- custom js -->
<script src="public/js/modalwindow.js"></script>
<script src="views/admin/js/common.js"></script>
<script src="views/admin/sm/systemmanage_kind.js"></script>

<script type="text/javascript"><%--
var height = $(window.parent.document.getElementById("rt_frame_conent")).height();
$('html').height(height+60); --%>
$(function(){
    var kindObj = new kind();
});
</script>

</body>
</html>