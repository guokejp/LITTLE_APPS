<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title></title>

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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/admin/equip/exceptmanage_ycyj.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <!--主体内容开始-->
    <div class="TB_frame container-fluid" id="data_dispalay2" style="display: none;">
        <div class="iframe-container">
            <div class="row">
                <div class="col-sm-12">
                    <form id="ycyj_form_control" class="form-inline iframe-searchBox queryForm">
                        <div class="search-box-container">
                            <div class="form-group glyphiconParent">
                                <label>使用时间：</label>
                                <input type="text" class="form-control" name="stime" id="query_startTime" readonly="readonly">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </div>
                            <div class="form-group glyphiconParent">
                                <label class="dateTymbol4">~</label>
                                <input type="text" class="form-control" name="etime" id="query_endTime" readonly="readonly">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </div>
                        </div>
                        <div class="search-box-container">
                            <div class="form-group">
                                <label>设备名称：</label>
                                <input name="iequipname" class="form-control"/>
                            </div>
                            <div class="form-group cancelRightMargin">
                                <label>设备区域：</label>
                            </div>
                            <div class="form-group">
                                <select id="query_xunjian_area" name="areaid" class="form-control"></select>
                            </div>
                            <div class="form-group cancelRightMargin">
                                <label>设备厂商：</label>
                            </div>
                            <div class="form-group">
                                <select name="iequipifirm" id="query_xunjian_ifirm" class="form-control"></select>
                            </div>
                            <div class="form-group cancelRightMargin">
                                <label>当前状态：</label>
                            </div>
                            <div class="form-group">
                                <select name="statusChoose" class="form-control" id="query_xunjian_state">
                                    <option value="">全部</option>
                                    <option value="10">预警中</option>
                                    <option value="20">禁止中</option>
                                </select>
                            </div>
                        </div>
                        <div class="search-box-container">
                            <div class="form-group">
                                <label>预警等级：</label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input class="gui-magic-radio" id="grade1" type="radio" name="grade" value="1">
                                    <label for="grade1" style="padding-left: 20px;">一级预警</label>
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input class="gui-magic-radio" id="grade2" type="radio" name="grade" value="2">
                                    <label for="grade2" style="padding-left: 20px;">二级预警</label>
                                </label>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input class="gui-magic-radio" id="grade3" type="radio" name="grade" value="3">
                                    <label for="grade3" style="padding-left: 20px;">三级预警</label>
                                </label>
                            </div>
                            <button type="button" class="btn gui-btn-search" id="query_btn_submit" style="margin-top: -3px;">搜索</button>

                            <div class="gui-btn-lgAdd pull-right switchBtn">
                                <span class="glyphicon glyphicon-picture"></span>
                                <span>平面图展示</span>
                            </div>
                        </div>
                    </form>
                </div>

                <div class="col-sm-12">
                    <div class="total-box">
                        <span class="total_item" id="total_item"></span>
                    </div>
                </div>

                <div class="col-sm-12">
                    <div class="row">
                        <div class="col-sm-2">
                            <div class="tree-left">
                                <table class="table table-hover table_custom table_custom-left">
                                    <thead>
                                    <tr>
                                        <th>设备类别</th>
                                    </tr>
                                    </thead>
                                    <tbody id="table_body_left"></tbody>
                                </table>
                            </div>
                        </div>

                        <div class="col-sm-10">
                            <table id="front-data-table" class="table table-hover table-bordered table_custom">
                                <thead>
                                <tr>
                                    <%--
                                    <th><input type="checkbox" id="checkbox_history_total"/></th>
                                    --%>
                                    <th>序号</th>
                                    <th>设备名称</th>
                                    <th>预警等级</th>
                                    <th>异常次数</th>
                                    <th>频率</th>
                                    <th>区域</th>
                                    <th>设备厂商</th>
                                    <th>开始使用时间</th>
                                    <th>预警状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="table_body"></tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid" id="data_dispalay1" style="padding-left: 4px;padding-right: 4px;">
        <div class="row">
            <div class="col-sm-12">
                <div class="switchContainer clearfix">
                    <div class="messageContainer pull-left">
                       <span class="messageTitle">设备预警</span>
                    </div>
                    <div class="messageContainer pull-left" style="margin-left: 30px;">
                        <span class="messageIcon messagesGrade1"></span>&nbsp;&nbsp;<span class="messageSTitle">一级预警</span>
                        <span class="messageIcon messagesGrade2"></span>&nbsp;&nbsp;<span class="messageSTitle">二级预警</span>
                        <span class="messageIcon messagesGrade3"></span>&nbsp;&nbsp;<span class="messageSTitle">三级预警</span>
                    </div>
                    <div class="gui-btn-lgAdd2 pull-right switchBtn">
                       <span class="glyphicon glyphicon-th"></span>
                       <span>数据展示</span>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <div class="iframe-container" style="padding: 0;">
                    <div class="modelContent" id="modelContent">
                        <img src="${pageContext.request.contextPath}/views/admin/images/earlywarning/equipmentDiagram.png" alt="">
                        <div class="alarmAnimationBox" id="alarmAnimationBox"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--主体内容结束-->

    <!------------ 以下是模态框信息 ------------>
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
                    <button type="button" class="btn ok gui-btn-ok" data-dismiss="modal">[BtnOk]</button>
                    <button type="button" class="btn cancel gui-btn-cancel" data-dismiss="modal">[BtnCancel]</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 详情弹出框开始 -->
    <div class="modal fade" id="cgxj_baseinfo">
        <div class="modal-dialog modal-lg">
            <div class="modal-content cgxj_modal_baseinfo_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title" style="text-align: center;">设备异常详情</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <div class="total-box">
                        <span class="total_item" id="task_abnormal_title"></span>
                    </div>
                    <table class="table table-hover table-bordered table_custom">
                        <thead>
                        <tr>
                            <th>
                                <input class="gui-magic-checkbox all-checkbox" type="checkbox" id="checkbox_abnormal_total"/>
                                <label for="checkbox_abnormal_total" style="padding-left: 17px;margin-bottom: 0;">全选</label>
                            </th>
                            <th>序号</th>
                            <th>设备名称</th>
                            <th>任务编号</th>
                            <th>故障描述</th>
                            <th>是否解决</th>
                            <th>处理方法</th>
                            <th>处理方式</th>
                            <th>费用</th>
                            <th>提交人</th>
                            <th>提交时间</th>
                            <th>备注</th>
                            <th>状态</th>
                            <th width="120">操作</th>
                        </tr>
                        </thead>
                        <tbody id="table_body_abnormal"></tbody>
                        <tfoot>
                            <tr>
                                <td colspan="14">
                                    <div class="table_page_div pull-right">
                                        <div class="pagination"></div>
                                    </div>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
                <div class="modal-footer" id="reject-buttons">
                    <button type="button" class="btn gui-btn-ok" onclick="$this.diabled_buttons();">禁止预警</button>
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 异常详情弹出框开始 -->
    <div class="modal fade ycgdDetailModal" id="ycyj_baseinfo">
        <div class="modal-dialog modal-lg">
            <div class="modal-content ycyj_modal_baseinfo_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h4 class="modal-title" style="text-align: center;">基本信息</h4>
                </div>
                <div class="modal-body base-modal-body" style="height: 425px;">
                    <table class="table table-bordered ycgdDetailModalT1" id="table-xjsbxx">
                        <tr>
                            <td colspan="4" class="table-title">巡检设备信息</td>
                        </tr>
                        <tr>
                            <td class="info-name">设备名称:</td>
                            <td class="info-vlaue" id="ycyj_device_iequipname"></td>
                            <td class="info-name">设备编号:</td>
                            <td class="info-vlaue" id="ycyj_device_iequipident"></td>
                        </tr>
                        <tr>
                            <td class="info-name">设备种类:</td>
                            <td class="info-vlaue" id="ycyj_device_devicekind"></td>
                            <td class="info-name">规格型号:</td>
                            <td class="info-vlaue" id="ycyj_device_iequipspecific"></td>
                        </tr>
                        <tr>
                            <td class="info-name">频率:</td>
                            <td class="info-vlaue" id="ycyj_device_freqexplain"></td>
                            <td class="info-name">任务类型:</td>
                            <td class="info-vlaue" id="ycyj_device_freqtypeexplain"></td>
                        </tr>
                        <tr>
                            <td class="info-name">区域:</td>
                            <td class="info-vlaue" id="ycyj_device_areaname"></td>
                            <td class="info-name">状态:</td>
                            <td class="info-vlaue" id="ycyj_device_abnorStatus"></td>
                        </tr>
                        <tr>
                            <td class="info-name">方案项目名称:</td>
                            <td class="info-vlaue" colspan="3" id="ycyj_device_schename"></td>
                        </tr>
                        <tr>
                            <td class="info-name">方案内容:</td>
                            <td colspan="4" class="info-vlaue" id="ycyj_device_schecontent"></td>
                        </tr>
                        <tr>
                            <td class="info-name">处理意见:</td>
                            <td colspan="4" class="info-vlaue" id="ycyj_device_schesuggest"></td>
                        </tr>
                    </table>
                    <table class="table table-bordered ycgdDetailModalT2" id="table-xjrwxx">
                        <tr>
                            <td colspan="4" class="table-title">巡检任务信息</td>
                        </tr>
                        <tr>
                            <td class="info-name">任务编号:</td>
                            <td colspan="4" class="info-vlaue" id="ycyj_device_taskident"></td>
                        </tr>
                        <tr>
                            <td class="info-name">巡检人员:</td>
                            <td class="info-vlaue" id="ycyj_device_checkmanname"></td>
                            <td class="info-name">巡检时间:</td>
                            <td class="info-vlaue" id="ycyj_device_taskcheckedtamp"></td>
                        </tr>
                    </table>
                    <table class="table table-bordered ycgdDetailModalT3" id="table-xjjg">
                        <tr>
                            <td colspan="4" class="table-title">巡检结果</td>
                        </tr>
                        <tr>
                            <td class="info-name">巡检结果:</td>
                            <td class="info-vlaue" id="ycyj_device_taskresult"></td>
                             <td class="info-name">是否解决</td>
                            <td class="info-vlaue" id="ycyj_device_abnorIsPolling"></td>
                        </tr>
                        <tr>
                            <td class="info-name">提交人:</td>
                            <td class="info-vlaue" id="ycyj_device_abnorSubmitName"></td>
                            <td class="info-name">提交时间:</td>
                             <td class="info-vlaue" id="ycyj_device_abnorSubmitTime"></td>
 
                        </tr>
                    </table>
                    <table class="table table-bordered ycgdDetailModalT4">
                        <thead>
                            <tr>
                                <td colspan="8" class="table-title" style="height: 40px;">异常设备</td>
                            </tr>
                            <tr>
                                <th>配件名称</th>
                                <th>故障描述</th>
                                <th>处理方法</th>
                                <th>处理方式</th>
                                <th>费用</th>
                                <th>调拨数量</th>
                                <th>调拨状态</th>
                                <th>图片</th>
                            </tr>
                       </thead>
                       <tbody>
                            <tr style="text-align: center;">
                                <td id="ycyj_device_iequipDeName"></td>
                                <td id="ycyj_device_abnorDescribe"></td>
                                <td id="ycyj_device_abnorHMethod"></td>
                                <td id="ycyj_device_abnorHMode"></td>
                                <td id="ycyj_device_abnorMoney"></td>
                                <td id="ycyj_device_outCount"></td>
                                <td id="ycyj_device_outStatus"></td>
                                <td id="ycyj_device_abnorUrl"></td>
                            </tr>
                       </tbody>
                      </table>
                </div>
                <div class="modal-footer" id="reject-buttons">
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 异常详情弹出框结束. -->
    <!-- 图片展示模态框开始 -->
    <div class="modal fade" id="ycyj_showPictures">
        <div class="modal-dialog modal-lg">
            <div class="modal-content cgxj_modal_baseinfo_content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                    <h5 class="modal-title">图片展示</h5>
                </div>
                <div class="modal-body base-modal-body">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" data-interval="3000" style="background-color: #ddd;">
                        <ol class="carousel-indicators" id="ycyj_serial_number">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                        </ol>

                        <div class="carousel-inner" id="ycyj_serial_picture">
                            <div class="item active">
                                <img src="public/img/default.png" style="width: 100%;height: 300px;">
                            </div>
                            <div class="item">
                                <img src="public/img/default.png" style="width: 100%;height: 300px;">
                            </div>
                            <div class="item">
                                <img src="public/img/default.png" style="width: 100%;height: 300px;">
                            </div>
                            <div class="item">
                                <img src="public/img/default.png" style="width: 100%;height: 300px;">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    <!-- 图片展示模态框结束 -->
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
<script src="${pageContext.request.contextPath}/views/admin/equip/exceptmanage_ycyj.js"></script>

<script type="text/javascript">
    var ycyjObj = new ycyj();
    $('#query_xunjian_state').comboSelect();
</script>
</html>
