/**
 * 设备预警库
**/
function ycyj() {
	this.search_total_page = 0;//总页数
	this.cur_search_page = 0;//第几页
	this.cur_page_for_update = 0;//更新页
	this.table_items_count_for_page = 0;//总记录数
	this.left_item_device_id = "";//左侧菜单设备编号
	this.left_item_device_name = "";//左侧菜单设备编号
	this.init();//初始化	
	
	this.total_sum = 0;//任务总数
	this.choose_sum = 0;//任务编号总数
	
	this.warnData = null;
	
	//选择的异常id
	this.choose_abnormal_ids = "";
}
/**
 * 初始化---查詢左側菜單和右側數據
 */
ycyj.prototype.init = function()
{
	$this = this;
	//时间初始化
	//$("#query_startTime").val(new Date().Format("yyyy-MM-dd"));
	///$("#query_endTime").val(new Date().Format("yyyy-MM-dd"));
	//初始化搜索框
	$this.getFormInit();
	//加载图片的预警位置
	$this.getPhotoWarn();
	$this.getLeftTaskWarnBy();
}

/**
 * 初始化搜索条件框
 */
ycyj.prototype.getFormInit = function()
{
	init_date_input('query_startTime');
	init_date_input('query_endTime');
	//巡检状态
	getSelectStatus_ycyj("#query_xunjian_status");
	//处理方式
	getAbnormalWay_select("#query_xunjian_mode");
	//巡检结果
	getSelectResult("#query_xunjian_result");
	//任务类型
	$this.getTypeMenu("#query_device_type");
	//设备厂商
	$this.getIfirm("#query_xunjian_ifirm");
	//设备区域
	$this.getDeviceArea("#query_xunjian_area");
	/**
	 * 搜索框单击
	 */
	$("#query_btn_submit").unbind();
	$("#query_btn_submit").click(function()
	{
		$this.getLeftTaskWarnBy();
	});
	
	//预警图片切换
	var index = 1;
	$(".switchBtn").click(function() {
		$("#data_dispalay" + index).hide();
		if (index == 2) {
		 	index = 0;
		 	location.reload();
		}
		index++;
		$("#data_dispalay" + index).show();
		
	});
}
/**
 * 查询所有设备厂商
 * @param id
 */
ycyj.prototype.getIfirm = function(id)
{
	//拿取所有区域信息
	common_post(
			getRootPath() + "/equip/equipRest/getIfirm",
			{},
			function(msg)
			{
				var data = $.parseJSON(msg).list;
				$(id).empty();
				var option = '<option value="">全部</option>';
				$(id).append(option);

				for(var i = 0; i < data.length; i++){
					var option = '<option value="'+data[i]+'">'+data[i]+'</option>';
					$(id).append(option);
				}
                $(id).comboSelect();
			},
			function(){},
			function(){}
			);
}
/**
 * 设备区域
 * @param id
 */
ycyj.prototype.getDeviceArea = function(id){
	//拿取所有区域信息
	common_post(
			getRootPath() + "/area/areaRest/getRegion",
			{},
			function(msg)
			{
				var data = $.parseJSON(msg);
				$(id).empty();
				var option = '<option value="">全部</option>';
				$(id).append(option);

				for(var i = 0; i < data.length; i++){
					var option = '<option value="'+data[i]['id']+'">'+data[i]['name']+'</option>';
					$(id).append(option);
				}
                $(id).comboSelect();
            },
			function(){},
			function(){}
			);
}
/**
 * 查询询价人员并赋默认值
 * @param id
 * @param xjry
 */
ycyj.prototype.get_xj_member = function(id){

	common_post2
	(
		getRootPath()+"/sm/userinfo/getUserByRoleId/"+DEFAULT_XJRY_ROLE_ID,
		{},
		function(msg){
			
			if(msg == ''){
				
				//console.log('cgxj.get_xj_member msg = "".');
				return;
			}
			
			var jsData = msg.list;
			$(id).empty();
			var option = '<option value="">全部</option>';
			$(id).append(option);

			for(var i = 0; i < jsData.length; i++){
				
				var name = jsData[i]['name'];
				var uid = jsData[i]['id'];
				var option = '<option value="'+uid+'">'+name+'</option>';
				$(id).append(option);
			}	
		},
		function(){},
		function(){});
}
/**
 * 巡检状态下拉框
 * @param id
 */
