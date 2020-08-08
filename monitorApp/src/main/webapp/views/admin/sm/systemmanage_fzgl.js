$this = null;

function fzgl(){
	
	this.init();
}

fzgl.prototype.init = function(){
	
	$this = this;
	
//	$this.ShowMask('mask_juhua_content',true);
//	$this.updatePage('');
	$this.init_ctl();	
}

fzgl.prototype.init_ctl = function(){
	
	$('#add_group_btn').unbind();
	$('#add_group_btn').click(function(){
		
		$('#add_group_name').val('');
		$('#add_group_desc').val('');
		$('#add_mdf_title').html('添加分组');
		$('#add_group_form').modal('show');
	});
	
	$('#addGroupSubmitBtn').unbind();
	$('#addGroupSubmitBtn').click(function(){
		
		$this.add_group_submit();
	});
	
	$('#group_type').empty();
	$('#group_type').val('');
	
	$.ajax({
		async:false,
		url:getRootPath()+"/sm/role/listRole",
		success:function(data) {
			$(data).each(function(){
				var option = '<option value="'+this.id+'">'+this.rolename+'</option>';
				$('#group_type').append(option);
			});
		}
	})
	
}

fzgl.prototype.add_group_submit = function(){
	var group_name = common_trim($('#add_group_name').val());
	var group_manase = common_trim($('#add_group_manase').val());
	var group_desc = common_trim($('#add_group_desc').val());
	var member_type = $('#group_type').val();
	
	if(group_name == ''){
		showMsg('分组名称不能为空！',null);
		return;
	}

	$.post(
		getRootPath() + "/sm/group/addGroup",
		{name:group_name,ismana:group_manase,description:group_desc,roleid:member_type},
		function(data){
			if(data.status) {
				showMsg('添加用户组成功！',function(){$('#add_group_form').modal('hide');});
				window.location.reload();
			} else {
				if (data.memo == null) {
					showMsg('抱歉，出现了一个未知的技术错误，请稍后重试',function(){$('#add_group_form').modal('hide');});
				} else {
					showMsg(data.memo,function(){$('#add_group_form').modal('hide');});
				}
			}
		}
	)
	

}

$('#query_btn_submit').on('click', function(){
		var fenzu_manage = common_trim($('#fenzu_manage').val());
		if(fenzu_manage == ''){
			showMsg('搜索内容不能为空！',null);
			return;
		}
		window.location.href = getRootPath() + "/sm/group/searchGroup?name="+fenzu_manage;
})


fzgl.prototype.get_data_success = function(msg){
	$this.update_table(msg);
}

fzgl.prototype.get_data_complete = function(){
	
	$this.ShowMask('mask_juhua_content',false);
}

fzgl.prototype.get_data_error = function(){
	$this.ShowMask('mask_juhua_content',false);
	showMsg('获取数据失败！',null);
}

fzgl.prototype.update_table = function(msg){
	
	 if(msg == ''){
			//console.log('ewxj.update_table msg == "".');
			return;
	 }
	 
	 var jsonData = $.parseJSON(msg);
	 if($("#table_body") == null) return;	

	 var users =  jsonData['users'];
	 $("#table_body").children().remove();
 
	if(users.length == 0) {
        return;
    }
	 
	//update tables	
	for(var i = 0; i < users.length; i ++)
	{
		var user = users[i];
		var groupname = user['groupname'];
		var groupdesc = user['groupdesc'];

		var	cur_line = i + 1;
		
		var oneline = $this.table_fzgl_html_item(user,cur_line,groupname,groupdesc);
		$("#table_body").append(oneline);
	}
}


fzgl.prototype.table_fzgl_html_item = function(user,cur_line,groupname,groupdesc){
	
	var control = '<div class="table_control_lnk"><div style="display:none">'+ JSON.stringify(user) +'</div>' +
	  '<div style="white-space: nowrap;">' + 
	  '<a onclick="$this.fzgl_modify_del(this,1);">修改</a>' +
	  '<a style="color:red;" onclick="$this.fzgl_modify_del(this,2);">删除</a>'+
	  '</div>' + '</div>';

	var oneline = '<tr>' +
	  '<td>' + cur_line + '</td>' + 
	  '<td>' + groupname + '</td>' + 
	  '<td>' + groupdesc + '</td>' + 
	  '<td>' + control + '</td>' + 
	  '</tr>';
 
	return oneline;
}


var deleteItem = function(id,name){

	showConfirm("你确定要删除 " + name + " 这个分组吗？",function(){
		$.get(
			getRootPath() + "/sm/group/deleteGroup/"+id,
			function(data) {
				if(data.status) {
					showMsg(data.Msg,function(){
						window.location.reload();
					});
				} else {
					if (data.Msg == null) {
						showMsg(data.Msg,null);
					} else {
						showMsg(data.Msg,null);
					}
				}
			}
		)
	})
}

var updateItem = function(id){

	$.get(
		getRootPath() + "/sm/group/getGroup/" + id,
		function(data) {
			$('#add_mdf_title').html('修改分组信息');
			$('#add_group_name').val(data.name);
			$('#add_group_desc').val(data.description);
			$('#group_type').val(data.roleid);
		}
	)
	
	$('#addGroupSubmitBtn').unbind();
	$('#addGroupSubmitBtn').click(function(){
		
		name = common_trim($('#add_group_name').val());
		description = common_trim($('#add_group_desc').val());
		roleid = $('#group_type').val();
	
		if(name == ''){
			showMsg('组名不能为空！',null);
			return;
		}
		$.post(
			getRootPath() + "/sm/group/updateGroup",
			{
				id:id,
				name:name,
				description:description,
				roleid:roleid
			},
			function(data) {
				if (data.status) {
					showMsg('修改分组信息成功！',function(){
						$('#add_group_form').modal('hide');
						window.location.reload();
					});
				} else {
					if (data.memo == null) {
						showMsg('抱歉，出现了一个未知的技术错误，请稍后重试',null);
					} else {
						showMsg(data.memo,null);
					}
				}
			}
		)
	});
	
	$('#add_group_form').modal('show');
}

fzgl.prototype.ShowMask = function(cid,isShow){
	
	if(isShow)
	{
		$('.' + cid).css('display','block');
	}
	else
	{
		$('.' + cid).css('display','none');
	}
}
