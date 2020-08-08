$this = null;

function yhgl(){
	
	this.init();
}

yhgl.prototype.init = function(){
	
	$this = this;
	
//	$this.ShowMask('mask_juhua_content',true);
//	$this.updatePage('','');
	$this.init_ctl();	
}

$('#add_mdf_user_phone').on('change',function(){
	phone = $('#add_mdf_user_phone').val()
	if(!(/^1[34578]\d{9}$/.test(phone))){ 
		$('#add_mdf_user_phone_warn').html("请填写正确的手机号")
        return false; 
    } else {
    	$('#add_mdf_user_phone_warn').html("")
    }
})

yhgl.prototype.init_ctl = function(){
	
	$('#add_group_btn').unbind();
	$('#add_group_btn').click(function(){
		
		$this.add_or_mdf_form_init(false);
		$('#add_group_form').modal('show');
	});
	
	$('#addMdfUserSubmitBtn').unbind();
	$('#addMdfUserSubmitBtn').click(function(){
		
		$this.add_group_submit();
	});
	
	$('#user_name').val('');
	
	$('#user_role').empty();
	$.ajax({
		async:false,
		url:getRootPath()+"/sm/role/listRole",
		success:function(data) {
			$(data).each(function(){
				var option = '<option value="'+this.id+'">'+this.rolename+'</option>';
				$('#user_role').append(option);
			})
			$('#user_role').val('');
		}
	})
	
	$this.query_group();
}

yhgl.prototype.add_or_mdf_form_init = function(isMdf){
	
	$('#add_mdf_login_user').val('');
	$('#add_mdf_login_pass').val('');
	$('#add_mdf_user_name').val('');
	$('#add_mdf_user_phone').val('');
	$('#add_mdf_user_phone_warn').html("");
	$('#add_mdf_user_email').val('');
	$('#add_mdf_login_pass').removeProp('readonly');
	
	$('#add_mdf_user_sex').empty();
	var option = '<option value="男">男</option>';
	$('#add_mdf_user_sex').append(option);
	option = '<option value="女">女</option>';
	$('#add_mdf_user_sex').append(option);

	
	
	$('#allow_pc').prop('checked','checked');
	$('#allow_phone').prop('checked','checked');
	
	if(isMdf){
		
		$('#add_mdf_title').html('修改用户信息');
		
	}
	else
	{
		$('#allow_pc').removeAttr("disabled","disabled");
		$('#add_mdf_title').html('添加用户');
		
		$("#device-kinds").show();
		$("#xjsb_show").show();
		$("#add_mdf_user_group").prop("disabled","");
		//默认全选
		$("#allow_sb1").prop("checked","checked");
		$("#allow_sb2").prop("checked","checked");
		$("#allow_sb3").prop("checked","checked");
		
		$this.get_group_info('');
		$this.get_role_info('');
		$('#addMdfUserSubmitBtn').unbind();
		$('#addMdfUserSubmitBtn').click(function(){
			
			$this.add_new_user();
		});
		
	}
}

yhgl.prototype.get_group_info = function(value){
	$.get(
		getRootPath() + "/sm/group/listAllGroupJson",
		function(data) {
			$('#add_mdf_user_group').html('');
			$(data).each(function(){
				option = '<option value="'+ this.id +'">'+this.name+'</option>';
				$('#add_mdf_user_group').append(option);
			})
			if(value != '' && value != undefined && value != null){
				$('#add_mdf_user_group').val(value);
			}
		}
	)
}

yhgl.prototype.get_role_info = function(value){
	$.get(
			getRootPath() + "/sm/role/listRole",
			function(data) {
				$('#add_mdf_user_role').html('');
				$(data).each(function(){
					option = '<option value="'+ this.id +'">'+this.rolename+'</option>';
					$('#add_mdf_user_role').append(option);
				})
				if(value != '' && value != undefined && value != null){
					$('#add_mdf_user_role').val(value);
				}
			}
	)
}

