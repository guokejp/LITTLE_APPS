$this = null;

function qygl(){
	this.infoid = 0;//设备表id
	//设备名称和父级名称
	this.pinfo_info = "";
	this.cur_pname = "";//设备名称
	//树形菜单数据
	this.tree_json_data = null; 
	this.tree_array_data = null;
	//区域id
	this.cur_sign = "";
	//区域名称
	this.cur_sign_text = "";
	//搜索框内容
	this.search_content = '';
	//search page--当前页
	this.cur_search_page = 0;
	//search total page--总页数
	this.search_total_page = 0;
	//search scroll loading data lock
	this.search_lock = false;
	//table items count
	this.table_items_count_for_page = 0;
	//current region control type
	this.cur_Region_control_type = 0;
	//curent region name list--所有区域
	this.cur_region_name_list = [];

	//global fjxt detail json data text
	this.glb_detail_json_data_text = '';
	//get detail sbid
	this.detail_sbid = '';
	//is detail content if first change
	this.is_detail_first_change = true;
	//is detail current choice mode checkbox
	this.is_cur_detail_choice_mode_checkbox = false;
	//is detail input last value
	this.is_detail_last_content_null = true;
	this.detailsByIfo = "";
	
	this.cur_nodeId = null;
	
	//curent owner device
	this.cur_own_dev_name = '';
	//detail current line
	this.detail_cur_line = 0;
	//current region manager add device type
	this.cur_region_add_new_device_type = '';

	this.init();
}
/**
 * 初始化
 */
qygl.prototype.init = function(){
	if($this == null) $this = this;
	
	common_post(
			getRootPath()+"/area/areaRest/getRegion",
			{},
			function(msg)
			{
				$this.region_tree_success(msg);
			},
			$this.region_tree_complete,
			$this.region_tree_error);
}
qygl.prototype.region_tree_success = function(msg){
	
	$this.init_tree(msg);
}

qygl.prototype.region_tree_complete = function(){
	//
}

qygl.prototype.region_tree_error = function(){
	
	showMsg('获取区域信息失败！',null);
}

qygl.prototype.init_tree = function(info){
	$('#tree').treeview({
        data: $this.getTree(info),
        levels: 5,
        multiSelect: false,
        expandIcon:'glyphicon glyphicon-plus-sign folder_color',
        collapseIcon:'glyphicon glyphicon-minus-sign folder_color',
        emptyIcon:'glyphicon glyphicon-map-marker node_color',
        selectedIcon: "select_color",
        // selectedIcon: "select_color",//glyphicon glyphicon-map-marker select_color
        showBorder:false,
        onNodeSelected: function(event, data) {
        	
			 if(data.sign != undefined)
			 {
				 $this.cur_nodeId = data.nodeId;
				 $this.cur_sign = data.nodeid;
				 $this.cur_sign_text = data.text;
				 $this.setSearchState(false);	 
				 $this.table_items_count_for_page = 0;
				 $('.search_input').val('');
				 $(".pagination").empty();
				 $this.get_device_data($this.cur_sign,TABLE_MAX_LINES,0);
			 }
		  }
    });

	if(info != "{}"){
		$this.cur_nodeId = 1;
		var aa = $("#tree").find("li").eq(1);
		aa.click();
	}

}
/**
 * 转换获取区域数据
 * @param info
 * @returns {Array}
 */
qygl.prototype.getTree = function(info){

	 var data = [];
	 var jsData = $.parseJSON(info);
	 tree_json_data = jsData;

	 $.each(jsData,function(n,value){

		 if(n.length == 0 || value.length == 0) return;
	  	$this.addTreeNode(n,value,data);
	 });

	 return data;
}

qygl.prototype.addTreeNode = function(tag,value,obj){

	//if(value.length != 1) return;
	var subObj = {};
	if(obj.id == undefined)
	{
		/*defaultObj = {};
		defaultObj.text = DEFAULT_REGION_NAME;
		defaultObj.id = 'null';
		defaultObj.sign = defaultObj.id;*/

		subObj = {};
		subObj.text = "所有区域";
		subObj.selectable = false;
		subObj.nodes = [];
		//subObj.nodes.push(defaultObj);
		obj.id = 'basetree';
		obj.push(subObj);
	}

	if(obj.length != 1) return;

	subObj = {};
	var baseNode = obj[0].nodes;
	subObj.text =  value.name;
	subObj.nodeid = value.id;
	subObj.sign = tag;
	baseNode.push(subObj);
	return;
 }

/**
 * 根据区域分页查询数据
 * @param signid
 * @param maxrow
 * @param pageindex
 */
qygl.prototype.get_device_data = function(signid,maxrow,pageindex){

	if(signid == 'null') signid = '';
	var key = common_trim($('.search_input').val());
	common_post2(
			getRootPath()+"/area/areaRest/getDeviceByArea",
			{id:signid,rows:maxrow,page:pageindex,keys:key},
			function(msg)
			{
				$this.get_region_device_success(msg);
			},
			$this.get_region_device_complete,
			$this.get_region_device_error);

}


qygl.prototype.get_region_device_success = function(msg){

	$this.update_table(msg,false);
}

qygl.prototype.get_region_device_complete = function(){

	//
}

qygl.prototype.get_region_device_error = function(){

	if($this.cur_nodeId!=null)
	{
		if($("#tree").find("li").eq($this.cur_nodeId).find("span").length>2)
		 //移除一个span
		 $("#tree").find("li").eq($this.cur_nodeId).find("span").eq(0).remove();
	}
	showMsg('获取区域设备信息失败！',null);
}
/**
 * 上一页和下一页
 * @param pageNumber
 * @param event
 * @returns {Boolean}
 */
qygl.prototype.changePage = function(pageNumber, event){

	 $this.get_device_data($this.cur_sign,TABLE_MAX_LINES,pageNumber - 1);
	 return false;
}
/**
 * 页面数据
 * @param msg
 * @param isSearch
 */
