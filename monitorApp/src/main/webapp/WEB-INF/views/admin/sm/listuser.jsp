<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
    + request.getServerName() + ":" + request.getServerPort()
    + path + "/";
%>

<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户管理</title>

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
    <link rel="stylesheet" href="views/admin/sm/systemmanage_yhgl.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <div class="container-fluid">
        <!-- 主体内容开始 -->
        <div class="row">
            <!-- 查询表单 -->
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="device_content device_content_normalxj gui-iframe-header">
                        <form class="form-inline header_ctl_panel queryForm">
                            <div class="form-group">
                                <label for="user_name">用户姓名：</label>
                                <input type="text" class="form-control" id="user_name" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="user_role">用户角色：</label>
                                <input type="email" class="form-control" id="user_role" placeholder="">
                            </div>
                            <button type="button" class="btn gui-btn-search" id="query_btn_submit">查询</button>
                        </form>
                        <div class="add_part add_part_no_cursor">
                            <div class="gui-btn-lgAdd" id="add_group_btn">
                                <span class="glyphicon glyphicon-plus"></span>
                                <span>添加用户</span>
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
                                <thead>
                                <tr>
                                    <th>登录账号</th>
                                    <th>用户姓名</th>
                                    <th>性别</th>
                                    <th>用户电话</th>
                                    <th>用户分组</th>
                                    <th>用户邮箱</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="table_body">
                                <c:forEach items="${userinfos }" var="userinfo">
                                    <tr>
                                        <td>
                                            <c:out value="${userinfo.loginaccount }"></c:out>
                                        </td>
                                        <td>
                                            <c:out value="${userinfo.name }"></c:out>
                                        </td>
                                        <td>
                                            <c:out value="${userinfo.sex }"></c:out>
                                        </td>
                                        <td>
                                            <c:out value="${userinfo.phone }"></c:out>
                                        </td>
                                        <td>
                                            <c:out value="${userinfo.group.name }"></c:out>
                                        </td>
                                        <td>
                                            <c:out value="${userinfo.email }"></c:out>
                                        </td>
                                        <td>
                                            <a class="btn gui-btn-modify" href="javascript:void(0)" onclick="updateUser(this,${userinfo.id})">修改</a>
                                            <a class="btn gui-btn-details" href="javascript:void(0)" onclick="resetPassword(${userinfo.id})">重置密码</a>
                                            <a class="btn gui-btn-del" href="javascript:void(0)" onclick="deleteUser(${userinfo.id},'${userinfo.name}')">删除</a>
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
        <!-- 主体内容 -->
    </div>

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
    <!--上传图片开始-->
    <div id="com-alert_image" class="modal"
         style="z-index:9999;display: none;">
        <form enctype="multipart/form-data">
            <div style="margin-top: 10px; margin-left: 180px">
                <input id="specialrecommendfile" type="file" size="30" name="file">
                <button type="button" onclick="UploadSpecialRecommendPic()" class="btn btn-warning btn-lg">上传</button>
                <input type=hidden class="span5" id="specialRecommendPic" name="riIndexPic">
            </div>
        </form>
    </div>
    <div class="modal fade" id="add_image_form">
        <div class="modal-dialog modal-md">
            <div class="modal-content cgxj_mdf_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="add_avatar_title">上传图片</h5>
                </div>
                <div class="modal-body base-modal-body" style="padding:0;">
                    <form method="post" enctype="multipart/form-data" id="formUpload">
                        <div style="width:100%;text-align: center;" id="large">
                            <img alt="头像" src="" id="img" style="margin:10px;width: 160px;height: 160px;">
                        </div>
                        <div style="margin:20px 120px;">
                            <input type="hidden" value="upload" name="action"/> <input
                                type="hidden" value="" name="id" id="sys_id"/> <input
                                class="input-file uniform_on" id="file" name="file" type="file">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="UploadPic">保存</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!--上传图片jies-->

    <!-- 添加用户  begin -->
    <div class="modal fade userManagementModal" id="add_group_form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content cgxj_mdf_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="add_mdf_title">添加用户</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <div class="" style="margin: 0 150px;">
                        <form class="form-inline modal-md-form" style="text-align: left;">
                            <div class="form-line-box">
                                <div class="form-group">
                                    <label for="add_mdf_login_user">登录账户：</label>
                                    <input type="text" class="form-control" id="add_mdf_login_user" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="add_mdf_login_pass">登录密码：</label>
                                    <input type="password" class="form-control" id="add_mdf_login_pass" placeholder="">
                                </div>
                            </div>
                            <div class="form-line-box">
                                <div class="form-group">
                                    <label for="add_mdf_user_name">用户姓名：</label>
                                    <input type="text" class="form-control" id="add_mdf_user_name" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="add_mdf_user_sex">用户性别：</label>
                                    <select id="add_mdf_user_sex" class="form-control"></select>
                                </div>
                            </div>
                            <div class="form-line-box">
                                <div class="form-group">
                                    <label for="add_mdf_user_phone">用户电话：</label>
                                    <input type="text" class="form-control" id="add_mdf_user_phone" placeholder="">
                                </div>
                                <div class="form-group">
                                    <label for="add_mdf_user_email">用户邮箱：</label>
                                    <input type="text" class="form-control" id="add_mdf_user_email" placeholder="">
                                </div>
                            </div>
                            <div class="form-line-box">
                                <div class="form-group">
                                    <label for="add_mdf_user_group">用户分组：</label>
                                    <select id="add_mdf_user_group" class="form-control"></select>
                                </div>
                            </div>
                             <div class="form-line-box" style="display:none">
                             
                                <div class="form-group">
                                    <label for="add_mdf_user_group">用户角色：</label>
                                    <select id="add_mdf_user_role" class="form-control"></select>
                                </div>
                            </div>
                            <div class="form-line-box"  style="display:none">
                                <div class="form-group">
                                    <label for="add_mdf_user_email">登录权限：</label>
                                    <div class="checkbox">
                                        <label>
                                            <input class="gui-magic-checkbox all-checkbox" type="checkbox" id="allow_pc" checked="checked">
                                            <label style="padding-left: 20px;" for="allow_pc">允许登录电脑端</label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-line-box"  style="display:none">
                                <div class="form-group">
                                    <label for="add_mdf_user_email">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <div class="checkbox">
                                        <label>
                                            <input class="gui-magic-checkbox all-checkbox" type="checkbox" id="allow_phone" checked="checked">
                                            <label style="padding-left: 20px;" for="allow_phone">允许登录手机端</label>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-line-box"  style="display:none">
                                <div class="form-group" id="xjsb_show">
                                    <label for="add_mdf_user_email">巡检设备：</label>
                                    <div class="checkbox">
                                        <c:forEach items="${deviceKinds }" var="dk">
                                            <div id="xjsb_${dk.id }">
                                        <span>
                                            <input class="gui-magic-checkbox all-checkbox" name="fixtype" value="${dk.id }" type="checkbox" id="allow_sb${dk.id }" checked="checked">&nbsp;&nbsp;
                                            <label style="padding-left: 20px;" for="allow_sb${dk.id }">${dk.name }</label>
                                        </span>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="addMdfUserSubmitBtn">保存</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 添加用户  end -->

    <!-- 重置密码  begin -->
    <div class="modal fade" id="mdf_pass_form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content mdf_pass_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">重置密码</h5>
                </div>
                <div class="modal-body base-modal-body">

                    <form class="form-inline modal-md-form" style="text-align: center;">
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="reset_password">新的密码：</label>
                                <input type="password" class="form-control" id="reset_password" placeholder="请输入新的密码">
                            </div>
                        </div>
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
</body>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<script type="text/javascript" src="public/js/jquery.form.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="public/js/bootstrap.min.js"></script>
<!-- bootstrap-treeview script -->
<script src="public/js/bootstrap-treeview.js"></script>
<!-- page js -->
<script src="public/js/simplePagination.js"></script>

<!-- custom js -->
<script src="public/js/modalwindow.js"></script>
<script src="views/admin/js/common.js"></script>
<script src="views/admin/sm/systemmanage_yhgl.js"></script>

<script type="text/javascript">
    $(function () {
        var yhglObj = new yhgl();
    });
</script>

</body>
</html>
