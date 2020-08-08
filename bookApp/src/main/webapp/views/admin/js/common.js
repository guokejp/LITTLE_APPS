//the max lines of table
const TABLE_MAX_LINES	  =	12;
//the max search lines of table
const TABLE_SEARCH_MAX_LINES = 30;
//max page btn count
const MAX_PAGE_BTN_COUNT  = 10;
//max page btn count
const MAX_PAGE_CUSTOM_COUNT  = 8;
const MAX_PAGE_CUSTOM_COUNT2  = 12;
//max fangan center linges
const MAX_LINE_FA_CENTER  = 6;
//checkbox header id
const CHECKBOX_ID_PREFIX = 'cb_';
//checkbox custom
const CHECKBOX_ID_ADD_NEW_FJ = 'add_new_fj_';
//巡检人员默认权限id
const DEFAULT_XJRY_ROLE_ID = '2';
//管理人员
const DEFAULT_MANAGER_ROLE_ID = '1';
//custom device name
const CUSTOM_DEVICE_NAME = '自定义设备';
//设备类
const CLASS_DEVICE_NAME_ONE = '设备';
const CLASS_DEVICE_NAME_TWO = '胶带传输系统';
//max charts width
const MAX_CHARTS_WIDTH = 890;
//charts bar width
const CHARTS_BAR_WIDTH = 45;


var storage = window.localStorage; 
//js获取项目根路径，如： http://localhost:8083/uimcardprj
function getRootPath(){
    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
    var curWwwPath=window.document.location.href;
    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
    var pathName=window.document.location.pathname;
    var pos=curWwwPath.indexOf(pathName);
    //获取主机地址，如： http://localhost:8083
    var localhostPaht=curWwwPath.substring(0,pos);
    //获取带"/"的项目名，如：/uimcardprj
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName);
}

jQuery.fn.extend({
	//echart图表部分
	line:function(title,xdata,ydata,option){//折线图
		var argLen = arguments.length;
		var legal = [1,3,4];

		if($.inArray(argLen,legal)==-1){
			throw new Error("参数长度不合法，只允许长度为:1,3,4");
		}
		
		var series = []
		if(ydata.length!=0 && ydata[0] instanceof Array){
			for(var i=0; i<ydata.length; i++){
				var data = {
			            name:'',
			            type:'line',
			            smooth: true,
			            data: ydata[i]
			     };
				series.push(data);
			}
		}else{
			var data = {
		            name:'',
		            type:'line',
		            smooth: true,
		            data: ydata
		     };
			series.splice(0,0,data);
		}
		
		var defaults = {
			title: title||{},
		    tooltip: {
		        trigger: 'axis',
		        axisPointer: {
		            type: 'cross'
		        }
		    },
		    grid: {
	            y2: 150//调整x轴label和x轴的距离
	        },
		    xAxis:  {
		        type: 'category',
		        boundaryGap:false,
		        axisLabel: {
				  interval:0,
				  rotate: 60
				},
		        data: xdata
		    },
		    yAxis: {
		        type: 'value',
		        boundaryGap: ['0', '0'],
		        splitLine: {
	                show: false
	            },
		        axisLabel: {
		            formatter: '{value}'
		        },
		        axisPointer: {
		            snap: true
		        }
		    },
		    dataZoom: [{
	            startValue: ''
	        }, {
	            type: 'inside'
	        }],
		    series: series
		};
		
		if(argLen==1 || option){
			jQuery.extend(true,defaults,option);
		}
		try {
			var chart = echarts.init(this[0]);
			chart.setOption(defaults); 
		} catch (e) {
			throw e;
		}
	},
	pie:function(title,data,legenddata,option){//饼图
		var argLen = arguments.length;
		
		var legal = [1,3,4];

		if($.inArray(argLen,legal)==-1){
			throw new Error("参数长度不合法，只允许长度为:1,3,4");
		}
		
		var defaults = {
			title : title || {},
		    tooltip : {
		        trigger: 'item',//axis可以该条目获取所有坐标轴的对应的数据.item只能获取该条目的数据
		        //item时，a是series元素name值，b是series的data子元素name值，c是data子元素value值
		        //d是data子元素value占总和的百分比值
		        formatter: "{b} : {c} ({d}%)"
		    },
		    legend: {
		        orient: 'vertical',
		        left: 'left',
		        //每个元素对应series的data子元素的name值
		        data: legenddata || []
		    },
		    series : [{
	            name: '',
	            type: 'pie',
	            radius : '55%',
	            center: ['50%', '60%'],//图形左右位置，上下位置
	            data:data || [],
	            itemStyle: {
	            	//强调样式
	                emphasis: {
	                    shadowBlur: 10,//阴影大小
	                    shadowOffsetX: 0,//阴影左偏移
	                    shadowColor: 'rgba(0, 0, 0, 0.5)'//阴影颜色
	                }
	            }
		   }]
		};
		if(argLen==1 || option){
			jQuery.extend(true,defaults,option);
		}
		try {
			var chart = echarts.init(this[0]);
			chart.setOption(defaults); 
		} catch (e) {
			throw e;
		}
	}
});

