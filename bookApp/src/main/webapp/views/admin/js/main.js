$("#main_name").html(getParam("name"));
$("#main_uid").html(getParam("id"));
var css = "";
/**
 * 退出
 */
function logOut() {
	window.location.href = ROOTPATH + "/sm/userinfo/logout"
}
/**
 * 重置密码
 */
function resetPass() {
	var id = $("#main_uid").html();
	$('#reset_password').val('');
	$('#re_reset_password').val('');

	$('#resetPassBtn').unbind();
	$('#resetPassBtn').click(function() {

		var former = common_trim($("#former_password").val());
		var pass = common_trim($('#reset_password').val());
		var repass = common_trim($('#re_reset_password').val());

		if (former == '') {
			showMsg('原密码不能为空字符串！', null);
			return;
		}
		if (pass == '') {

			showMsg('新密码不能为空字符串！', null);
			return;
		}

		if (pass != repass) {

			showMsg('前后输入密码不一致！', null);
			return;
		}

		$.post(getRootPath() + "/sm/userinfo/reset", {
			id : id,
			loginpasswd : pass,
			formerpasswd : former,
		}, function(data) {
			if (data.status) {
				showMsg('重置密码成功！', function() {
					window.location.reload();
				})
			} else {
				if (data.memo == null) {
					showMsg('重置密码失败！', null);
				} else {
					showMsg(data.memo, null);
				}
			}
		})
	});

	$('#mdf_pass_form').modal('show');
}
$(function() {
	// 查询用户信息
	common_post(getRootPath() + "/sm/userinfo/getLoginUser", {}, function(data) {
		var msg = $.parseJSON(data).user;
		$("#main_name").html(msg.name);
		$("#main_uid").html(msg.id);
		if (isNull(msg.urlimage) != "")
			$("#header_user_img").prop("src", getRootPath() + msg.urlimage);
	}, function() {
	}, function() {
	})
	// getMessage();
	$('.main_menu').MainMenu(function(id) {
		left_main_tree_click(id);
	});
	var parent = document.getElementById("gh_0");
	// parent.style.color="#00916c";
	var child = parent.children[0].children[0].children[0];
	child.src = child.src.replace(".svg", "_hover.svg");
	var frame = document.getElementById('rt_frame_conent');
	frame.src = getRootPath() + '/loginAndout/toPage?path=admin/home/home';

	// setInterval('getMessage()',60000);
	// document.getElementById("mm_homepage_systemstate").style.background =
	// '#00d1a5';

	// 展开一个
	// $("#mm_checkmanage_fpxj").click();
});

