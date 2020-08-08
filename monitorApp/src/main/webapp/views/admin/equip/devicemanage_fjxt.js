$this = null;

function fjxt(){
	//tree数的数据结构
	this.tree_json_data = null;
	//tree array struct
	this.tree_array_data = null;
	//当前选中的类型id
	this.dkindid = null;
	//当前选中的类型名称
	this.dkindname = null;
	//当前选中的数菜单节点id
	this.cur_tree_id = null;
	//当前选中的数菜单节点name
	this.cur_tree_name = null;
	//当前选中的数菜单根节点id
	this.cur_tree_rootid = null;
	//当前选中的数菜单根节点对象
	this.cur_tree_node = {};
	//three level linkage
	this.linkOneId   = null;

	this.linkTwoId 	 = null;

	this.linkThreeId = null;
	//choice tree path
	this.cur_tree_path = [];
	//search content
	this.search_content = '';
	//search scroll loading data lock
	this.search_lock = false;
	this.cur_search_page = 1;
	this.search_rows = TABLE_MAX_LINES;
	this.totalpages = 1;
	//table items count,用于控制是否重置分页显示。
	this.table_items_count_for_page = 0;
	//get detail sbid
	this.detail_sbid = '';
	//current detail page index
	this.cur_detail_page_index = 0;
	//is detail input last value
	this.is_detail_last_content_null = true;
	//is detail content if first change
	this.is_detail_first_change = true;
	//is detail current choice mode checkbox
	this.is_cur_detail_choice_mode_checkbox = false;
	//global detail json data text
	this.glb_detail_json_data_text = '';

	//拿取当前点击设备，需要展示的表格表头数据
	this.tablefieldtable = [];
	//拿取当前点击设备，需要展示的详情表头数据
	this.tablefieldinfo = [];
	//拿取区域信息
	this.areaInfo = {};
	//选择的设备id
	this.choose_device_ids = "";

	this.init();
	this.reginon = null;
};

fjxt.prototype.device_tree_success = function(msg)
{
	$this.init_tree.call($this,msg);
}

fjxt.prototype.device_tree_complete = function()
{
	//
}

fjxt.prototype.device_tree_error = function()
{
	showMsg('获取分拣系统设备树数据失败！',null);
}

fjxt.prototype.get_areaInfo_success = function(msg){
	$this.areaInfo = $.parseJSON(msg);
	//初始化时间，搜索等
	$this.initInputParms();
}

fjxt.prototype.get_areaInfo_complete = function(){}
fjxt.prototype.get_areaInfo_error = function()
{
	showMsg('获取区域信息失败！',null);
}


fjxt.prototype.getTree = function(info)
{
	 var data = [];
	 if(info == '')
	 {
		// //console.log('Error:fjxt.prototype.getTree info = "";');
		return;
	 }

	 var jsData = $.parseJSON(info);
	 $this.tree_json_data = jsData;

	 $.each(jsData,function(n,value){

		 if(n.length == 0 || value.length == 0) return;
	 });

	 $this.tree_array_data = data;
	 return data;
}

fjxt.prototype.init_tree = function(info)
{
	var data = $.parseJSON(info);
	$this.tree_json_data = data;
	$('#tree').treeview({
        data: data,//$this.getTree(info),         // data is not optional
        levels: 3,
        multiSelect: false,
        expandIcon:'glyphicon glyphicon-plus-sign folder_color',
        collapseIcon:'glyphicon glyphicon-minus-sign folder_color',
        emptyIcon:'fa fa-cog folder_color floder_size',
        selectedIcon: "select_color",
        showBorder:false,
        onNodeSelected: function(event, data) {
        	$this.table_items_count_for_page = 0;
        	$this.cur_tree_id = data.id ? data.id : null;
        	$this.cur_tree_name = data.text ? data.text : null;
        	$this.cur_tree_rootid = data.rootid ? data.rootid : null;
        	$this.dkindid = data.dkindid ? data.dkindid : null;
        	$this.dkindname = data.dkindname ? data.dkindname : null;
        	$this.cur_tree_node = data;
        	$this.search_rows = TABLE_MAX_LINES;
        	//点击父级点，展开子节点
        	if(data.nodes){
        		if(data.state.expanded == false){
        			$('#tree').treeview('expandNode',[$this.cur_tree_node.nodeId]);
            	}else{
            		$('#tree').treeview('collapseNode',[$this.cur_tree_node.nodeId]);
            	}
        	}

        	$this.search_content= '';
        	$("#lookPartForEachPart").empty();
        	$('.search_input').val('');
			if(data.id != undefined && data.nodes == undefined){
				 $this.cur_search_page = 1;
				 $this.setSearchState(false);
				 $('.search_input').val('');
				 $(".pagination").empty();
				 $this.installTableAndInfodataHead.call($this,$this.cur_tree_rootid);
			}else{
				//$this.search_info();
			}
		 }
    });
	//默认选中一个
	if($this.cur_tree_id != null){
		var node = $this.cur_tree_node;
		$('#tree').find("li[data-nodeid="+node.nodeId+"]").click();
	}else{
		var firsNode = $('#tree').treeview('getNode', 1);
		var fistLeafNode = getTreeofFirstLeaf(firsNode);
		$('#tree').find("li[data-nodeid="+fistLeafNode.nodeId+"]").click();
	}
}

fjxt.prototype.findNodeByTag = function(tag,nodes)
{
	 if(nodes.length == 0) return -1;

	 for(var i = 0; i < nodes.length; i++)
	 {
		 if(tag == nodes[i].nodeid) return i;
	 }

	 return -1;
}

fjxt.prototype.install_head_success = function(msg)
{
  $this.update_tableOfhead.call($this,msg,false);
}

fjxt.prototype.install_head_complete = function()
{
	//
}

fjxt.prototype.install_head_error = function(msg)
{
	showMsg('获取设备表头失败.',null);
}

fjxt.prototype.device_data_success = function(msg)
{
  $this.update_table.call($this,msg,false);
}

fjxt.prototype.device_data_complete = function()
{
	//
}

fjxt.prototype.device_data_error = function(msg)
{
	showMsg('获取设备详细信息失败.',null);
}

//装填表头数据
fjxt.prototype.installTableAndInfodataHead = function(rootid){
    var id = $this.cur_tree_id
	common_post(
			ROOTPATH + "equip/equipRest/installTableAndInfodataHead/"+rootid,
			{},
			$this.install_head_success,
			$this.install_head_complete,
			$this.install_head__error);
}

fjxt.prototype.get_device_data = function(signid,maxrow,pageindex){
    var id = $this.cur_tree_id
	common_post(
			ROOTPATH + "equip/equipRest/getEquipTableByPid",
			{id:id,rows:$this.search_rows,page:$this.cur_search_page,key:$this.search_content},
			$this.device_data_success,
			$this.device_data_complete,
			$this.device_data_error);
}