function getSelectStatus_ycyj(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+NUM_STATUS3+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM50+'">'+NUM_STATUS5+'</option>';
	$(id).append(option);
}
/**
 * 任务类型
 */
ycyj.prototype.getTypeMenu = function(id)
{
	//获得所有类型
	common_post(
			getRootPath()+"/maintenance/frequency/getAllFrequency",
			{},
			function(msg){
				var data = $.parseJSON(msg);
				$(id).empty();
				var option = '<option value="" selected="selected">全部</option>';
				$(id).append(option);
				$.each(data.Msg.type,function(index,item)
				{
					if(item.pid==0)
					{
						var option = '<option value="'+item.id+'">'+item.explains+'</option>';
						$(id).append(option);
					}										
				})
			},function(){},function(){});
}
/**
 * 获取分配历史记录左侧菜单查询
 */
ycyj.prototype.getLeftTaskWarnBy = function()
{
	$("#table_body_left").empty();
	var params = getFormJson("#ycyj_form_control");
	common_post
	(
		getRootPath() + "/admin/equip/warnBankRest/getLeft",
		params,
		function(msg)
		{
			var dataList = $.parseJSON(msg).list;
			for(var i=0 ; i<dataList.length ; i++){
				var html = "";
				if(i==0){
					html = html + '<tr class="table_body_left_click" style="background-color:#EAEAEA">';
				}else{
					html = html + '<tr class="table_body_left_click">';
				}
				html = html + '<td>'+dataList[i].iequipname+'</td>';
				html = html + '<td style="display:none">'+dataList[i].iequipid+'</td>';
				html = html + '</tr>';
				$("#table_body_left").append(html);
			}
			//用户体验开始加载右边带分页的数据，默认取设备数据第一个
			if(dataList.length > 0){
				$this.left_item_device_id = dataList[0].iequipid;
				$this.left_item_device_name = dataList[0].iequipname;
				//开始加载数据
				$this.getTaskWarnBy.call($this,0,MAX_PAGE_BTN_COUNT);
				
				//绑定设备名称部分可点击的列监听事件
				$("#table_body_left").on("click","tr",function(obj){
					$(".table_body_left_click").css("background-color","");
					$(obj.currentTarget).css("background-color","#EAEAEA");
					//获得点击参数，开始查询
					$this.left_item_device_id = obj.currentTarget.childNodes[1].innerText;
					//table清空
					$("#table_body").empty();
					//开始加载数据
					$this.getTaskWarnBy.call($this,0,MAX_PAGE_BTN_COUNT);
				})
			}
			else
			{
				$("#table_body").empty();
				$("#total_item").html("异常预警列表总计"+$this.total_sum+"条.");
			}
		},
		function(){
			
		},
		$this.checkManage_data_error);
}
/**
 * 获取分配历史记录分页条件查询
 */
ycyj.prototype.getTaskWarnBy = function(page,rows)
{
	var params = getFormJson("#ycyj_form_control");
	params.page = ++page;
	params.rows = rows;
	params.iequipid = $this.left_item_device_id;//任务名称
	common_post
	(
		getRootPath() + "/admin/equip/warnBankRest/getPageBy",
		params,
		$this.getManage_data_success,
		function(){
	    	var hInput = $("#front-data-table td input,#front-data-table th input");
	    	hInput.prop("checked","checked");
	    	//人员默认全选
	    	$("#date_item tr:even td input").prop("checked",true);
		},
		$this.checkManage_data_error);
}
/**
 * 更新列表--获取数据成功
 */
ycyj.prototype.getManage_data_success = function(msg,time)
{
	var data = $.parseJSON(msg);
	//$this.table_items_count_for_page = 0;
	$this.update_table.call($this,msg,false);//更新列表
}
/**
 * 上一页和下一页
 * @param pageNumber
 * @param event
 * @returns {Boolean}
 */
