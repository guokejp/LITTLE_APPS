
function history1()
{
	this.search_total_page = 0;//总页数
	this.cur_search_page = 0;//第几页
	this.cur_page_for_update = 0;//更新页
	this.table_items_count_for_page = 0;//总记录数
	this.left_item_device_id = "";//左侧菜单设备编号
	this.left_item_device_name = "";//左侧菜单设备编号
	this.init();//初始化	
	
	this.total_sum = 0;//任务总数
	this.choose_sum = 0;//任务编号总数
}
/**
 * 初始化---查詢左側菜單和右側數據
 */
history1.prototype.init = function()
{
    var windowHeight = window.parent.document.getElementById('rt_frame_conent').offsetHeight;//获取浏览器当前窗口文档高度
    $("#treeLeft").css("height",windowHeight-125);

	$this = this;
	//时间初始化
	$("#query_startTime").val(new Date().Format("yyyy-MM-dd"));
	$("#query_endTime").val(new Date().Format("yyyy-MM-dd"));
	//初始化搜索框
	$this.getFormInit();
	$this.getTaskhistory1By(0,MAX_PAGE_BTN_COUNT);
}
/**
 * 初始化搜索条件框
 */
history1.prototype.getFormInit = function()
{
	init_date_input('query_startTime');
	init_date_input('query_endTime');
	//巡检状态
	getSelectStatus_history1("#query_xunjian_status");
	//处理方式
	getAbnormalWay_select("#query_xunjian_mode");
	//巡检结果
	getSelectResult("#query_xunjian_result");
	//任务类型
	//$this.getTypeMenu("#query_device_type");
	//巡检人员
	//$this.get_xj_member("#query_xunjian_uid");
	//设备区域
	$this.getDeviceArea("#query_xunjian_area");
	/**
	 * 搜索框单击
	 */
	$("#query_btn_submit").unbind();
	$("#query_btn_submit").click(function() {
		$this.getTaskhistory1By(0,MAX_PAGE_BTN_COUNT);
	});
	

	//全选事件
	$("#checkbox_history1_total").on("change",function()
	{
		var checked = $(this).is(":checked");
		if(checked)
		{
			var hInput = $("#front-data-table td input,#front-data-table th input");
		 	hInput.prop("checked",true);
		 	$this.choose_sum = (hInput.length-1);
		}
		else
		{
			var hInput = $("#front-data-table td input,#front-data-table th input");
		 	hInput.prop("checked",false);
		 
		 	$this.choose_sum = 0;
		}	
	 });
	
}
/**
 * 设备区域
 * @param id
 */
history1.prototype.getDeviceArea = function(id){
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
history1.prototype.get_xj_member = function(id){

	common_post2
	(
		getRootPath()+"/sm/userinfo/getUserByRoleId/"+DEFAULT_XJRY_ROLE_ID,
		{},
		function(msg){
			
			if(msg == ''){
				
				console.log('cgxj.get_xj_member msg = "".');
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
            $(id).comboSelect();
		},
		function(){},
		function(){});
}
/**
 * 巡检状态下拉框
 * @param id
 */
function getSelectStatus_history1(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+NUM_STATUS3+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM50+'">'+NUM_STATUS5+'</option>';
	$(id).append(option);
    $(id).comboSelect();
}
/**
 * 任务类型
 */
history1.prototype.getTypeMenu = function(id)
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
                $(id).comboSelect();
			},function(){},function(){});
}
/**
 * 获取分配历史记录左侧菜单查询
 */
history1.prototype.getLeftTaskhistory1By = function()
{
	$("#table_body_left").empty();
	var params = getFormJson("#history1_form_control");
	common_post
	(
		getRootPath() + "/mission/missionOrder/getLefthistory1",
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
				$this.getTaskhistory1By.call($this,0,MAX_PAGE_BTN_COUNT);
				
				//绑定设备名称部分可点击的列监听事件
				$("#table_body_left").on("click","tr",function(obj){
					$(".table_body_left_click").css("background-color","");
					$(obj.currentTarget).css("background-color","#EAEAEA");
					//获得点击参数，开始查询
					$this.left_item_device_id = obj.currentTarget.childNodes[1].innerText;
					$this.left_item_device_name = obj.currentTarget.childNodes[0].innerText;
					//table清空
					$("#table_body").empty();
                    $("#table_foot").show();
					//开始加载数据
					$this.getTaskhistory1By.call($this,0,MAX_PAGE_BTN_COUNT);
				})
			}
			else
			{
                $("#table_foot").hide();
                $("#table_body").empty();

                $("#table_body").append('<tr><td colspan="'+$("#table_head").find("th").length+'">暂无数据</td></tr>');

				$("#total_item").html("巡检任务列表合计"+$this.total_sum+"条.");
			}
		},
		function(){
			
		},
		$this.checkManage_data_error);
}
/**
 * 获取分配历史记录分页条件查询
 */
history1.prototype.getTaskhistory1By = function(page,rows)
{
	var params = getFormJson("#history1_form_control");
	params.page = ++page;
	params.rows = rows;
	common_post
	(
		getRootPath() + "/sm/userinfo/getActionLogPageBy?type=getLoginUser",
		params,
		$this.getManage_data_success,
		function(){
	    	//var hInput = $("#front-data-table td input,#front-data-table th input");
	    	//hInput.prop("checked","checked");
	    	//人员默认全选
	    	//$("#date_item tr:even td input").prop("checked",true);
		},
		$this.checkManage_data_error);
}
/**
 * 更新列表--获取数据成功
 */
history1.prototype.getManage_data_success = function(msg,time)
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
history1.prototype.changePage = function(pageNumber, event){ 
	
	 $this.getTaskhistory1By(pageNumber - 1,MAX_PAGE_BTN_COUNT,false);
	 return false;
}
/**
 * 更新表格
 * @param msg
 * @param isSearch
 */
