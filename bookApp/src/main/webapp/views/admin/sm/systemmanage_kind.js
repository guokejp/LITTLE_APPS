$this = null;

function kind(){
	
	this.init();
}

kind.prototype.init = function(){
	
	$this = this;
	$this.init_ctl();
	$this.get_data();
}

kind.prototype.init_ctl = function(){
	
	$('#add_kind_btn').unbind();
	$('#add_kind_btn').click(function(){
		
		$('#add_kind_name').val('');
		$('#add_kind_desc').val('');
		$('#add_mdf_title').html('新增设备种类');
		$('#add_kind_form').modal('show');
	});
	
	$('#addKindSubmitBtn').unbind();
	$('#addKindSubmitBtn').click(function(){
		
		$this.add_kind_submit();
	});
	
	$('#kind_type').empty();
	$('#kind_type').val('');
	
}

kind.prototype.add_kind_submit = function(){
	
	var kind_name = common_trim($('#add_kind_name').val());
	var kind_desc = common_trim($('#add_kind_desc').val());
	
	if(kind_name == ''){
		
		showMsg('种类名称不能为空！',null);
		return;
	}
	
	$.post(
		getRootPath()+ "/sm/deviceKindRest/add",
		{name:kind_name,remark:kind_desc},
		function(data){
			if(data.success)
			{
				showMsg(data.msg,function(){$('#add_kind_form').modal('hide');});
				$this.get_data();
			} 
			else 
			{
				showMsg(data.msg,function(){$('#add_kind_form').modal('hide');});
			}
		}
	)
	

}

$('#query_btn_submit').on('click', function(){
	$this.get_data();
})
//查询数据
kind.prototype.get_data = function()
{
	var name = common_trim($('#fenzu_manage').val());
	common_post2(
			getRootPath()+"/sm/deviceKindRest/getPageBy",
			{name:name},
			function(msg){
				
				$this.get_data_success(msg);
			},
			function(){},
			function(){showMsg('获取数据失败！',null);}); 
	
}
//查询成功
kind.prototype.get_data_success = function(msg){

	$this.update_table(msg);
}

kind.prototype.get_data_complete = function(){
	
	$this.ShowMask('mask_juhua_content',false);
}

kind.prototype.get_data_error = function(){
	
	$this.ShowMask('mask_juhua_content',false);
	showMsg('获取数据失败！',null);
}

kind.prototype.update_table = function(msg){
	
	 if(msg == ''){
			
			//console.log('ewxj.update_table msg == "".');
			return;
	 }
	 
	 var jsonData = msg;
	 if($("#table_body") == null) return;	

	 var kinds =  jsonData['list'];
	 $("#table_body").children().remove();
 
	if(kinds.length == 0) 
	{
		$("#table_title").html("设备种类合计0种");
		$("#table_body").append("<tr><td colspan='3'>暂无数据！</td></tr>");
		return;
	}
	 
	//update tables	
	for(var i = 0; i < kinds.length; i ++)
	{
		var kind = kinds[i];


		var	cur_line = i + 1;
		
		var oneline = $this.table_kind_html_item(kind,cur_line);
		$("#table_body").append(oneline);
	}
	$("#table_title").html("设备种类合计"+kinds.length+"种");
}


kind.prototype.table_kind_html_item = function(kind,cur_line){
	
	var control = '<div class="table_control_lnk"><div style="display:none">'+ JSON.stringify(kind) +'</div>' +
	  '<div style="white-space: nowrap;">' + 
	  '<a class="btn gui-btn-modify" onclick="$this.kind_modify_del(this,1);">修改</a>' +
	  '<a class="btn gui-btn-del" onclick="$this.kind_modify_del(this,2);">删除</a>'+
	  '</div>' + '</div>';
	
	var oneline = '<tr>' +
	  '<td>' + kind.name + '</td>' + 
	  '<td>' + kind.remark + '</td>' + 
	  '<td>' + control + '</td>' + 
	  '</tr>';
 
	return oneline;
}
/**
 * 选择修改还是删除
 */
kind.prototype.kind_modify_del = function(obj,type)
{
	var data = $.parseJSON($(obj).parent().prev().text());
	if(type==1) updateItem(data);
	if(type==2) deleteItem(data.id,data.name);
}

/**
 * 删除
 */
var deleteItem = function(id,name){

	showConfirm("你确定要删除 " + name + " 这个种类吗？",function(){
	common_post(
			getRootPath() + "/sm/deviceKindRest/del/"+id,
			{},
			function(data) {
				var data = $.parseJSON(data);
				if(data.success)
				{
					showMsg(data.msg,function(){$('#add_kind_form').modal('hide');});
					$this.get_data();
				} 
				else 
				{
					showMsg(data.msg,function(){$('#add_kind_form').modal('hide');});
				}
			}
		)
	})
}
/**
 * 修改
 */
var updateItem = function(data){


	$('#add_mdf_title').html('修改设备种类信息');
	$('#add_kind_name').val(data.name);
	$('#add_kind_desc').val(data.remark);
	
	
	$('#addKindSubmitBtn').unbind();
	$('#addKindSubmitBtn').click(function(){
		
		name = common_trim($('#add_kind_name').val());
		description = common_trim($('#add_kind_desc').val());
	
		if(name == ''){
			showMsg('设备种类不能为空！',null);
			return;
		}
		$.post(
			getRootPath()+ "/sm/deviceKindRest/set",
			{
				id:data.id,
				name:name,
				remark:description
			},
			function(data)
			{
				if(data.success)
				{
					showMsg(data.msg,function(){$('#add_kind_form').modal('hide');});
					$this.get_data();
				} 
				else 
				{
					showMsg(data.msg,function(){$('#add_kind_form').modal('hide');});
				}
			}
		)
	});
	
	$('#add_kind_form').modal('show');
}
/**
 * 遮罩是否
 * @param cid
 * @param isShow
 */
kind.prototype.ShowMask = function(cid,isShow){
	
	if(isShow)
	{
		$('.' + cid).css('display','block');
	}
	else
	{
		$('.' + cid).css('display','none');
	}
}