function left_main_tree_click(id) {
	// 查询提示消息
	// getMessage();

	// 清除首页样式
	var parent = document.getElementById("gh_0");
	parent.style.color = "";
	var child = parent.children[0].children[0].children[0];
	child.src = child.src.replace("_hover.svg", ".svg");
	// 清除样式
	$(".main_menu div ul li div").each(function(index, item)// 子节点
	{
		var class_id = $(item)[0].id;
		document.getElementById(class_id).style.background = '';
		document.getElementById(class_id).style.color = '';

		var parent = document.getElementById(class_id).parentElement.parentElement.parentElement.previousSibling;
		parent.style.color = "";
		var child = parent.children[0].children[0].children[0];
		child.src = child.src.replace("_hover.svg", ".svg");
	});

	// 加载样式
	// document.getElementById(id).style.background = '#00d1a5';
	document.getElementById(id).style.background = '#6e87a1';
	document.getElementById(id).style.color = '#fff';
	// 获取父节点,更改父节点样式
	var parent = document.getElementById(id).parentElement.parentElement.parentElement.previousSibling;
	// parent.style.color="#00916c";
	parent.style.color = "#fff";
	// 当前父节点没有打开要打开
	if ($(parent).attr('aria-expanded') != true && $(parent).attr('aria-expanded') != 'true') {
		$(parent).click();
	}
	// 其它父节点折叠起来
	var parentId = parent.id;
	var headings = $("#left_click_menu").find(".panel-heading");
	$.each(headings, function(i, obj) {
		var id = $(obj).attr('id');
		if (id != 'gh_0' && id != parentId) {
			if ($(obj).attr('aria-expanded') == 'true' || $(obj).attr('aria-expanded') == true) {
				$(obj).click();
			}
		}
	});

	var child = parent.children[0].children[0].children[0];
	child.src = child.src.replace(".svg", "_hover.svg");

	var frame = document.getElementById('rt_frame_conent');

	if (frame == null)
		return;

	if (id == 'mm_homepage_systemstate') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/home/home';
	}
	/* 库存管理 */
	/*
	 * else if(id == 'mm_repertory_dqkc') { frame.src =
	 * getRootPath()+'/loginAndout/toPage?path=admin/repertory/repertory_current'; }
	 * else if(id == 'mm_repertory_rkjl') { frame.src =
	 * getRootPath()+'/loginAndout/toPage?path=admin/repertory/repertory_intoRecords'; }
	 * else if(id == 'mm_repertory_dbckjl') { frame.src =
	 * getRootPath()+'/loginAndout/toPage?path=admin/repertory/repertory_outRecords'; }
	 */
	/* 设备管理 */
	else if (id == 'mm_devicemanage_fjxt') {
		frame.src = ROOTPATH + 'equip/equipRest/equipMain';
	}else if (id == 'mm_devicemanage_jygh'){ // 借阅归还
		frame.src = ROOTPATH + 'equip/equipRest/equipMainJygh';
	} else if (id == 'mm_applymanage_class') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/apply/applyManager';
	} else if (id == 'mm_devicemanage_jdcsxt') {
		frame.src = './devicemanage_jdcsxt.html';
	} else if (id == 'mm_repertory_management') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/repertory/repertory_management';
	} else if (id == 'mm_devicemanage_bysb')// 保养设备
	{
		frame.src = './devicemanage_bysb.html';
	} else if (id == 'mm_regionmanage_sbqy') {
		frame.src = './area/stuinfo/listUser';
	} else if (id == 'mm_repairplan_sbwh') {
		frame.src = getRootPath() + '/maintenance/maintain/maintainIndex';
	} else if (id == 'mm_repairplan_fazx') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/maintenance/repairplan_fazx';
	} else if (id == 'mm_checkmanage_cgxj')// 巡检工单
	{
		// frame.src = './checkmanage_xjgd.html';
	} else if (id == 'mm_checkmanage_rwls') {
		// frame.src = './checkmanage_rwls.html';
	} else if (id == 'mm_checkmanage_ewxj') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/polling/checkmanage_ewxj';
	} else if (id == 'mm_checkmanage_fpxj') {
		// frame.src = './checkmanage_fpxj.html';
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/allot/checkmanage_fpxj';
	} else if (id == 'mm_SpotCheck_check') // 抽查考核
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/missionManage/spotCheck';
	} else if (id == 'mm_missionmanage_missonorder') {
		frame.src = getRootPath() + '/mission/missionOrder/index';
	} else if (id == 'mm_missionmanage_exceptionorder') {
		frame.src = getRootPath() + '/mission/exceptionOrder/index';
	}
	// -----任务历史记录
	else if (id == 'mm_TaskHistoryManager_allot')// 分配历史记录
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/history/TaskHistoryManager_allot';
	} else if (id == 'mm_TaskHistoryManager_task')// /任务历史记录
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/sm/actionLog';
	} else if (id == 'mm_TaskHistoryManager_task_login')// /任务历史记录
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/sm/actionLog_login';
	} else if (id == 'mm_exceptmanage_gzjl') {
		// frame.src = './exceptmanage_gzjl.html';
	} else if (id == 'mm_exceptmanage_wxjl') {
		// frame.src = './exceptmanage_wxjl.html';
	} else if (id == 'mm_exceptmanage_ghjl') {
		// frame.src = './exceptmanage_ghjl.html';
	} else if (id == 'mm_exceptmanage_ycjl') {
		// frame.src = './mm_exceptmanage_ycjl.html';
	} else if (id == 'mm_exceptmanage_ycyj') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/equip/exceptmanage_ycyj';
	}

	// 智能分析------------------------------------------------------------------------------------

	else if (id == 'mm_zhinengfenxi_sbtj') // 设备统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_sbtj';
	} else if (id == 'mm_zhinengfenxi_sbyjtj') // 设备预警统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_sbyjtj';
	} else if (id == 'mm_zhinengfenxi_whfatj') // 维护方案统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_whfatj';
	} else if (id == 'mm_zhinengfenxi_ryrwtj') // 人员任务统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_ryrwtj';
	} else if (id == 'mm_zhinengfenxi_fprwtj') // 分配任务统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_fprwtj';
	} else if (id == 'mm_zhinengfenxi_ewrwtj') // 额外任务统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_ewrwtj';
	} else if (id == 'mm_zhinengfenxi_qjtb') {// 请假调班统计
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_qjtb';
	} else if (id == 'mm_zhinengfenxi_fytj') // 费用统计
	{
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/chartAnalysis/chart_fytj';
	}

	// 基础设置------------------------------------------------------------------------------------

	else if (id == 'mm_systemmanage_fzgl') {
		frame.src = getRootPath() + '/sm/group/listGroup';
	} else if (id == 'mm_systemmanage_yhgl') {
		frame.src = getRootPath() + '/sm/userinfo/listUser';
	} else if (id == 'mm_systemmanage_zbgl') {
		frame.src = getRootPath() + '/sm/userduty/index';
	}
	/*
	 * else if(id == 'mm_systemmanage_cckh')//抽查考核机制 { frame.src = getRootPath()
	 * +'/sm/randomcheck/index'; }
	 */
	else if (id == 'mm_systemmanage_deviceKind') {
		frame.src = getRootPath() + '/loginAndout/toPage?path=admin/sm/deviceKind';
	}

	else if (id == 'mm_shexiang_shezhi') {
		frame.src = getRootPath() + '/equip/equipRest/goMonitorMain';
	}

	else if (id == 'mm_shexiang_shezhi_chunchu') {
		frame.src = getRootPath() + '/equip/equipRest/goMonitorChunchu';
	}

	else if (id == 'mm_equip_location') {
		frame.src = getRootPath() + '/equip/equipRest/goEquipMap';
	}

}