fjxt.prototype.changePage = function(pageNumber, event)
{
	$this.cur_search_page = pageNumber;
	$this.get_device_data($this.cur_sign,$this.cur_search_page,pageNumber);
	return false;
}

fjxt.prototype.get_tree_path_by_sign = function(signValue)
{
	 var retValue = null;

	 if((signValue == '' && $this.cur_sign == '') || $this.tree_json_data == null) return null;

	 $.each($this.tree_json_data,function(n,value){

			if((signValue == '') && (n == $this.cur_sign))
			{
				retValue = value;
			}
			else if((signValue != '') && (n == signValue))
			{
				retValue = value;
			}
		 });

	 return retValue;
}

fjxt.prototype.update_tableOfhead = function(msg,isSearch){
	if(msg == '')
	{
		// //console.log('Error:fjxt.prototype.update_table msg = ""');
		return;
	}
	var jsonData = $.parseJSON(msg);
	var rootid = $this.cur_tree_rootid;
	var tablekey = rootid+"table"
	$("#table_head").empty();
	$("#addPartForEachPart").empty();
	if(jsonData.statusCode != 1){
		return
	}
	//加载表格表头
	if(jsonData.Msg[tablekey] != null){
		var fieldColumnList = jsonData.Msg[tablekey].fieldColumnList;
		$this.tablefieldtable = fieldColumnList;
		var html='<tr>';
		html = html + '<th><input class="gui-magic-checkbox all-checkbox" type="checkbox" id="checkbox_fjxt_total"><label for="checkbox_fjxt_total">全选</label></th>';		
		$(fieldColumnList).each(function(i,obj){
			html = html + '<th style="'+obj.style+'">'+obj.field+'</th>'
		})
		html = html + '<th>操作</th>'
		html = html + '</tr>';
	}else{
		var fieldColumnList = jsonData.Msg['0table'].fieldColumnList;
		$this.tablefieldtable = fieldColumnList;
		var html='<tr>';
		html = html + '<th><input class="gui-magic-checkbox all-checkbox" type="checkbox" id="checkbox_fjxt_total"><label for="checkbox_fjxt_total">全选</label></th>';
		$(fieldColumnList).each(function(i,obj){
			html = html + '<th style="'+obj.style+'">'+obj.field+'</th>'
		})
		html = html + '<th>操作</th>'
		html = html + '</tr>';
	}
	$("#table_head").append(html);
	//加载详情列表名称lookPartForEachPart
	var infokey = rootid+"info";
	var infoaddHtml = '';
	var infoinfoHtml = '';
	if(jsonData.Msg[infokey] != null){
		var fieldColumnList = jsonData.Msg[infokey].fieldColumnList;
		$this.tablefieldinfo = fieldColumnList;
		$(fieldColumnList).each(function(i,obj){
            infoaddHtml = infoaddHtml + '<tr>';
			infoaddHtml = infoaddHtml + '<td class="table-label">';
			infoaddHtml = infoaddHtml + '<label>'+obj.field+'</label>';
			infoaddHtml = infoaddHtml + '</td>';
			// infoaddHtml = infoaddHtml + '<td class="table-label">';
			infoaddHtml = infoaddHtml + '<td class="table-value">';
			infoaddHtml = infoaddHtml + '<input type="text" class="form-control" name="'+obj.column+'">';
			infoaddHtml = infoaddHtml + '</td>';
			infoaddHtml = infoaddHtml + '</tr>';

			infoinfoHtml = infoinfoHtml + '<tr>';
			infoinfoHtml = infoinfoHtml + '<td class="table-label">';
			infoinfoHtml = infoinfoHtml + '<label>'+obj.field+'</label>';
			infoinfoHtml = infoinfoHtml + '</td>';
			infoinfoHtml = infoinfoHtml + '<td class="table-value">';
			infoinfoHtml = infoinfoHtml + '<label name='+obj.column+' type="data" ></label>';
			infoinfoHtml = infoinfoHtml + '</td>';
			infoinfoHtml = infoinfoHtml + '</tr>';
		});
	}
	$("#addPartForEachPart").append(infoaddHtml);
	$("#lookPartForEachPart").append(infoinfoHtml);

	//开始加载表格数据
	 $this.get_device_data.call($this,$this.cur_sign,TABLE_MAX_LINES,0);

}

fjxt.prototype.update_table = function(msg,isSearch){
	$("#checkbox_fjxt_total").prop("checked","");
	//全选
	$("#checkbox_fjxt_total").unbind();
	$("#checkbox_fjxt_total").click(function()
	{
		var checked = $(this).prop("checked");
		if(checked)
		{
			$("#table_body tr td").find("input").each(function(index,item){
				
				$(item).prop("checked","checked");
			});

		}
		else
		{
			$("#table_body tr td").find("input").each(function(index,item){
				
				$(item).prop("checked","");
			});
		}
		
	});
	if(msg == '')
	{
		// //console.log('Error:fjxt.prototype.update_table msg = ""');
		return;
	}
	 var jsonData = $.parseJSON(msg);
	 if($("#table_body") == null) return;

	 var pages = jsonData.pages;
	 var curpage = jsonData.pageNum;

	 $("#table_body").children().remove();

	 //update pages
	 if($this.table_items_count_for_page != TABLE_MAX_LINES * pages){
		 $(".pagination").empty();
		 $this.table_items_count_for_page = TABLE_MAX_LINES * pages;

		 $(".pagination").pagination({
	        items: $this.table_items_count_for_page,
	        itemsOnPage: TABLE_MAX_LINES,
	        cssStyle: 'compact-theme',
	        onPageClick:$this.changePage
	    });
	 }
	 var devices = jsonData.list;
	 if(devices.length == 0){
	 	 $("#table_page_div").hide();
		 $("#table_body").append('<tr><td colspan="'+$("#table_head").find("th").length+'">暂无数据</td></tr>');
		 return
	 }

	 $this.cur_search_page = parseInt(jsonData.pageNum);

	 for(var i = 0; i < devices.length; i ++){
		 var device = devices[i];
		 var id = device['id'];
		 var cur_line = 0;

		 if(isSearch){
			 cur_line = (($this.cur_search_page-1)*$this.search_rows + i + 1);
		 }else{
			 cur_line = (($this.cur_search_page-1)*$this.search_rows + i + 1);
		 }
		 var onelineitem = $this.table_html_item(id,device,cur_line);
		 $("#table_body").append(onelineitem);
	 }
}