ycyj.prototype.changePage = function(pageNumber, event){ 
	
	$this.getAbnormaDetails($this.warnData,pageNumber - 1,MAX_PAGE_BTN_COUNT);
	 return false;
}
/**
 * 更新表格
 * @param msg
 * @param isSearch
 */
ycyj.prototype.update_table = function(msg,isSearch)
{

	if(msg == '')
	{
		//console.log('Error:fjxt.prototype.update_table msg = ""');
		return;
	}
	 var jsonData = $.parseJSON(msg);
	 if($("#table_body") == null) return;
	 
	 var pages = 0;
	 var curpage = 0;
	 var devices = "";
	 var totalCount = 0;
	 var totalNum = "";
	 $.each(jsonData,function(n,value){
		 
		if(n == 'pages')   pages = value;
		if(n == 'curpage') curpage = value;
		if(n == 'list') devices = value;
		if(n == 'totalCount') totalCount = value;
		if(n == 'totalNum') totalNum = value;
	 });
	 
	 $this.search_total_page = pages;
	 
	 if(isSearch)
	 {
		 if($this.cur_search_page == 0) $("#table_body").children().remove();
		 if($this.search_total_page == 0) return;
		 if($this.cur_search_page > $this.search_total_page - 1)
		 {
			 $this.searchToEnd();
			 return;
		 }
	 }
	 else
	 {
		 $("#table_body").children().remove();
		 //update pages
		 if($this.table_items_count_for_page != MAX_PAGE_BTN_COUNT * pages)
		 {
			 $(".pagination").empty();
			 $this.table_items_count_for_page = MAX_PAGE_BTN_COUNT * pages;
			 
			 $(".pagination").pagination({
		        items: $this.table_items_count_for_page,
		        itemsOnPage: MAX_PAGE_BTN_COUNT,
		        cssStyle: 'compact-theme',
		        onPageClick:$this.changePage
		    });
		 }
	 }
	 if(isSearch)
	 {
		 if($this.cur_search_page == 0) $("#table_body").children().remove();
		 if($this.search_total_page == 0) return;
		 if($this.cur_search_page > $this.search_total_page - 1)
		 {
			 $this.searchToEnd();
			 return;
		 }
	 }
	 else
	 {
		 $("#table_body").children().remove();
	 }
	 if(devices.length == 0) 
	 {
		 $this.total_sum = 0;
		 $this.choose_sum = 0;
		 $("#total_item").html("异常预警列表总计"+$this.total_sum+"条.");
		 return;
	 }	 
	 $this.total_sum = totalCount;
	 $this.choose_sum = totalNum;
	 $this.cur_page_for_update = parseInt(curpage);
	 
	 $("#total_item").html("异常预警列表总计"+$this.total_sum+"条，"+totalNum+"");
	
	 for(var i = 0; i < devices.length; i ++)
	{
		var fenlei = '';
		var device = devices[i];		
		var cur_line = 0;
		
		if(isSearch)
		{
			cur_line = ($this.cur_search_page*MAX_PAGE_BTN_COUNT + i + 1);
		}
		else
		{
			cur_line = (curpage*MAX_PAGE_BTN_COUNT + i + 1);
		}
		
		
		var onelineitem = $this.table_html_item(device,cur_line);	
		$("#table_body").append(onelineitem);
		
	}
}
/**
 * 表格
 * @param device
 * @param cur_line
 * @returns {String}
 */