/**
 * *获取消息提示信息---getMessage
 */
function getMessage() {
	common_post(getRootPath() + "/admin/index/indexRest/getMessage", {}, function(data) {
		$('#modal-custom').find('.modal-body').empty();
		var message = $.parseJSON(data);

		$('#modal-custom').find('.modal-title').text("未读任务：" + message.total + "条");
		$("#wx_badge").html(message.total);
		var yesterday = null;
		$('#modal-custom').find('.modal-body').append('<p style="margin: 10px auto;">今日消息：</p>');

		// 上次未分配任务
		var allot = message.allot;
		var allot_skip = "mm_checkmanage_fpxj";
		if (allot != 0)
			$('#modal-custom').find('.modal-body').append('<p style="margin: 10px auto;"><a href="javascript:void(0);" onclick="skip_page(\'' + allot_skip + '\',\'' + allot + '\')">上次未分配任务：' + allot + '条</a></p>');

		// 未分配的转异常
		var unAllotAb = message.unAllotAb;
		var unAllotAb_skip = "mm_missionmanage_exceptionorder";
		if (unAllotAb != 0) {
			$('#modal-custom').find('.modal-body').append('<p style="margin: 10px auto;"><a href="javascript:void(0);" onclick="skip_page(\'' + unAllotAb_skip + '\',\'' + unAllotAb + '\')">未分配转异常：' + unAllotAb + '条</a></p>');
		}

		// 异常未处理
		var UnHandleAb = message.UnHandleAb;
		var UnHandleAb_skip = "mm_missionmanage_exceptionorder";
		$.each(UnHandleAb, function(index, item) {
			$('#modal-custom').find('.modal-body').append('<p style="margin: 10px auto;"><a href="javascript:void(0);" onclick="skip_page(\'' + UnHandleAb_skip + '\',\'' + item.id + '\')">' + item.name + '未处理异常：' + item.count + '条</a></p>');
		});

		/** ************昨天***************** */
		$('#modal-custom').find('.modal-body').append('<p style="margin: 10px auto;">昨天消息：</p>');
		// 已过期巡检任务-
		var OutList = message.OutList;
		var OutList_skip = "mm_missionmanage_missonorder";
		$.each(OutList, function(index, item) {
			$('#modal-custom').find('.modal-body').append('<p style="margin: 10px auto;"><a href="javascript:void(0);" onclick="skip_page(\'' + OutList_skip + '\',\'' + item.id + '\')">' + item.name + '漏检任务：' + item.count + '条</a></p>');
		});
	});
};
/**
 * 弹出消息框挑战页面
 */