//蒙版生成/移除
function toggleMask(hide,maskcfg,containercfg){
	var mc = {
		id:"mask",
		bg:"#FFF",
		alpha:0.1,
		zindex:1000
	}; 
	var cc = {
		bg:"#E1E1E1",
		w:10,
		h:3,
		unit:"em"
	}
	
	jQuery.extend(mc,maskcfg);
	jQuery.extend(cc,containercfg);
	
	if(!hide){
		var html = '';
		html+='<div id='+mc.id+'>';
		html+='<div style="width: 100%; height: 100%; background: #FFF; opacity:0.1; top:0; left:0; position: fixed; z-index: 1000;">';
		html+='</div>';
		html+='<div style="background:'+cc.bg+'; width:'+(cc.w+cc.unit)+'; height:'+(cc.h+cc.unit)+'; margin-left:-'+(cc.w/2+cc.unit)+'; margin-top:-'+(cc.h/2+cc.unit)+'; left:50%; top:50%; position: fixed; z-index: '+mc.zindex+1+';">';
		html+='</div>';
		html+='</div>';
		$(document.body).prepend(html);
	}else{
		$("#mask").remove();
	}
}

/**
 * 去掉字符串两端空格
 * @param str
 * @returns
 */
function common_trim(str){ //删除左右两端的空格
	if(str == null) str = "";
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

/**
 * 判断字符串是否全为数字
 * @param str
 * @returns {Boolean}
 */
function isNumber(str){
	if(/^\d+$/.test(str)) return true;
	else return false;
}

/**
 * post data to server
 * @param url  		post 网址
 * @param data		post 参数
 * @param success   post success callback
 * @param complete  post complete callback
 * @param error		post error callback
 */
function common_post(url,data,success,complete,error)
{
	function local_success(msg){
		
	  try
	  {
	    if(msg != ''){
			
			var jsData = $.parseJSON(msg);
			var reqstate = jsData['reqstate'];
			var redirect = jsData['redirect'];
			
			if(reqstate == 'error'){		
				var url = '../' + redirect;				
				if(self != top){					
					self.parent.location.href = url;
				}
				else{					
					self.location.href = url;
				}
			}
		}
	  }
	  catch(err)
	  {
		  
	  }
		
	  success(msg);
	} 
	
	$.ajax({
		url:url,
		type:'post',
		data : data,  
        dataType : 'text',
        success:local_success,
  		complete:complete,
  		error:error 
	 }); 
}
/**
 * post data to server
 * @param url  		post 网址
 * @param data		post 参数
 * @param success   post success callback
 * @param complete  post complete callback
 * @param error		post error callback
 */
function common_post2(url,data,success,complete,error)
{
	function local_success(msg){
		
	  try
	  {
	    if(msg != ''){
			
			var jsData = $.parseJSON(msg);
			var reqstate = jsData['reqstate'];
			var redirect = jsData['redirect'];
			
			if(reqstate == 'error'){		
				var url = '../' + redirect;				
				if(self != top){					
					self.parent.location.href = url;
				}
				else{					
					self.location.href = url;
				}
			}
		}
	  }
	  catch(err)
	  {
		  
	  }
		
	  success(msg);
	} 
	
	$.ajax({
		url:url,
		type:'post',
		data : JSON.stringify(data),  
        dataType : 'json',
        headers:{"Content-Type":"application/json;charset=UTF-8"},
        success:local_success,
  		complete:complete,
  		error:error 
	 }); 
}
/** 
 * 显示提示消息（自动关闭） 
 * @param msg 
 * @param sec 显示时间（毫秒） 
 * @param callback 回调函数 
 */  
function showTip(msg, sec, callback){  
    if(!sec) {  
        sec = 1000;  
    }  
    Modal.tip({  
        title:'提示',  
        msg: msg  
    }, sec);  
    setTimeout(callback, sec);  
}  
  
/** 
 * 显示消息 
 * @param msg 
 */  
function showMsg(msg, callback){  
    Modal.alert({  
        title:'提示',  
        msg: msg,  
        btnok: '确定'  
    }).on(function (e) {  
        if(callback){  
            callback();  
        }  
     });  
}  
  
/** 
 * 模态对话框 
 * @param msg 
 * @returns 
 */  
function showConfirm(msg,callback){  
    Modal.confirm(  
      {  
          title:'提示',  
          msg: msg,  
      }).on( function (e) {  
          callback();  
      });   
}


/**
 *  解析手写序列命令
 *  @param value  1,5,6-13,18
 *  @returns     1,5,6,7,8,9,10,11,12,13,18
 */
function parseHandleWriteStr(value){
    
	var parsedData = [];
    var strArr = new Array();
	 value = value.replace(/，/g,',');
	 value = value.replace(/ /g,'');
	 value = value.replace(/	/g,'');
	 strArr = value.split(',');
	 
	 for(var i = 0; i < strArr.length; i++)
	 {
		var subStrArr = new Array();
		subStrArr = strArr[i].split('-');
		if((subStrArr.length == 0) || (subStrArr.length > 2)) continue;
		
		if(subStrArr.length == 1)
		{
			if(isNaN(subStrArr[0])) continue;
			parsedData.push(parseInt(subStrArr[0]));
		}
		else if(subStrArr.length == 2)
		{
			if(isNaN(subStrArr[0]) || isNaN(subStrArr[1])) continue;

		    var start = parseInt(subStrArr[0]);
			var end   = parseInt(subStrArr[1]);
			
			if((start < end) && (end - start < 10000))
			{
			   var curIndex = start;
			   while(curIndex <= end){
			     
				  parsedData.push(curIndex);
				  curIndex++;
			   }
			}
		}
	 }

	 return parsedData;
 }

/**
 *  初始化时间 picker 控件
 *  @param id 控件 id
 *  @param isShowTime 是否使用 日期时间控件
 */
//var disabledDays = ["2017-06-30","2017-06-29","2017-05-29"];//格式要与datepicker中的日期格式一致（yyyy/mm/dd）
function init_date_input(id,isShowTime){
 if((isShowTime == undefined) || (!isShowTime)){
	 $('#'+id).datepicker({
	        language: 'zh-CN',
	        todayBtn:true,
	        autoclose: true,
	        todayHighlight:true,
	        format:"yyyy-mm-dd"	       
	    });
 }else{
	 
	 $('#'+id).datetimepicker({
	        language: 'zh-CN',
	        todayBtn:"linked",
	        autoclose: true,
	        orientation:'right',
	        todayHighlight:true,
	        format:"yyyy-mm-dd hh:ii"
	    }); 
 }
}
/**
 * 今天之前的时间显示灰色
 * @param id
 */
function init_date_Disable(id,isShowTime)
{
	if((isShowTime == undefined) || (!isShowTime))
	{
			 $('#'+id).datepicker({
			        language: 'zh-CN',
			        todayBtn:true,
			        autoclose: true,
			        todayHighlight:true,
			        format:"yyyy-mm-dd",
			        beforeShowDay:function(date) 
			        {    
			            var toDay = (new Date()).Format("yyyy-MM-dd");
			            var dateTime = date.Format("yyyy-MM-dd");
			            if(dateTime<toDay)
			        	{
			            	return false;
			        	}
			            return [true,'',''];
			        }
			    });
 
	}
	else
	{
			 $('#'+id).datetimepicker({
			        language: 'zh-CN',
			        todayBtn:"linked",
			        autoclose: true,
			        orientation:'right',
			        minDate:new Date(),
			        todayHighlight:true,
			        format:"yyyy-mm-dd hh:ii"
			        
			    }); 
	 }
	 
}
/**
 * 今天之后不可选
 * @param id
 * @param isShowTime
 */
function init_date_Later(id)
{
 $('#'+id).datepicker({
        language: 'zh-CN',
        todayBtn:true,
        autoclose: true,
        todayHighlight:true,
        format:"yyyy-mm-dd",
        beforeShowDay:function(date) 
        {    
            var toDay = (new Date()).Format("yyyy-MM-dd");
            var dateTime = date.Format("yyyy-MM-dd");
            if(dateTime>toDay)
        	{
            	return false;
        	}
            return [true,'',''];
        }
    }); 
}
//对Date的扩展，将 Date 转化为指定格式的String
//月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
//年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
//例子： 
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
Date.prototype.Format = function (fmt) { //author: meizz 
 var o = {
     "M+": this.getMonth() + 1, //月份 
     "d+": this.getDate(), //日 
     "h+": this.getHours(), //小时 
     "m+": this.getMinutes(), //分 
     "s+": this.getSeconds(), //秒 
     "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
     "S": this.getMilliseconds() //毫秒 
 };
 if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
 for (var k in o)
 if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
 return fmt;
};
/**
 *  胡群殴当前时间  yyyy-mm-dd
 *  @returns 当前时间
 */
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var year = date.getFullYear();
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = year + seperator1 + month + seperator1 + strDate;
    return currentdate;
}