fjxt.prototype.table_html_item = function(id,device,cur_line){

	var control = '<div id="'+ id +'" class="table_control_lnk"><div style="display:none">'+ JSON.stringify(device) +'</div>' +
	  '<div>' +
	  '<a onclick="$this.click_table_ctl_lnk(this,1);" class="btn gui-btn-view">查看</a>' +
	  //(device.istatus == 10 ? '<a onclick="$this.click_table_ctl_lnk(this,5);" class="btn gui-btn-del">借出</a>' : '') +
	  (device.istatus == 20 ? '<a onclick="$this.click_table_ctl_lnk(this,6);" class="btn gui-btn-details">归还</a>' : '') +
	  '<a onclick="$this.click_table_ctl_lnk(this,3);" class="btn gui-btn-modify">修改</a>' +
	  '<a onclick="$this.click_table_ctl_lnk(this,4);" class="btn gui-btn-del">删除</a>'+
	  '</div>' + '</div>';

	var oneline = '<tr>';
	oneline = oneline + '<td><input class="gui-magic-checkbox all-checkbox" type="checkbox" id="checkbox_fjxt_total_' + id + '"><label for="checkbox_fjxt_total_' + id + '">' + cur_line + '</label></td>' ;
	$($this.tablefieldtable).each(function(i,obj){
		var value = device[obj.column] ? device[obj.column] : '';
		var showVal = getShowVal(obj,value);
		oneline = oneline + '<td>'+showVal+'</td>'
	})
	oneline = oneline + '<td>'+control+'</td>';
	oneline = oneline + '</tr>' ;
	return oneline;
}


fjxt.prototype.showPartBaseInfo = function(jsonText){
	console.log(jsonText);
	var jsData = $.parseJSON(jsonText);
	/*//获得本设备所有上级名称
	common_post(ROOTPATH+"area/areaRest/getDeviceDetails/"+jsData.id,
			{},
			function(data){
				var lis = ($.parseJSON(data)).menus;
				var s = '';
				for(var i=lis.length-1 ; i>0 ; i--){
					s = s + lis[i] ;
					if(i>1){
						s = s + '->' ;
					}
				}
				$("#rootEquips").html(s);
			},
			function(){},
			function(){});
*/
	$('#fjxt_baseinfo').modal('show');
	$("#rootEquips").html(jsData.root_name);
    var lable = $("#fjxt_baseinfo").find($('label[type="data"]'));


    $.each(lable,function(i,obj){
    	$.each(jsData,function(colume,val){
        	if($(obj).attr("name") == colume){
        		var flag = true;
        		var showVal  = '';
        		//遍历配置文件中的值，
        		$.each($this.tablefieldinfo,function(k,tableinfo){
        			if(tableinfo.column == colume){
        				showVal = getShowVal(tableinfo,val);
                		$(obj).html(showVal);
                		flag = false;
        			}
        		})
        		//配置文件中没有匹配到值，就认为是jsp中写好的公共部分东西
        		if(flag){
        			var attrboj = makeEquipXmlFiledObj($(obj));
        			showVal = getShowVal(attrboj,val)
        			$(obj).html(showVal);
        		}

        	}
        })
    })
    if(jsData.infourl != null && jsData.infourl != 'null'){
        $("#infoimg").attr('src',ROOTPATH+jsData.infourl)
    }else{
    	$("#infoimg").attr('src',ROOTPATH+"/public/img/default.png")
    }
    
    var inputs = $("#formUpload").find("input");
	$.each(inputs,function(i,input){
		var input_name = $(input).attr("name");
		$.each(jsData,function(name,value){
			if(input_name == name){
				var flag = true;
				$.each($this.tablefieldinfo,function(k,tableinfo){
	    			if(tableinfo.column == name){
	    				showVal = getShowVal(tableinfo,value);
	            		$(input).val(showVal);
	            		flag = false;
	    			}
	    		})
	    		//配置文件中没有匹配到值，就认为是jsp中写好的公共部分东西
        		if(flag){
        			var attrboj = makeEquipXmlFiledObj($(input));
        			showVal = getShowVal(attrboj,value)
        			$(input).val(showVal);
        		}
			}
		})
	});
}

fjxt.prototype.click_table_ctl_lnk = function(dom,type)
{
	var id = dom.parentNode.parentNode.id;
	var trNode = dom.parentNode.parentNode.parentNode.parentNode;
	var textData = dom.parentNode.parentNode.firstChild.innerText;

	if(id == undefined) return;

	if(type == 1){	//查看
		$this.showPartBaseInfo(textData);
	}else if(type == 2){	//详情
		$this.init_detail(textData,false);
	}else if(type == 3){//修改
		$this.initModifyPart(textData,'#owndevice','#partctl','#fenlei');
	}else if(type == 4){// 删除
		jsonData = JSON.parse(textData);
		showConfirm("你确定要删除 " + jsonData.name + " 这个书籍吗？",function(){ $this.delPartItem(id,trNode,textData);});
	}else if(type == 5){// 借出
		$this.initBowr(textData,'#owndevice','#partctl','#fenlei');
	}else if(type == 6){// 归还
		jsonData = JSON.parse(textData);
		showConfirm("你确定要归还 " + jsonData.name + " 这个书籍吗？",function(){ $this.backBook(id,trNode,textData);});
	}
}


fjxt.prototype.del_item_error = function(){
	showMsg('删除数据失败！',null);
}

fjxt.prototype.delPartItem = function(id,trNode,textData){

	if(trNode.tagName != 'TR')
	{
		// //console.log('Error:删除数据时，tr dom 节点查找失败！');
		return;
	}
	var jsonData = $.parseJSON(textData);
	$.post(
		getRootPath() + "/equip/equipRest/deleteEquipTable",
		{
			id:id
		},
		function(data) {
			data = JSON.parse(data);
			if(data.statusCode == 1) {
				$(trNode).remove();showMsg('删除数据成功！',null);
			} else {
				showMsg('抱歉，出现了一个未知的技术错误，请稍后重试！',null);
			}
		}
	)
}


fjxt.prototype.backBook = function(id,trNode,textData){

	$.post(
		getRootPath() + "/equip/equipRest/backBook",
        {id:id},
        function(data) {
        	$this.add_part_success(data);
		}
	 );
}

fjxt.prototype.search_device_success = function(msg){
	$this.update_table(msg,true);
	$this.cur_search_page ++;
}

fjxt.prototype.search_device_complete = function(){
	$this.search_lock = false;
}

fjxt.prototype.search_device_error = function(){
	showMsg('服务器搜索数据失败！',null);
}

fjxt.prototype.search_info = function(isInited)
{
	var searchContent = '';

	if(isInited){
		 $this.search_lock = false;
		 searchContent = common_trim($('.search_input').val());
		 if(searchContent == ''){
			 showMsg('搜索内容不能为空！',null);
			 return;
		 }

		 $this.search_content = searchContent;
	}else{
		if($this.search_lock) return;
		searchContent = $this.search_content;
	}
	var cur_tree_id = $this.cur_tree_id;
	if(cur_tree_id == null){
		//showMsg('请在左侧树形菜单中选择要搜索的类型！',null);
		return;
	}
	$this.search_lock = true;

	if(isInited){
		//$this.setSearchState(true);
		$this.cur_search_page = 1;
		$this.totalpages = 1;
		$this.searchScrollToBottomEvent();
	}
	$this.table_items_count_for_page = 0;
	common_post(
			ROOTPATH + "equip/equipRest/getEquipTableByPid",
			{rows:$this.search_rows,page:$this.cur_search_page,id:cur_tree_id,key:$this.search_content},
			$this.search_device_success,
			$this.search_device_complete,
			$this.search_device_error);
	}

