<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>任务历史记录</title>

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
    <!-- custom css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/css/common.css">
    <link rel="stylesheet" href="public/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/public/serach-select/combo.select.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/history/TaskHistoryManager_allot.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
    <!--主体内容开始-->
    <div class="TB_frame container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <div class="iframe-container">
                    <form id="history_form_control" class="form-inline iframe-searchBox queryForm">
                        <div class="search-box-container">
                            <div class="form-group">
                                <label>操作人：</label>
                                <input id="query_xunjian_identify" name="taskident" class="form-control"/>
                            </div>
                            <button type="button" class="btn gui-btn-search" id="query_btn_submit">搜索</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="total-box">
                        <span class="total_item" id="total_item"></span>
                    </div>
                </div>
            </div>

            <div class="col-sm-12">
                <div class="iframe-container">
                    <div class="row">
                        <%--<div class="col-sm-2">
                            <div class="tree-left" id="treeLeft">
                                <table class="table table-hover table_custom table_custom-left">
                                    <thead>
                                    <tr>
                                        <th>设备名称</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table_body_left" class="leftListTable"></tbody>
                                </table>
                            </div>
                        </div>
                        --%>
                        <div class="col-sm-10">
                            <table id="front-data-table" class="table table-bordered table-hover table_custom">
                                <thead id="table_head">
                                <tr>
                                    <th style="display: none;">序号</th>
                                    <th>名称</th>
                                    <th>IP地址</th>
                                    <th>操作日期</th>
                                    <th>客户端信息</th>
                                    <th>请求地址</th>
                                </tr>
                                </thead>
                                <tbody id="table_body"></tbody>
                                <tfoot id="table_foot">
                                <tr>
                                    <td colspan="10">
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
    <!--主体内容结束-->

    <!--------------以下是弹窗信息------------->
    <!-- system modal-->
    <div id="com-alert" class="modal" style="z-index:9999;display: none;">
        <div class="modal-dialog modal-sm modal-alert">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span
                            class="sr-only">Close</span></button>
                    <h5 class="modal-title"><i></i> [Title]</h5>
                </div>
                <div class="modal-body small">
                    <p>[Message]</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn ok btn-primary" data-dismiss="modal">[BtnOk]</button>
                    <button type="button" class="btn cancel btn-default" data-dismiss="modal">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 详情弹出 -->
    <div class="modal fade basicInformationModal" id="cgxj_baseinfo">
        <div class="modal-dialog modal-lg">
            <div class="modal-content cgxj_modal_baseinfo_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" style="text-align: center;">基本信息</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <table class="table table-bordered" id="table-xjsbxx">
                        <tr>
                            <td colspan="4" class="table-title">巡检设备信息</td>
                        </tr>
                        <tr>
                            <td class="info-name">设备名称</td>
                            <td class="info-vlaue" id="cgxj_device_iequipname"></td>
                            <td class="info-name">设备编号</td>
                            <td class="info-vlaue" id="cgxj_device_iequipident"></td>
                        </tr>
                        <tr>
                            <td class="info-name">设备种类</td>
                            <td class="info-vlaue" id="cgxj_device_devicekind"></td>
                            <td class="info-name">规格型号</td>
                            <td class="info-vlaue" id="cgxj_device_iequipspecific"></td>
                        </tr>
                        <tr>
                            <td class="info-name">频率</td>
                            <td class="info-vlaue" id="cgxj_device_freqexplain"></td>
                            <td class="info-name">任务类型</td>
                            <td class="info-vlaue" id="cgxj_device_freqtypeexplain"></td>
                        </tr>
                        <tr>
                            <td class="info-name">区域</td>
                            <td class="info-vlaue" id="cgxj_device_areaname"></td>
                            <td class="info-name">状态</td>
                            <td class="info-vlaue" id="cgxj_device_taskstatus"></td>
                        </tr>
                        <tr>
                            <td class="info-name">方案项目名称</td>
                            <td class="info-vlaue" colspan="3" id="cgxj_device_schename"></td>
                        </tr>
                        <tr>
                            <td class="info-name">方案内容</td>
                            <td colspan="4" class="info-vlaue" id="cgxj_device_schecontent"></td>
                        </tr>
                        <tr>
                            <td class="info-name">处理意见</td>
                            <td colspan="4" class="info-vlaue" id="cgxj_device_schesuggest"></td>
                        </tr>
                    </table>
                    <table class="table table-bordered" id="table-xjrwxx">
                        <tr>
                            <td colspan="4" class="table-title">巡检任务信息</td>
                        </tr>
                        <tr>  
                            <td class="info-name">任务编号</td>
                            <td class="info-vlaue" id="cgxj_device_taskident"></td>
                   			<td class="info-name">巡检人员</td>
                            <td class="info-vlaue" id="cgxj_device_checkmanname"></td>
                        </tr>
                        <tr>
                            <td class="info-name">巡检开始时间：</td>
                            <td class="info-vlaue" id="cgxj_device_taskchecksttamp"></td>
                            <td class="info-name">巡检结束时间</td>
                            <td class="info-vlaue" id="cgxj_device_taskcheckedtamp"></td>
                        </tr>
                    </table>
                    <table class="table table-bordered" id="table-xjjg">
                        <tr>
                            <td colspan="4" class="table-title">巡检结果</td>
                        </tr>
                        <tr>
                            <td class="info-name">巡检结果</td>
                            <td class="info-vlaue" id="cgxj_device_taskresult"></td>
                            <td class="info-name">备注</td>
                            <td class="info-vlaue" id="cgxj_device_abnorRemark"></td>
                        </tr>
                        <tr>
                            <td class="info-name">提交人</td>
                            <td class="info-vlaue" id="cgxj_device_submitname"></td>
                            <td class="info-name">提交时间</td>
                            <td class="info-vlaue" colspan="3" id="cgxj_device_tasksubmittamp"></td>
                        </tr>
                        <tr>
                            <td class="info-name">图片</td>
                            <td class="info-vlaue" colspan="3" id="cgxj_device_abnorUrl"></td>
                        </tr>
                    </table>
                    <table class="table table-bordered table-hover" id="task_abnormal">
                        <thead>
                        <tr>
                            <td colspan="7" class="table-title">异常设备</td>
                        </tr>
                        <tr>
                            <th>配件名称</th>
                            <th>故障描述</th>
                            <th>处理方法</th>
                            <th>处理方式</th>
                            <th>费用</th><%--
                            <th>调拨数量</th>
                            <th>调拨状态</th>--%>
                        </tr>
                        </thead>
                        <tbody id="table_body_abnormal"></tbody>
                    </table>
                </div>
                <div class="modal-footer" id="reject-buttons">
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 详情结束 -->
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
<script src="${pageContext.request.contextPath}/views/admin/sm/actionLog_login.js"></script>

<script type="text/javascript">
    var historyObj1 = new history1();
</script>
</html>
