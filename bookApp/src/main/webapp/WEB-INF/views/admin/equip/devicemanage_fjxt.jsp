<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  	<head>
		<base href="<%=basePath%>">

		<title>所有设备</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--<link rel="stylesheet" type="text/css" href="styles.css">-->

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

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		  <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
  	</head>
  
  	<body>
		<!--主体内容 start-->
  		<div class="container-fluid LR_Cancel_Iframe">
    		<div class="row">
				<div class="col-sm-2">
					<div class="gui-content-left" id="manage_zhsb_btn">
						<div class="row">
							<div class="col-sm-4" style="text-align: center;">
								<div onclick="$this.devtree_manage(1);">
									<button class="btn gui-btn-add">添加</button>
								</div>
							</div>
							<div class="col-sm-4" style="text-align: center;">
								<div onclick="$this.devtree_manage(2);">
									<button class="btn gui-btn-modify">修改</button>
								</div>
							</div>
							<div class="col-sm-4" style="text-align: center;">
								<div onclick="$this.devtree_manage(3);">
									<button class="btn gui-btn-del">删除</button>
								</div>
							</div>
						</div>

						<div class="device_tree device_tree_fjxt" id="tree"></div>
					</div>
				</div>
				<div class="col-sm-10">
					<div class="gui-content-right">
						<div class="device_content device_content_fjxt">
							<div class="search_add_div gui-iframe-header">
								<div class="input-group search_div">
									<input type="text" class="form-control input-sm search_input" placeholder="设备名称 / 编号">
									<div class="input-group-addon btn btn-primary glyphicon glyphicon-search search_btn" onclick="$this.search_info(true);"></div>
								</div>
								<div onclick="window.open('http://127.0.0.1:8080/xunjian/device?action=makeDeviceClassTree')"></div>

								
								<div class="add_part gui-btn-lgAdd" data-toggle="modal" onclick="$this.initAddPart('#owndevice','#partctl','#fenlei');">
									<span class="glyphicon glyphicon-plus"></span>
									<span>新增图书</span>
								</div>
							</div>

							<div class="table_div gui-iframe-body">
								<!-- 表格内容-->
								<div class="table_div_fjxt">
									<table class="table table-bordered table-hover table_custom table_custom_fjxt">
										<thead id="table_head" class="table_head">
										<tr>
											<th>序号</th>
											<th>设备名称</th>
											<th>设备识别码</th>
											<th>分类</th>
											<th>数量</th>
											<th>状态</th>
											<th style="width: 200px;">操作</th>
										</tr>
										</thead>
										<tbody id="table_body"></tbody>
									</table>
									<!-- 分页 -->
									<div class="table_page_div clearfix" id="table_page_div">
										<div style="float:left;margin-left: 5px;">每页显示数据<input class="input-sm search_input" style="margin:0 5px;" size="2" type="text" placeholder="12"/>条<button style="margin-left: 5px;" class="btn gui-btn-add" onclick="$this.changePaging(this)">确定</button></div>
										<div class="pagination pull-right"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
   			</div>
		</div>
		<!--主体内容 end-->

		<!------------以下是弹窗内容------------>
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
		<!-- 添加设备树信息 -->
		<div class="modal fade addEquipmentModal" id="zhsb_addtreenode">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title">添加</h5>
					</div>
					<div class="modal-body">
						<div class="form-inline modal-md-form">
							<div class="form-line-box">
								<div class="form-group">
									<label for="add_tree_gc_input">上级菜单：</label>
									<input type="text" class="form-control" id="add_tree_gc_input" disabled="disabled" placeholder="">
								</div>
							</div>
							<div class="form-line-box">
								<div class="form-group">
									<label for="add_tree_jb_input">新增二级：</label>
									<input type="text" class="form-control" id="add_tree_jb_input" placeholder="">
								</div>
								<!--<button class="btn gui-btn-ok" id="add_tree_jb_btn">添加</button>-->
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" id="add_tree_jb_btn" class="btn gui-btn-ok">添加</button>
						<button type="button" id="closeAddEquipWin" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 修改设备树信息 -->
		<div class="modal fade modifyEquipmentModal" id="zhsb_mdftreenode">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title">修改</h5>
					</div>
					<div class="modal-body">
						<div class="form-inline modal-md-form">
							<div class="form-line-box">
								<div class="form-group">
									<label for="mdf_tree_gc_input">修改为：</label>
									<input type="text" class="form-control" id="mdf_tree_gc_input" placeholder="">
								</div>
								<!--<button class="btn gui-btn-ok" id="mdf_tree_gc_btn">修改</button>-->
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-ok" id="mdf_tree_gc_btn">修改</button>
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
				<!-- modal-content end. -->
			</div>
		</div>
		<!-- 添加部件信息 -->
		<div class="modal fade addPartModal" id="fjxt_addpart">
			<div class="modal-dialog  modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" id="addPartTitle">新增部件</h5>
					</div>
					<div class="modal-body fjxt_modal_body">
						<form enctype="multipart/form-data" id="formUpload">
							<table class="table	table-bordered gui-table-box">
								<tbody>
								<tr>
									<td class="table-label"><label>上级名称：</label></td>
									<td class="special-margin" colspan="1"><label id="fatherEquipName" style="padding: 0 10px;"></label></td>
								</tr>
								<tr>
									<td class="table-label"><label>种类：</label></td>
									<td><input type="text" class="form-control" name="dkindid" id="add_dkindid"/></td>
								</tr>
								<tr>
									<td class="table-label"><label>图书名称：</label></td>
									<td><input type="text" class="form-control" name="name" placeholder="请输入"></td>
								</tr>
								<tr>
									<td class="table-label">图书编号：</td>
									<td><input type="text" class="form-control" name="identify"  placeholder="请输入"></td>
									<!-- <td class="table-label"><label>状态：</label></td>
									<td><input type="text" class="form-control" name="istatus" id="add_status" fxname="statusFx"  disabled></td>
									<td class="table-label">出版社：</td>
									<td><input type="text" class="form-control" name="ifirm"  placeholder="请输入"></td> -->
								</tr>
								<!-- <tr>
									<td class="table-label">借阅人位置：</td>
									<td><input type="text" class="form-control" name="ibrand"  placeholder="请输入"></td>
									<td class="table-label">借阅人编号：</td>
									<td><input type="text" class="form-control" name="unit"  placeholder="请输入"></td>
								</tr>
								<tr>
									<td class="table-label"><label>借阅人：</label></td>
									<td><input type="text" class="form-control" name="ispecific"  placeholder="请输入"></td>
								</tr>
								<tr>
									
									<td class="table-label">借出时间：</td>
									<td><input type="text" class="form-control emheight2 addInfoDate" readonly="readonly" name="onlinedate" usefx="true" fxname="Formatyyyymmdd" fixtype="date"  placeholder="请选择"></td>
								</tr> -->
								<%--<tr>
									<td class="table-label"><label>到期时间：</label></td>
									<td><input type="text" class="form-control emheight2 addInfoDate" readonly="readonly" name="baddate" usefx="true" fxname="Formatyyyymmdd" fixtype="date" placeholder="请选择"></td>
									<td class="table-label"><label>最后维修时间：</label></td>
									<td><input type="text" class="form-control emheight2 addInfoDate" readonly="readonly" name="repairdate" usefx="true" fxname="Formatyyyymmdd" fixtype="date" placeholder="请选择"></td>
								</tr>
								<tr>
									<td class="table-label"><label>最后更换时间：</label></td>
									<td><input type="text" class="form-control emheight2 addInfoDate" readonly="readonly" name="replacedate" usefx="true" fxname="Formatyyyymmdd" fixtype="date" placeholder="请选择"></td>
									<td class="table-label"><label>区域：</label></td>
									<td><select class="form-control" name="areaId" id="add_area_id"></select></td>
								</tr>
								<tr>
									<td class="table-label"><label>备注：</label></td>
									<td colspan="3"><input type="text" class="form-control" name="infonote" placeholder="请输入"></td>
								</tr>
								<tr>
									<td rowspan="3" class="table-label"><label>质保期(年)：</label></td>
									<td rowspan="3"><input type="text" class="form-control" name="guarantee" placeholder="请输入"></td>
									<td rowspan="3" colspan="2" style="padding: 0;">
										<table class="addPartForEachPartTable">
											<tbody id="addPartForEachPart"></tbody>
										</table>
									</td>
								</tr>

								--%></tbody>
								<tfoot>
									<tr style="height: 34px;">
										<td class="table-label"><label style="padding-top: 8px;font-size: 13px;color: #5a5a5a;font-weight: normal;">图片：</label></td>
										<td class="special-margin" colspan="3">
											<input type="file" class="form-control file-input" id="infourl" placeholder="请选择">
										</td>
									</tr>
									<tr>
										<td colspan="4" style="width: 100%;">
											<div class="imgbox" id="large">
												<img alt="设备" src="" id="img"  width="196" height="120">
											</div>
										</td>
									</tr>
									<tr style="display:none">
										<td colspan="4" class="text-center">
											<input type="text" name="spotlocate" id="spotlocate" class="spotlocate" value="">
											<span class="btn gui-btn-view" id="pointImg" onclick="parentFunction();">借阅人住址</span>
										</td>
									</tr>
								</tfoot>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-ok" id="addPartBtn">添加图书</button>
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 借出 -->
		<div class="modal fade addPartModal" id="fjxt_initBowr">
			<div class="modal-dialog  modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" id="addPartTitle">图书借出</h5>
					</div>
					<div class="modal-body fjxt_modal_body">
						<form enctype="multipart/form-data" id="formUpload">
							<table class="table	table-bordered gui-table-box">
								<tbody>
								<tr>
									<td class="table-label"><label>名称：</label></td>
									<td><input type="text" class="form-control" name="bowrbookname" readonly='true' placeholder="请输入"></td>
									<td class="table-label">编号：</td>
									<td><input type="text" class="form-control" name="bowrbookidentify" readonly='true'  placeholder="请输入"></td>
								</tr>
								<tr>
									<td class="table-label">安装位置：</td>
									<td><input type="text" class="form-control" name="bowrbookibrand"  placeholder="请输入"></td>
									<td class="table-label">品牌：</td>
									<td><input type="text" class="form-control" name="bowrbookunit"  placeholder="请输入"></td>
								</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-ok" id="addBowr">借出</button>
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		
		
		<!-- 基本信息 -->
		<div class="modal fade basicPartModal" id="fjxt_baseinfo">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title">基本信息</h5>
					</div>
					<div class="modal-body fjxt_modal_body">
						<table class="table	table-bordered gui-table-box">
							<tbody>
							<tr>
								<td class="table-label"><label>所属：</label></td>
								<td colspan="3"><label id="rootEquips"></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>种类：</label></td>
								<td><label name="dkname" type="data" ></label></td>
								<td class="table-label"><label>图书名称：</label></td>
								<td><label name="name" type="data" ></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>编号：</label></td>
								<td><label name="identify" type="data" ></label></td>
								<!-- <td class="table-label"><label>出版社：</label></td>
								<td><label name="ifirm" type="data" ></label></td> -->
								<td class="table-label"><label>状态：</label></td>
								<td><label name="istatus" type="data" usefx="true" fxname="statusFx" ></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>借阅人编号：</label></td>
								<td><label name="unit" type="data" ></label></td>
								<td class="table-label"><label>借阅人：</label></td>
								<td><label name="ispecific" type="data" ></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>借阅人住址：</label></td>
								<td><label name="ibrand" type="data" ></label></td>
								<td class="table-label"><label>最近借出时间：</label></td>
								<td><label name="onlinedate" type="data" usefx="true" fxname="Formatyyyymmdd" fixtype="date"></label></td>
							</tr>
							<%--<tr>
								<td class="table-label"><label>到期时间：</label></td>
								<td><label name="baddate" type="data" usefx="true" fxname="Formatyyyymmdd" fixtype="date" ></label></td>
								<td class="table-label"><label>最后维修时间：</label></td>
								<td><label name="repairdate" type="data" usefx="true" fxname="Formatyyyymmdd" fixtype="date" ></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>最后更换时间：</label></td>
								<td><label name="replacedate" type="data" name="onlinedate" usefx="true" fxname="Formatyyyymmdd" fixtype="date" ></label></td>
								<td class="table-label"><label>区域：</label></td>
								<td><label name="area_name" type="data" ></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>质保期(年)：</label></td>
								<td colspan="3"><label name="guarantee" type="data"></label></td>
							</tr>
							<tr>
								<td class="table-label"><label>备注：</label></td>
								<td><label name="infonote" type="data" ></label></td>
								<td colspan="2" rowspan="5" style="padding: 0;">
									<table class="addPartForEachPartTable">
										<tbody id="lookPartForEachPart"></tbody>
									</table>
								</td>
							</tr>
							--%></tbody>
							<tfoot>
							<tr>
								<td class="table-label"><label>图片：</label></td>
								<td colspan="3">
									<div class="imgbox">
										<img alt="设备" src="" id="infoimg"  width="196" height="120" style="width: 196px;">
									</div>
								</td>
							</tr>
							<tr>
								<td colspan="4" class="text-center">
									<input type="hidden" name="spotlocate" id="spotlocate" class="spotlocate" value="">
									<span class="btn gui-btn-view" id="pointImg" onclick="parentFunction('y');">查看位置</span>
								</td>
							</tr>
							</tfoot>
						</table>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 详情信息 begin-->
		<div class="modal fade" id="fjxt_detail">
			<div class="modal-dialog modal-lg">
				<div class="modal-content fjxt_modal_detail_content">
					<!-- mask juhua start -->
					<div class="mask_juhua">
						<div id="img_juhua">
							<img src="views/admin/images/resource/wait.jpg" onclick="javascript:void(0);" />
						</div>
					</div>
					<!-- mask juhua end -->

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 align="center" class="modal-title" id="xqinfo">设备配件详情</h5>
					</div>
					<div class="modal-body base-modal-body">

						<div class="clearfix" style="margin-bottom: 20px;">
							<div class="btn gui-btn-lgAdd" id="addBtn">
								<span class="glyphicon glyphicon-plus"></span>
								<span>新增部件</span>
							</div>
						</div>

						<div class="table_div_fjxt_xq">
							<table class="table table-bordered table-hover table_custom table_custom_fjxt_xq">
								<thead>
								<tr>
									<th>配件名称</th>
									<th>配件规格</th>
									<th>数量</th>
									<th>单位</th>
									<th>备注</th>
									<th>操作</th>
								</tr>
								</thead>
								<tbody id="table_body_xq"></tbody>
							</table>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>

		</div>
		<!-- 详情信息 end -->
		<!-- 详情信息 新增部件/修改信息  start-->
		<div class="modal fade" id="fjxt_detail_mdf_add_form">
			<div class="modal-dialog modal-md">
				<div class="modal-content fjxt_modal_detail_mdf_add_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" id="detail_mdf_add_title">详情 - 新增设备</h5>
					</div>
					<div class="modal-body base-modal-body">
						<form class="form-inline modal-md-form">
							<div class="form-line-box">
								<div class="form-group">
									<label for="detail_name">配件名称：</label>
									<input type="text" class="form-control" id="detail_name" placeholder="">
								</div>
							</div>
							<div class="form-line-box">
								<div class="form-group">
									<label for="detail_identify">配件编号：</label>
									<input type="text" class="form-control" id="detail_identify" placeholder="">
								</div>
							</div>
							<div class="form-line-box">
								<div class="form-group">
									<label for="detail_dspecific">配件规格：</label>
									<input type="text" class="form-control" id="detail_dspecific" placeholder="">
								</div>
							</div>
							<div class="form-line-box">
								<div class="form-group">
									<label for="detail_amount">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量：</label>
									<input type="text" class="form-control" id="detail_amount" placeholder="">
								</div>
							</div>
							<div class="form-line-box">
								<div class="form-group">
									<label for="detail_dunit">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位：</label>
									<input type="text" class="form-control" id="detail_dunit" placeholder="">
								</div>
							</div>
							<div class="form-line-box">
								<div class="form-group">
									<label for="detail_detailnote">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注：</label>
									<input type="text" class="form-control" id="detail_detailnote" placeholder="">
								</div>
							</div>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-ok" id="detailAddPartBtn">添加部件</button>
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 详情信息 新增部件/修改信息   end-->
		<!-- 详情信息 删除信息  start-->
		<div class="modal fade" id="fjxt_detail_del_form">
			<div class="modal-dialog modal-md">
				<div class="modal-content fjxt_modal_detail_mdf_add_content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">×</span><span class="sr-only">Close</span>
						</button>
						<h5 class="modal-title" id="detail_mdf_add_title">详情 - 批量删除配件</h5>
					</div>
					<div class="modal-body base-modal-body">
						<form class="form-inline modal-md-form">
							<div class="form-line-box">			
								<div class="form-group">
									<label for="detail_name_like">配件名称：</label>
									<select class="form-control" id="detail_name_like" style="width:200px;"></select>
								</div>
								
								<div class="form-group" style="margin-top:10px;">
									<label for="detail_dspecific_like">规格型号：</label>
									<select class="form-control" id="detail_dspecific_like" style="width:200px;"></select>
								</div>
							</div>
							
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn gui-btn-ok" id="detailDelPartBtn">确定</button>
						<button type="button" class="btn gui-btn-cancel" data-dismiss="modal">取消</button>
					</div>
				</div>
			</div>
		</div>
		<!-- 详情信息删除信息   end-->
		<script type="text/javascript">
				var ROOTPATH = '<%=basePath %>';
		</script>

		<script src="${pageContext.request.contextPath}/public/js/jquery.min.js"></script>
		<script src="public/js/bootstrap.min.js"></script>
		<script src="public/js/bootstrap-treeview.js"></script>
		<script src="public/js/simplePagination.js"></script>
		<script src="public/js/bootstrap-datepicker.min.js"></script>
		<script src="public/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
		<script src="public/js/bootbox.min.js"></script>
		<script src="public/js/modalwindow.js"></script>
		<script src="views/admin/js/common.js"></script>
		<script src="public/utils/util.js"></script>
		<script src="views/admin/equip/devicemanage_fjxt.js"></script>

		<script type="text/javascript">
			$(function () {
				var fjxtObj = new fjxt();
			});
			/*以下2点请勿移动*/
			//1、调用父页面方法
			function parentFunction(option) {
                parent.showIframeModal(option);
            }
			//2、返回参数
            function backParameters() {
                var parentValue = $("#spotlocate",window.parent.document).val();
                if(parentValue !== ''){
                    var newValue = parentValue.split(",");
                    $("#spotlocate").val(newValue[0]+","+newValue[1]);
                }
            }
		</script>
	</body>
</html>