yhgl.prototype.add_new_user = function(){
	
	var name = common_trim($('#add_mdf_login_user').val());
	var pass = $('#add_mdf_login_pass').val();
	var pgid = $('#add_mdf_user_group').val();
	var yhxm = common_trim($('#add_mdf_user_name').val());
	var yhdh = common_trim($('#add_mdf_user_phone').val());
	var sex = $('#add_mdf_user_sex').val();
	var roleid = $('#add_mdf_user_role').val();
	var phoneAuth = false;
	var webAuth = false;

	if($('#allow_pc').is(':checked')){
		webAuth = true;
	}
	else{
		webAuth = false;
	}
	
	if($('#allow_phone').is(':checked')){
		phoneAuth = true;
	}
	else{
		phoneAuth = false;
	}
	
	if(name == ''){
		showMsg('登录账号不能为空!',null);
		return;
	}
	if(yhdh == ''){
		showMsg('请填写用户电话!',null);
		return;
	}
	if(!(/^1[34578]\d{9}$/.test(yhdh))){ 
		showMsg('请填写正确的手机号!',null);
        return; 
    }
	
	if(pass == ''){
		showMsg('登录密码不能为空!',null);
		return;
	}
	
	if(pgid == null){
		showMsg('请选择用户所属分组！',null);
		return;
	}
	
	if(yhxm == ''){
		showMsg('用户姓名不能为空！',null);
		return;
	}
	
	if(sex == null){
		showMsg('请选择用户性别！',null);
		return;
	}
	var email = $('#add_mdf_user_email').val();
	//判断是否为空
	if(!$this.is_checked_null())
	{
		showMsg("请至少选择一个巡检设备！",null);
		return;
	}
	
	var fixtype_chk_value =[];
	$('input[name="fixtype"]:checked').each(function(){
		fixtype_chk_value.push($(this).val());
	}); 
	var fixtype = fixtype_chk_value.join(',');
	
	var userinfo = {
			groupid:pgid,
			loginaccount:name,
			loginpasswd:pass,
			name:yhxm,
			phone:yhdh,
			sex:sex,
			roleid:roleid,
			phoneauth:phoneAuth,
			webauth:webAuth,
			email:email,
			fixtype:fixtype
	}
	
	$.post(
		getRootPath()+"/sm/userinfo/addUser",
		userinfo,
		function(data) {
			if(data.status) {
				$('#add_group_form').modal('hide');
				showMsg('添加新用户成功！',function()
				{
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
}
/**
 * 判断寻设备是否为空
 */
yhgl.prototype.is_checked_null = function()
{
	var fixtype_chk_value =[];
	$('input[name="fixtype"]:checked').each(function(){
		fixtype_chk_value.push($(this).val());
	}); 
	var fixtype = fixtype_chk_value.join(',');
	return fixtype == ''?false:true;
}

yhgl.prototype.add_group_submit = function(){
	
	var group_name = common_trim($('#add_group_name').val());
	var group_desc = common_trim($('#add_group_desc').val());
	var member_type = $('#group_type').val();
	
	if(group_name == ''){
		
		showMsg('分组名称不能为空！',null);
		return;
	}
	
	if(member_type == null){
		
		showMsg('人员类型不能为空！',null);
		return;
	}
	
	common_post(
			"../user",
			{action:"addusergroup",name:group_name,desc:group_desc,role:member_type},
			function(msg){
				
				showMsg('添加用户组成功！',function(){$('#add_group_form').modal('hide');});
			},
			function(){},
			function(){showMsg('添加用户组失败！',null);}); 

}

yhgl.prototype.query_group = function(){
	
	$('#query_btn_submit').unbind();
	$('#query_btn_submit').click(function(){
		var user_name = common_trim($('#user_name').val());
		var user_role = common_trim($('#user_role').val());
		window.location.href= getRootPath() + "/sm/userinfo/searchUser?name="+user_name+"&rolename="+user_role;
	});
}

yhgl.prototype.updatePage = function(name,role){
	
	common_post(
			"../user",
			{action:"getuser",name:name,role:role},
			$this.get_data_success,
			$this.get_data_complete,
			$this.get_data_error);
}

yhgl.prototype.get_data_success = function(msg){

	$this.update_table(msg);
}

yhgl.prototype.get_data_complete = function(){
	
	$this.ShowMask('mask_juhua_content',false);
}

yhgl.prototype.get_data_error = function(){
	
	$this.ShowMask('mask_juhua_content',false);
	showMsg('获取数据失败！',null);
}

yhgl.prototype.update_table = function(msg){
	
	 if(msg == ''){
			
			//console.log('ewxj.update_table msg == "".');
			return;
	 }
	 
	 var jsonData = $.parseJSON(msg);
	 if($("#table_body") == null) return;	

	 var users =  jsonData['users'];
	 $("#table_body").children().remove();
 
	if(users.length == 0) return;
	 
	//update tables	
	for(var i = 0; i < users.length; i ++)
	{
		var user = users[i];
		var id = user['id'];
		var username = user['username'];
		var name = user['name'];
		var sex = user['sex'];
		var phone = user['phone'];
		var sjdl = user['sjdl'];
		var dndl = user['dndl'];
		var grole = user['grole'];
		var email = user['email'];
		var type = user['type'];
		var login_quanxian = '';
		
		if(dndl == '1') login_quanxian = '电脑端';
		if(sjdl == '1'){
			
			if(login_quanxian.length > 0) login_quanxian += '/';
			
			login_quanxian += '手机端';
		} 

		var	cur_line = i + 1;
		
		var oneline = $this.table_fzgl_html_item(user,id,cur_line,name,sex,phone,grole,email,login_quanxian,type);
		alert()
		$("#table_body").append(oneline);
	}
}


yhgl.prototype.table_fzgl_html_item = function(user,id,cur_line,name,sex,phone,grole,email,login_quanxian,type){
	var control = '<div class="table_control_lnk"><div style="display:none">'+ JSON.stringify(user) +'</div>' +
	  '<div style="white-space: nowrap;">' + 
	  '<a onclick="$this.yhgl_modify_del(this,1);">修改</a>' +
	  '<a onclick="$this.yhgl_modify_del(this,2);">重置密码</a>' +
	  '<a style="color:red;" onclick="$this.yhgl_modify_del(this,3);">删除</a>'+
	  '<a onclick="$this.yhgl_modify_image('+id+');">上传头像</a>' +
	  '</div>' + '</div>';

	var oneline = '<tr>' +
	  '<td>' + cur_line + '</td>' + 
	  '<td style="display:none;">' + id +'</td>' +
	  '<td>' + name + '</td>' + 
	  '<td>' + sex + '</td>' + 
	  '<td>' + phone + '</td>' + 
	  '<td>' + grole + '</td>' + 
	  '<td>' + grole + '</td>' + 
	  '<td>' + email + '</td>' + 
	  '<td>' + control + '</td>' + 
	  '</tr>';
 
	return oneline;
}


yhgl.prototype.yhgl_modify_del = function(objThis,type){
	
	var trNode = objThis.parentNode.parentNode.parentNode.parentNode;
	var textData = objThis.parentNode.parentNode.firstChild.innerText;
	
	if(trNode == undefined) return;
	
	if(type == 1){
		
		$this.modify_base_info(textData,trNode);
	}
	else if(type == 2){
		
		$this.reset_password(textData,trNode);
	}
	else if(type == 3){
		
		$this.delitem(textData,trNode);
	}
	
}


var resetPassword = function(id){
	
	$('#reset_password').val('');
	$('#re_reset_password').val('');
	
	$('#resetPassBtn').unbind();
	$('#resetPassBtn').click(function(){
		
		var pass = common_trim($('#reset_password').val());
		var repass = common_trim($('#re_reset_password').val());
		
		if(pass == ''){
			
			showMsg('密码不能为空字符串！',null);
			return;
		}
		
		if(pass != repass){
			
			showMsg('前后输入密码不一致！',null);
			return;
		}
		
		$.post(
			getRootPath() + "/sm/userinfo/updateUser",
			{
				id:id,
				loginpasswd:pass
			},
			function(data) {
				if(data.status) {
					showMsg('重置密码成功！',function(){
						window.location.reload();
					})
				} else {
					if(data.memo == null) {
						showMsg('重置密码失败！',null);
					} else {
						showMsg(data.memo,null);
					}
				}
			}
		)
	});
	
	$('#mdf_pass_form').modal('show');
}

var deleteUser = function(id,name){
	showConfirm("你确定要删除 " + name + " 这个用户吗？",function(){
		$.get(
			getRootPath() + "/sm/userinfo/deleteUser/"+id,
			function(data) {
				if(data.status) {
					showMsg('删除数据成功！',function(){
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
}
/**
 * 上传图片
 * @param textData
 * @param trNode
 */
var yhgl_modify_image = function(id)
{
	$("#file").val('');
	var large = $("#large");  
	large.hide();  
	var dataURL="";
	$("#file").change(function() 
	{
		var $file = $(this);
		var fileObj = $file[0];
		var windowURL = window.URL || window.webkitURL;
		var $img = $("#img");
		 
		if(fileObj && fileObj.files && fileObj.files[0])
		{
			dataURL = windowURL.createObjectURL(fileObj.files[0]);
			
			$img.attr('src',dataURL);
			$img.attr('width',300);
		}
		else
		{
			dataURL = $file.val();
		}
		large.show();
	});
	$('#add_image_form').modal('show');
	$('#UploadPic').unbind();
	$('#UploadPic').click(function()
	{
		if(dataURL=="")
		{
			showMsg('请选择头像图片!',null);
		}
		else
		{
			  $("#sys_id").val(id);
			  var formData = new FormData($("#formUpload")[0]);
			  //var formData = $("#formUpload");//必
              $.ajax({
                  url: getRootPath()+'/sm/userinfo/upload',
                  type: "POST",
                  data: formData,
                  contentType: false, //必须false才会避开jQuery对 formdata 的默认处理 
                  processData: false, //必须false才会自动加上正确的Content-Type
                  success: function (data)
                  {
                	 if(data['success'])
            		 {
                		 showMsg('上传成功！',null);
            		 }
                	 else
            		 {
                		 showMsg("上传失败，请重新上传！",null);
            		 }
                	 $('#add_image_form').modal('hide');
                  }
              });
						
		}
		
		
	});
};
var updateUser = function(dom,id) {
	$this.add_or_mdf_form_init(true);
	//获取要修改的用户信息
	$.get(
		getRootPath() + "/sm/userinfo/getUser/"+id,
		function(data) {
			var id = data.id;
			var loginaccount = data.loginaccount;
			var name = data.name;
			var sex = data.sex;
			var groupid = data.groupid;
			var roleid = data.roleid;
			var phone = data.phone;
			var webauth =  data.webauth;
			var phoneauth =  data.phoneauth;
			var email =  data.email;
			var fixtype =  data.fixtype;
			$('#add_mdf_login_user').val(loginaccount);
			$('#add_mdf_login_pass').prop('readonly','readonly');
			$('#add_mdf_user_name').val(name);
			$('#add_mdf_user_sex').val(sex);
			$('#add_mdf_user_group').val(groupid);
			$('#add_mdf_user_roleid').val(roleid);
			$('#add_mdf_user_phone').val(phone);
			$('#add_mdf_user_email').val(email);
			
			$this.get_group_info(groupid);
			$this.get_role_info(roleid);
			
			$('#allow_sb1').removeProp('checked');
			$('#allow_sb2').removeProp('checked');
			$('#allow_sb3').removeProp('checked');
			
		
			var xjsb = "";
			if(isNull(fixtype)!="")
			{
				xjsb = fixtype.split(",");
			}
			
			if(loginaccount=="admin")
			{
				$("#device-kinds").hide();
				//隐藏
				$("#xjsb_show").hide();
				
				$("#add_mdf_user_group").prop("disabled",true);
			}
			else
			{
				$("#device-kinds").show();
				
				$("#xjsb_show").show();
				
				$("#add_mdf_user_group").prop("disabled","");
			}
			
			$.each(xjsb,function(index,item)
					{
				$('#allow_sb'+item).prop('checked','checked');
			});
			
			if(webauth){
				$('#allow_pc').prop('checked','checked');
				if(id == 1){
					$('#allow_pc').attr("disabled","disabled")
				}else{
					$('#allow_pc').removeAttr("disabled","disabled");
				}
				
			}
			else{
				$('#allow_pc').removeProp('checked');
				$('#allow_pc').removeAttr("disabled","disabled");
			}
			
			if(phoneauth){
				$('#allow_phone').prop('checked','checked');
			}
			else{
				$('#allow_phone').removeProp('checked');
			}
			
		}
	)
	
	
	

	$('#add_mdf_title').html('修改用户信息');
	$('#addMdfUserSubmitBtn').unbind();
	$('#addMdfUserSubmitBtn').click(function(){
		
		loginaccount = common_trim($('#add_mdf_login_user').val());
		groupid = $('#add_mdf_user_group').val();
		roleid = $('#add_mdf_user_role').val();
		name = common_trim($('#add_mdf_user_name').val());
		phone = common_trim($('#add_mdf_user_phone').val());
		sex = $('#add_mdf_user_sex').val();
		email = $('#add_mdf_user_email').val();
		
		if($('#allow_pc').is(':checked')){
			webauth = true;
		}
		else{
			webauth = false;
		}
		
		if($('#allow_phone').is(':checked')){
			phoneauth = true;
		}
		else{
			phoneauth = false;
		}
		
		if(loginaccount == ''){
			showMsg('登录账号不能为空!',null);
			return;
		}

		if(groupid == null){
			showMsg('请选择用户所属分组！',null);
			return;
		}
		
		if(roleid == null){
			showMsg('请选择用户所属角色！',null);
			return;
		}
		
		if(name == ''){
			showMsg('用户姓名不能为空！',null);
			return;
		}
		
		if(phone == ''){
			showMsg('请填写用户电话!',null);
			return;
		}
		if(!(/^1[34578]\d{9}$/.test(phone))){ 
			$('#add_mdf_user_phone_warn').html("请填写正确的手机号")
	        return false; 
	    }
		
		if(sex == null){
			showMsg('请选择用户性别！',null);
			return;
		}
		
		var fixtype_chk_value =[];
		$('input[name="fixtype"]:checked').each(function(){
			fixtype_chk_value.push($(this).val());
		}); 
		var fixtype = fixtype_chk_value.join(',');
		
		//判断是否为空
		if(!$this.is_checked_null())
		{
			showMsg("请至少选择一个巡检设备！",null);
			return;
		}
		
		var userinfo = {
			fixtype:fixtype,
			id:id,
			email:email,
			loginaccount:loginaccount,
			groupid:groupid,
			roleid:roleid,
			name:name,
			phone:phone,
			sex:sex,
			phoneauth:phoneauth,
			webauth:webauth
		}
		
		$.post(
			getRootPath() + "/sm/userinfo/updateUser",
			userinfo,
			function(data) {
				if(data.status) {
					$('#add_group_form').modal('hide');
					showMsg('修改用户信息成功！',function()
					{
						window.location.reload();
					});		
				} else {
					if(data.memo == null) {
						showMsg('修改用户信息失败！',null);
					} else {
						showMsg(data.memo,null);
					}
				}
			}
		)
	});
	
	$('#add_group_form').modal('show');
}

yhgl.prototype.ShowMask = function(cid,isShow){
	
	if(isShow)
	{
		$('.' + cid).css('display','block');
	}
	else
	{
		$('.' + cid).css('display','none');
	}
}