qygl.prototype.update_table = function(msg,isSearch){

	 if(msg == '')
	 {
		$(".pagination").empty();
		console.log('Error:qygl.update_table msg = ""');
		return;
	 }

	 var jsonData = msg;
	 if($("#table_body") == null) return;

	 var pages = 0;
	 var curpage = 0;
	 var devices = "";

	 $.each(jsonData,function(n,value){

		if(n == 'pages') pages = value;
		if(n == 'curpage') curpage = value;
		if(n == 'list') devices = value;
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
		 if($this.table_items_count_for_page != TABLE_MAX_LINES * pages)
		 {
			 $(".pagination").empty();
			 $this.table_items_count_for_page = TABLE_MAX_LINES * pages;

			 $(".pagination").pagination({
		        items: $this.table_items_count_for_page,
		        itemsOnPage: TABLE_MAX_LINES,
		        cssStyle: 'compact-theme',
		        onPageClick:$this.changePage
		    });
		 }
	 }
	 if($this.cur_nodeId!=null)
		{
			/*if($("#tree").find("li").eq($this.cur_nodeId).find("span").length>2)
			 //移除一个span
			 $("#tree").find("li").eq($this.cur_nodeId).find("span").eq(0).remove();*/
		}
	if(devices.length==0)
	{
		$("#tfoot_body_empty").empty();
		$("#tfoot_body").hide();
		$("#tfoot_body_empty").append('<tr><td colspan="8" style="padding: 8px !important;">暂无数据</td></tr>');
		return;
	}
	else
	{
		$("#tfoot_body_empty").empty();
		$("#tfoot_body").show();
	}
	
	var signs = "";//有哪些区域
	for(var i = 0; i < devices.length; i ++)
	{
		var fenlei = '';
		var device = devices[i];
		var serach = common_trim($('.search_input').val());
		var id = device['id'];
		var rootid = device['rootid'];
		var name = device['name'];
		var sbid = device['identify'];
		var sssb = device['parent'];
		if(isNull(sssb)=="") sssb = "";
		var cur_line = 0;

		if(isSearch)
		{
			cur_line = ($this.cur_search_page*TABLE_SEARCH_MAX_LINES + i + 1);
		}
		else
		{
			cur_line = (curpage*TABLE_MAX_LINES + i + 1);
		}
		
		var onelineitem = $this.table_html_item(id,sbid,device,cur_line,name,sssb,rootid);
		
		$("#table_body").append(onelineitem);
	}
	
}
/**
 * 数据table
 * @param id
 * @param sbid
 * @param device
 * @param cur_line
 * @param name
 * @param sssb
 * @param rootid
 * @returns {String}
 */
qygl.prototype.table_html_item = function(id,sbid,device,cur_line,name,sssb,rootid){
	
	var control = '<div id="'+ id +'" class="table_control_lnk"><div style="display:none">'+ JSON.stringify(device) +'</div>' +
	  '<div>' + 
	  '<a class="btn gui-btn-view" onclick="$this.click_table_ctl_lnk(this,1);">查看</a>' +
	  '<a class="btn gui-btn-details" onclick="$this.click_table_ctl_lnk(this,2,\''+ name +'\');">详情</a>' +
	  '<a class="btn gui-btn-modify" onclick="$this.click_table_ctl_lnk(this,3);">修改</a>' +
	  /*'<a class="btn gui-btn-del" onclick="$this.click_table_ctl_lnk(this,4);">删除</a>'+*/
	  '<a class="btn gui-btn-del" onclick="$this.click_table_ctl_lnk(this,6);">生成二维码</a>'+
	  '<a class="btn gui-btn-del" onclick="$this.click_table_ctl_lnk(this,7);">下载二维码</a>'+
	  '<a class="btn gui-btn-del" onclick="$this.click_table_ctl_lnk(this,5);">查看二维码</a>'+
	  '</div>' + '</div>';
	
	var oneline = '<tr>' +
	  '<td style="display:none;">' + id + '</td>' + 
	  '<td style="display:none;">' + rootid + '</td>' + 
	  '<td>' + cur_line + '</td>' + 
	  '<td>' + name + '</td>' + 
	  '<td>' + sbid + '</td>' + 
	  '<td>' + sssb + '</td>' + 
	  '<td>' + control + '</td>' + 
	  '</tr>';
	
	return oneline;
}


qygl.prototype.searchToEnd = function(){
	$(".table_div_qygl").unbind();
}

/**
 * 区域的添加、修改和删除
 * @param type
 */
qygl.prototype.region_manage = function(type)
{
	 $this.cur_Region_control_type = 0;
	 
	 //region_manage
	 if(type == 1) //添加
	 {
		$this.cur_Region_control_type = 1;
	 }
	 else if(type == 2) //修改
	 {
		$this.cur_Region_control_type = 2;
	 }
	 else if(type == 3) //删除
	 {
		$this.cur_Region_control_type = 3;
	 }
	  
	 common_post(
			 	getRootPath()+"/area/areaRest/getRegion",
			 	{},
				$this.region_manage_success,
				$this.region_manage_complete,
				$this.region_manage_error);
}

qygl.prototype.region_manage_success = function(msg){
	
	$this.update_region_manage_items(msg);
}

qygl.prototype.region_manage_complete = function(msg){
	
	//
}

qygl.prototype.region_manage_error = function(msg){
	
	showMsg('修改区域信息时获取区域结构数据失败！',null);
}


qygl.prototype.update_region_manage_items = function(msg)
{
	$this.cur_region_name_list = [];
	
	if(msg == '')
	{
		console.log('qygl.update_region_manage_items msg = ""');
		return;
	}
	
	$('#oldregion').empty();
	$('#delregion').empty();
		
	 var jsonData = $.parseJSON(msg);
	 
	 $.each(jsonData,function(n,value)
	 {
		 var option = '<option value="'+ value.id +'">'+ value.name +'</option>';
		 $('#oldregion').append(option);
        
		 $('#delregion').append(option);
		 $this.cur_region_name_list.push(value); 		  
	 });
	 
	$('#addregion').val('');
	$('#oldregion').val('');
	$('#renameregion').val('');
	$('#delregion').val('');
	 var id = $this.cur_sign;
	 $("#oldregion").val(id);
	 $('#oldregion').comboSelect();
	if($this.cur_Region_control_type == 1) $('#region_manage_add').modal('show');
	if($this.cur_Region_control_type == 2) $('#region_manage_set').modal('show');
	if($this.cur_Region_control_type == 3) $('#region_manage_del').modal('show');
}

qygl.prototype.is_regionname_exists = function(regionName){
	
	if($this.cur_region_name_list.length == 0){
		
		console.log('qygl.is_regionname_exists cur_region_name_list.length == 0');
		return false;
	}
	
	for(var i = 0; i < $this.cur_region_name_list.length; i++){
		
		if(regionName == $this.cur_region_name_list[i]) return true;
	}
	
	return false;
}
/**
 * 条件搜索
 * @param isInited
 */
qygl.prototype.search_info = function(isInited)
{
	var searchContent = '';
	
	if(isInited)
	{
		 $this.search_lock = false;
		 searchContent = common_trim($('.search_input').val());	 
		/* if(searchContent == '')
		 {
			 showMsg('搜索内容不能为空！',null);
			 return;
		 }*/
		 
		 $this.search_content = searchContent;
	}
	else
	{
		if($this.search_lock) return;
		searchContent = $this.search_content;
	}	
	 
	 $this.search_lock = true;
	 
	 if(isInited)
	 {
		 //$this.setSearchState(true);
		 $this.cur_search_page = 0;
		 $this.search_total_page = 0;
		 $this.searchScrollToBottomEvent(); 
	 }
	 
	 var signid = $this.cur_sign;
	 if(signid == 'null') signid = '';
	 
	 common_post2(
				getRootPath()+"/area/areaRest/getDeviceByArea",
				{id:signid,rows:TABLE_MAX_LINES,page:$this.cur_search_page,keys:searchContent},
				function(msg)
				{
					$this.table_items_count_for_page = 0;
					$this.get_region_device_success(msg);
				},
				$this.get_region_device_complete,
				$this.get_region_device_error);
}

qygl.prototype.get_search_data_success = function(msg){
	
	$this.update_table(msg,true);
	$this.cur_search_page ++;
}

qygl.prototype.get_search_data_complete = function(){
	
	$this.search_lock = false;
}

qygl.prototype.get_search_data_error = function(){
	
	showMsg('搜索数据失败！',null);
}

qygl.prototype.searchScrollToBottomEvent = function(){
	$this.searchToEnd();
	$(".table_div_qygl").scroll(function(){  
        viewH =$(".table_div_qygl").height(),//可见高度  
        contentH =$(".table_div_qygl").get(0).scrollHeight,//内容高度  
        scrollTop =$(".table_div_qygl").scrollTop();//滚动高度  
       if(scrollTop/(contentH -viewH)>=0.95){ //到达底部100px时,加载新内容  
        console.log('search scroll need load data!'); 
        $this.search_info(false);
       }  
    });  
}

qygl.prototype.searchToEnd = function(){
	$(".table_div_qygl").unbind();
}

qygl.prototype.setSearchState = function(isSearch){
	
	if(isSearch)
	{
		$('.table_page_div').css('display','none');
		$('.table_div_qygl').css('height','490px');
	}
	else
	{
		$('.table_page_div').removeAttr('style');
		$('.table_div_qygl').removeAttr('style');
	}	
}


qygl.prototype.click_table_ctl_lnk = function(dom,type)
{
	var id = dom.parentNode.parentNode.id;
	var trNode = dom.parentNode.parentNode.parentNode.parentNode;
	var name = $(trNode).find("td").eq(3).text();
	var rootid = $(trNode).find("td").eq(1).text();
	if(id == undefined) return;
	
	if(type == 1)
	{			
		$this.showPartBaseField(rootid,id);
	}
	else if(type == 2)
	{	
		$this.cur_pname = name;
		$this.init_detail_first(id,name);
	}
	else if(type == 3)
	{
		$this.updatePartBaseField(rootid,id);
	}
	else if(type == 4)
	{
		showConfirm("你确定要删除 " + name + " 这个设备吗？",function(){ $this.delPartItem(id,trNode);});
	}
	else if(type == 5) $this.device_show_lookImg(name);
	else if(type==6){//生成单个设备二维码
		common_post(
				getRootPath()+"/area/areaRest/makeImagesSingle/"+id,
				{},
				function(sdata){
					var data = $.parseJSON(sdata);
					showMsg(data.msg,null);
				},
				function(){},
				function(){
					showMsg('生成二维码失败！',null);
				}
		);
	}else if(type==7){//下载单个设备二维码
		var path = getRootPath() + "/imgCode/imgs/"+ $this.cur_sign_text+"-"+name+".jpg";
		if(validateImage(path))
		{
			var url = encodeURI("imgCode/imgs/"+ $this.cur_sign_text+"-"+name+".jpg");
			var FILE_DOWN = getRootPath()+"/area/areaRest/down";//文件下载
			window.open(FILE_DOWN+"?path="+url);
		}
		else
		{
			showMsg("二维码未生成！",null);
		}
	}
}
/**
 * 获取子类信息
 * @param id--gyw
 */
qygl.prototype.init_detail_first = function(id,pname){
	$this.infoid = id;
	common_post(
			getRootPath()+"/area/areaRest/getDeviceDetails/"+id,
			{},
			function(msg){ 
					$this.init_device_detail(msg,false,pname); 
			},
			function(){},
			function(){showMsg('获取信息失败！',null);});
}

/**
 * 设备详情数据
 * @param textData
 * @param isUpdate
 */
qygl.prototype.init_device_detail = function(textData,isUpdate,pname){
	
	var option = '';
	var jsonData = '';
	$this.detailsByIfo = textData;
	$("#table_body_fjxt_xq").empty();
	if((textData == '') && (!isUpdate)) return;
	
	if(!isUpdate)
	{
		$this.glb_detail_json_data_text = textData;
	}
	else
	{
		textData = $this.glb_detail_json_data_text;	
	}
	
	jsonData = $.parseJSON(textData);
	var menus = jsonData['menus'];
	jsonData = jsonData['devices'];
	//if(jsonData.length==0) return;

	$this.is_detail_first_change = true;
	$this.is_cur_detail_choice_mode_checkbox = true;
	$('#detail_table_fjxt_checkbox').prop('disabled',false);
	$('#detail_table_fjxt_checkbox').prop('checked',false);
	
	var html = "";
	for(var i=menus.length;i>0;i--)
	{
		if(html=="") html+=menus[i-1];
		else html = html + "->" + menus[i-1];	
	}
	var title = '设备 - 详情信息 ['+html+']';
	
	$('#fjxt_xqinfo').html(title);
	$('#fjxt_detail_userWriteXulie').val('');
	$('#fjxt_detail_userBatCtl').empty();

	option = '<option value=""></option>';
	$('#fjxt_detail_userBatCtl').append(option);
	option = '<option value="batdelete">批量删除</option>';
	$('#fjxt_detail_userBatCtl').append(option);
	option = '<option value="batMakeImg">批量生成二维码</option>';
	$('#fjxt_detail_userBatCtl').append(option);
	option = '<option value="batDownLoadImg">批量下载二维码</option>';
	$('#fjxt_detail_userBatCtl').append(option);
	
	$('#fjxt_detail_userBatCtl').val('');
	$('#fjxt_detail_labelRegioncm').hide();
	$('#fjxt_detail_batRegionSelect').hide();
	$('.fjxt_detail_user_xqadd_part').css('right','-315px');

	//get region	
	$this.getRegion('fjxt_detail_batRegionSelect');
	
	$("#fjxt_detail_userBatCtl").comboSelect();
	$('#fjxt_detail_userBatCtl').unbind();
	$('#fjxt_detail_userBatCtl').change(function(){
		var ctlType = $('#fjxt_detail_userBatCtl').val();
		if(ctlType == 'batmodify')
		{
			$('#fjxt_detail_labelRegioncm').show();
			$('#fjxt_detail_batRegionSelect').show();
			
			$('.fjxt_detail_user_xqadd_part').css('right','-110px');
		}
		else
		{
			$('#fjxt_detail_labelRegioncm').hide();
			$('#fjxt_detail_batRegionSelect').hide();
			$('.fjxt_detail_user_xqadd_part').css('right','-315px');
		}
		$("#fjxt_detail_userBatCtl").comboSelect();
	});
	
	$('#detail_table_fjxt_checkbox').unbind();
	$('#detail_table_fjxt_checkbox').click(function(){
		
		var trList = $("#table_body_fjxt_xq").children('tr');
		if(trList.length == 0) return;
		
		$this.detail_checkbox_checkall(trList,$('#detail_table_fjxt_checkbox').is(':checked'));
	});
	
	$('#fjxt_detail_userWriteXulie').unbind();
	$('#fjxt_detail_userWriteXulie').on('input',function(e){
		
		var content = common_trim($('#fjxt_detail_userWriteXulie').val());
		
		var isNullContent = (content != '');
		$('#detail_table_fjxt_checkbox').prop('disabled', isNullContent);

		var trList = $("#table_body_fjxt_xq").children('tr');
		if(trList.length == 0) return;
		
		if(($this.is_detail_last_content_null != isNullContent) || $this.is_detail_first_change)
		{
			$this.is_detail_first_change = false;
			$this.is_detail_last_content_null = isNullContent;
			$this.detail_checkbox_disabled(trList,!(content == ''));
		}	
	});
	
	$('#fjxt_detail_userBatSubmit').unbind();
	$('#fjxt_detail_userBatSubmit').click(function(){
		
		var value = $('#fjxt_detail_userWriteXulie').val();
		var batCtlType = $('#fjxt_detail_userBatCtl').val();
		
		if(batCtlType == null){
			
			showMsg('请选择批量操作类型！',null);
			return;
		}
	
		var ids = $this.getIdsByHandleWriteXulie('table_body_fjxt_xq',value);
		if(ids.length == 0)
		{
			showMsg('未找到需要批量修改的数据!',null);
			return;
		}

		$this.batDealDataSubmit('fjxt_detail_batRegionSelect',ids,batCtlType);
	});
	
	$this.cur_detail_page_index = 0;
	$this.detail_cur_line = 0;
	$this.getFjxtDetailDeviceList($this.cur_detail_page_index,pname);
	
	if(!isUpdate) $('#fjxt_detail').modal('show');
	//$this.detailShowMask('fjxt_mask_juhua',true);
}

qygl.prototype.detailShowMask = function(id,isShow){
	
	if(isShow)
	{
		$('.' + id).css('display','block');
	}
	else
	{
		$('.' + id).css('display','none');
	}
}

qygl.prototype.getFjxtDetailDeviceList = function(pageIndex,pname){
			$this.get_fjxt_device_info_success($this.detailsByIfo,pname);	
}

/**
 * 显示详情数据
 */
qygl.prototype.get_fjxt_device_info_success = function(msg,pname){

	$this.cur_detail_page_index ++;
	
	if(msg == '')
	{
		$this.detailShowMask('fjxt_mask_juhua',false);
		return;
	}
	
	var jsonData = $.parseJSON(msg);
	var curpage = jsonData['curpage'];
	var pages = jsonData['pages'];	
	var devices = jsonData['devices'];
	if(devices.length==0)
	{
		$("#table_body_fjxt_xq").append('<tr><td colspan="8">暂无数据</td></tr>');	
		return;
	}
	for(var i = 0; i < devices.length; i++)
	{
		var device = devices[i];
	
		$this.detail_cur_line++;
		device.pname = pname;
		var onelineitem = $this.table_fjxt_detail_html_item(device,$this.detail_cur_line);
		$("#table_body_fjxt_xq").append(onelineitem);	
	}
	
	//循环获取下一页
	if($this.cur_detail_page_index <= pages - 1)
	{
		$this.getFjxtDetailDeviceList($this.cur_detail_page_index);
	}
	else
	{
		$this.detailShowMask('fjxt_mask_juhua',false);
	}
}

qygl.prototype.get_fjxt_device_info_complete = function(){
	
	//
}


qygl.prototype.get_fjxt_device_info_error = function(){
	
	$this.detailShowMask('fjxt_mask_juhua',false);
}

qygl.prototype.table_fjxt_detail_html_item = function(device,cur_line){
	
	var control = '<div id="detail_'+ device.id +'" class="table_control_lnk"><div style="display:none">'+ JSON.stringify(device) +'</div>' +
	  '<div>' ;
	

	if(device.oneself=="1")
	{
		//control+=  '<a class="btn gui-btn-modify" onclick="$this.detail_fjxt_modify_del(this,1,\''+ device.id +'\',\''+device.pname+'\');">修改</a>';
		/*control+=  '<a class="btn gui-btn-view" onclick="$this.device_show_lookImg(\''+ device.infoid +'\');">查看二维码</a>'+
		  '</div>' + '</div>';*/
	}
	else if(device.oneself=="2")
	{
		/*control+=  '<a class="btn gui-btn-view" onclick="$this.detail_jdcsxt_modify_lookImg(\''+ device.id +'\');">查看二维码</a>'+
		  '</div>' + '</div>';*/
	}
	else
	{
		control+=  '<a class="btn gui-btn-modify" onclick="$this.detail_fjxt_modify_del(this,1,\''+ device.id +'\',\''+device.pname+'\');">修改</a>';
		control+=  '<a class="btn gui-btn-del" onclick="$this.detail_fjxt_modify_del(this,2,\''+ device.id +'\');">删除</a>';
		control+=  '<a class="btn gui-btn-view" onclick="$this.detail_jdcsxt_modify_lookImg(\''+ device.name +'\');">查看二维码</a>'+
		  '</div>' + '</div>';
	}
	

	var oneline = '<tr>' +
	  '<td>' + '<input class="gui-magic-checkbox sub-checkbox" type="checkbox" id="'+ CHECKBOX_ID_PREFIX + device.id +'" /><label for="'+ CHECKBOX_ID_PREFIX + device.id +'">' + cur_line + '</label>' + '</td>' +
	  '<td style="display: none;">' + cur_line + '</td>' +
	  '<td>' + device.name + '</td>' + 
	  '<td>' + device.specific + '</td>' + 
	  '<td>' + device.amount + '</td>' +
	  '<td>' + device.dunit + '</td>' +
	  '<td>' + device.detailnote + '</td>' +
	  '<td>' + control + '</td>' + 
	  '</tr>';
 
	return oneline;
}

qygl.prototype.detail_fjxt_modify_del = function(obj,tp,sbid,pname){
	
	if((tp != 1) && (tp != 2)) return;
	if('' == sbid) return;
	
	//var sjid = $this.detail_sbid;
	//if('' == sjid) return;
	
	if(tp == 1){
		$this.detail_fjxt_modify_addpart(obj,true,sbid,pname);
	}
	else if( tp == 2){
		var sbidData = new Array();
		sbidData.push(sbid);
		
		var jsDataText = $(obj).parent().parent().children().eq(0).text();
		var device = $.parseJSON(jsDataText);
		
	  showConfirm("你确定要删除 " + device.name + " 这个设备吗？",
	  function(){ 
		  
		  common_post2(
				  getRootPath()+"/equip/detail/delDetail",
					{ids:sbidData},
					function(msg){
						showMsg("删除成功！",null);
						var trItem = $('#' + CHECKBOX_ID_PREFIX + sbid).parent().parent();
						trItem.remove();
					},
					function(){},
					function(){showMsg('删除数据失败！',null);});
	  });	  
	}
}

qygl.prototype.batDealDataSubmit = function(reginId,arrIds,batCtlType){
	
	var region = '';
	var ctlparam = '';
	var sbidData = '';
	
	if(batCtlType == 'batmodify'){
		
		ctlparam = 'setregionbatch';
		region = $('#' + reginId).val();
		if(region == null){
			
			showMsg('请选择要修改的目的区域!',null);
			return;
		}
		
		if(region == 'null') region = '';
	}
	else if(batCtlType == 'batdelete'){
		
		ctlparam = 'deldevicebatch';
	}
	else if(batCtlType == "batMakeImg"){
		ctlparam = 'makeImgbatch';
	}
	else if(batCtlType == "batDownLoadImg"){
		ctlparam = 'downLoadbatch';
	}
	else{
		
		showMsg('批量操作类型参数错误！',null);
		return;
	}
	
	 var sbidData = new Array();
		for(var i = 0; i < arrIds.length; i++){
			
			sbidData.push(arrIds[i]);
		}
	
	sbidDataStr = '';
	for(var i = 0; i < arrIds.length; i++){
		
		sbidDataStr += ""+ arrIds[i] +"";
		if(i != arrIds.length - 1) sbidDataStr += ",";
	}
	if(ctlparam == 'makeImgbatch'){//生成二维码
		bootbox.dialog({
			message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>'
		});
		common_post(
			getRootPath()+"/area/areaRest/makeImagesParts",
			{device:sbidDataStr,forceAll:""},
			function(sdata){
				bootbox.hideAll();
				var data = $.parseJSON(sdata);
				//刷新
				showMsg(data.msg,null);
			},
			function(){},
			function(){
				bootbox.hideAll();showMsg('批量处理数据失败！',null);});
	}else if(ctlparam == 'downLoadbatch'){
		bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
		common_post(
				getRootPath()+"/area/areaRest/downLoadPartsImgs",
				{device:sbidDataStr},
				function(data){
					bootbox.hideAll();
					if(data != "error"){
						if(data=="no") showMsg("尚未生成二维码！",null);
						else window.open(data); 
					}else{
						showMsg('下载失败！',null);
					}
				},
				function(){},
				function(){
					bootbox.hideAll();showMsg('批量处理数据失败！',null);});
	}else{//批量删除
		common_post2
		(
				getRootPath()+"/equip/detail/delDetail",
				{ids:sbidData},
				function(msg){
					
					if(msg.success){
						showMsg('批量处理数据成功！',null);
						for(var i =0;i<sbidData.length;i++)
						{
							var trItem = $('#' + CHECKBOX_ID_PREFIX + sbidData[i]).parent().parent();
							trItem.remove();
						}
						
					}
				},
				function(){},
				function(){showMsg('批量处理数据失败！',null);});
	}
	
}

qygl.prototype.detail_checkbox_checkall = function(trList,isCheckAll){
	
	for(var i = 0; i < trList.length; i++){
		
		var td_checkbox = trList[i];
		var id = td_checkbox.firstChild.firstChild.id;
		
		$('#' + id).prop('checked',isCheckAll);
	}
}

qygl.prototype.detail_checkbox_disabled = function(trList,isDisabled){
	
	$this.is_cur_detail_choice_mode_checkbox = !isDisabled;
	
	for(var i = 0; i < trList.length; i++){
		
		var td_checkbox = trList[i];
		var id = td_checkbox.firstChild.firstChild.id;
		
		$('#' + id).prop('disabled',isDisabled);
	}
}



qygl.prototype.getIdsByHandleWriteXulie = function(tbid,value){
	
	var arrIndexs = [];
	if(!$this.is_cur_detail_choice_mode_checkbox)
	{
		arrIndexs = parseHandleWriteStr(value);
		if(arrIndexs.length == 0){
			
			showMsg("手写序列格式有误！",null);
			return [];
		}
	}
	
	return $this.getIdsByIndexs(tbid,arrIndexs);
}

qygl.prototype.getIdsByIndexs = function(tbid,arrIndexs){
	
	var arrRet = [];
	var trList = $("#" + tbid).children('tr');
	if(trList.length == 0) return [];
	
    for(var i = 0; i < trList.length; i++){
		
		var td_checkbox = trList[i];
		var id = td_checkbox.firstChild.firstChild.id;
		var index = parseInt(td_checkbox.childNodes[1].innerText);
		var subid = $this.parseDeviceId(id);
		
		if($this.is_cur_detail_choice_mode_checkbox)
		{
			if($('#' + id).prop('checked'))
			{
			  if(subid != '') arrRet.push(subid);
			}
		}
		else
		{
			if(arrIndexs.length == 0) break;
			var subindex = $.inArray(index,arrIndexs);
			if(subindex != -1) arrRet.push(subid);
		}		
	}
    
    return arrRet;
}

qygl.prototype.parseDeviceId = function(value){
	
	value = common_trim(value);
	if(value == '') return '';
	var index = value.indexOf(CHECKBOX_ID_PREFIX);
	if(index == -1) return '';
	
	return value.substr(CHECKBOX_ID_PREFIX.length);
}
/**
 * 点击修改查询设备信息
 * @param id
 */
qygl.prototype.initModifyPart = function(rootid,id){
	
	common_post2(
			getRootPath()+"/area/areaRest/getDeviceData",
			{id:id},
			function(msg){ $this.initModifyPart_sub(id,msg); },
			function(){},
			function(){showMsg('获取信息失败！',null);});
}

qygl.prototype.initModifyPart_sub = function(id,info){
	
	if(info == ''){
			
			console.log('qygl.initModifyPart_sub info="".');
			return;
	}
	
	
	
	var device = info;
	var jsData = device['equipInfo'];
	var menus = device['menus'];
	
	var html = "";
	for(var i=menus.length;i>0;i--)
	{
		if(html=="") html+=menus[i-1];
		else html = html + "->" + menus[i-1];	
	}
	$("#set_menus").html(html);
	
	for(var i in jsData)
	{
		var filed = jsData[i];
		var id2 = "fjxt_mdf_adddev"+i;
		
		$("#fjxt_mdf_adddev_update_data").find("td").find("input").each(function(index,item)
		{
			var id = $(item).prop("id");
			if(id==id2)
			{
				if(filed instanceof Object) 
				{
					$(item).val(new Date(filed.time).Format("yyyy-MM-dd"));
				}
				else 
				{
					$(item).val(filed);
				}
				if(i=="istatus") $(item).val(InfoStatus(filed));
			}
		})
	}
	var url = jsData['infourl'];

	if(isNull(url)=="") $('#fjxt_mdf_adddevinfourl').prop("src",DEFAULT_IMG_URL);
	else $('#fjxt_mdf_adddevinfourl').prop("src",REAL_IMG_URL+url);
	
	/*var url = getImgUrl(jsData['url']);
	$("#fjxt_mdf_adddevinfourl").prop("src",url);*/
		$this.getRegion('fjxt_mdf_adddevarea_id',jsData['areaId']);
		$('#fjxt_mdf_Btn_submit').unbind();
		$('#fjxt_mdf_Btn_submit').click(function(){
					
			var mdf_region = $('#fjxt_mdf_adddevarea_id').val();
			if(mdf_region == null || mdf_region == 'null') mdf_region = '';
			common_post(
					getRootPath()+"/area/areaRest/setDeviceRegion/"+id,
					{areaid:mdf_region},
					function(msg){
						var data = $.parseJSON(msg);
						if(data.success)
						{
							showMsg('修改区域信息成功！',null);
							$('#fjxt_modify').modal('hide');
							
							$("#table_body").children().remove();
							$(".pagination").empty();
							$this.get_device_data($this.cur_sign,TABLE_MAX_LINES,0);
						}
						else
						{
							showMsg('修改区域信息失败！',null);
						}
					},
					function(){},
					function(){showMsg('修改区域信息失败！',null);});
		});
		
		$('#fjxt_modify').modal('show');
} 
qygl.prototype.areaClick = function()
{
	$(".device_tree").find("li").each(function(index,item){
		var node = $(item).text();
		if(node == $this.cur_sign_text) {
			$(item).click();
		}
	});
}
/**修改设备信息
 * 获取该设备需要显示的字段
 * @param rootid
 * @param id
 */
qygl.prototype.updatePartBaseField = function(rootid,id){
	$("#addPartForEachPart").empty();
	common_post(
			getRootPath() + "/equip/equipRest/installTableAndInfodataHead/"+rootid,
			{},
			function(msg)
			{
				var data = $.parseJSON(msg);
				var tablekey = rootid+"info";
				var filed = data.Msg[tablekey];
				if(filed==undefined) filed = data.Msg['0info'].fieldColumnList;
				else filed = data.Msg[tablekey].fieldColumnList;
				var infoHtml = '';
				var fieldColumnList = filed;
				$this.tablefieldinfo = fieldColumnList;

				$(fieldColumnList).each(function(i,obj)
				{
					if(i==(fieldColumnList.length-1))
					{
						if(i/2==0)
						{
							infoHtml = infoHtml + '<div class="col-sm-2 col-xs-2 textlable">';
							infoHtml = infoHtml + '<label for="adddevname">'+obj.field+'</label>';
							infoHtml = infoHtml + '</div>';
							infoHtml = infoHtml + '<div class="col-sm-4 col-xs-4 textinpt">';
							infoHtml = infoHtml + '<input type="text" class="form-control" id="fjxt_mdf_adddev'+obj.column+'" disabled>';
							infoHtml = infoHtml + '</div>';
						}
						else
						{
							infoHtml = infoHtml + '<div class="col-sm-2 col-xs-2 textlable">';
							infoHtml = infoHtml + '<label for="adddevname">'+obj.field+'</label>';
							infoHtml = infoHtml + '</div>';
							infoHtml = infoHtml + '<div class="col-sm-4 col-xs-4 textinpt">';
							infoHtml = infoHtml + '<input type="text" class="form-control" id="fjxt_mdf_adddev'+obj.column+'" disabled>';
							infoHtml = infoHtml + '</div>';
							infoHtml = infoHtml + '<div class="col-sm-6 col-xs-6 textinpt" style="height:34px;">';
							infoHtml = infoHtml + '</div>';
						}
					}
					else
					{
						infoHtml = infoHtml + '<div class="col-sm-2 col-xs-2 textlable">';
						infoHtml = infoHtml + '<label for="adddevname">'+obj.field+'</label>';
						infoHtml = infoHtml + '</div>';
						infoHtml = infoHtml + '<div class="col-sm-4 col-xs-4 textinpt">';
						infoHtml = infoHtml + '<input type="text" class="form-control" id="fjxt_mdf_adddev'+obj.column+'" disabled>';
						infoHtml = infoHtml + '</div>';
					}
					
				})
				$("#addPartForEachPart").append(infoHtml);
				$this.initModifyPart(rootid,id);	
			},
			function(){},
			function(){showMsg('获取信息失败！',null);});
}

/**查看设备
 * 获取该设备需要显示的字段
 * @param rootid
 * @param id
 */
qygl.prototype.showPartBaseField = function(rootid,id){
	$("#fjxt_baseinfo_allinfo_center").empty();
	common_post(
			getRootPath() + "/equip/equipRest/installTableAndInfodataHead/"+rootid,
			{},
			function(msg)
			{
				var data = $.parseJSON(msg);
				var tablekey = rootid+"info";
				var filed = data.Msg[tablekey];
				if(filed==undefined) filed = data.Msg['0info'].fieldColumnList;
				else filed = data.Msg[tablekey].fieldColumnList;
				console.log(filed);
				var infoHtml = '';
				var fieldColumnList = filed;
				$this.tablefieldinfo = fieldColumnList;
				
				var tb = document.getElementById("fjxt_baseinfo_allinfo_center");
				
	            var trindex = 0;
				for(var i=0;i<fieldColumnList.length;i++)
				{
					var newTr = tb.insertRow(trindex++);//添加新行，trIndex就是要添加的位置 
					if((i+1)<fieldColumnList.length)
					{
						infoHtml = '<label for="adddevname">'+fieldColumnList[i].field+'</label>';
						var newTd1 = newTr.insertCell(); 
				        newTd1.innerHTML = infoHtml ;
				        
				        infoHtml = '<p id="fjxt_basedev'+fieldColumnList[i].column+'" name="'+fieldColumnList[i].column+'"></p>';
						var newTd1 = newTr.insertCell(); 
				        newTd1.innerHTML = infoHtml ;
				        
				        infoHtml = '<label for="adddevname">'+fieldColumnList[i+1].field+'</label>';
						var newTd1 = newTr.insertCell(); 
				        newTd1.innerHTML = infoHtml ;
				        
				        infoHtml = '<p id="fjxt_basedev'+fieldColumnList[i+1].column+'" name="'+fieldColumnList[i+1].column+'"></p>';
						var newTd1 = newTr.insertCell(); 
				        newTd1.innerHTML = infoHtml ;
					}
					else
					{
						if(i==(fieldColumnList.length-1))
						{
							infoHtml = '<label for="adddevname">'+fieldColumnList[i].field+'</label>';
							var newTd1 = newTr.insertCell(); 
					        newTd1.innerHTML = infoHtml ;
					        
					        infoHtml = '<p id="fjxt_basedev'+fieldColumnList[i].column+'" name="'+fieldColumnList[i].column+'"></p>';
							var newTd2 = newTr.insertCell();
							newTd2.colSpan ='3';
					        newTd2.innerHTML = infoHtml ;
						}
						
					}
					i++;
				}
				$("#fjxt_baseinfo_allinfo_center").next().css("border-top","none");
				$this.showPartBaseInfo(rootid,id);
				
			},
			function(){},
			function(){showMsg('获取信息失败！',null);});
}

/**
 * 查询设备所有信息
 * @param id
 */
qygl.prototype.showPartBaseInfo = function(rootid,id){
	
	common_post2(
			getRootPath()+"/area/areaRest/getDeviceData",
			{id:id},
			function(msg){ $this.viewBaseInfoSub(id,msg); },
			function(){},
			function(){showMsg('获取信息失败！',null);});
}
/**
 * 设备信息显示
 * @param id
 * @param info
 */
qygl.prototype.viewBaseInfoSub = function(id,info){
	
	if(info == ''){
		
		console.log('qygl.viewBaseInfo info="".');
		return;
	}
	
	//var isFjSystem = (id.indexOf('FJ') == 0);
	
	var device = info;
	var jsData = device['equipInfo'];
	var menus = device['menus'];
	
	var html = "";
	for(var i=menus.length;i>0;i--)
	{
		if(html=="") html+=menus[i-1];
		else html = html + ">" + menus[i-1];	
	}
	$("#fjxt_basedevsbss").html(html);
	
	for(var i in jsData)
	{
		var filed = jsData[i];
		var id2 = "fjxt_basedev"+i;
		$(".fjxt_baseinfo_left_table").find("p").each(function(index,item)
		{
			var id = $(item).prop("id");
			if(id==id2)
			{
				
				if(filed instanceof Object) 
				{
					$(item).text(new Date(filed.time).Format("yyyy-MM-dd"));
				}
				else 
				{
					$(item).text(filed);
				}
				if(i=="istatus") $(item).text(InfoStatus(filed));
			}
		})
	}
	var url = getImgUrl(jsData.infourl);
	
	$("#fjxt_basedevinfourl").prop("src",url);
	$(".fjxt_baseinfo_img").prop('src',url);
    
	$('#fjxt_baseinfo').modal('show');
}

qygl.prototype.delPartItem = function(id,trNode){
	
	if(trNode.tagName != 'TR')
	{
		console.log('Error:qygl.delPartItem 删除数据时，tr dom 节点查找失败！');
		return;
	}
	
	var area = $this.cur_sign;
	if(area == 'null') area = '';
	
	common_post(
			getRootPath()+"/area/areaRest/setDeviceRegion/"+id,
			{areaid:1},
			function(msg){$(trNode).remove();showMsg('删除数据成功！',null);},
			function(){},
			function(){showMsg('删除数据失败！',null);});
}
/**
 * 新增部件--详情信息
 * @param obj--this
 * @param ismodify--false--增加   true-修改
 * @param sbid ''
 */
qygl.prototype.detail_fjxt_modify_addpart = function(obj,ismodify,sbid,pname){
	
	$this.detail_fjxt_modify_addpart_sub(obj, ismodify, sbid,pname);
}


qygl.prototype.detail_fjxt_modify_addpart_sub = function(obj,ismodify,sbid,pname){
	

	if(ismodify)//修改
	{
		$('#fjxt_detail_mdf_add_title').html('详情 - 修改信息');
		$('#fjxt_detailAddPartBtn').html('确定');
		
		var jsDataText = $(obj).parent().parent().children().eq(0).text();
		var device = $.parseJSON(jsDataText);
		
		$this.getRegion('fjxt_detail_region');
		$('#fjxt_detail_region').val($this.cur_sign);
		
		$('#fjxt_detail_basedevname').val(device.name);
		$('#fjxt_detail_basedevdspecific').val(device.specific);
		$('#fjxt_detail_basedevamount').val(device.amount);
		$('#fjxt_detail_basedevdunit').val(device.dunit);
		$('#fjxt_detail_basedevdetailidentify').val(device.detailidentify);
		$('#fjxt_detail_basedevdetailnote').val(device.detailnote);
	
	
		
		$('#fjxt_detailAddPartBtn').unbind();
		$('#fjxt_detailAddPartBtn').click(function(){
			
			area = $('#fjxt_detail_region').val();
			var name = $('#fjxt_detail_basedevname').val();
			var specific = $('#fjxt_detail_basedevdspecific').val();
			var amount = $('#fjxt_detail_basedevamount').val();
			var dunit = $('#fjxt_detail_basedevdunit').val();
			var detailidentify = $('#fjxt_detail_basedevdetailidentify').val();
			var detailnote = $('#fjxt_detail_basedevdetailnote').val();
		
			if(area == null) area = '';
			if(name == ''){
				
				showMsg('配件名称不能为空！',null);
				return;
			}
			
			if(specific == ''){
				
				showMsg('配件规格不能为空！',null);
				return;
			}
			
			if(amount == ''){
				
				showMsg('数量不能为空！',null);
				return;
			}
			if(dunit == '')
			{
				showMsg('单位不能为空！',null);
				return;
			}
			device['id'] = sbid;
			device['name'] = name;
			device['specific'] = specific;
			device['amount'] = amount;
			device['dunit'] = dunit;
			device['detailnote'] = detailnote;
			device['detailidentify'] = detailidentify;    
			
		common_post2(
					getRootPath() + "/equip/detail/setDetail",
					{
						id:sbid,
						name:name,
						infoid:device['infoid'],
						specific:specific,
						amount:amount,
						dunit:dunit,
						detailidentify:detailidentify,
						detailnote:detailnote
					},
					function(data) {
						if(data.status) {
							showMsg(data.memo,function(){$('#fjxt_detail_mdf_add_form').modal('hide');});
							var trObj = $(obj).parent().parent().parent().parent();
							if(trObj[0].tagName != 'TR') return;
							var cur_line = trObj.children().eq(1).text();
							
							var onelineitem = $this.table_fjxt_detail_html_item(device,cur_line);
							trObj.replaceWith(onelineitem);
							$this.search_info(false);
							//刷新外面
						} else {
							if(data.memo == '')
								showMsg('抱歉，出现了一个未知的技术问题，请稍后重试',function(){});
							else
								showMsg(data.memo,function(){});
						}
					},
					function(){},
					function(){showMsg('修改失败！',null)});
		});
	}
	else
	{
		$('#fjxt_detail_mdf_add_title').html('详情 - 新增部件');
		$('#fjxt_detailAddPartBtn').html('确定');
		
		$('#fjxt_detail_basedevname').val('');
		$('#fjxt_detail_basedevdspecific').val('');
		$('#fjxt_detail_basedevamount').val('');
		$('#fjxt_detail_basedevdunit').val('');
		$('#fjxt_detail_basedevdetailidentify').val('');
		$('#fjxt_detail_basedevdetailnote').val('');

		//get region	
		$this.getRegion('fjxt_detail_region');
			
		
		$('#fjxt_detailAddPartBtn').unbind();
		$('#fjxt_detailAddPartBtn').click(function(){
			
			var name = common_trim($('#fjxt_detail_basedevname').val());
			var dspecific = common_trim($('#fjxt_detail_basedevdspecific').val());
			var amount = common_trim($('#fjxt_detail_basedevamount').val());
			var dunit = common_trim($('#fjxt_detail_basedevdunit').val());
			var detailidentify =$('#fjxt_detail_basedevdetailidentify').val();
			var detailnote = common_trim($('#fjxt_detail_basedevdetailnote').val());
			
			if(name == ''){
				
				showMsg('配件名称不能为空！',null);
				return;
			}
			
			if(dspecific == ''){
				
				showMsg('配件规格不能为空！',null);
				return;
			}
			
			if(amount == ''){
				
				showMsg('数量不能为空！',null);
				return;
			}
			if(dunit == '')
			{
				showMsg('单位不能为空！',null);
				return;
			}

			$.post(
				getRootPath() + "/equip/detail/addDetail",
				{
					infoid:$this.infoid,
					name:name,
					specific:dspecific,
					amount:amount,
					detailidentify:detailidentify,
					dunit:dunit,
					detailnote:detailnote
				},
				function(data) {
					if(data.status) {
						showMsg('添加成功！',function(){
						$('#fjxt_detail_mdf_add_form').modal('hide');
						$this.init_detail_first($this.infoid);});
					} else {
						if(data.memo == '')
							showMsg('抱歉，出现了一个未知的技术问题，请稍后重试',function(){});
						else
							showMsg(data.memo,function(){});
					}
				}
			)
			
		});
	}
	
	$('#fjxt_detail_mdf_add_form').modal('show');
}
/*****************************************************************
 * 
 * 							区域管理 -- 新增设备
 * 
 *****************************************************************/
qygl.prototype.makeImages = function(){
	bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
	common_post(
		getRootPath()+"/area/areaRest/makeImages",
		{device:""},
		function(sdata){
			bootbox.hideAll();
			var data = $.parseJSON(sdata);
			console.log(data);
			if(data.code == "confirm"){
				if(confirm("已经生成过一次，确定要重新生成吗？")){
					bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
					common_post(
							getRootPath()+"/area/areaRest/makeImages",
							{device:"",forceAll:"forceAll"},
							function(skdata){
								var kdata = $.parseJSON(skdata);
								bootbox.hideAll();
								showMsg(kdata.msg,null);
							},
							function(){},
							function(){
								bootbox.hideAll();
								showMsg('操作是失败！',null);
							});
				}
			}else{
				showMsg(data.msg,null);
			}
		},
		function(){},
		function(){
			bootbox.hideAll();
			showMsg('操作是失败！',null);
		});
}

qygl.prototype.downLoadAllImgs = function(){
	bootbox.dialog({
		message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>'
	});
	common_post(
			getRootPath()+"/area/areaRest/downLoadAllImgs",
			{},
			function(data){
				bootbox.hideAll();
				if(data=="no")
				{
					showMsg("尚未生成设备二维码！",null);
				}
				else
				{
					window.open(data);
				}
			},
			function(){},
			function(){
				bootbox.hideAll();
				showMsg('操作失败！',null);
			});
}

qygl.prototype.showNoRegionData = function(rows,page,sssb,czbf,sbfl){
	
	common_post(
			"../region",
			{action:"getnoregioninfodevice",page:page,rows:rows,sssb:sssb,czbf:czbf,sbfl:sbfl},
			function(msg){
			
				 if(msg == '')
				 {
					console.log('Error:qygl.showNoRegionData msg = "";'); 
					$this.detailShowMask('fjxt_jdcsxt_mask_juhua',false);
					return;
				 }
				 
				$this.update_addnew_detail_page(msg);				
			},
			function(){},
			function(){});
}
/**
 * 添加设备页面信息
 * @param msg
 */
qygl.prototype.update_addnew_detail_page = function(msg){
	$('#table_body_fjxt_adddev').empty();
	var pages = 0;
	$this.cur_detail_page_index ++;

	var jsonData = msg;
	var curpage = jsonData['curpage'];
	pages = jsonData['pages'];	
	var devices = jsonData['list'];
		
	for(var i = 0; i < devices.length; i++)
	{
		var device = devices[i];
		
		$this.detail_cur_line++;
		
		var onlinedate = "";
		if(isNull(device.onlinedate)!="") onlinedate = new Date(device.onlinedate.time).Format("yyyy-MM-dd");
		var baddate = "";
		if(isNull(device.baddate)!="") baddate = new Date(device.baddate.time).Format("yyyy-MM-dd");
		var repairdate = "";
		if(isNull(device.repairdate)!="") repairdate = new Date(device.repairdate.time).Format("yyyy-MM-dd");
		var replacedate = "";
		if(isNull(device.replacedate)!="") replacedate = new Date(device.replacedate.time).Format("yyyy-MM-dd");
		var onelineitem = '<tr>' +
		'<td>' + '<input class="gui-magic-checkbox sub-checkbox" type="checkbox" id="'+ CHECKBOX_ID_PREFIX + CHECKBOX_ID_ADD_NEW_FJ + device.id +'" /><label for="'+ CHECKBOX_ID_PREFIX + CHECKBOX_ID_ADD_NEW_FJ + device.id +'">' + $this.detail_cur_line + '</label>' + '</td>' +
		'<td style="display: none;">' + $this.detail_cur_line + '</td>' +
		'<td>' +device.name + '</td>' + 
		'<td>' +device.identify + '</td>' + 
		'<td>' +device.ifirm + '</td>' + 
		'<td>' +device.ibrand + '</td>' +  
		'<td>' +device.unit + '</td>' + 
		'<td>' +device.amount + '</td>' + 
		'<td>' +device.ispecific + '</td>' +
		'<td>' +(InfoStatus(device.istatus)) + '</td>' +
		'<td>' + onlinedate + '</td>' +
		'<td>' + baddate + '</td>' +	  
		'<td>' + repairdate + '</td>' +
		'<td>' + replacedate + '</td>' +
		'<td>' +device.area_name + '</td>' +
		'</tr>';
		
		$("#table_body_fjxt_adddev").append(onelineitem);	
	}
}
/**
 * 根据rootid和id查询区域信息
 */
qygl.prototype.getDeviceSelect = function(){
	//获取pid 和id
	var pid = $('#fjxt_detail_owner_dev_adddev').val();
	var id = $('#fjxt_detail_ctl_part_adddev').val();
	
	common_post2(
			getRootPath()+"/area/areaRest/getDeviceData",
			{pid:pid,id:id},
			function(msg){
				
				$this.update_addnew_detail_page(msg);
			},
			function(){},
			function(){showMsg('获取数据失败！',null);});
}
/**
 * 将设备添加到某个区域
 */
qygl.prototype.add_new_dev = function(){

	$('#fjxt_detail_owner_dev_adddev').empty();
	$('#fjxt_detail_ctl_part_adddev').empty();
	
	$('#fjxt_detail_owner_dev_adddev').val('');
	$('#fjxt_detail_ctl_part_adddev').val('');

	//区域信息
	$this.getRegion('fjxt_fengpeidao');
	//设备名称
	$this.init_sbmc_select('fjxt_detail_owner_dev_adddev','fjxt_detail_ctl_part_adddev');
	
	//$this.getDeviceSelect();

	$('#fjxt_detail_Submit_adddev').unbind();
	$('#fjxt_detail_Submit_adddev').click(function(){
		
		$('#table_body_fjxt_adddev').empty();

		$this.cur_detail_page_index = 0;
		$this.detail_cur_line = 0;
		$this.getDeviceSelect();
	});
	
	
	$('#detail_table_fjxt_checkbox_adddev').unbind();
	$('#detail_table_fjxt_checkbox_adddev').click(function(){
		
		var trList = $("#table_body_fjxt_adddev").children('tr');
		if(trList.length == 0) return;
		
		$this.detail_checkbox_checkall(trList,$('#detail_table_fjxt_checkbox_adddev').is(':checked'));
	});
	
	//全选
	$("#detail_table_jdcsxt_checkbox").click(function()
	{
		var checked = $(this)[0].checked;
		if(checked)//全选
		{
			var trList = $("#table_body_fjxt_adddev").children('tr');
			$(trList).each(function(index,item)
			{
				var td = $(this).find("td").eq(0);
				$(td).find("input").prop("checked","checked");
			});
		}
		else//取消全选
		{
			var trList = $("#table_body_fjxt_adddev").children('tr');
			$(trList).each(function(index,item)
			{
				var td = $(this).find("td").eq(0);
				$(td).find("input").prop("checked","");
			});
		}
	});
	
	
	$('#fjxt_jdxt_yingyiong_btn').unbind();
	$('#fjxt_jdxt_yingyiong_btn').click(function(){
		
		var area = $('#fjxt_fengpeidao').val();

		var trList = $("#table_body_fjxt_adddev").children('tr');
		
		if(trList.length == 0)
		{
			showMsg('表中数据为空!',null);
			return;
		}
		
		if(area == null){	
			showMsg('请选择要分配到的区域！',null);
			return;
		}
		
		var arrIds = [];

		for(var i = 0; i < trList.length; i++){
			
			var td_checkbox = trList[i];
			var id = td_checkbox.firstChild.firstChild.id;
			
			if($('#' + id).is(':checked')){
				
				var prefix = CHECKBOX_ID_PREFIX + CHECKBOX_ID_ADD_NEW_FJ;
				var index = id.indexOf(prefix);
				if(index != 0) continue;
				
				var idsub = id.substr(prefix.length);
				arrIds.push(idsub);
			}
		}
		
	 if(arrIds.length == 0){
		 
		 showMsg('未找到对应的数据!',null);
		 return;
	 }
	 
	 var sbidData = new Array();
		for(var i = 0; i < arrIds.length; i++){
			
			sbidData.push(arrIds[i]);
		}
		//添加设备到某个区域
		common_post2(
				getRootPath()+"/area/areaRest/addDeviceGoArea",
				{ids:sbidData,area_id:area},
				function(msg){
					
					showMsg('分配区域成功！',null);
					$this.cur_detail_page_index = 0;
					$this.detail_cur_line = 0;
					//刷新
					$this.getDeviceSelect();
					$this.search_info(false);
					/*var trList = $("#table_body_fjxt_adddev").children('tr');
					if(trList.length == 0) return;
					
					for(var i = 0; i < trList.length; i++){
						var td_checkbox = trList[i];
						var id = td_checkbox.firstChild.firstChild.id;
						if($('#' + id).is(':checked')) $(td_checkbox).remove();
					}*/
					
				},
				function(){},
				function(){showMsg('分配区域失败！',null);});
		
	});
	
	$('#fjxt_detail_adddev').modal('show');
}
//装填表头数据
qygl.prototype.installTableAndInfodataHead = function(rootid){	 
	common_post(
			ROOTPATH + "equip/equipRest/installTableAndInfodataHead/"+rootid,
			{},
			$this.install_head_success,
			$this.install_head_complete,
			$this.install_head__error);
}
/**
 * 获取区域信息  {区域id}
 */
qygl.prototype.getRegion = function(id,area_id)
{
	//get region	
	common_post(
			getRootPath()+"/area/areaRest/getRegion",
			{},
			function(msg){
				
				if(msg == '') return;
				$this.init_region_select(id,msg,area_id);
			},
			function(){},
			function(){});
}
/**
 * 装填区域信息
 */
qygl.prototype.init_region_select = function(id,value,area_id){
	
	var option = '';
	$('#' + id).empty();
	
	var jsData = $.parseJSON(value);
	 
	 
	$.each(jsData,function(n,value){
	  
		 if(n.length == 0 || value.length == 0) return; 
		 option = '<option value="'+ value.id +'">'+ value.name +'</option>';
		 $('#' + id).append(option);
	 });
	if(isNull(area_id)!="") $('#' + id).val(area_id);
	else $('#' + id).val('');
}
/**
 * 查询设备名称和父级
 * {pid} 父级名称
 * {id} 子级名称
 */
qygl.prototype.init_sbmc_select = function(pid,id)
{
	$("#"+pid).empty();//pid pname
	$("#"+id).empty();//id name
	//查询
	common_post(
			getRootPath()+"/area/areaRest/getNameAndPname",
			{},
			function(msg)
			{
				var data = $.parseJSON(msg);
				$this.pinfo_info = data;
				$.each(data[0],function(index,item)
				{
					if(index.length == 0 || item.length == 0) return; 
					//重复的不填pid相同
					if(index!=0)
					{
						var info = $('#' + pid)[0].options;
						var flag = true;
						for(var i=0;i<info.length;i++)
						{
							if(item.pid==info[i].value)
							{
								flag = false;
							}
						}
						if(flag)
						{
							if(isNull(item.pname)!="")
							{
								option = '<option value="'+ item.pid +'">'+ item.pname +'</option>';
								 $('#' + pid).append(option);
							}
						}
					}
					else
					{
						if(isNull(item.pname)!="")
						{
							option = '<option value="'+ item.pid +'">'+ item.pname +'</option>';
							 $('#' + pid).append(option);
						}
					}
				});
				$("#"+id).empty();//id name
				option = '<option value="">所有设备</option>';
				 $('#' + id).append(option);
				 var pids = $("#"+pid).val(); 
				$.each(data[0],function(index,item)
				{
					if(pids==item.pid)
					{
						option = '<option value="'+ item.id +'">'+ item.name +'</option>';
						 $('#' + id).append(option);
					}
				});
				$("#"+pid).change(function()
				{
					var parentid = $("#"+pid).val();
					$("#"+id).empty();//id name
					option = '<option value="">所有设备</option>';
					 $('#' + id).append(option);
					$.each($this.pinfo_info[0],function(index,item)
					{
						if(parentid==item.pid)
						{
							option = '<option value="'+ item.id +'">'+ item.name +'</option>';
							 $('#' + id).append(option);
						}
					});
				});
				
				//查看
				$this.getDeviceSelect();
			},
			function(){},
			function(){showMsg("暂无数据！",null)});
}
/**
 * 添加修改区域
 */
qygl.prototype.region_control = function()
{
	 var location = "";
	 var lid = "";
	 
	if(($this.cur_Region_control_type < 1) || ($this.cur_Region_control_type > 3))  return;
	
	if($this.cur_Region_control_type == 1)
	{
		lid = "";
		location = getRootPath()+"/area/areaRest/addRegion";	
		lname = common_trim($('#addregion').val());
		if(lname == "")
		{
			showMsg('添加的名称不能为空！',null);
			return;
		}
		
		if($this.is_regionname_exists(lname))
		{
			showMsg('此区域名称已经存在，请更换！',null);
			return;
		}
	}
	else if($this.cur_Region_control_type == 2)
	{
		location = getRootPath()+"/area/areaRest/setRegion";
		lid = common_trim($('#oldregion').val());
		lidtext = common_trim($('#oldregion').find("option:selected").text());
		lname = common_trim($('#renameregion').val());
		
		if((lid == '') || (lname == ''))
		{
			showMsg('参数不能为空！',null);
			return;
		}
		
		if(lidtext == lname)
		{
			showMsg('请输入一个不同的区域名称！',null);
			return;
		}
		
		if($this.is_regionname_exists(lname))
		{
			showMsg('此区域名称已经存在，请更换！',null);
			return;
		}
	}
	else if($this.cur_Region_control_type == 3)
	{
		location = getRootPath()+"/area/areaRest/delRegion";
		lid = common_trim($('#delregion').val());
		lname = "";
		
		if(lid == '')
		{
			showMsg('参数不能为空！',null);
			return;
		}
	}
	
	var area = {"id":lid,"name":lname};
	var data = JSON.stringify(area);
	 $.ajax
	 ({
         type: "POST",
         url: location,
         dataType: "json",
         data:data,
         headers:{"Content-Type":"application/json;charset=UTF-8"},
         success: function(msg)
         {
        	
        	 if(msg.success)
    		 {
        		showMsg(msg.msg,function(){
        			$this.region_modify_success(data);
        		});
        		
    		 }
        	 else
    		 {
        		 $this.region_modify_error();
    		 }
        	
         }
	 });
}

qygl.prototype.region_modify_success = function(msg){
	
	if($this.cur_Region_control_type == 1) $('#region_manage_add').modal('hide');
	if($this.cur_Region_control_type == 2) $('#region_manage_set').modal('hide');
	if($this.cur_Region_control_type == 3) $('#region_manage_del').modal('hide');
	$("#table_body").children().remove();
	$(".pagination").empty();
	$this.init();
}

qygl.prototype.region_modify_complete = function(msg){
	
	//
}

qygl.prototype.region_modify_error = function(msg){
	
	showMsg('修改区域信息失败！',null);
}
/**
 * 查看配件二维码
 */
qygl.prototype.detail_jdcsxt_modify_lookImg = function(name)
{
	var path = getRootPath() + "/imgPartsCode/imgs/part_"+$this.cur_pname+"-"+name+".jpg";

	if(validateImage(path))
	{
		var html = '<img src="'+path+'" width="250" height="240" alt="配件" onerror="showMsg("二维码未生成!",null);"/>';
		 showMsg(html,null);
	}
	else
	{
		showMsg("二维码未生成！",null);
	}
	
}

/**
 * 查看设备二维码
 */
qygl.prototype.device_show_lookImg = function(name)
{
	var path = getRootPath() + "/imgCode/imgs/"+ $this.cur_sign_text+"-"+name+".jpg";
	if(validateImage(path))
	{
		var html = '<img src="'+path+'" width="250" height="240" alt="设备" onerror="showMsg("二维码未生成!",null);"/>';
		 showMsg(html,null);
	}
	else
	{
		showMsg("二维码未生成！",null);
	}
	
}

