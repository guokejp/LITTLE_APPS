/**
 * 预警机制管理
 */
function yjjz()//初始化
{	
	//查询页面数据
	/**
	 * 提交事件
	 */
	$("#yjjz_submit").unbind();
	$("#yjjz_submit").click(function()
	{
		var day = {};
		//日
		day.id = 1;
		day.onewarn = $("#yjjz_dayOne").val();
		day.twowarn = $("#yjjz_dayTwo").val();
		day.threewarn = $("#yjjz_dayThree").val();
		
		
		
		var week = {};
		//周
		week.id = 2;
		week.onewarn = $("#yjjz_weekOne").val();
		week.twowarn = $("#yjjz_weekTwo").val();
		week.threewarn = $("#yjjz_weekThree").val();
		
		
		var month = {};
		//月
		month.id = 3;
		month.onewarn = $("#yjjz_monthOne").val();
		month.twowarn = $("#yjjz_monthTwo").val();
		month.threewarn = $("#yjjz_monthThree").val();
		
		var quarter = {};
		//季度
		quarter.id = 4;
		quarter.onewarn = $("#yjjz_quarterOne").val();
		quarter.twowarn = $("#yjjz_quarterTwo").val();
		quarter.threewarn = $("#yjjz_quarterThree").val();
		
		var halfYear = {};
		//半年
		halfYear.id = 5;
		halfYear.onewarn = $("#yjjz_halfYearOne").val();
		halfYear.twowarn = $("#yjjz_halfYearTwo").val();
		halfYear.threewarn = $("#yjjz_halfYearThree").val();
		
		var year = {};
		//年
		year.id = 6;
		year.onewarn = $("#yjjz_yearOne").val();
		year.twowarn = $("#yjjz_yearTwo").val();
		year.threewarn = $("#yjjz_yearThree").val();
		//修改
		var data = [day,week,month,quarter,halfYear,year];
		$(data).each(function(){
			
		})
		
		$.post(
			getRootPath() + "/sm/warning/saveWarningSettings",
			{"warnings":JSON.stringify([day,week,month,quarter,halfYear,year])},
			function(data) {
				if(data.status) {
					showMsg('预警机制修改数据成功！',function(){
						window.location.reload();
					});
				} else {
					showMsg('预警机制修改数据失败!',function(){});
				}
			}
		)
	});
};