ycyj.prototype.table_html_item = function(device,cur_line)
{
	var control = "";
	
		control = '<div id="'+ device.id  +'" class="table_control_lnk"><div style="display:none">'+ JSON.stringify(device) +'</div>' +
		  '<div>' + 
			  '<a class="btn gui-btn-view" onclick="$this.click_table_ctl_lnk(this,1);">详情</a>&nbsp;&nbsp;</div>';
	var oneline = '<tr>' ;
	
	var startTime = device.iequiponlinedate;
	if(isNull(startTime)=="") startTime = "";
	else startTime = new Date(device.iequiponlinedate.time).Format("yyyy-MM-dd hh:mm");
	oneline = oneline +
	/*'<td>' + '<input type="checkbox" id="'+ CHECKBOX_ID_PREFIX + device.id +'" /><span style="display:none;">'+ device.id+'</span>' + '</td>' + */
	  '<td style="display:none;">' + device.id + '</td>' +   
	  '<td>' + cur_line + '</td>' +
	  '<td>' + device.iequipname + '</td>' +
	  '<td>' + getWanGrande(device.grade) + '</td>' + //预警等级
	  '<td>' + device.num + '</td>' + //异常次数
	  '<td>' + device.freqexplain + '</td>' + //频率
	  '<td>' + device.areaname + '</td>' + //区域
	  '<td>' + device.iequipifirm + '</td>' + ///设备厂商 
	  '<td>' + startTime + '</td>' ; //开始时间
		var html = "";
		if(device.status==NUM10) html = '<td style="color:red;">' + getWanStatus(device.status) + '</td>'; //预警状态  
		else html = '<td>' + getWanStatus(device.status) + '</td>'; //预警状态  
		oneline = oneline + html;
	  
	  oneline = oneline + '<td>' + control + '</td>' + 
	  '</tr>';
	
	return oneline;
}

/**
 * 详情信息
 */
ycyj.prototype.click_table_ctl_lnk = function(dom,type)
{
	var div = $(dom).parent().prev();
	var jsData = $.parseJSON(div[0].innerText);

	if(type==1)
	{
		$this.table_items_count_for_page = 0;
		$this.warnData = jsData;
		$this.getAbnormaDetails($this.warnData,0,MAX_PAGE_BTN_COUNT);
	}
}
/**
 * 查询详情信息
 * @param jsData
 */
