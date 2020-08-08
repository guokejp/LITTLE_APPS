<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>区域管理</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/public/css/bootstrap.min.css" rel="stylesheet">
    <!-- frame -->
    <link href="${pageContext.request.contextPath}/views/admin/css/frame.css" rel="stylesheet">
    <!-- bootstrap-treeview -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/bootstrap-treeview.css">
    <!-- page -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/css/simplePagination.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/serach-select/combo.select.css">
    <!-- custom css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/common.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/area/regionmanage_devregion.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!-- 主体内容开始 -->
    <div class="container-fluid LR_Cancel_Iframe">
        <div class="row">
            <!--左侧-->
            <div class="col-sm-2">
                <div class="gui-content-left" id="manage_zhsb_btn">
                    <div class="row">
                        <div class="col-sm-4" style="text-align: center;">
                            <div onclick="$this.region_manage(1);">
                                <button class="btn gui-btn-add">添加</button>
                            </div>
                        </div>
                        <div class="col-sm-4" style="text-align: center;">
                            <div onclick="$this.region_manage(2);">
                                <button class="btn gui-btn-modify">修改</button>
                            </div>
                        </div>
                        <div class="col-sm-4" style="text-align: center;">
                            <div onclick="$this.region_manage(3);">
                                <button class="btn gui-btn-del">删除</button>
                            </div>
                        </div>
                    </div>
                    <div class="device_tree device_tree_qygl" id="tree"></div>
                </div>
            </div>
            <!--右侧-->
            <div class="col-sm-10">
                <div class="gui-content-right">
                    <div class="device_content device_content_qygl">
                        <div class="search_add_div gui-iframe-header">
                            <div class="input-group search_div">
                                <input type="text" class="form-control input-sm search_input" placeholder="设备名称 / 编号">
                                <div class="input-group-addon btn btn-primary glyphicon glyphicon-search search_btn"
                                     onclick="$this.search_info(true);"></div>
                            </div>

                            <div class="add_part add_part_no_cursor">
                                <ul class=" clearfix" id="btnadddevice">
                                	<li>
                                        <div class="gui-btn-lgAdd" onclick="$this.makeImages();">
                                            <span class="glyphicon glyphicon-th"></span>
                                            <span>生成所有二维码</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="gui-btn-lgAdd" onclick="$this.downLoadAllImgs();">
                                            <span class="glyphicon glyphicon-download-alt"></span>
                                            <span>下载所有二维码</span>
                                        </div>
                                    </li>
                                    <!--<li>
                                        <div class="gui-btn-lgAdd" onclick="$this.add_new_dev();">
                                            <span class="glyphicon glyphicon-random"></span>
                                            <span>分配区域</span>
                                        </div>
                                    </li>-->
                                </ul>
                            </div>
                        </div>

                        <div class="table_div">
                            <!-- 表格内容-->
                            <table class="table table-bordered table-hover table_custom table_custom_qygl">
                                <thead>
                                <tr>
                                    <th>序号</th>
                                    <th>设备名称</th>
                                    <th>设备编号</th>
                                    <th>所属设备</th>
                                    <th style="min-width:200px;max-height: 280px;">操作</th>
                                </tr>
                                </thead>
                                <tbody id="table_body"></tbody>
                                <tfoot id="tfoot_body_empty"></tfoot>
                                <tfoot id="tfoot_body">
                                <tr>
                                    <td colspan="5">
                                        <!-- 分页 -->
                                        <div class="table_page_div pull-right">
                                            <div class="pagination"></div>
                                        </div>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 主体内容结束 -->

    <!--------以下是弹窗内容-------->
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
                    <button type="button" class="btn gui-btn-ok ok" data-dismiss="modal">[BtnOk]</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>
    <!-- system modal end -->
    <!-- 添加区域-->
    <div class="modal fade" id="region_manage_add">
        <div class="modal-dialog modal-md">
            <div class="modal-content region_manage_modal_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h5 class="modal-title">添加区域</h5>
                </div>
                <div class="modal-body">
                    <form class="form-inline modal-md-form">
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="addregion">添加区域：</label>
                                <input type="text" class="form-control" id="addregion" placeholder="">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" onclick="$this.region_control();">添加设备</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 修改区域-->
    <div class="modal fade" id="region_manage_set">
        <div class="modal-dialog modal-md">
            <div class="modal-content region_manage_modal_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h5 class="modal-title">修改区域</h5>
                </div>
                <div class="modal-body">
                    <form class="form-inline modal-md-form">
                        <div class="form-line-box" style="margin-bottom: 20px;">
                            <div class="form-group">
                                <label for="oldregion">原区域：</label>
                            </div>
                            <div class="form-group">
                                <div class="combo-select-box">
                                    <select type="text" style="width:196px;" class="form-control" id="oldregion" placeholder=""></select>
                                </div>
                            </div>
                        </div>
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="renameregion">修改为：</label>
                                <input type="text" class="form-control" id="renameregion" placeholder="">
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" onclick="$this.region_control();">修改</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 删除区域-->
    <div class="modal fade" id="region_manage_del">
        <div class="modal-dialog modal-md">
            <div class="modal-content region_manage_modal_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h5 class="modal-title">删除区域</h5>
                </div>
                <div class="modal-body">
                    <form class="form-inline modal-md-form">
                        <div class="form-line-box">
                            <div class="form-group">
                                <label for="delregion">删除区域：</label>
                                <select type="text" class="form-control" id="delregion" placeholder="" style="width: 196px;"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" onclick="$this.region_control();">删除</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 基本信息 -->
    <div class="modal fade sbqyBasiModal" id="fjxt_baseinfo">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fjxt_modal_baseinfo_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">基本信息</h5>
                </div>
                <div class="modal-body">
                    <table class="table table-bordered fjxt_baseinfo_left_table gui-table-box" id="fjxt_baseinfo_allinfo">
                        <tr>
                            <td class="table-label"><label>设备所属：</label></td>
                            <td width="30%" colspan="3"><p id="fjxt_basedevsbss" name="sbss"></p></td>
                        </tr>

                        <tr>
                            <td class="table-label"><label>设备名称：</label></td>
                            <td width="30%"><p id="fjxt_basedevname" name="name"></p></td>
                            <td class="table-label" width="20%"><label for="adddevname">设备编号：</label></td>
                            <td><p id="fjxt_basedevidentify" name="identify"></p></td>
                        </tr>

                        <tr>
                            <td class="table-label"><label for="adddevname">设备厂商：</label></td>
                            <td><p id="fjxt_basedevifirm" name="ifirm"></p></td>
                            <td class="table-label"><label for="adddevname">品牌：</label></td>
                            <td><p id="fjxt_basedevibrand" name="ibrand"></p></td>
                        </tr>

                        <tr>
                            <td class="table-label"><label for="adddevname">单位：</label></td>
                            <td><p id="fjxt_basedevunit" name="unit"></p></td>
                            <td class="table-label"><label for="adddevname">数量：</label></td>
                            <td><p id="fjxt_basedevamount" name="amount"></p></td>
                        </tr>

                        <tr>
                            <td class="table-label"><label for="adddevname">规格型号：</label></td>
                            <td><p id="fjxt_basedevispecific" name="ispecific"></p></td>
                            <td class="table-label"><label for="adddevname">状态：</label></td>
                            <td><p id="fjxt_basedevistatus" name="istatus"></p></td>
                        </tr>

                        <tr>
                            <td class="table-label"><label for="adddevname">上线时间：</label></td>
                            <td><p id="fjxt_basedevonlinedate" name="onlinedate"></p></td>
                            <td class="table-label"><label for="adddevname">到期时间：</label></td>
                            <td><p id="fjxt_basedevbaddate" name="baddate"></p></td>
                        </tr>

                        <tr>
                            <td class="table-label"><label for="adddevname">最后维修时间：</label></td>
                            <td><p id="fjxt_basedevrepairdate" name="repairdate"></p></td>
                            <td class="table-label"><label for="adddevname">区域：</label></td>
                            <td><p id="fjxt_basedevarea_name" name="area_name"></p></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="adddevname">最后更换时间：</label></td>
                            <td colspan="3"><p id="fjxt_basedevreplacedate" name="replacedate"></p></td>
                        </tr>

                        <!-- 添加内容 -->
                        <tbody id="fjxt_baseinfo_allinfo_center" style="border-top:none;"></tbody>
                        <tr>
                            <td class="table-label"><label for="adddevname">备注：</label></td>
                            <td colspan="3"><p id="fjxt_basedevinfonote" name="infonote">
                        </tr>
                        <tr>
                            <td class="table-label"><label for="adddevname">图片：</label></td>
                            <td colspan="3"><img alt="" src="" width="70" height="70" id="fjxt_basedevinfourl">
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 系统 - 修改部件信息 -->
    <div class="modal fade" id="fjxt_modify">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fjxt_modal_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">修改信息<span id="set_menus"></span></h5>
                </div>
                <div class="modal-body fjxt_modal_body">
                    <table class="table table-bordered fjxt_baseinfo_left_table gui-table-box" id="fjxt_mdf_adddev_update_data">
                        <tr>
                            <td class="table-label"><label>设备名称：</label></td>
                            <td width="30%"><input type="text" class="form-control" id="fjxt_mdf_adddevname" disabled name="name"></td>
                            <td class="table-label"><label for="">设备编号：</label></td>
                            <td width="30%"><input type="text" class="form-control" id="fjxt_mdf_adddevidentify" disabled name="identify"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="">设备厂商：</label></td>
                            <td width="30%"><input type="text" class="form-control" id="fjxt_mdf_adddevifirm" disabled name="ifirm"></td>
                            <td class="table-label" width="20%"><label for="">品牌：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevibrand" disabled name="ibrand"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="">单位：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevunit" disabled name="unit"></td>
                            <td class="table-label"><label for="">数量：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevamount" disabled name="amount"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_mdf_adddevispecific">规格型号：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevispecific" disabled name="ispecific"></td>
                            <td class="table-label"><label for="fjxt_mdf_adddevistatus">状态：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevistatus" disabled name="istatus"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_mdf_adddevonlinedate">上线时间：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevonlinedate" disabled name="onlinedate"></td>
                            <td class="table-label"><label for="fjxt_mdf_adddevbaddate">到期时间：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevbaddate" disabled name="baddate"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_mdf_adddevrepairdate">最后维修时间：</label></td>
                            <td><input type="text" class="form-control" id="fjxt_mdf_adddevrepairdate" disabled name="repairdate"></td>
                            <td class="table-label"><label for="fjxt_mdf_adddevarea_id">区域：</label></td>
                            <td><select type="text" class="form-control" id="fjxt_mdf_adddevarea_id" name="area_id"></select></td>
                            <!--<div id="addPartForEachPart"></div>-->
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_mdf_adddevinfonote">备注：</label></td>
                            <td colspan="3"><input type="text" class="form-control" id="fjxt_mdf_adddevinfonote" disabled name="infonote"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_mdf_adddevinfourl">图片：</label></td>
                            <td colspan="3"><img alt="" src="" width="70" height="70" id="fjxt_mdf_adddevinfourl"></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="fjxt_mdf_Btn_submit">修改信息</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 分拣系统 - 详情信息  begin-->
    <div class="modal fade" id="fjxt_detail">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fjxt_modal_detail_content">
                <!-- mask juhua start -->
                <div class="fjxt_mask_juhua">
                    <div id="fjxt_img_juhua"><img src="${pageContext.request.contextPath}/views/admin/images/resource/wait.jpg" onclick="javascript:void(0);"/></div>
                </div>
                <!-- mask juhua end -->

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="fjxt_xqinfo">分拣系统 - 详情信息</h5>
                </div>
                <div class="modal-body fjxt-base-modal-body">
                    <div class="modal-body-header" style="margin-bottom: 20px;">
                        <form class="form-inline">
                            <div class="form-group">
                                <label for="fjxt_detail_userWriteXulie">手动填写序列（1-10,15,20-30）：</label>
                                <input type="text" class="form-control" id="fjxt_detail_userWriteXulie" placeholder="">
                            </div>
                            <div class="form-group">
                                <label for="fjxt_detail_userBatCtl">批量操作：</label>
                            </div>
                            <div class="form-group">
                                <div class="combo-select-box">
                                    <select id="fjxt_detail_userBatCtl" class="form-control"></select>
                                </div>
                            </div>
                            <button type="button" class="btn btn-sm gui-btn-ok btn-submit" id="fjxt_detail_userBatSubmit">提交</button>
                        </form>
                        <div class="modal-add-part gui-btn-lgAdd" data-toggle="modal" onclick="$this.detail_fjxt_modify_addpart(this,false,'');">
                            <span class="glyphicon glyphicon-plus"></span>
                            <span>新增部件</span>
                        </div>
                    </div>

                    <div class="table_div_fjxt_xq">
                        <table class="table table-bordered table-hover table_custom table_custom_fjxt_xq gui-table-box">
                            <thead>
                            <tr>
                                <th>
                                    <input class="gui-magic-checkbox all-checkbox" type="checkbox" id="detail_table_fjxt_checkbox"/>
                                    <label for="detail_table_fjxt_checkbox" style="margin-bottom: 0;">全选</label>
                                </th>
                                <th style="display: none;">序号</th>
                                <th>配件名称</th>
                                <th>配件规格</th>
                                <th>数量</th>
                                <th>单位</th>
                                <th>备注</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="table_body_fjxt_xq"></tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 分拣系统 - 详情信息   end -->
    <!-- 详情信息 新增部件/修改信息  start-->
    <div class="modal fade" id="fjxt_detail_mdf_add_form">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fjxt_modal_detail_mdf_add_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="fjxt_detail_mdf_add_title">详情 - 新增设备</h5>
                </div>
                <div class="modal-body fjxt-base-modal-body">
                    <table class="table table-bordered fjxt_baseinfo_left_table gui-table-box">
                        <tr>
                            <td class="table-label"><label for="fjxt_detail_basedevname">配件名称：</label></td>
                            <td width="30%"><input type="text" class="form-control" id="fjxt_detail_basedevname"></td>
                            <td class="table-label"><label for="fjxt_detail_basedevdetailidentify">配件编号：</label></td>
                            <td width="30%"><input type="text" class="form-control" id="fjxt_detail_basedevdetailidentify"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_detail_basedevamount">数量：</label></td>
                            <td width="30%"><input type="number" class="form-control" id="fjxt_detail_basedevamount"></td>
                            <td class="table-label"><label for="fjxt_detail_basedevdunit">单位：</label></td>
                            <td width="30%"><input type="text" class="form-control" id="fjxt_detail_basedevdunit"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_detail_basedevdspecific">配件规格：</label></td>
                            <td colspan="3"><input type="text" class="form-control" id="fjxt_detail_basedevdspecific"></td>
                        </tr>
                        <tr>
                            <td class="table-label"><label for="fjxt_detail_basedevdetailnote">备注：</label></td>
                            <td colspan="3">
                                <textarea rows="3" class="form-control" id="fjxt_detail_basedevdetailnote"></textarea>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-ok" id="fjxt_detailAddPartBtn">添加设备</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 详情信息 新增部件/修改信息   end-->
    <!--  分配区域  begin-->
    <div class="modal fade" id="fjxt_detail_adddev">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fjxt_modal_detail_content">
                <!-- mask juhua start -->
                <div class="fjxt_jdcsxt_mask_juhua">
                    <div id="fjxt_img_juhua_adddev">
                        <img src="${pageContext.request.contextPath}/views/admin/images/resource/wait.jpg" onclick="javascript:void(0);"/>
                    </div>
                </div>
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="fjxt_xqinfo_adddev">分配区域</h5>
                </div>
                <div class="modal-body fjxt-base-modal-body">
                    <div class="modal-body-header" id="adddev_ctl_panel">
                        <form class="form-inline">
                            <div class="form-group">
                                <label for="fjxt_detail_owner_dev_adddev" id="fjxt_detail_label_owner_adddev">设备名称：</label>
                                <select id="fjxt_detail_owner_dev_adddev" class="form-control" style="padding-right: 30px;"></select>
                            </div>
                            <div class="form-group">
                                <label for="fjxt_detail_ctl_part_adddev"></label>
                                <select class="form-control" id="fjxt_detail_ctl_part_adddev" style="padding-right: 30px;"></select>
                            </div>
                            <button type="button" class="btn btn-sm gui-btn-ok btn-submit" id="fjxt_detail_Submit_adddev">搜索</button>
                        </form>
                    </div>
                    <div class="table_div_fjxt_xq table_div_fjxt_xq_adddev_cls gui-table-box" id="table_div_fjxt_xq_adddev">
                        <table class="table table-bordered table-hover table_custom table_custom_fjxt_xq">
                            <thead>
                            <tr>
                                <th style="width: 60px;">
                                    <input class="gui-magic-checkbox all-checkbox" type="checkbox" id="detail_table_jdcsxt_checkbox"/>
                                    <label for="detail_table_jdcsxt_checkbox" style="margin-bottom: 0;">全选</label>
                                </th>
                                <th style="display: none;">序号</th>
                                <th>设备名称</th>
                                <th>设备编号</th>
                                <th>设备厂商</th>
                                <th>品牌</th>
                                <th>单位</th>
                                <th>数量</th>
                                <th>规格型号</th>
                                <th>设备状态</th>
                                <th>上线时间</th>
                                <th>到期时间</th>
                                <th>最后维修时间</th>
                                <th>最后更换时间</th>
                                <th>所属区域</th>
                            </tr>
                            </thead>
                            <tbody id="table_body_fjxt_adddev"></tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-body-footer clearfix"  id="add_new_footer_panel">
                    <form class="form-inline pull-right" style="margin: 15px 20px;">
                        <div class="form-group">
                            <label for="fjxt_fengpeidao" id="label_fjxt_fengpeidao">分配到</label>
                            <select id="fjxt_fengpeidao" class="form-control" style="padding-right: 30px;"></select>
                        </div>
                        <button type="button" class="btn gui-btn-ok btn-sm btn-submit" id="fjxt_jdxt_yingyiong_btn">
                            应用
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- 分配区域   end -->
    <!-- 详情信息 begin-->
    <div class="modal fade" id="jdcsxt_detail">
        <div class="modal-dialog modal-lg">
            <div class="modal-content jdcsxt_modal_detail_content">
                <!-- mask juhua start -->
                <div class="jdcsxt_mask_juhua">
                    <div id="jdcsxt_img_juhua">
                        <img src="${pageContext.request.contextPath}/views/admin/images/resource/wait.jpg" onclick="javascript:void(0);"/></div>
                </div>
                <!-- mask juhua end -->

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" id="jdcsxt_xqinfo">胶带传输系统 - 详情信息</h5>
                </div>
                <div class="modal-body jdcsxt-base-modal-body">
                    <ul class="nav">
                        <li>
                            <ul class="nav nav-pills">
                                <li>
                                    <label for="jdcsxt_detail_userWriteXulie">手动填写序列（1-10,15,20-30）：</label>
                                </li>
                                <li>
                                    <input type="text" class="form-control" id="jdcsxt_detail_userWriteXulie">
                                </li>
                                <li>
                                    <label for="jdcsxt_detail_userBatCtl" id="jdcsxt_detail_labelBatctl">批量操作：</label>
                                </li>
                                <li>
                                    <select id="jdcsxt_detail_userBatCtl" class="form-control"></select>
                                </li>
                                <li>
                                    <label for="jdcsxt_detail_batRegionSelect"
                                           id="jdcsxt_detail_labelRegioncm">区域：</label>
                                </li>
                                <li>
                                    <select id="jdcsxt_detail_batRegionSelect" class="form-control"></select>
                                </li>
                                <li>
                                    <button type="button" class="btn btn-primary btn-sm"
                                            id="jdcsxt_detail_userBatSubmit">提交
                                    </button>
                                </li>
                                <li>
                                    <div class="jdcsxt_detail_user_xqadd_part" data-toggle="modal" data-target=""
                                         onclick="$this.detail_jdcsxt_modify_addpart(this,false,'');"><img
                                            class="add_img"
                                            src="${pageContext.request.contextPath}/views/admin/images/resource/add_part.png"/>新增部件
                                    </div>
                                </li>
                            </ul>

                        </li>
                        <li>
                            <div class="table_div_jdcsxt_xq">
                                <table class="table table-bordered table-hover table_custom table_custom_jdcsxt_xq">
                                    <thead>
                                    <tr>
                                        <th style="width:30px;"><input type="checkbox" id="detail_table_jdcsxt_checkbox"/></th>
                                        <th style="width:36px;">序号</th>
                                        <th style="width:95px;">设备名称</th>
                                        <th style="width:80px;">设备编号</th>
                                        <th style="width:85px;">设备厂商</th>
                                        <th style="width:65px;">品牌</th>
                                        <th style="width:72px;">单位</th>
                                        <th style="width:65px;">数量</th>
                                        <th style="width:75px;">规格型号</th>
                                        <th style="width:75px;">设备状态</th>
                                        <th style="width:75px;">上线时间</th>
                                        <th style="width:75px;">到期时间</th>
                                        <th style="width:75px;">最后维修时间</th>
                                        <th style="width:75px;">最后更换时间</th>
                                        <th style="width:75px;">所属区域</th>
                                        <th style="width:85px;">操作</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table_body_jdcsxt_xq"></tbody>
                                </table>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!-- 详情信息 end -->
</body>
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
<script src="${pageContext.request.contextPath}/public/serach-select/jquery.combo.select.js"></script>
<script src="${pageContext.request.contextPath}/public/utils/util.js"></script>
<script src="${pageContext.request.contextPath}/views/admin/area/regionmanage_sbqy.js"></script>

<script type="text/javascript">
    var qyglObj = new qygl();
</script>
</html>
