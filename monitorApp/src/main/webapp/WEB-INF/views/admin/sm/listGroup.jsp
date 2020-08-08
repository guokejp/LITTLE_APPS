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
    <title>分组管理</title>

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
    <link rel="stylesheet" href="views/admin/sm/systemmanage_fzgl.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

    <div class="container-fluid">
        <div class="row">
            <!-- 查询表单 -->
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="search_add_div gui-iframe-header">
                        <div class="pull-left">
                            <label class="search_div_title">分组管理：</label>
                        </div>
                        <div class="input-group search_div">
                            <input type="text" class="form-control input-sm search_input" placeholder="" id="fenzu_manage">
                            <div class="input-group-addon btn btn-primary glyphicon glyphicon-search search_btn" id="query_btn_submit"></div>
                        </div>

                        <div class="add_part add_part_no_cursor">
                            <div class="gui-btn-lgAdd" id="add_group_btn">
                                <span class="glyphicon glyphicon-plus"></span>
                                <span>添加分组</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 内容表格 -->
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="table_div">
                        <!-- 表格内容-->
                        <div class="cgxj_table_div">

                            <!-- mask juhua start -->
                            <div class="mask_juhua_content">
                                <div id="img_juhua_content">
                                    <img src="views/admin/images/resource/wait.jpg" onclick="javascript:void(0);"/>
                                </div>
                            </div>
                            <!-- mask juhua end -->

                            <table class="table table-bordered table-hover table_custom table_custom_cgxj">
                                <thead id="table_head">
                                <tr>
                                    <th>序号</th>
                                    <th>分组</th>
                                    <th>属于管理组</th>
                                    <th>描述</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="table_body">
                                <c:forEach items="${userGroups}" varStatus="i" var="v">
                                    <tr>
                                        <td>${i.index+1 }</td>
                                        <td>${v.name }</td>
                                        <c:choose>
	                                        <c:when test="${v.ismana== '1'}">  
											    <td>管理组</td>  
											</c:when>
											<c:otherwise> 
											   	<td></td>
											</c:otherwise>
										</c:choose>
                                        <td>${v.description }</td>
                                        <td>
                                            <a class="btn gui-btn-modify" href="javascript:void(0)" onclick="updateItem(${v.id })">修改</a>
                                            <a class="btn gui-btn-del" href="javascript:void(0)" onclick="deleteItem(${v.id },'${v.name }')">删除</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-----------以下是模态框信息---------->
    <!-- system modal start -->
    <div id="com-alert" class="modal" style="z-index:9999;display: none;">
        <div class="modal-dialog modal-sm modal-alert">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h5 class="modal-title"><i></i> [Title]</h5>
                </div>
                <div class="modal-body small">
                    <p class="tips-content">[Message]</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok ok" data-dismiss="modal" style="width: 95px;">[BtnOk]</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal" style="width: 95px;">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>
    <!-- system modal end -->
    <!-- 添加/修改 分组  begin -->
    <div class="modal fade addModifyModal" id="add_group_form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content cgxj_mdf_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="add_mdf_title">添加分组</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <div class="form-inline modal-md-form" style="text-align: center;">
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="add_group_name">&nbsp;&nbsp;&nbsp;&nbsp;名称：</label>
                                <input type="text" class="form-control" id="add_group_name" placeholder="">
                            </div>
                        </div>
                         <div class="form-line-box">
                            <div class="form-group">
                                <label for="add_group_manase">管理组：</label>
                                 <select id="add_group_manase" class="form-control">
                                 	<option value="0">否</option>
                                 	<option value="1">是</option>
                                 </select>
                            </div>
                        </div>
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="add_group_desc">&nbsp;&nbsp;&nbsp;&nbsp;描述：</label>
                                <textarea class="form-control" id="add_group_desc" cols="22" rows="5" placeholder=""></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="addGroupSubmitBtn">保存</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 添加分组  end -->
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
<script src="views/admin/sm/systemmanage_fzgl.js"></script>

<script type="text/javascript">
    $(function () {
        var fzglObj = new fzgl();
    });
</script>

</body>
</html>