ycyj.prototype.getAbnormaDetails = function(jsData,page,rows)
{
	var isSearch = false;
	$("#table_body_abnormal").empty();
	
	jsData.page = page;
	jsData.rows = rows;
	$("#task_abnormal").show();
	var maintain = {
			schemeid:jsData.schemeid,
			equipid:jsData.equipid,
			page:page,
			rows:rows
			};
	//查询异常信息-table_body_abnormal--已处理信息
	common_post(
			getRootPath()+"/admin/equip/warnBankRest/getWarnAbnormal",
			maintain,
			function (data){
				//输出详情信息
				var datas = $.parseJSON(data);
				
				 var pages = 0;
				 var curpage = 0;
				 var devices = "";
				 var totalCount = 0;
				 $.each(datas,function(n,value){
					 
					if(n == 'pages')   pages = value;
					if(n == 'curpage') curpage = value;
					if(n == 'list') devices = value;
					if(n == 'totalCount') totalCount = value;
				 });
				 $("#task_abnormal_title").html("设备异常详情列表总计"+totalCount+"条。");
				 
				 $this.search_total_page = pages;
				 
				 if(isSearch)
				 {
					 if($this.cur_search_page == 0) $("#table_body_abnormal").children().remove();
					 if($this.search_total_page == 0) return;
					 if($this.cur_search_page > $this.search_total_page - 1)
					 {
						 $this.searchToEnd();
						 return;
					 }
				 }
				 else
				 {
					 $("#table_body_abnormal").children().remove();
					 //update pages
					 if($this.table_items_count_for_page != MAX_PAGE_BTN_COUNT * pages)
					 {
						 $(".pagination").empty();
						 $this.table_items_count_for_page = MAX_PAGE_BTN_COUNT * pages;
						 
						 $(".pagination").pagination({
					        items: $this.table_items_count_for_page,
					        itemsOnPage: MAX_PAGE_BTN_COUNT,
					        cssStyle: 'compact-theme',
					        onPageClick:$this.changePage
					    });
					 }
				 }
				 if(isSearch)
				 {
					 if($this.cur_search_page == 0) $("#table_body_abnormal").children().remove();
					 if($this.search_total_page == 0) return;
					 if($this.cur_search_page > $this.search_total_page - 1)
					 {
						 $this.searchToEnd();
						 return;
					 }
				 }
				 else
				 {
					 $("#table_body_abnormal").children().remove();
				 }
				 if(devices.length == 0) 
				 {
					 return;
				 }	 
				 $this.cur_page_for_update = parseInt(curpage);
				 
				for(var i=0;i<devices.length;i++)
				{
					var device = devices[i];
					var cur_line = 0;
					
					if(isSearch)
					{
						cur_line = ($this.cur_search_page*MAX_PAGE_BTN_COUNT + i + 1);
					}
					else
					{
						cur_line = (curpage*MAX_PAGE_BTN_COUNT + i + 1);
					}
					var control = "";
					
					control = '<div id="'+ device.id  +'" class="table_control_lnk"><div style="display:none;">'+JSON.stringify(device)+'</div><div style="display:none">'+ JSON.stringify(jsData) +'</div>' +
					  '<div>'; 
					if(device.status==NUM30)//已处理中 
					{
						if(device.iswarn==0)//可以启动预警
							control	 += '<a class="btn gui-btn-view" onclick="$this.setStatus(this,'+device.id+');">禁止预警</a>';
						if(device.iswarn==1)//可以禁止中
							control	 +=  '<a class="btn gui-btn-del" onclick="$this.setStatus(this,'+device.id+');">启动预警</a>';
					}
					
					control	 += '<a class="btn gui-btn-view" onclick="$this.getDetails(this,'+device.id+');">查看</a></div>';
					
					var input = "";
					if(device.status==NUM30)//已处理中 
					{
						if(device.iswarn==0)
						input = '<input class="gui-magic-checkbox sub-checkbox" type="checkbox" id="'+ CHECKBOX_ID_PREFIX + cur_line +'" /><label for="'+ CHECKBOX_ID_PREFIX + cur_line +'"></label> <span style="display:none;">'+ device.id+'</span><span style="display:none;">'+ jsData.id+'</span>';
					}
					else
					{
						input =  '<span style="display:none;">'+ device.id+'</span><span style="display:none;">'+ jsData.id+'</span>';
					}
					var subTime = "";
					if(isNull(device.submit_time)!="") subTime = new Date(device.submit_time.time).Format("yyyy-MM-dd hh:mm");
					var oneline = '<tr>' +
					  '<td>' + input +  '</td>' + 
					  '<td>' + cur_line + '</td>' + 
					  '<td>' + device.iequipname + '</td>' +   
					  '<td>' + device.taskident + '</td>' + 
					  '<td>' + device.describe + '</td>' + 
					  '<td>' + getAbnormalIs(device.is_polling) + '</td>' + 
					  '<td>' + getAbnormalMethod(device.h_method) + '</td>' + 
					  '<td>' + getAbnormalWay(device.h_mode) + '</td>' + 
					  '<td>' + device.money + '</td>' + 
					  '<td>' + device.abnorSubmitName + '</td>' + 
					  '<td>' + subTime + '</td>' + 
					  '<td>' + device.remark + '</td>' + 
					  '<td>' + getAbnormalStatus(device.status) + '</td>' + 
					  '<td>' + control + '</td>' + 
					  '</tr>';
					$("#table_body_abnormal").append(oneline);
				}
				$this.getALLSelect();
			},
			function (){return},
			function (){
				// alert("error4");
			}
	);

	$("#cgxj_baseinfo").modal("show");
}
/**
 * 禁止和启动预警
 * @param jsData
 */
ycyj.prototype.setStatus = function(dom,abnorma_id)
{
	var div = $(dom).parent().prev();
	var jsData = $.parseJSON(div[0].innerText);
	$this.warnData = jsData;
	var params = {};
	params.status = jsData.status;
	params.id = jsData.id;
	params.equipid = jsData.iequipid;
	common_post
	(
		getRootPath() + "/admin/equip/warnBankRest/set/"+abnorma_id,
		params,
		function(msg)
		{
			var data = $.parseJSON(msg);
			if(data.success)
			{
				showMsg("操作成功！",null);//修改
				$this.getAbnormaDetails($this.warnData,0,MAX_PAGE_BTN_COUNT);
				$this.getTaskWarnBy.call($this,0,MAX_PAGE_BTN_COUNT);
			}
			else
			{
				showMsg("操作失败！",null);
			}
		},
		function(){},
		function(){showMsg("操作失败！",null);});

}
/**
 * 详情
 * @param jsData
 */