function skip_page(skip, item)// document.cookie="choose_Skip="+"";//工单还是异常
{

	if (item.indexOf("未处理") > 0) {
		storage.setItem("type", "yichang");
		storage.setItem("status", "yichang");
		storage.setItem("xjry", item.split("-")[0]);
	}

	left_main_tree_click(skip);
}
/**
 * 拖动
 */
function dragFunc(id) {
	var Drag = document.getElementById(id);
	Drag.onmousedown = function(event) {
		var ev = event || window.event;
		event.stopPropagation();
		var disX = ev.clientX - Drag.offsetLeft;
		var disY = ev.clientY - Drag.offsetTop;
		document.onmousemove = function(event) {
			var ev = event || window.event;
			Drag.style.left = ev.clientX - disX + "px";
			Drag.style.top = ev.clientY - disY + "px";
			Drag.style.cursor = "move";
		};
	};
	Drag.onmouseup = function() {
		document.onmousemove = null;
		this.style.cursor = "default";
	};
};

/**
 * 位置获取（x+y）
 */
function getClickPos(e) {
	e = e || window.event;
	var imgId = '#' + $(e.target).attr('id');
	var currentWidth = $(imgId).width();
	var currentHeight = $(imgId).height();
	var offsetX = e.pageX - $(imgId).offset().left - 3;
	var offsetY = e.pageY - $(imgId).offset().top - 25;
	var x = offsetX - 1;
	var y = offsetY + 21;
	$('.areaMaker').html('<div class="ball" style="top:' + offsetY + ';left:' + offsetX + '"></div>');
	/*
	 * console.log(offsetX+"---------"+offsetY); console.log(x+"---------"+y);
	 */
	$("#spotlocate").val(x + "," + y);
}
function getMovePos(e) {
	e = e || window.event;
	var imgId = '#' + $(e.target).attr('id');
	var currentWidth = $(imgId).width();
	var currentHeight = $(imgId).height();
	var offsetX = e.pageX - $(imgId).offset().left - 3;
	var offsetY = e.pageY - $(imgId).offset().top - 25;
	var x = offsetX + 10;
	var y = offsetY + 51;

	var mydiv = document.createElement("div");
	mydiv.setAttribute("id", "hint");
	mydiv.style.position = "absolute";
	mydiv.style.color = "#3a3a3a";
	mydiv.style.lineHeight = "15px";
	mydiv.style.background = "#fff";
	mydiv.style.borderStyle = "solid";
	mydiv.style.borderColor = "#fff";
	mydiv.style.padding = "5px 8px";
	mydiv.style.borderRadius = "5px";
	mydiv.style.borderWidth = "1px";
	mydiv.style.height = "40px";
	mydiv.style.display = "none";
	$("#area").append(mydiv);
	document.getElementById("imageID").addEventListener("mousemove", function() {
		var myhint = document.getElementById("hint");
		myhint.style.display = "block";
		myhint.style.left = x + "px";
		myhint.style.top = y + "px";
		myhint.innerHTML = "x：" + x + "像素</br>y：" + y + "像素";
	});
}