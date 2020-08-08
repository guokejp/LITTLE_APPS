jQuery.extend({
	//checkbox或者radio表单项样式组件, type: 'checkbox' 指定checkbox样式, 'radio' 指定radio样式
	checkradio:function(cls,type){
		var bordersize = 3;
		var pw = $(cls).width();
		var ph = $(cls).height();
		var cw = (pw-10);
		var ch = (ph-10);
		var ptop = (ph+bordersize*2)/2;
		var pleft = (pw+bordersize*2)/2;
		var ctop = ch/2;
		var cleft = cw/2
	
		$.each(document.styleSheets,function(index,item){
			if(item['rules']){
				$.each(item['rules'],function(i,rule){
					if(rule['selectorText']==cls){
						if(!type || type=='radio'){
							document.styleSheets[index].insertRule(cls+":before{content:''; display:block; position:absolute; width:"+pw+"px; height:"+ph+"px; border-radius:50%; background-color: #fff; border: "+bordersize+"px solid #ccc; top:-"+ptop+"px; left:-"+pleft+"px; margin-left:50%; margin-top:50%;}",0);
							document.styleSheets[index].insertRule(cls+":after {content:''; display:block; position:absolute; width:"+cw+"px; height:"+ch+"px; background:#fff; border-radius:50%; top:-"+ctop+"px; left:-"+cleft+"px; margin-left:50%; margin-top:50%;}",0);
							document.styleSheets[index].insertRule(cls+":checked::before {border-color: #27AE60;}",0);
							document.styleSheets[index].insertRule(cls+":checked::after  {background-color: #27AE60;}",0);
						}else{
							document.styleSheets[index].insertRule(cls+":before{content:''; display:block; position:absolute; width:"+pw+"px; height:"+ph+"px; background-color: #fff; border: "+bordersize+"px solid #ccc; background:#fff; top:-"+ptop+"px; left:-"+pleft+"px; margin-left:50%; margin-top:50%;}",0);
							document.styleSheets[index].insertRule(cls+":after {content:''; display:block; position:absolute; width:"+cw+"px; height:"+ch+"px; background:#fff; top:-"+ctop+"px; left:-"+cleft+"px; margin-left:50%; margin-top:50%;}",0);
							document.styleSheets[index].insertRule(cls+":checked::before {border-color: #27AE60;}",0);
							document.styleSheets[index].insertRule(cls+":checked::after  {background-color: #27AE60;}",0);
						}
					}
				});
			}
		});
	}
});