fjxt.prototype.searchScrollToBottomEvent = function(){
	$(".table_div_fjxt").unbind();
	$(".table_div_fjxt").scroll(function(){
        viewH =$(".table_div_fjxt").height(),//可见高度
        contentH =$(".table_div_fjxt").get(0).scrollHeight,//内容高度
        scrollTop =$(".table_div_fjxt").scrollTop();//滚动高度
       if(scrollTop/(contentH -viewH)>=0.95){ //到达底部100px时,加载新内容
        //console.log('search scroll need load data!');
        $this.search_info(false);
       }
    });
}

fjxt.prototype.searchToEnd = function(){
	$(".table_div_fjxt").unbind();
}

fjxt.prototype.setSearchState = function(isSearch){

	if(isSearch)
	{
		$('.table_page_div').css('display','none');
		$('.table_div_fjxt').css('height','490px');
	}
	else
	{
		$('.table_page_div').removeAttr('style');
		$('.table_div_fjxt').removeAttr('style');
	}
}

fjxt.prototype.init = function(){

	$this = this;
	//初始化树菜单
	common_post(
			ROOTPATH + "equip/equipRest/getEquipTree",
			{},
			$this.device_tree_success,
			$this.device_tree_complete,
			$this.device_tree_error);

	//拿取所有区域信息
	common_post(
			ROOTPATH + "area/areaRest/getRegion",
			{},
			$this.get_areaInfo_success,
			$this.get_areaInfo_complete,
			$this.get_areaInfo_error);


}

//初始化输入框，如时间框等
fjxt.prototype.initInputParms = function(){
	$('.addInfoDate').datepicker({
        language: 'zh-CN',
        todayBtn:true,
        autoclose: true,
        todayHighlight:true,
        format:"yyyy-mm-dd",
        //startDate:year + '-' + month + '-' + '01',
        //endDate:year + '-' + month + '-' + monthDay,
        beforeShowDay:function(date){
            /*var dateTime = parseInt(date.Format("M"));
            if(dateTime!=month){
            	return false;
        	}*/
            return [true,'',''];
        }
    });

	//增加数据，区域下拉
	$("#add_area_id").empty();
	$.each($this.areaInfo,function(i,obj){
		$('#add_area_id').append('<option value="'+obj.id+'">'+obj.name+'</option>');
	})

	//状态
	$("#add_status").empty();
	$('#add_status').append('<option value="10">正常</option>');
	$('#add_status').append('<option value="20">外接</option>');

}

/**
 * 选择图片
 */
fjxt.prototype.chooseImage = function()
{
	var large = $("#large");
	large.hide();
	var dataURL="";
	$("#infourl").change(function() {
		var $file = $(this);
		var fileObj = $file[0];
		var windowURL = window.URL || window.webkitURL;
		var $img = $("#img");

		if(fileObj && fileObj.files && fileObj.files[0]){
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
		}else{
			dataURL = $file.val();
		}
		$img.attr('src',dataURL);
		large.show();
		$("#device_image").show();
	});
}
/**
 * 设备种类初始化
 * @param pid
 * @param id
 */
fjxt.prototype.init_dkindid_select = function(id,dkindid)
{
	$("#"+id).empty();//id name
	//查询
	common_post(
			getRootPath()+"/sm/deviceKindRest/getAll",
			{},
			function(msg)
			{
				var data = $.parseJSON(msg);
				$.each(data.list,function(index,item)
				{
					if(index.length == 0 || item.length == 0) return;
					option = '<option value="'+ item.id +'">'+ item.name +'</option>';
					 $('#' + id).append(option);
				});
				if(isNull(dkindid)!="")  $('#' + id).val(dkindid);
			},
			function(){},
			function(){showMsg("暂无数据！",null)});
}
/**
 * 批量新增配件
 */
fjxt.prototype.batchAddPart = function(){
	
	$this.choose_device_ids = "";
	$("#table_body tr td").find("input").each(function(index,item){
		
		var checked = $(item).prop("checked");
		if(checked)
		{
			var id = $(item).prop("id").replace("checkbox_fjxt_total_","");
			$this.choose_device_ids = $this.choose_device_ids + "," + id;
		}
	});
	
	
	if($this.choose_device_ids == "")
	{
		showMsg("请选择要添加配件的设备！",null);
		return;
	}
	$('#detail_mdf_add_title').html('详情 - 新增部件');
	$('#detailAddPartBtn').html('确定');

	$('#detail_name').val('');
	$('#detail_dspecific').val('');
	$('#detail_amount').val('');
	$('#detail_dunit').val('');
	$('#detail_detailnote').val('');
	$('#detail_identify').val('');

	$('#detailAddPartBtn').unbind();
	$('#detailAddPartBtn').click(function(){
		
		var name = common_trim($('#detail_name').val());
		var dspecific = common_trim($('#detail_dspecific').val());
		var amount = common_trim($('#detail_amount').val());
		var dunit = common_trim($('#detail_dunit').val());
		var detailnote = common_trim($('#detail_detailnote').val());
		var identify = common_trim($('#detail_identify').val());
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
		var reg=/^[0-9]*[1-9][0-9]*$/;
		if(!reg.test(amount)) {
			showMsg('数量必须为正整数！',null);
			return;
		}
		if(parseInt(amount) >2000000000) {
			showMsg('请填写小于2000000000的数字！',null);
			return;
		}

		if(dunit == '')
		{
			showMsg('单位不能为空！',null);
			return;
		}
		
		$.post(
			getRootPath() + "/equip/detail/addBatchDetail",
			{
				name:name,
				specific:dspecific,
				amount:amount,
				dunit:dunit,
				detailnote:detailnote,
				detailidentify:identify,
				devices:$this.choose_device_ids
			},
			function(data) {
				if(data.status) {
					showMsg(data.memo,function(){
					$('#fjxt_detail_mdf_add_form').modal('hide');
				    $this.init_detail('',true);});
				} else {
					if(data.memo == '')
						showMsg('抱歉，出现了一个未知的技术问题，请稍后重试',function(){});
					else
						showMsg(data.memo,function(){});
				}
			}
		)
	});
	$('#fjxt_detail_mdf_add_form').modal('show');
}
/**
 * 批量删除配件
 */
