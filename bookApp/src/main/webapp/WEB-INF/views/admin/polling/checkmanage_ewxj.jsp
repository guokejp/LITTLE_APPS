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

<title>额外巡检</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/public/css/bootstrap.min.css"
	rel="stylesheet">
<!-- frame -->
<link
	href="${pageContext.request.contextPath}/views/admin/css/frame.css"
	rel="stylesheet">
<!-- bootstrap-treeview -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/bootstrap-treeview.css">
<!-- page -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/simplePagination.css">
<!-- custom css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/admin/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/admin/css/upload.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/public/serach-select/combo.select.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/admin/polling/checkmanage_ewxj.css">
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
		<div class="iframe-container">
			<div class="row">
				<!--查询-->
				<div class="col-sm-12">
					<form id="xjgd_form_control"
						class="form-inline iframe-searchBox queryForm">
						<div class="search-box-container">
							<div class="form-group glyphiconParent">
								<label>选择时间：</label> <input type="text" class="form-control"
									name="stime" id="query_startTime" readonly="readonly">
								<span class="glyphicon glyphicon-calendar"></span>
							</div>
							<div class="form-group glyphiconParent">
								<label class="dateTymbol4">~</label> <input type="text"
									class="form-control" name="etime" id="query_endTime"
									readonly="readonly"> <span
									class="glyphicon glyphicon-calendar"></span>
							</div>
						</div>
						<div class="search-box-container">					
							<div class="form-group cancelRightMargin">
								<label>巡检人员：</label>
							</div>
							<div class="form-group">
								<select id="query_xunjian_renyaun" class="form-control"></select>
							</div>
							<div class="form-group cancelRightMargin">
								<label>状态：</label>
							</div>
							<div class="form-group">
								<select id="query_xunjian_status" class="form-control">
									<option value="" checked>全部</option>
									<option value="待巡检">待巡检</option>
									<option value="已完成">已完成</option>
									<option value="已过期">已过期</option>
								</select>
							</div>
							<div class="form-group cancelRightMargin">
								<label>设备类型：</label>
							</div>
							<div class="form-group">
								<select id="query_xunjian_sblx" class="form-control"></select>
							</div>
							
							<div class="form-group cancelRightMargin">
								<label>设备名称：</label>
							</div>
							<div class="form-group" >
								<select id="query_xunjian_sbmc" name="sbmc"
									class="form-control">
									<option value="" checked>全部</option>
									</select>
							</div>
							
							<button type="button" class="btn gui-btn-search"
								id="query_btn_submit">搜索</button>
								<p></p>
							<div class="gui-btn-lgAdd pull-right button-operation" onclick="addEwxj()">
								<span class="glyphicon glyphicon-plus"></span> <span>新增额外巡检</span>
							</div>
							<div class="gui-btn-lgAdd pull-right button-operation"
								onclick="addXcEwxj('data_xcsbmc')">
								<span class="glyphicon glyphicon-plus"></span> <span>新增小车巡检</span>
							</div>
							<br/>
						</div>
					</form>
				</div>

				<div class="col-sm-12">
					<div style="position: relative;">
						<div class="custom-div" id="ta-head">
							<div class="custom-td custom-click" style="margin:0 auto;">新增额外任务</div>
							<div class="custom-td">提交额外任务</div>
							<div class="custom-td">异常额外任务</div>
						</div>

						<div class="btn-content"
							style="position: absolute;right: 0;top: 1px;">
							<span class="gui-btn-pass" style="display:none;" id="nomal_allot_again" onclick="batchAllotAgain()">再分配</span>				
							<span class="gui-btn-noPass" id="normal_delete" onclick="batchDel()">删除</span>
						</div>
					</div>
				</div>
				<div class="col-sm-12">
					<div style="position: relative;">
						<div class="custom-head-div" id="show_content_head">
							
						</div>
					</div>
				</div>
				<!--表格-->
				<div class="col-sm-12">
					<div class="table_div">
						<!-- 表格内容-->
						<div class="cgxj_table_div">
							<table id="chechkmanager_ewxj_table"
								class="table table-bordered table-hover body-table table_custom">
								<thead>
									<tr>
										<th style="width: 70px;"><input
											class="gui-magic-checkbox all-checkbox" type="checkbox"
											onclick="selectAll();" id="selectAll"><label
											for="selectAll" style="margin-bottom: 0;">全选</label></th>
										<th style="display: none;">序号</th>
										<th>任务编号</th>
										<th>设备编号</th>
										<th>设备名称</th>
										<th>巡检结果</th>
										<th>巡检人员</th>
										<th>巡检结束时间</th>
										<th>提交人</th>
										<th>提交时间</th>
										<th>状态</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody id="table_body"></tbody>				
								<tfoot id="tfoot_body_data">
								
								</tfoot>
								
							</table>
							<div id="tfoot_body" class="clearfix table-footerBox" style="height:45px !important; border: 1px solid #ddd;border-top: 0;">
                                <!-- 分页 -->
                                <div class="table_page_div table_page  pull-right" id="table_page_div" style="padding: 10px 15px 0 0;">
                                    <div class="pagination compact-theme simple-pagination"><ul><li class="disabled"><span class="current prev">&lt;</span></li><li class="active"><span class="current">1</span></li><li class="disabled"><span class="current next">&gt;</span></li></ul></div>
                                </div>
                            </div>
							
							<div class="col-sm-12" style="display:none;" id="chechkmanager_ewxj_table2">
				                    <div class="row">
				                        <div class="col-sm-2">
				                            <div class="tree-left" id="treeLeft">
				                                <table class="table table_custom table_custom-left">
				                                    <thead>
				                                    <tr>
				                                        <th>设备名称</th>
				                                    </tr>
				                                    </thead>
				                                    <tbody id="table_body2_left"></tbody>
				                                </table>
				                            </div>
				                        </div>
				
				                        <div class="col-sm-10">
				                            <div class="table-right">
				                               <table
													class="table table-bordered table-hover body-table table_custom">
													<thead>
														<tr>
															<th style="width: 70px;"><input
																class="gui-magic-checkbox all-checkbox" type="checkbox"
																onclick="selectAll2();" id="selectAll2"><label
																for="selectAll2" style="margin-bottom: 0;">全选</label></th>
															<th style="display: none;">序号</th>
															<th>任务编号</th>
															<th>配件名称</th>
															<%--<th>规格型号</th>--%>
															<th>巡检结果</th>
															<th>处理方法</th>
															<th>处理方式</th>
															<th>提交人</th>
															<%--<th>定位</th>--%>
															<th>提交时间</th>
															<th>状态</th>
															<th>操作</th>
														</tr>
													</thead>
													<tbody id="table_body2"></tbody>
													
													<tfoot id="tfoot_body_data2">
													
													</tfoot>
												</table>
												<div id="tfoot_body2" class="clearfix table-footerBox" style="border: 1px solid #ddd;border-top: 0;">
					                                <!-- 分页 -->
					                                <div class="table_page_div table_page  pull-right" id="table_page_div">
					                                    <div class="pagination2 compact-theme simple-pagination"><ul><li class="disabled"><span class="current prev">&lt;</span></li><li class="active"><span class="current">1</span></li><li class="disabled"><span class="current next">&gt;</span></li></ul></div>
					                                </div>
					                            </div>
				                            </div>
				                        </div>
				                    </div>
				            </div>
											
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--主体内容结束-->

	<!---------------以下是模态框信息--------------->
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
					<p style="text-align: center;">[Message]</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn ok gui-btn-ok"
						data-dismiss="modal">[BtnOk]</button>
					<button type="button" class="btn cancel gui-btn-cancel"
						data-dismiss="modal">[BtnCancel]</button>
				</div>
			</div>
		</div>
	</div>
	<!-- system modal end -->
	<!-- 图片显示 -->
	<div id="com-alertImg" class="modal alertImgModal"
		style="z-index:9999;display: none;">
		<div class="modal-dialog modal-sm modal-alert">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h5 class="modal-title">
						<i></i> 图片显示
					</h5>
				</div>
				<div class="modal-body small" id="img_content"></div>

				<div class="modal-footer">
					<button type="button" class="btn cancel gui-btn-cancel"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新增修改开始 -->
	<div class="modal fade" id="ewxj_baseinfo">
		<div class="modal-dialog modal-lg">
			<div class="modal-content ewxj_modal_baseinfo_content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h5 class="modal-title" style="text-align:center;" id="ewxj_title">新增额外巡检</h5>
				</div>
				<div class="modal-body ewxj-base-modal-body">
					<input type="hidden" value="" id="data_ewxj_id" />
					<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="4">巡检任务</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="background-custom">设备名称：</td>
								<td class="td-custom">
									<div class="dowebok">
										<select id="data_sbmc"></select>
									</div></td>
								<td class="background-custom">设备种类：</td>
								<td class="td-custom"><input type="text" id="data_kind"
									class="form-control" disabled></td>
							</tr>
							<tr>
								<td class="background-custom">设备编号：</td>
								<td class="td-custom"><input class="form-control"
									id="data_sbbh" placeholder="请输入" />
								</td>
								<td class="background-custom">巡检人员：</td>
								<td class="td-custom"><select class="form-control"
									id="data_xjry"></select>
								</td>
							</tr>
							<tr>
								<td class="background-custom">巡检开始时间：</td>
								<td class="td-custom"><input class="form-control"
									id="data_xjsj" placeholder="请选择" readOnly />
								</td>
								<td class="background-custom">巡检结束时间：</td>
								<td class="td-custom"><input class="form-control"
									id="data_xjsjed" placeholder="请选择" readOnly />
								</td>
							</tr>
							<tr>
								<td class="background-custom">巡检内容：</td>
								<td class="td-custom" colspan="3"><textarea
										class="form-control" id="data_xjlr" /></textarea>
								</td>
							</tr>
							<td class="background-custom">巡检意见：</td>
								<td class="td-custom" colspan="3"><textarea class="form-control"
										id="data_xjyj" /></textarea>
								</td>
							<tr>
								<td class="background-custom">备注：</td>
								<td class="td-custom" colspan="3"><textarea
										class="form-control" id="data_remark" /></textarea>
								</td>
							</tr>
							<tr style="display:none;">
								<td class="background-custom">图片：</td>
								<td class="td-custom" colspan="3">
                              		<div id="fileUploadContent" class="fileUploadContent"></div>
                                </td>
							</tr>
						</tbody>
					</table>
					<%--<p style="height:20px;"></p>
					--%><%--<table class="table table-bordered">
						<thead>
							<tr>
								<td colspan="4">填写巡检结果</td>
							</tr>
						</thead>

						<tbody>
							<tr>
								<td class="background-custom">是否巡检：</td>
								<td class="td-custom"><select class="form-control"
									id="data_sfxj"></select></td>
								<td class="background-custom">巡检结果：</td>
								<td class="td-custom"><select class="form-control"
									id="data_xjjg"></select></td>
							</tr>
							<tr>
								<td class="background-custom">处理方式：</td>
								<td class="td-custom"><select class="form-control"
									id="data_handle_manner">
										<option value="1">自修</option>
										<option value="2">外修</option>
								</select></td>
								<td class="background-custom">处理方法：</td>
								<td class="td-custom"><select class="form-control"
									id="data_handle_method">
										<option value="1">维修</option>
										<option value="2">更换</option>
								</select></td>
							</tr>
							<tr>
								<td class="background-custom">是否解决：</td>
								<td class="td-custom"><select class="form-control"
									id="data_is_resolved">
										<option value="1">是</option>
										<option value="0">否</option>
								</select></td>
							</tr>
							<tr>
								<td class="background-custom">巡检后意见：</td>
								<td class="td-custom"><textarea class="form-control"
										id="data_xjyj" /></textarea>
								</td>

								<td class="background-custom">费用：</td>
								<td class="td-custom"><input class="form-control"
									id="expense" />
								</td>
							</tr>
							<tr>
								<td class="background-custom">提交人：</td>
								<td class="td-custom"><select id="data_tjry"
									class="form-control"></select></td>
								<td class="background-custom">提交时间：</td>
								<td class="td-custom"><input class="form-control"
									id="data_tjsj" readOnly />
								</td>
							</tr>
							
							<tr>
								<td class="background-custom">备注：</td>
								<td class="td-custom" colspan="3"><textarea
										class="form-control" id="data_remark" /></textarea>
								</td>
							</tr>
							<tr>
								<td class="background-custom">图片：</td>
								<td class="td-custom" colspan="3">
                              		<div id="fileUploadContent" class="fileUploadContent"></div>
                                </td>
							</tr>
						</tbody>
					</table>

				--%></div>
				<div class="modal-footer">
					<button type="button" class="btn gui-btn-ok" id="addMdfSaveBtn">确定</button>
					<button type="button" class="btn gui-btn-cancel"
						data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新增、修改结束 -->

		<!-- 小车新增修改开始 -->
		<div class="modal fade" id="ewxj_Xcbaseinfo">
			<div class="modal-dialog modal-lg">
				<div class="modal-content ewxj_modal_baseinfo_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" style="text-align:center;" id="ewxj_title">新增小车额外巡检</h5>
					</div>
					<div class="modal-body ewxj-base-modal-body">
						<input type="hidden" value="" id="data_ewxj_id" />
						<table class="table table-bordered">
							<thead>
								<tr>
									<td colspan="4">巡检任务</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="background-custom">设备类型：</td>
									<td class="td-custom">
										<div class="dowebok">
											<input id="data_xcsbmcselect" type="hidden"> <select
												id="data_xcsbmc"></select>
										</div></td>
									<td class="background-custom">设备数量：</td>
									<td class="td-custom"><input type="text" id="data_xcamount"
										class="form-control" disabled></td>
								</tr>
								<tr>
									<td class="background-custom">巡检年份：</td>
									<td class="td-custom"><select class="form-control" id="data_xcyear">
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<option value="2019">2019</option>
									</select></td>
									<td class="background-custom">巡检月份：</td>
									<td class="td-custom"><select class="form-control" id="data_xcmonth">
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>
											<option value="6">6</option>
											<option value="7">7</option>
											<option value="8">8</option>
											<option value="9">9</option>
											<option value="10">10</option>
											<option value="11">11</option>
											<option value="12">12</option>
									</select></td>
								</tr>
								<tr>
									<td class="background-custom">巡检人员：</td>
									<input id="data_xcxjryselect" type="hidden">
									<td class="td-custom"><select class="form-control"
										id="data_xcxjry"></select>
									</td>
								</tr>
								<tr>
									<td class="background-custom">巡检内容：</td>
									<td class="td-custom" colspan="3"><textarea
											class="form-control" id="data_xcxjlr" /></textarea>
									</td>
								</tr>
							</tbody>
						</table>
	
						<div class="modal-footer">
							<button type="button" class="btn gui-btn-ok" id="addXCMdfSaveBtn">确定</button>
							<button type="button" class="btn gui-btn-cancel"
								data-dismiss="modal">取消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 小车新增修改结束 -->
		<!-- 其他状态详情开始 -->
		<div class="modal fade" id="ewxj_datainfo">
			<div class="modal-dialog modal-lg">
				<div class="modal-content ewxj_modal_baseinfo_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" style="text-align:center;">任务详情</h5>
					</div>
					<div class="modal-body ewxj-base-modal-body">
						<table class="table table-bordered" id="allot">
							<tr>
								<td colspan="4" class="text-center">选择处理人员</td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%;">再分配时间：</td>
								<td colspan="3" class="" style="width:80%;"><input
									type="text" id="allotTime" class="form-control"
									placeholder="请选择" style="border: 0;"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%;">选择处理人：</td>
								<td colspan="3" class="" style="width:80%;" id="allotHandler"></td>
							</tr>
						</table>
						<table class="table table-bordered">
							<tr>
								<td class="background-custom" style="width:20%">设备名称：</td>
								<td class="td-custom" style="width:30%" id="info_equip_name"></td>
								<td class="background-custom" style="width:20%">设备种类：</td>
								<td class="td-custom" style="width:30%" id="info_equip_kind"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">设备编号：</td>
								<td class="td-custom" style="width:30%" id="info_equip_identify"></td>
								<td class="background-custom" style="width:20%">任务编号：</td>
								<td class="td-custom" style="width:30%" id="info_task_number"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检开始时间：</td>
								<td class="td-custom" style="width:30%" id="info_task_checkstime"></td>
								<td class="background-custom" style="width:20%">巡检结束时间：</td>
								<td class="td-custom" style="width:30%" id="info_task_checktime"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">是否巡检：</td>
								<td class="td-custom" style="width:30%" id="info_task_isxj"></td>
								<td class="background-custom" style="width:20%">状态：</td>
								<td class="td-custom" style="width:30%" id="info_task_status"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检人员：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_task_checker_name"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">巡检内容：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_task_content"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">图片：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_task_url"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer" id="infoOkButton">
						<button type="button" data-dismiss="modal" class="btn gui-btn-ok"
							id="">确定</button>
					</div>
					<div tid="" class="modal-footer" id="allotOkButton">
						<button type="button" class="btn gui-btn-ok"
							onclick="submitAllotAgain()">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 其他状态详情结束 -->

		<!-- 已完成详情开始 -->
		<div class="modal fade" id="ewxj_datainfo2">
			<div class="modal-dialog modal-lg">
				<div class="modal-content ewxj_modal_baseinfo_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" style="text-align:center;">任务详情</h5>
					</div>
					<div class="modal-body ewxj-base-modal-body">
						<table class="table table-bordered">
							<tr>
								<td class="background-custom" style="width:20%">设备名称：</td>
								<td class="td-custom" style="width:30%" id="info_ok_equip_name"></td>
								<td class="background-custom" style="width:20%">设备种类：</td>
								<td class="td-custom" style="width:30%" id="info_ok_equip_kind"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">设备编号：</td>
								<td class="td-custom" style="width:30%" id="info_ok_equip_identify"></td>
								<td class="background-custom" style="width:20%">任务编号：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_number"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检开始时间：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_checkstime"></td>	
								<td class="background-custom" style="width:20%">巡检结束时间：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_checktime"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">是否巡检：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_isxj"></td>
								<td class="background-custom" style="width:20%">巡检结果：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_result"></td>
							</tr>					
							<tr>
								<td class="background-custom" style="width:20%">巡检后意见：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_idea"></td>
								<td class="background-custom" style="width:20%">状态：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_status"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">提交人：</td>
								<td class="td-custom" style="width:30%" id="info_ok_task_submiter"></td>
								<td class="background-custom" style="width:30%">提交时间：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_ok_task_submitTime"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检人员：</td>
								<td colspan="3" class="td-custom" style="width:80%"
									id="info_ok_task_checker_name"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">备注：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_ok_task_remark"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">巡检内容：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_ok_task_content"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">图片：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="info_ok_task_url"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer" id="infoOkButton">
						<button type="button" data-dismiss="modal" class="btn gui-btn-ok"
							id="">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 已完成详情结束 -->
		<!-- 批量分配开始 -->
		<div class="modal fade redistributionModal" id="ewxj_batchallot">
			<div class="modal-dialog modal-md">
				<div class="modal-content ewxj_modal_baseinfo_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" style="text-align:center;">任务详情</h5>
					</div>
					<div class="modal-body ewxj-base-modal-body">
						<table class="table table-bordered" id="allot">
							<tr>
								<td colspan="4" class="text-center"
									style="height: 40px;color: #333333;font-size: 15px;">选择处理人员</td>
							</tr>
							<tr>
								<td class="background-custom">再分配时间：</td>
								<td colspan="3"><input type="text" id="b_allotTime"
									class="form-control" style="border: 0;" placeholder="请选择">
								</td>
							</tr>
							<tr>
								<td class="background-custom">选择处理人：</td>
								<td colspan="3" id="b_allotHandler"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer" id="allotOkButton">
						<button type="button" class="btn modal-ok"
							onclick="submitBatchAllotAgain()">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 批量分配结束 -->
		<!-- 修改开始 -->
		<div class="modal fade" id="ewxj_modify">
			<div class="modal-dialog modal-lg">
				<div class="modal-content ewxj_modal_baseinfo_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" style="text-align:center;">
							<b>修改额外巡检</b>
						</h5>
					</div>
					<div class="modal-body ewxj-base-modal-body">
						<table class="table table-bordered">
							<tr>
								<td colspan="4" class="text-center">巡检任务信息：</td>
								<input type="hidden" id="modify_id" value="">
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">设备名称：</td>
								<td class="td-custom" style="width:30%" id="modify_equip_name"></td>
								<td class="background-custom" style="width:20%">设备种类：</td>
								<td class="td-custom" style="width:30%" id="modify_equip_kind"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">设备编号：</td>
								<td class="td-custom" style="width:30%"
									id="modify_equip_identify"></td>
								<td class="background-custom" style="width:20%">任务编号：</td>
								<td class="td-custom" style="width:30%" id="modify_task_number"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检人员：</td>
								<td class="td-custom" style="width:30%"
									id="modify_task_checker_name"></td>
								<td class="background-custom" style="width:20%">巡检时间：</td>
								<td class="td-custom" style="width:30%"
									id="modify_task_checktime"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">巡检内容：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="modify_task_content"></td>
							</tr>
						</table>
						<table class="table table-bordered">
							<tr>
								<td colspan="4" class="text-center">填写巡检结果</td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">是否巡检：</td>
								<td class="td-custom" style="width:30%"><select
									class="form-control" id="modify_task_isxj">
										<option value="20">是</option>
										<option value="10">否</option>
								</select></td>
								<td class="background-custom" style="width:20%">巡检结果：</td>
								<td class="td-custom" style="width:30%"><select
									class="form-control" id="modify_task_result">
										<option value="10">正常</option>
										<option value="20">异常</option>
								</select></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">处理方式：</td>
								<td class="td-custom" style="width:30%"><select
									class="form-control" id="modify_task_handle_manner">
										<option value="1">自修</option>
										<option value="2">外修</option>
								</select></td>
								<td class="background-custom" style="width:20%">处理方法：</td>
								<td class="td-custom" style="width:30%"><select
									class="form-control" id="modify_task_handle_method">
										<option value="1">维修</option>
										<option value="2">更换</option>
								</select></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">是否解决：</td>
								<td class="td-custom" style="width:30%"><select
									class="form-control" id="modify_task_is_resolved">
										<option value="1">是</option>
										<option value="0">否</option>
								</select></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检后意见：</td>
								<td class="td-custom" style="width:30%"><input
									id="modify_task_idea" type="text" class="form-control">
								</td>
								<td class="background-custom" style="width:20%">费用（元）：</td>
								<td class="td-custom" style="width:30%"><input type="text"
									class="form-control" id="modify_task_expense"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">提交人：</td>
								<td class="td-custom" style="width:30%"><select
									id="modify_task_submiter" class="form-control">
								</select></td>
								<td class="background-custom" style="width:30%">提交时间：</td>
								<td class="td-custom" style="width:70%"><input
									id="modify_task_submitTime" type="text" class="form-control">
								</td>
							</tr>
							<tr>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">备注：</td>
								<td colspan="3" class="td-custom" style="width:70%"><input
									type="text" class="form-control" id="modify_task_remark">
								</td>
							</tr>
							<tr>
								<td class="background-custom" style="width:30%">图片：</td>
								<td colspan="3" class="td-custom" style="width:70%"
									id="modify_task_url">
									<div id="modify_imgs"></div>
									<div id="modify_fileUploadContent" class="fileUploadContent"></div>
								</td>
							</tr>
						</table>
					</div>
					<div class="modal-footer" style="text-align:center;">
						<button type="button" class="btn gui-btn-ok"
							onclick="submitUpdate()" style="width:80px;">修改</button>
						<button type="button" class="btn gui-btn-cancel"
							data-dismiss="modal" style="width:80px;">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 修改结束 -->
