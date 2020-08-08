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
			show_err_msg('机器码不能为空！');	
			$('#email').focus();
		}
		else if($('#password').val() == '')
		{
			show_err_msg('序列号不能为空！');
			$('#password').focus();
		}
		else
		{
			$.ajax({  
				url : "xunjian/licence",  
				type : 'post',  
				data : {action:"setlicence", licence:$('#password').val()},
				dataType : 'text',
				success: function(msg)
				{
					if (msg == 'ok') window.location.href = 'login.html';
					else show_err_msg('无效的序列号！');
				},
				complete: function(){},
				error: function() {show_err_msg('未知错误，请联系系统管理员！');}
				});	
		}
	});
});