ycyj.prototype.getDetails = function(dom,abnorma_id,msgData)
{
	var div = $(dom).parent().prev();
	var jsData = $.parseJSON(div[0].innerText);
	var msgData = $.parseJSON($(dom).parent().prev().prev()[0].innerText);
	common_post
	(
		getRootPath() + "/admin/equip/warnBankRest/getDetails",
		{taskid:msgData.taskid,abnorId:abnorma_id},
		function(msg)
		{
			var data = $.parseJSON(msg).list;
			//根据任务id和异常id查询详情
			for(var key in data)
			{
				var value = data[''+key+''];
				$("#ycyj_device_"+key).empty();
				if(key=="taskcheckedtamp") $("#ycyj_device_"+key).html(new Date(parseInt(value)).Format("yyyy-MM-dd hh:mm"));
				else if(key=="abnorStatus") $("#ycyj_device_"+key).html(getAbnormalStatus(value));
				else if(key=="abnorIsPolling") 
				{
					$("#ycyj_device_"+key).html(getAbnormalIs(value));
				}
				else if(key=="abnorHMethod") $("#ycyj_device_"+key).html(getAbnormalMethod(value));
				else if(key=="taskresult") $("#ycyj_device_"+key).html(inspectionResults(value));
				else if(key=="abnorSubmitTime") 
				{
					var time = (isNull(value)!=""?(new Date(value).Format("yyyy-MM-dd hh:mm")):"");
					$("#ycyj_device_"+key).html(time);
				}
				else if(key=="abnorHMode") $("#ycyj_device_"+key).html(getAbnormalWay(value));
				else if(key=="abnorUrl")
				{
					if(isNull(value)!="")
					{
						var html = '<a href="javascript:void(0);" onclick=\'showImg("'+value+'")\'>图片</a>';
						//图片显示
						
						$("#ycyj_device_"+key).html(html);
					}
				}
				else if(key=="outStatus")
				{
					$("#ycyj_device_"+key).html(getOutStatus(value));
				}
				else $("#ycyj_device_"+key).html(value);
			}
		
		},
		function(){},
		function(){showMsg("操作失败！",null);});

	$('#ycyj_baseinfo').modal('show');
}
/**
 * 全选
 */
ycyj.prototype.getALLSelect = function()
{
	$("#checkbox_abnormal_total").unbind();
	$("#checkbox_abnormal_total").click(function()
	{
		if($(this)[0].checked)
		{
			$("#table_body_abnormal tr td").find("input").each(function(index,item)
			{
				$(this)[0].checked = true;
			})
		}
		else
		{
			$("#table_body_abnormal tr td").find("input").each(function(index,item)
			{
				$(this)[0].checked = false;
			})
		}
	});
}
/***
 * 批量禁止预警
 */
ycyj.prototype.diabled_buttons = function()
{
	var warnId = $("#table_body_abnormal tr td:first").find("span:first").next().text();
	var ids = "";
	//获取勾选的异常id 
	$("#table_body_abnormal tr td").find("input").each(function(index,item)
	{
		if($(this)[0].checked)
		{
			ids = $(this).next().next().text() + "," + ids;
		}
	})
	if(ids=="")
	{
		showMsg("请选择一个异常任务！",null);
		return;
	}
	common_post
	(
		getRootPath() + "/admin/equip/warnBankRest/setDisabled",
		{ids:ids,warnId:warnId},
		function(msg)
		{
			var data = $.parseJSON(msg);
			if(data.success)
			{
				showMsg("操作成功！",null);//修改
				$this.getAbnormaDetails($this.warnData,0,MAX_PAGE_BTN_COUNT);
				$this.getTaskWarnBy.call($this,0,MAX_PAGE_BTN_COUNT);
			}
			else
			{
				showMsg("操作失败！",null);
			}
		},
		function(){},
		function(){showMsg("操作失败！",null);});

}