fjxt.prototype.batchDelPart = function(){
	
	$this.choose_device_ids = "";
	$("#table_body tr td").find("input").each(function(index,item){
		
		var checked = $(item).prop("checked");
		if(checked)
		{
			var id = $(item).prop("id").replace("checkbox_fjxt_total_","");
			$this.choose_device_ids = $this.choose_device_ids + "," + id;
		}
	});
	
	if($this.choose_device_ids == "")
	{
		showMsg("请选择要删除配件的设备！",null);
		return;
	}
	//配件数据
	var item_part_data = [];
	//查询所有配件，本身和其他不再此范围----------根据选择id
	$.post(
			getRootPath() + "/equip/detail/getPartsByDevices",
			{
				devices:$this.choose_device_ids
			},
			function(data) 
			{
				item_part_data = data;
				$("#detail_name_like").empty();
				$("#detail_dspecific_like").empty();
				$.each(data,function(index,item)
				{
					$("#detail_name_like").append('<option value="'+item.name+'">'+item.name+'</option>');
				});
				
				if(data[0].dspecifics!=undefined)
				{
					var msg = data[0].dspecifics;
					//$("#detail_dspecific_like").append('<option value="">全部</option>');
					$.each(msg,function(index,item)
					{
						$("#detail_dspecific_like").append('<option value="'+item+'">'+item+'</option>');
					});
				}
				
				
			});
	/**
	 * 配件选择事件
	 */
	$("#detail_name_like").unbind();
	$("#detail_name_like").change(function(){
		$("#detail_dspecific_like").empty();
		var name = $(this).val();
		$.each(item_part_data,function(index,item){
			if(name==item.name)
			{
				var msg = item.dspecifics;
				//$("#detail_dspecific_like").append('<option value="">全部</option>');
				$.each(msg,function(index,item)
				{
					$("#detail_dspecific_like").append('<option value="'+item+'">'+item+'</option>');
				});
				
			}
		});
	});
	$('#detailDelPartBtn').unbind();
	$('#detailDelPartBtn').click(function(){
		//配件名称
		var name = $("#detail_name_like").val();
		//规格型号
		var dspecific = $("#detail_dspecific_like").val();
		
		if(name=="")
		{
			showMsg("未选择配件！",null);
			return;
		}
		bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
		$.post(
				getRootPath() + "/equip/detail/delBatchDetail",
				{
					name:name,
					dspecific:dspecific,
					devices:$this.choose_device_ids
				},
				function(data) {
					bootbox.hideAll();
					if(data.status) {
						showMsg(data.memo,function(){$('#fjxt_detail_del_form').modal('hide');})
						//刷新
						//开始加载表格数据
						$this.get_device_data.call($this,$this.cur_sign,$this.search_rows,$this.cur_search_page);
					} else {
						if(data.memo == '')
							showMsg('抱歉，出现了一个未知的技术问题，请稍后重试',function(){});
						else
							showMsg(data.memo,function(){});
					}
				});
	});
	$('#fjxt_detail_del_form').modal('show');
}
/**
 * 新增设备
 * @param linkOneId
 * @param linkTwoId
 * @param linkThreeId
 */
fjxt.prototype.initAddPart = function(linkOneId,linkTwoId,linkThreeId){
	//选择图片
	$this.chooseImage();
	if($this.cur_tree_id == null){
        showMsg("请先选中父节点！",null);
		return
	}
	$("#fatherEquipName").html($this.cur_tree_name);
	//添加时候只能选择tree的叶子节点
	if($this.cur_tree_node.nodes){
		showMsg("请选中数的叶子节点！",null);
		return
	}
	document.getElementById("formUpload").reset();
	$("#addPartBtn").html("添加设备");
	//设备种类初始化
	//$this.init_dkindid_select('add_dkindid', $this.dkindid);
	$("#add_status").val("正常");
	$("#add_dkindid").val($this.dkindname);
	$("#add_dkindid").attr("disabled","true");
	$("#fjxt_addpart").modal('show');
    $("#addPartTitle").text("确定");
	$('#addPartBtn').unbind();
	$('#addPartBtn').click(function(){
		$this.addPartSubmit('','equip/equipRest/addEquipTable');
	});
}

fjxt.prototype.addPartSubmit = function(id,url){
	var parmList = $("#formUpload").serializeArray();
	var formData = new FormData($("#formUpload")[0]);
	formData.append("file", document.getElementById("infourl").files[0]);
	var fileName=document.getElementById("infourl").value;
	var suffixIndex=fileName.lastIndexOf(".");
	var suffix=fileName.substring(suffixIndex+1).toUpperCase();
	if(suffix!="JPG"&&suffix!="PNG"&&suffix!=""){
		showMsg("请上传图片（格式JPG、PNG等）!",null);
		return
	}
	var flag = true;
	$.each(parmList,function(i,parm){
		if(parm.name == 'name' && common_trim(parm.value) == ''){
			showMsg("设备名称不能为空！",null);
			flag = false;
		}
		if(parm.name == 'amount' && parm.value != '' && !isNumber(parm.value)){
			showMsg("设备数量只能为整数！",null);
			flag = false;
		}
		if(parm.name == 'guarantee' && parm.value != '' && !isNumber(parm.value)){
			showMsg("质保期只能为整数！",null);
			flag = false;
		}
		eval("formData."+parm.name+"='"+parm.value+"'");
	})
	if(id != null && id != undefined && id != '' ){
		formData.append("id",id);
	}else{
		formData.append("istatus",10);
	}
	formData.append("pid",$this.cur_tree_id);
	formData.append("rootid",$this.cur_tree_rootid);
	formData.append("dkindid",$this.dkindid);
	formData.append("istreeleaf",0);
	formData.append("istableleaf",1);
	formData.append("isdel",0);
	if(!flag){return};
	$('#addPartBtn').prop("disabled","true");
	bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
	$.ajax({
        url: url,
        type: "POST",
        data: formData,
        dataType : 'text',
        contentType: false, //必须false才会避开jQuery对 formdata 的默认处理 
        processData: false, //必须false才会自动加上正确的Content-Type
        success: function (data){
        	$('#addPartBtn').prop("disabled","");
        	$this.add_part_success(data);
        }
	 });

}

fjxt.prototype.add_part_success = function(msg)
{
	bootbox.hideAll();
	$this.get_device_data($this.cur_sign,TABLE_MAX_LINES,0);
	showMsg('操作成功！',function(){$('#fjxt_addpart').modal('hide');});
}