/**gyw
获取当前时间、昨天、明天等等
**/
function GetDateStr(AddDayCount) 
{ 
	var date = new Date(); 
	date.setDate(date.getDate()+AddDayCount);//获取AddDayCount天后的日期 
	var y = date.getFullYear(); 
	var m = date.getMonth()+1;//获取当前月份的日期 
	var d = date.getDate(); 
	if(m<10)
	{
		m = "0" + m;
	}
	if(d<10)
	{
		d = "0" + d;
	}
	return y+"-"+m+"-"+d; 
} ;
/**
 * 获取某个时间多少天后的时间
 * @param date---日期
 * @param AddDayCount--天数
 * @returns {String}
 */
function GetEtime(date,AddDayCount) 
{ 
	date.setDate(date.getDate()+parseInt(AddDayCount));//获取AddDayCount天后的日期 
	var y = date.getFullYear(); 
	var m = date.getMonth()+1;//获取当前月份的日期 
	var d = date.getDate(); 
	if(m<10)
	{
		m = "0" + m;
	}
	if(d<10)
	{
		d = "0" + d;
	}
	return y+"-"+m+"-"+d; 
} ;
/**gyw
 * //获取当前时间周的结束日期
 */
var getLastWeek = function(time)
{
	var timeDayOfWeek = time.getDay(); //今天本周的第几天 
	var timeDay = time.getDate(); //当前日 
	var timeMonth = time.getMonth(); //当前月 
	var timeYear = time.getYear(); //当前年 
	timeYear += (timeYear < 2000) ? 1900 : 0; //
	//timeDayOfWeek = timeDayOfWeek==0?7:timeDayOfWeek; // 如果是周日，就变成周七  
	var weekStartDate = new Date(timeYear, timeMonth, timeDay + (6 - timeDayOfWeek)); //获取结束日期 
	weekStartDate.setDate(weekStartDate.getDate()+1);
	return weekStartDate;
};
function getDate(date)
{
	var y = date.getFullYear(); 
	var m = date.getMonth()+1;//获取当前月份的日期 
	var d = date.getDate(); 
	
	return y+"-"+m+"-"+d;
};
/**gyw
 * 计算两个时间之间相差天数
 */