/***
 * 2d预警库信息
 */
ycyj.prototype.getPhotoWarn = function(){
	var windowHeight = window.parent.document.getElementById('rt_frame_conent').offsetHeight;//获取浏览器当前窗口文档高度
	$("#modelContent").css("height",windowHeight-40);

	var params = getFormJson("#ycyj_form_control");
   	common_post(
		getRootPath() + "/admin/equip/warnBankRest/photoWarn",
		params,
		function(msg){
			var list = $.parseJSON(msg);
            // console.log(list);
            var html = '';
			/*去除list数组spotlocate为空的值*/
			var newArr = [];
            function remove(arr) {
                for(var i=0;i<list.length;i++){
                    if (isNull(arr[i].spotlocate) !== ""){
                        newArr.push(arr[i])
                    }
                }
            }
            remove(list);
            // console.log(newArr);

			$.each(newArr,function(i,obj){
              	/*top和left*/
                var newSpotlocate = obj.spotlocate.split(",");
                var data = JSON.stringify(obj);

				html += ' <div class="alarmAnimationP alarmAPosition'+ i +'" style="top: '+ newSpotlocate[1] +'px;left: '+ newSpotlocate[0] +'px" onmousemove="$(\'.tips'+ i +'\').css(\'display\',\'block\');" onmouseout="$(\'.tips'+ i +'\').css(\'display\',\'none\');">'+
						' <div class="alarmAnimationS ewGrade'+ obj.level +'"></div>'+
						' <div class="tips tips'+ i +'">'+
							' <p class="tipsName">'+ obj.name +'</p>'+
							' <p class="tipsLevel">预警等级：'+ getWanGrande(obj.level) +'<br/>设备区域:'+ obj.area +'</p>'+
							'<div style="display:none;">'+JSON.stringify(obj)+'</div>'+
							' <button class="btn gui-btn-view" onclick="$this.setBanWarnLevel(this);">禁止预警</button>'+
						' </div>'+
						' </div>';
			});

            $("#alarmAnimationBox").append(html);
		},

		function(){
			
		},
		$this.checkManage_data_error
	);
}
/**
 * 2d-图片禁止预警一个级别
 */
ycyj.prototype.setBanWarnLevel = function(dom)
{
	var data = $(dom).prev()[0].innerText;
	var jsData = $.parseJSON(data);
	var params = {};
	params.equipid = jsData.equipid;
	params.grade = jsData.level;
	common_post
	(
		getRootPath() + "/admin/equip/warnBankRest/setBanWarnLevel",
		params,
		function(msg)
		{
			var data = $.parseJSON(msg);
			if(data.success)
			{
				showMsg(data.msg,null);//修改
				//加载图片的预警位置
				location.reload();
			}
			else
			{
				showMsg(data.msg,null);
			}
		},
		function(){},
		function(){showMsg("操作失败！",null);});

}
/**
 * 图片显示
 * @param value
 */
function showImg(value)
{
	$("#ycyj_serial_picture").empty();
	$("#ycyj_serial_number").empty();
	//serial_picture   
	var arry = value.split("*##*");
	var html = "";
	var html2 = "";
	for(var i in arry)
	{
		html += '<li data-target="#carousel-example-generic" data-slide-to="'+i+'" class="active"></li>';
		
		
		if(i==0) {
			html2 += '<div class="item active">'+
            			'<img src="'+REAL_IMG_URL2+arry[i]+'" style="height: 300px;margin: 0 auto;">'+
            		'</div>';
		}
		else {
			html2 += '<div class="item">'+
						'<img src="'+REAL_IMG_URL2+arry[i]+'" style="height: 300px;margin: 0 auto;">'+
					'</div>';
		}
		
	}
	$("#ycyj_serial_number").html(html);
	$("#ycyj_serial_picture").html(html2);
	$("#ycyj_showPictures").modal("show");
}