fjxt.prototype.initModifyPart = function(jsonText,linkOneId,linkTwoId,linkThreeId)
{
	var jsData = $.parseJSON(jsonText);
	$("#file").val('');
	$("#spotlocate").val('');
	$("#device_image").show();

	//选择图片
	$this.chooseImage();
	$("#large").show();

	var inputs = $("#formUpload").find("input");
	$.each(inputs,function(i,input){
		var input_name = $(input).attr("name");
		$.each(jsData,function(name,value){
			if(input_name == name){
				var flag = true;
				$.each($this.tablefieldinfo,function(k,tableinfo){
	    			if(tableinfo.column == name){
	    				showVal = getShowVal(tableinfo,value);
	            		$(input).val(showVal);
	            		flag = false;
	    			}
	    		})
	    		//配置文件中没有匹配到值，就认为是jsp中写好的公共部分东西
        		if(flag){
        			var attrboj = makeEquipXmlFiledObj($(input));
        			showVal = getShowVal(attrboj,value)
        			$(input).val(showVal);
        		}
			}
		})
	});
	if(jsData.infourl != null && jsData.infourl != 'null'){
		$("#img").attr('src',ROOTPATH+jsData.infourl);
    }else{
    	$("#img").attr('src',ROOTPATH+"/public/img/default.png")
    }
	$("#add_status").val(statusFx(jsData.istatus));
	$("#add_dkindid").attr("disabled","true");
	$("#add_area_id").val(jsData.areaId);

	$("#fatherEquipName").html($this.cur_tree_name);
	$("#addPartBtn").html("修改设备");
	//设备种类初始化
	//$this.init_dkindid_select('add_dkindid', jsData.dkindid);
	$("#add_dkindid").val($this.dkindname);
	$('#fjxt_addpart').modal('show');
    $("#addPartTitle").text("修改部件");
	$('#addPartBtn').unbind();
	$('#addPartBtn').click(function(){$this.addPartSubmit(jsData.id,'equip/equipRest/editEquipTable');});

}


fjxt.prototype.initBowr = function(jsonText,linkOneId,linkTwoId,linkThreeId)
{
	var jsData = $.parseJSON(jsonText);
	$("input[name=bowrbookname]").eq(0).val(jsData.name);
	$("input[name=bowrbookidentify]").eq(0).val(jsData.identify);
	$('#fjxt_initBowr').modal('show');
	$('#addBowr').unbind();
	$('#addBowr').click(function(){$this.bowrbook(jsData.id,'equip/equipRest/bowrbook');});

}

//借出去
fjxt.prototype.bowrbook = function(id,url){

	var ibrand = $("input[name=bowrbookibrand]").eq(0).val();
	var unit = $("input[name=bowrbookunit]").eq(0).val();
	$('#addBowr').prop("disabled","true");
	bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
	$.ajax({
        url: url,
        type: "POST",
        data: {
        	id:id,
        	ibrand:ibrand,
        	unit:unit
        },
        dataType : 'json',
        success: function (data){
        	$('#fjxt_initBowr').modal('hide')
        	$('#addBowr').prop("disabled","");
        	$this.add_part_success(data);
        }
	 });
	
}


fjxt.prototype.modify_device_complete = function(msg){

	//
}

fjxt.prototype.modify_device_error = function(msg){

	showMsg("修改设备信息失败！",null);
}

fjxt.prototype.init_detail = function(textData,isUpdate){
	var option = '';
	var jsonData = '';

	$this.init_date_picker_detail();
	$("#table_body_xq").empty();
	if((textData == '') && (!isUpdate)) return;

	if(!isUpdate){
		$this.glb_detail_json_data_text = textData;
	}else{
		textData = $this.glb_detail_json_data_text;
	}

	jsonData = $.parseJSON(textData);
	var title = '设备配件详情';

	$('#xqinfo').html(title);

	$('#userWriteXulie').val('');
	$('#userBatCtl').empty();

	$('#userBatCtl').val('');

	$('#labelRegioncm').hide();
	$('#batRegionSelect').hide();
	$('.user_xqadd_part').css('right','-315px');


	$('#detail_table_checkbox').unbind();
	$('#detail_table_checkbox').click(function(){

		var trList = $("#table_body_xq").children('tr');
		if(trList.length == 0) return;

		$this.detail_checkbox_checkall(trList,$('#detail_table_checkbox').is(':checked'));
	});

	$this.getDetailDeviceList(jsonData.id,jsonData.name);

	$('#addBtn').on('click',function(){
		$this.detail_modify_addpart(this,false,jsonData.id,'');
	});

	if(!isUpdate) $('#fjxt_detail').modal('show');
	$this.detailShowMask(true);
}

fjxt.prototype.batDealDataSubmit = function(arrIds,batCtlType){

	var region = '';
	var ctlparam = '';
	var sbidData = '';

	if(batCtlType == 'batmodify'){

		ctlparam = 'setregionbatch';
		region = $('#batRegionSelect').val();
		if(region == null){

			showMsg('请选择要修改的目的区域!',null);
			return;
		}

		if(region == 'null') region = '';
	}
	else if(batCtlType == 'batdelete'){

		ctlparam = 'deldevicebatch';
	}
	else{

		showMsg('批量操作类型参数错误！',null);
		return;
	}

	sbidData = "{\"id\":[";
	for(var i = 0; i < arrIds.length; i++){

		sbidData += "\""+ arrIds[i] +"\"";
		if(i != arrIds.length - 1) sbidData += ",";
	}
	sbidData += "]}";

	common_post(
			"../device",
			{action:ctlparam,sbid:sbidData,area:region},
			$this.detail_bat_deal_success,
			$this.detail_bat_deal_complete,
			$this.detail_bat_deal_error);
}


fjxt.prototype.detail_bat_deal_success = function(msg){

	if(msg == 'ok'){

		$this.init_detail('',true);
	}
}

fjxt.prototype.detail_bat_deal_complete = function(){

	//
}

fjxt.prototype.detail_bat_deal_error = function(){

   showMsg('批量处理数据失败！',null);
}

fjxt.prototype.detail_checkbox_checkall = function(trList,isCheckAll){

	for(var i = 0; i < trList.length; i++){

		var td_checkbox = trList[i];
		var id = td_checkbox.firstChild.firstChild.id;

		$('#' + id).prop('checked',isCheckAll);
	}
}

fjxt.prototype.detail_checkbox_disabled = function(trList,isDisabled){

	$this.is_cur_detail_choice_mode_checkbox = !isDisabled;

	for(var i = 0; i < trList.length; i++){

		var td_checkbox = trList[i];
		var id = td_checkbox.firstChild.firstChild.id;

		$('#' + id).prop('disabled',isDisabled);
	}
}

fjxt.prototype.getDetailDeviceList = function(id,pname){

	$.get(
		getRootPath() + "/equip/detail/getDetails/" + id,
		function(data) {

			$(data).each(function(index,item){
				//配件名称
				var detailid = this.id;
				//配件名称
				var infoid = this.infoid;
				//配件名称
				var name = this.name;
				//配件规格
				var specific = this.specific;
				//数量
				var amount = this.amount;
				//单位
				var dunit = this.dunit;
				//备注
				var detailnote = isNull(this.detailnote);
				item.pname = pname;
				var onelineitem = $this.table_detail_html_item(item,detailid,infoid,name,specific,amount,dunit,detailnote);
				$("#table_body_xq").append(onelineitem);

			})
			$this.detailShowMask(false);
		}
	)
}