var getDifferTime = function(startDate,endDate)
{
	var s1 = startDate.getTime(),s2 = endDate.getTime();
	var total = (s2 - s1)/1000;
	var day = parseInt(total / (24*60*60));//计算整数天数
	return day;
};
/**gyw
 * 计算两个时间之间相差月份
 */
var getDifferMonth = function(startDate,endDate)
{
	var startYear = startDate.getYear();
	var endYear = endDate.getYear();
	var end = endDate.getMonth();
	var start = startDate.getMonth();
	var number = 0;
	if(startYear==endYear)//判断两个时间年份是否一致
	{
		number = parseInt(end-start);//计算
	}
	else
	{
		var total = (endYear-startYear)*12;
		number = parseInt(end-start)+total;
	}
	
	return number;
};
/** 
 * 获取指定的URL参数值 
 * URL:http://www.quwan.com/index?name=tyler 
 * 参数：paramName URL参数 
 * 调用方法:getParam("name") 
 * 返回值:tyler 
 */ 
function getParam(paramName) { 
    paramValue = "", isFound = !1; 
    if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) { 
    	var url = decodeURI(this.location.search);
        arrSource = unescape(url).substring(1, url.length).split("&"), i = 0; 
        while (i < arrSource.length && !isFound) arrSource[i].indexOf("=") > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase() && (paramValue = arrSource[i].split("=")[1], isFound = !0), i++ 
    } 
    return paramValue == "" && (paramValue = null), paramValue 
} 
/**
 * 按时间排序
 */
