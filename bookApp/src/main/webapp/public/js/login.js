// JavaScript Document
//支持Enter键登录
document.onkeydown = function(e){
	if($(".bac").length==0)
	{
		if(!e) e = window.event;
		if((e.keyCode || e.which) == 13){
			var obtnLogin=document.getElementById("submit_btn")
			obtnLogin.focus();
		}
	}
}

$(function()
{
	//提交表单
	$('#submit_btn').click(function()
	{
		show_loading();
		if($('#email').val() == '')
		{
			show_err_msg('用户名不能为空！');	
			$('#email').focus();
		}
		else if($('#password').val() == '')
		{
			show_err_msg('密码不能为空！');
			$('#password').focus();
		}
		else
		{
			$.ajax({  
				url : ROOTPATH+"/sm/userinfo/login",  
				type : 'post',  
				data : {action:"login", loginaccount:$('#email').val(), loginpasswd:$('#password').val(),webauth:'1'},
				dataType : 'text',
				success: function(data)
				{
					var jso = $.parseJSON(data);
					var statusCode = jso['statusCode'];
					if (statusCode == "1") {
						window.location.href = encodeURI(ROOTPATH+'index.jsp');
					}else {
						show_err_msg(jso['Msg']);
					}
				},
				complete: function(){},
				error: function() {show_err_msg('未知错误，请联系系统管理员！');}
			});	
		}
	});
});