history1.prototype.update_table = function(msg,isSearch)
{

	if(msg == '') {
		console.log('Error:fjxt.prototype.update_table msg = ""');
		return;
	}
	 var jsonData = $.parseJSON(msg);
	 //console.log(msg);
	 if($("#table_body") == null) return;

	 var pages = 0;
	 var curpage = 0;
	 var devices = "";
	 var totalCount = 0;
	 var totalNum = 0;
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
             //console.log(devices.length);
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
             console.log(devices.length);
			 $this.searchToEnd();
			 return;
		 }
	 } else {
		 $("#table_body").children().remove();
	 }

	//console.log(devices.length);

	 if(devices.length == 0) {
		 $this.total_sum = 0;
		 $this.choose_sum = 0;
		 $("#total_item").html("列表数据总计"+$this.total_sum+"条.");

         $("#table_foot").hide();
         $("#table_body").append('<tr><td colspan="'+$("#table_head").find("th").length+'">暂无数据</td></tr>');
		 return;
	 }	 
	 $this.total_sum = totalCount;
	 $this.choose_sum = totalNum;
	 $this.cur_page_for_update = parseInt(curpage);
	 
	 $("#total_item").html("列表数据总计"+$this.total_sum+"条，"+$this.left_item_device_name+"任务"+$this.choose_sum+"条.");
	
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
history1.prototype.table_html_item = function(device,cur_line)
{
	var control = "";
	
		control = '<div id="'+ device.id  +'" class="table_control_lnk"><div style="display:none">'+ JSON.stringify(device) +'</div>' +
		  '<div>' + 
			  '<a class="btn gui-btn-view" onclick="$this.click_table_ctl_lnk(this,1);">查看</a>' +
		  '</div>'+
		  		  '</div>';
	var oneline = '<tr>' +
	'<td style="display:none;">' + device.id + '</td>' +
	  '<td style="display:none;">' + cur_line + '</td>' +
	  '<td>' + device.userName + '</td>' + //任务编号
	  '<td>' + device.requestIp + '</td>' + //任务类型
	  '<td>' + new Date(device.requestDate.time).Format("yyyy-MM-dd hh:mm:ss") + '</td>' + //方案项目名称
	  '<td>' + device.browserInfo + '</td>' + //巡检人员
	  '<td>' + device.requestUrl + '</td>' + ///巡检结果 
	  '</tr>';
	
	return oneline;
}
/**
 * 详情信息
 */
history1.prototype.click_table_ctl_lnk = function(dom,type)
{
	var div = $(dom).parent().prev();
	var jsData = $.parseJSON(div[0].innerText);

	if(type==1)
	{
		$("#table_body_abnormal").empty();
		if(jsData['taskresult']==NUM20)//是异常，结果
		{
			$("#task_abnormal").show();
			//查询异常信息-table_body_abnormal--已处理信息
			common_post(
					getRootPath()+"/mission/exceptionOrder/getAbnomal",
					{tid:jsData['taskid'],status:30},
					function (data){
						//输出详情信息
						$this.sysoDeta(jsData);
						
						var devices = $.parseJSON(data).list;
						for(var i=0;i<devices.length;i++)
						{
							var device = devices[i];
							var oneline = '<tr style="text-align:center;">' +
							  '<td>' + device.iequipDeName + '</td>' +   
							  '<td>' + device.describe + '</td>' + 
							  '<td>' + getAbnormalMethod(device.hMethod) + '</td>' + 
							  '<td>' + getAbnormalWay(device.hMode) + '</td>' + 
							  '<td>' + device.money + '</td>' + 
							 /* '<td>' + device.outCount + '</td>' + 
							  '<td>' + getOutStatus(device.outStatus) + '</td>' + */
							  '</tr>';
							$("#table_body_abnormal").append(oneline);
						}
						
					},
					function (){return},
					function (){alert("error4")});
			
		}
		else
		{
			$("#task_abnormal").hide();
			//输出详情信息
			$this.sysoDeta(jsData);
		}
		$("#cgxj_baseinfo").modal("show");
	}
}
/**
 * 输出详情信息
 * @param jsData
 */
history1.prototype.sysoDeta = function(jsData)
{
	for(var key in jsData)
	{
		var value = jsData[''+key+''];
		$("#cgxj_device_"+key).empty();
		if(key=="taskcheckedtamp" || key=="taskchecksttamp") $("#cgxj_device_"+key).html(new Date(parseInt(value)).Format("yyyy-MM-dd hh:mm"));
		else if(key=="taskstatus") $("#cgxj_device_"+key).html(inspectionStatus(value));
		else if(key=="abnorIsPolling") $("#cgxj_device_"+key).html(getAbnormalIs(value));
		else if(key=="abnorHMethod") $("#cgxj_device_"+key).html(getAbnormalMethod(value));
		else if(key=="taskresult") $("#cgxj_device_"+key).html(inspectionResults(value));
		else if(key=="tasksubmittamp") 
		{
			if(isNull(value)=="") $("#cgxj_device_"+key).html(value);
			else $("#cgxj_device_"+key).html(new Date(parseInt(value)).Format("yyyy-MM-dd hh:mm"));
		}
		else if(key=="abnorHMode") $("#cgxj_device_"+key).html(getAbnormalWay(value));
		else if(key=="abnorUrl")
		{
			var html = "";
			var arry = value.split(",");
			for(var i in arry)
			{
				html = html + '<img alt="图片" src="'+REAL_IMG_URL2+arry[i]+'" width="50" height="50"/>';
			}
			$("#cgxj_device_"+key).html(html);
		}
		else $("#cgxj_device_"+key).html(value);
	}
}