function CompareDate(a,b)
{
	var date1 = new Date(a.xjtime.replace(/-/g,"\/"));
	var date2 = new Date(b.xjtime.replace(/-/g,"\/"));
	var result = 0;
	if(date2>date1)
	{
		result = 1;
	}
	else if(date2<date1)
	{
		result = -1;
	}
	else
	{
		result = 0;
	}
  return result;
};
/**
 * 日期是星期几
 */
function getWeekMark(date)
{
	var l = ["日","一","二","三","四","五","六"];
	var d = date.getDay();
	var str = "星期" + l[d];
	return str;
};
Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}
function Formatyyyymmdd(dateTime){
	return new Date(dateTime).Format("yyyy-MM-dd");
}
function statusFx(statusCode){
	var INFO_STATUS_10 = '正常';
	var INFO_STATUS_20 = '<b style="color:red">外借</b>';
	var INFO_STATUS_1 = '一级预警';
	var INFO_STATUS_2 = '二级预警';
	var INFO_STATUS_3 = '三级预警';
	return eval("INFO_STATUS_"+statusCode);
}



//获取某年某月天数
function getDaysInOneMonth(year, month){  
	  month = parseInt(month, 10);  
	  var d= new Date(year, month, 0);  
	  return d.getDate();  
}  
/**
 * 判断该字段是否为空
 */
function isNull(field)
{
	if(field==undefined) return "";
	else if(field=="") return "";
	else if(field==null) return "";
	else if(field=="null") return "";
	else return field;
}
/**
 * 获取巡检设备内容
 */
function xjsb_handle(type)
{
	if(type==undefined) return "";
	var xjsb = "";
	var data = type.split(",");
	$.each(data,function(index,item)
	{
		var msg = "";
		if(item=="0") msg = "其他设备";
		if(item=="1") msg = "网络设备";
		if(item=="2") msg = "技术设备";
		
		if(xjsb=="")
		{
			xjsb += msg;
		}else
		{
			xjsb += "," + msg;
		}
	});
	return xjsb;
}


/**参数说明：
 * 根据长度截取先使用字符串，超长部分追加…
 * str 对象字符串
 * len 目标字节长度
 * 返回值： 处理结果字符串
 */