<!-- ----------------------------------------------异常额外任务------------------------------------------------------------ -->
		<!-- 异常详情开始 -->
		<div class="modal fade" id="ewxj_abnormal_datainfo">
			<div class="modal-dialog modal-lg">
				<div class="modal-content ewxj_modal_baseinfo_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" style="text-align:center;">任务详情</h5>
					</div>
					<div class="modal-body ewxj-base-modal-body">
						<table class="table table-bordered" id="abnormal_allot">
							<tr>
								<td colspan="4" class="text-center">选择处理人员</td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%;">再分配时间：</td>
								<td colspan="3" class="" style="width:80%;"><input
									type="text" id="abnormal_allotTime" class="form-control"
									placeholder="请选择" style="border: 0;"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%;">选择处理人：</td>
								<td colspan="3" class="" style="width:80%;" id="abnormal_allotHandler"></td>
								<td style="display:none;" id="abnormal_abnormalId"></td>
							</tr>
						</table>
						<table class="table table-bordered">
							<tr><td colspan="4" style="text-align: center;">巡检结果</td></tr>
							<tr>
								<td class="background-custom" style="width:20%">是否巡检：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraIsxjName"></td>
								<td class="background-custom" style="width:20%">巡检结果：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraResultName"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">提交人：</td>
								<td class="td-custom" style="width:30%" id="abnormal_abnormalSubmitName"></td>
								<td class="background-custom" style="width:20%">是否解决：</td>
								<td class="td-custom" style="width:30%" id="abnormal_abnormalIsPollingName"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">提交时间：</td>
								<td class="td-custom" style="width:30%" id="abnormal_abnormalSubmitTime"></td>
								<td class="background-custom" style="width:20%">状态：</td>
								<td class="td-custom" style="width:30%" id="abnormal_abnormalStatusName"></td>
							</tr>	
						</table>
						<table class="table table-bordered">
	                        <thead>
	                            <tr>
	                                <td colspan="8" class="table-title" style="height: 40px;">异常设备</td>
	                            </tr>
	                            <tr>
	                                <th>配件名称</th>
	                                <th>规格型号</th>
	                                <th>故障描述</th>
	                                <th>处理方法</th>
	                                <th>处理方式</th>
	                                <th>费用</th>
	                                <th>图片</th>
	                            </tr>
	                       </thead>
	                       <tbody>
	                            <tr style="text-align: center;">
	                                <td id="abnormal_partName"></td>
	                                <td id="abnormal_partDspecific"></td>
	                                <td id="abnormal_abnormalDescribe"></td>
	                                <td id="abnormal_abnormalHMethodName"></td>
	                                <td id="abnormal_abnormalHModeName"></td>
	                                <td id="abnormal_abnormalMoney"></td>
	                                <td id="abnormal_abnormalUrl"></td>
	                            </tr>
	                       </tbody>
                       </table>
                       <table class="table table-bordered" style="display:none;">
	                        <thead>
	                            <tr>
	                                <td colspan="5" class="table-title" style="height: 40px;">调拨设备</td>
	                            </tr>
	                            <tr>
	                                <th>配件名称</th>
	                                <th>规格型号</th>
	                                <th>调拨数量</th>
	                                <th>库存数量</th>
	                                <th>调拨状态</th>
	                            </tr>
	                       </thead>
	                       <tbody id="Appropriation_table">
	                            
	                       </tbody>
                       </table>
                       <table class="table table-bordered">
							<tr><td colspan="4" style="text-align: center;">巡检信息</td></tr>
							<tr>
								<td class="background-custom" style="width:20%">设备名称：</td>
								<td class="td-custom" style="width:30%" id="abnormal_deviceName"></td>
								<td class="background-custom" style="width:20%">设备种类：</td>
								<td class="td-custom" style="width:30%" id="abnormal_kindName"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">设备编号：</td>
								<td class="td-custom" style="width:30%" id="abnormal_deviceNumber"></td>
								<td class="background-custom" style="width:20%">任务编号：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraNumber"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检开始时间：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraCheckTime"></td>
								<td class="background-custom" style="width:20%">巡检结束时间：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraCheckTimeEd"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">备注：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraRemark"></td>
								<td class="background-custom" style="width:20%">巡检后意见：</td>
								<td class="td-custom" style="width:30%" id="abnormal_extraIdea"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检人员：</td>
								<td class="td-custom" colspan="3" style="width:30%" id="abnormal_extraCheckName"></td>
							</tr>
							<tr>
								<td class="background-custom" style="width:20%">巡检内容：</td>
								<td colspan="3" class="td-custom" style="width:30%" id="abnormal_extraContent"></td>
							</tr>
						</table>
					</div>
					<div class="modal-footer" id="abnormal_again_one">
						<button type="button" data-dismiss="modal" class="btn gui-btn-ok"
							id="">确定</button>
					</div>
					<div class="modal-footer" style="display: none;" id="abnormal_again_two">
						<button type="button" class="btn gui-btn-ok"
						onclick="$this.abnormal_again_allot()"	id="">确定</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 异常详情结束 -->
		<!-- 图片展示模态框开始 -->
	    <div class="modal fade" id="abnormal_showPictures">
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
	                        <ol class="carousel-indicators" id="abnormal_serial_number">
	                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
	                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
	                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
	                            <li data-target="#carousel-example-generic" data-slide-to="3"></li>
	                        </ol>
	
	                        <div class="carousel-inner" id="abnormal_serial_picture">
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
<script
	src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script
	src="${pageContext.request.contextPath}/public/js/bootstrap.min.js"></script>
<!--bootstrap-treeview script -->
<script
	src="${pageContext.request.contextPath}/public/js/bootstrap-treeview.js"></script>
<!-- page js -->
<script
	src="${pageContext.request.contextPath}/public/js/simplePagination.js"></script>
<!-- date time ctl -->
<script
	src="${pageContext.request.contextPath}/public/js/bootstrap-datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/public/js/bootstrap-datetimepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/public/js/locales/bootstrap-datepicker.zh-CN.min.js"></script>
<!-- custom js -->
<script
	src="${pageContext.request.contextPath}/public/js/modalwindow.js"></script>
<script
	src="${pageContext.request.contextPath}/public/js/bootbox.min.js"></script>
<script
	src="${pageContext.request.contextPath}/views/admin/js/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/public/utils/util.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/public/utils/upload.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/public/serach-select/jquery.combo.select.js"></script>
<script
	src="${pageContext.request.contextPath}/views/admin/polling/checkmanage_ewxj.js"></script>
<script type="text/javascript">
	$(function() {
		var ewxjObj = new ewxj();
	});
</script>
</html>