fjxt.prototype.detail_modify_addpart = function(obj,ismodify,infoid,detailid,pname){
	$('#detail_basedevname').removeAttr("readonly");
	$('#detail_basedevid').removeAttr("readonly");
	$('#detail_baseowndev').removeAttr("disabled");
	$('#detail_basectlpart').removeAttr("disabled");
	$('#detail_basefenlei').removeAttr("disabled");
	$('#detail_baseguige').removeAttr("readonly");

	if(ismodify)//修改
	{
		$('#detail_mdf_add_title').html('详情 - 修改信息');
		$('#detailAddPartBtn').html('确定');

		var jsDataText = $(obj).parent().prev().text();
		var device = $.parseJSON(jsDataText);

		$('#detail_name').val(device.name);
		$('#detail_dspecific').val(device.specific);
		$('#detail_amount').val(device.amount);
		$('#detail_dunit').val(device.dunit);
		$('#detail_identify').val(device.detailidentify);
		$('#detail_detailnote').val(device.detailnote);



		$('#detailAddPartBtn').unbind();
		$('#detailAddPartBtn').click(function(){

			var name = $('#detail_name').val();
			var specific = $('#detail_dspecific').val();
			var amount = $('#detail_amount').val();
			var dunit = $('#detail_dunit').val();
			var detailidentify = $('#detail_identify').val();
			var detailnote = $('#detail_detailnote').val();
			var detailid = device.id;
			var infoid = infoid;
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

			device['id'] = device.id;
			device['name'] = name;
			device['specific'] = specific;
			device['amount'] = amount;
			device['dunit'] = dunit;
			device['detailnote'] = detailnote;
			device['detailidentify'] = detailidentify;


		common_post2(
					getRootPath() + "/equip/detail/setDetail",
					{
						id:device.id,
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

							var onelineitem = $this.table_detail_html_item(device,detailid,infoid,name,specific,amount,dunit,detailnote);
							trObj.replaceWith(onelineitem);
							//刷新
							//开始加载表格数据
							$this.get_device_data.call($this,$this.cur_sign,TABLE_MAX_LINES,$this.cur_search_page);
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
		$('#detail_mdf_add_title').html('详情 - 新增部件');
		$('#detailAddPartBtn').html('确定');

		$('#detail_name').val('');
		$('#detail_dspecific').val('');
		$('#detail_amount').val('');
		$('#detail_dunit').val('');
		$('#detail_detailnote').val('');
		$('#detail_identify').val('');

		$('#detailAddPartBtn').unbind();
		$('#detailAddPartBtn').click(function(){
			var name = common_trim($('#detail_name').val());
			var dspecific = common_trim($('#detail_dspecific').val());
			var amount = common_trim($('#detail_amount').val());
			var dunit = common_trim($('#detail_dunit').val());
			var detailnote = common_trim($('#detail_detailnote').val());
			var identify = common_trim($('#detail_identify').val());
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
			var reg=/^[0-9]*[1-9][0-9]*$/;
			if(!reg.test(amount)) {
				showMsg('数量必须为正整数！',null);
				return;
			}
			if(parseInt(amount) >2000000000) {
				showMsg('请填写小于2000000000的数字！',null);
				return;
			}

			if(dunit == '')
			{
				showMsg('单位不能为空！',null);
				return;
			}
			bootbox.dialog({ message: '<div class="text-center"><i class="fa fa-spin fa-spinner"></i> 操作中，请稍后...</div>' });
			$.post(
				getRootPath() + "/equip/detail/addDetail",
				{
					infoid:infoid,
					name:name,
					specific:dspecific,
					amount:amount,
					dunit:dunit,
					detailnote:detailnote,
					detailidentify:identify
				},
				function(data) {
					bootbox.hideAll();
					if(data.status) {
						showMsg(data.memo,function(){
						$('#fjxt_detail_mdf_add_form').modal('hide');
					    $this.init_detail('',true);});
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

fjxt.prototype.detail_modify_submit_complete = function(){


}

fjxt.prototype.detail_modify_submit_error = function(){

	showMsg('详情信息修改失败！',null);
}

fjxt.prototype.detail_modify_del = function(obj,tp,sbid){

	if((tp != 1) && (tp != 2)) return;
	if('' == sbid) return;

	/*var sjid = $this.detail_sbid;
	if('' == sjid) return;*/

	if(tp == 1){
		$this.detail_modify_addpart(obj,true,sbid);
	}
	else if( tp == 2){

		var jsDataText = $(obj).parent().prev().text();
		var device = $.parseJSON(jsDataText);

		var sbidData = new Array();
		sbidData.push(device.id);

	  showConfirm("你确定要删除 " + device.name + " 这个设备吗？",
	  function(){

		  common_post2(
				  getRootPath()+"/equip/detail/delDetail",
					{ids:sbidData},
					function(msg){
						showMsg("删除成功！",null);
						var trItem = $(obj).parent().parent().parent().parent();
						trItem.remove();
					},
					$this.detail_delete_complete,
					$this.detail_delete_error);
	  });

	}
}

fjxt.prototype.detail_delete_complete = function(){

	//
}

fjxt.prototype.detail_delete_error = function(){

	showMsg('删除数据失败！',null);
}

fjxt.prototype.table_detail_html_item = function(obj,detailid,infoid,name,specific,amount,dunit,detailnote){

	var control = '<div id="detail_'+ detailid +'" class="table_control_lnk"><div style="display:none">'+ JSON.stringify(obj) +'</div>';
	control +=
	  '<div>';
	if(obj.oneself=="1")
	{
		//control += '<a class="btn gui-btn-modify" onclick="$this.detail_modify_addpart(this,1,\''+ infoid +'\','+detailid+',\''+obj.pname+'\');">修改</a>';
	}
	else if(obj.oneself=="2")
	{
		
	}
	else
	{
		control += '<a class="btn gui-btn-modify" onclick="$this.detail_modify_addpart(this,1,\''+ infoid +'\','+detailid+',\''+obj.pname+'\');">修改</a>';
		control += '<a class="btn gui-btn-del" onclick="$this.detail_modify_del(this,2,\''+ detailid +'\');">删除</a>';
	}
	
	
	
	control +=  '</div>' + '</div>';

	//本身不能删除
	var oneline = '<tr>' +
	  '<td>' + name + '</td>' +
	  '<td>' + isNull(specific) + '</td>' +
	  '<td>' + amount + '</td>' +
	  '<td>' + dunit + '</td>' +
	  '<td>' + detailnote + '</td>' +
	  '<td>' + control + '</td>' +
	  '</tr>';

	return oneline;
}

fjxt.prototype.detailShowMask = function(isShow){

	if(isShow)
	{
		$('.mask_juhua').css('display','block');
	}
	else
	{
		$('.mask_juhua').css('display','none');
	}
}


fjxt.prototype.getIdsByHandleWriteXulie = function(value){

	var arrIndexs = [];
	if(!$this.is_cur_detail_choice_mode_checkbox)
	{
		arrIndexs = parseHandleWriteStr(value);
		if(arrIndexs.length == 0){

			showMsg("手写序列格式有误！",null);
			return [];
		}
	}

	return $this.getIdsByIndexs(arrIndexs);
}


fjxt.prototype.parseDeviceId = function(value){

	value = common_trim(value);
	if(value == '') return '';
	var index = value.indexOf(CHECKBOX_ID_PREFIX);
	if(index == -1) return '';

	return value.substr(CHECKBOX_ID_PREFIX.length);
}

fjxt.prototype.getIdsByIndexs = function(arrIndexs){

	var arrRet = [];
	var trList = $("#table_body_xq").children('tr');
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


fjxt.prototype.init_date_picker_detail = function(){

	init_date_input('detail_onlinetime');
	init_date_input('detail_expiredtime');
	init_date_input('detail_modifytime');
	init_date_input('detail_changetime');
};
/**
 * 对左侧菜单进行增删改操作
 * @param id
 */
fjxt.prototype.devtree_manage = function(id)
{
	if(id==1){
		$this.left_tree_add();//添加
	}if(id==2){
		$('#mdf_tree_gc_input').val("");
		if(!$this.cur_tree_node.id){
			showMsg('最顶级设备不允许修改！',null);
			return false;
		}
		$this.left_tree_update();//修改
	}if(id==3){
		$this.left_tree_del();//删除
	}
}
/**
 * 左侧菜单添加操作
 */
fjxt.prototype.left_tree_add = function(){
	$('#add_tree_gc_input').val($this.cur_tree_name);
	$('#zhsb_addtreenode').modal('show');
    $('#add_tree_jb_btn').unbind();
	$('#add_tree_jb_btn').click(function(){
		var newJbName = common_trim($('#add_tree_jb_input').val());
		var rootid = $this.cur_tree_rootid ? $this.cur_tree_rootid : 0;
		var pid = $this.cur_tree_id ? $this.cur_tree_id : 0;
		var dkindid = $this.cur_tree_node.dkindid ? $this.cur_tree_node.dkindid : 0;
		if(newJbName == ''){
			showMsg('名称不能为空！',null);
			return;
		}
		common_post(
				ROOTPATH + "equip/equipRest/addEquip",
				{pid:pid,name:newJbName,rootid:rootid,dkindid:dkindid},
				function(msg){
					var data = $.parseJSON(msg);
					if(data.statusCode == '1'){
						showMsg('设备添加成功！',null);
						$("#add_tree_jb_input").val('');
						$("#tree").treeview("addNode", [$this.cur_tree_node.nodeId, { node: data.Msg }]);
						//$('#tree').treeview("addNode", [$this.cur_tree_node.id, { node: { text: "新加的菜单"} }])
						$('#tree').treeview('expandNode',[$this.cur_tree_node.nodeId]);
					}else if(data.statusCode == '0'){
						showMsg(data.Msg,null);
						$("#add_tree_jb_input").val('');
					}
				},
				function(){},
				function(){showMsg('添加设备失败！',null);});
	});
}
/**
 * 左侧菜单修改操作
 */
fjxt.prototype.left_tree_update = function(){
	$('#zhsb_mdftreenode').modal('show');
    $('#mdf_tree_gc_btn').unbind();
    $('#mdf_tree_gc_btn').click(function(){
    	var id = $this.cur_tree_id;
    	var name = common_trim($('#mdf_tree_gc_input').val());
    	common_post(
			ROOTPATH + "equip/equipRest/updateEquip",
			{id:id,name:name},
			function(msg){
				var data = $.parseJSON(msg);
				if(data.statusCode == 1){
					$this.init();
					$('#zhsb_mdftreenode').modal('hide');
				}else if(data.statusCode == 0){
					showMsg(data.Msg,null);
					$("#mdf_tree_gc_input").val('');
				}
			},
			function(){},
			function(){
                showMsg('修改名称失败！',null);
			}
		);
    });
}
/**
 * 左侧菜单删除操作
 */
fjxt.prototype.left_tree_del = function()
{
	var thisNode = $this.cur_tree_node;
	console.log(thisNode);
	if(thisNode.nodes){
		showMsg('请先删除下级菜单！',null);
		return false;
	}else{
		showConfirm("你确定删除此设备及其下的设备？",function(){
			var id = $this.cur_tree_id;
    		common_post(
    				ROOTPATH + "equip/equipRest/deleteEquip",
        			{id:id},
        			function(msg){
        				var data = $.parseJSON(msg);
        				if(data.statusCode == 1){
    						showMsg(data.Msg,null);
    						$this.init();
    					}else if(data.statusCode == 0){
    						showMsg(data.Msg,null);
    					}
        			},
        			function(){},
        			function(){showMsg('删除菜单失败！',null);});
			});
	}
}

fjxt.prototype.getClickPos = function(e) {
    e = e || window.event;
    var imgId ='#'+ $(e.target).attr('id');
    var currentWidth = $(imgId).width();
    var currentHeight = $(imgId).height();
    var offsetX = e.pageX - $(imgId).offset().left + 17;
    var offsetY = e.pageY - $(imgId).offset().top + 4;
    var x = offsetX-22;
    var y = offsetY-8;
    $('.areaMaker').html('<div class="ball" style="top:'+offsetY+';left:'+offsetX+'"></div>');
    // console.log('X : ' + x + '\n' + 'Y : ' + y);
    $("#spotlocate").val(x+","+y);
}

fjxt.prototype.point = function() {
	// var value = $("#spotlocate").val();
	if(value !== ''){
        var newSpotlocate = value.split(",");
        var top  = parseInt(newSpotlocate[1]) + 8;
        var left = parseInt(newSpotlocate[0]) + 22;
        /*console.log(newSpotlocate);
        console.log(top);
        console.log(left);*/
        $('.areaMaker').html('<div class="ball" style="top:'+top+';left:'+left+'"></div>');
	}
    // $('#fjxt_point_equipmentDiagram').modal('show');
}
/**
 * 根据每页数分页
 * @param dom
 */
fjxt.prototype.changePaging = function(dom)
{
	var value = $(dom).prev().prop("value");
	if(isNull(value)=="")
	{
		value = TABLE_MAX_LINES;
	}
	$this.cur_search_page = 1;
	$this.search_rows = value;
	$this.get_device_data($this.cur_sign,$this.search_rows,1);
	return false;
};