function cutString(str, len) {
	//length属性读出来的汉字长度为1
	if(str.length*2 <= len) {
		return str;
	}
	var strlen = 0;
	var s = "";
	for(var i = 0;i < str.length; i++) {
		s = s + str.charAt(i);
		if (str.charCodeAt(i) > 128) {
			strlen = strlen + 2;
			if(strlen >= len){
				return s.substring(0,s.length-1) + "...";
			}
		} else {
			strlen = strlen + 1;
			if(strlen >= len){
				return s.substring(0,s.length-2) + "...";
			}
		}
	}
	return s;
}
/**
 * 返回一个数形结构的第一个最子节点，用于做树形结构默认点击
 */
function getTreeofFirstLeaf(obj){
	var ret = {};
	if(obj.nodes){
		ret = getTreeofFirstLeaf(obj.nodes[0]);
	}else{
		ret = obj
	}
	return ret;
}


/**
 * 遍历输出表头及查看信息时，获取显示的值
 * obj:{column: "name", field: "设备名称", fixtype: "", fxname: "", style: "width:50px;", …} --xml配置文件内容
 * value:abc   ----数据库查询出的值
 */
function getShowVal(obj,value){
	var showVal = '';
	if(obj.usefx == 'true'){
		if(obj.fixtype == 'date'){
			if(value != null && value != 'null' && value != undefined && value != ''){
				showVal = eval(obj.fxname+'('+value.time+')');
			}else{
				showVal = '';
			}
		}else{
			showVal = eval(obj.fxname+'('+value+')');
		}
	}else{
		showVal = value
	}
	return showVal;
}

/**
 * 制作一个能够模xml的字段配置
 * JqeryObj : 获取到的html节点的jquery对象，html节点形式为 <label name="replacedate" type="data" name="onlinedate" usefx="true" fxname="Formatyyyymmdd" fixtype="date" >
 * attrboj： 返回的模拟xml的对象 {column: "name", field: "设备名称", fixtype: "", fxname: "", style: "width:50px;", …}
 * 
 */
function makeEquipXmlFiledObj(JqeryObj){
	var attrboj = {};
	if(JqeryObj.attr("usefx") == 'true'){
		attrboj.usefx = "true";
		attrboj.fxname = JqeryObj.attr("fxname");
		if(JqeryObj.attr("fixtype")){
			attrboj.fixtype = JqeryObj.attr("fixtype");
		}
	}
	return attrboj;
}
/**
 * 将form数据转换为键值对
 * @param form-#xxxx--form的id
 */
function getFormJson(form) 
{
	var values = {};
	var data = $(form).serializeArray();
	$.each(data, function ()
	{
		if (values[this.name] !== undefined) 
		{
			if (!values[this.name].push)
			{
				values[this.name] = [values[this.name]];
			}
			values[this.name].push(this.value || '');
		} 
		else 
		{
			values[this.name] = this.value || '';
		}
	});
	return values;
}
/**
 * Tab切换方法（on是当前属性 hide是隐藏属性）
 * 形式： <!--横向菜单-->    <ul class="Menu"><li class="on"><a>*</a></li><li><a>*</a></li></ul>
 *        <!--切换内容-->    <div><div class="subTab">内容1</div><div class="subTab hide">内容2</div></div>
 * 调用:  tabSwitch(".tab",".subTab");
 */
function tabSwitch(menus, conts) {
    $(menus).click(function() {
        var index = $(this).index();
        $(this).addClass("active").siblings().removeClass("active");
        $(conts).eq(index).removeClass("hide").siblings().addClass("hide");
    })
}
/**
 * 判断图片是否存在
 */
function validateImage(url)  
{      
    var xmlHttp ;  
    if (window.ActiveXObject)  
     {  
      xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");  
     }  
     else if (window.XMLHttpRequest)  
     {  
      xmlHttp = new XMLHttpRequest();  
     }   
    xmlHttp.open("Get",url,false);  
    xmlHttp.send();  
    if(xmlHttp.status==404)  
    return false;  
    else  
    return true;  
}