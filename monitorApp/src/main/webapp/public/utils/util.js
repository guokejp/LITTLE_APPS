//数字
const NUM10 = 10;
const NUM20 = 20;
const NUM30 = 30;
const NUM40 = 40;
const NUM50 = 50;

//巡检结果
const RESULT_10 = '正常';
const RESULT_20 = '异常';

//巡检状态
const NUM_STATUS1 = "已分配";
const NUM_STATUS2 = "未完成";
const NUM_STATUS3 = "已完成";
const NUM_STATUS4 = "转异常";
const NUM_STATUS5 = "过期";

//默认图片路径
const DEFAULT_IMG_URL = getRootPath() + "/public/img/default.png";
//真实图片路径
const REAL_IMG_URL = getRootPath();
//真实图片路径
const REAL_IMG_URL2 = getRootPath() + "/";

/**
 * 返回图片路径
 * @param number
 * @returns
 */
function getImgUrl(url)
{
	if(url==""||url==undefined||url==null) return DEFAULT_IMG_URL;
	
	else  return REAL_IMG_URL+url;
}
/**
 * 根据传入的数字
 * 返回巡检状态
 */
function inspectionStatus(number)
{
	if(number==NUM10) return NUM_STATUS1;
	else if(number==NUM20) return NUM_STATUS2;
	else if(number==NUM30) return NUM_STATUS3;
	else if(number==NUM40) return NUM_STATUS4;
	else if(number==NUM50) return NUM_STATUS5;
	else return "";
}
/**
 * 巡检状态下拉框
 * @param id
 */
function getSelectStatus(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+NUM_STATUS1+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+NUM_STATUS2+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+NUM_STATUS3+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM40+'">'+NUM_STATUS4+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM50+'">'+NUM_STATUS5+'</option>';
	$(id).append(option);
}
/**
 * 根据传入的数字
 * 返回巡检结果
 */
function inspectionResults(number)
{
	if(number==NUM10) return RESULT_10;
	else if(number==NUM20) return RESULT_20;
	else return "";
}
/**
 * 巡检结果下拉框
 * @param id
 */
function getSelectResult(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+RESULT_10+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+RESULT_20+'</option>';
	$(id).append(option);
    $(id).comboSelect();
}
/*********************基础数据开始********************************/
//状态
const INFO_STATUS_10 = '正常';
const INFO_STATUS_1 = '一级预警';
const INFO_STATUS_2 = '二级预警';
const INFO_STATUS_3 = '三级预警';

/**
 * 根据传入的数字
 * 返回基础数据状态
 */
function InfoStatus(number)
{
	if(number==NUM10) return INFO_STATUS_10;
	else if(number==NUM20) return INFO_STATUS_20;
	else return "";
}
/*********************基础数据结束********************************/


/*********************额外巡检开始********************************/
//额外巡检状态
const EXTRA_TASK_STATUS_10 = '待巡检';
const EXTRA_TASK_STATUS_20 = '已完成';
const EXTRA_TASK_STATUS_30 = '待分配';

//额外巡检是否巡检
const EXTRA_TASK_ISXJ_10 = '否';
const EXTRA_TASK_ISXJ_20 = '是';
/**
 * 根据传入的数字
 * 返回额外巡检状态
 */
function extraTaskStatus(number)
{
	if(number==NUM10) return EXTRA_TASK_STATUS_10;
	else if(number==NUM20) return EXTRA_TASK_STATUS_20;
	else if(number==NUM30) return EXTRA_TASK_STATUS_30;
	else return "";
}
/**
 * 额外巡检是否巡检下拉框
 * @param id
 */
function getSelectETIsxj(id)
{
	
	$(id).empty();//设备类型
/*	var option = '<option value="">全部</option>';
	$(id).append(option);*/
	var option = '<option value="'+NUM20+'">'+EXTRA_TASK_ISXJ_20+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+EXTRA_TASK_ISXJ_10+'</option>';
	$(id).append(option);
    $(id).comboSelect();
}
/**
 * 额外巡检巡检状态下拉框
 * @param id
 */
function getSelectETStatus(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+EXTRA_TASK_STATUS_10+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+EXTRA_TASK_STATUS_20+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+EXTRA_TASK_STATUS_30+'</option>';
	$(id).append(option);
}
/*********************额外巡检结束********************************/


/*********************异常工单开始***********************************/
//异常工单状态
const ABNORMAL_CONSTANT_1 = '维修';
const ABNORMAL_CONSTANT_2 = '更换';
const ABNORMAL_CONSTANT_11 = '自修';
const ABNORMAL_CONSTANT_12 = '外修';
const ABNORMAL_CONSTANT_111 = '待分配';
const ABNORMAL_CONSTANT_112 = '待处理';
const ABNORMAL_CONSTANT_113 = '已处理';

function getAbnormalIs(number)
{
	if(number==NUM10) return EXTRA_TASK_ISXJ_10;
	else if(number==NUM20) return EXTRA_TASK_ISXJ_20;
	else return "";
}
/**
 * 根据传入的数字
 * 返回状态
 */
function getAbnormalStatus(number)
{
	if(number==NUM10) return ABNORMAL_CONSTANT_111;
	else if(number==NUM20) return ABNORMAL_CONSTANT_112;
	else if(number==NUM30) return ABNORMAL_CONSTANT_113;
	else return "";
}
/**
 * 状态下拉框
 * @param id
 */
function getAbnormalStatus_select(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+ABNORMAL_CONSTANT_111+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+ABNORMAL_CONSTANT_112+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+ABNORMAL_CONSTANT_113+'</option>';
	$(id).append(option);
}
/**
 * 根据传入的数字
 * 返回处理方式
 */
function getAbnormalWay(number)
{
	if(number==NUM10) return ABNORMAL_CONSTANT_11;
	else if(number==NUM20) return ABNORMAL_CONSTANT_12;
	else return "";
}
/**
 * 处理方式下拉框
 * @param id
 */
function getAbnormalWay_select(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+ABNORMAL_CONSTANT_11+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+ABNORMAL_CONSTANT_12+'</option>';
	$(id).append(option);
    $(id).comboSelect();
}
/**
 * 根据传入的数字
 * 返回方法
 */
function getAbnormalMethod(number)
{
	if(number==NUM10) return ABNORMAL_CONSTANT_1;
	else if(number==NUM20) return ABNORMAL_CONSTANT_2;
	else return "";
}
/**
 * 方法下拉框
 * @param id
 */
function getAbnormalMethod_select(id)
{
	$(id).empty();//设备类型
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+ABNORMAL_CONSTANT_1+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+ABNORMAL_CONSTANT_2+'</option>';
	$(id).append(option);
}
/*********************异常工单结束***********************************/

/***********************预警库开始**********************************/
const WARN_STATUS_1 = "预警中";
const WARN_STATUS_2 = "禁止中";

const WARN_GRANDE_1 = "一级预警";
const WARN_GRANDE_2 = "二级预警";
const WARN_GRANDE_3 = "三级预警";

const NUM1 = 1;
const NUM2 = 2;
const NUM3 = 3;
/**
 *获取预警库状态
 */
function getWanStatus(number)
{
	if(number==NUM10) return WARN_STATUS_1;
	else if(number==NUM20) return WARN_STATUS_2;
	else return "";
}

/**
 *获取预警库等级
 */
function getWanGrande(number)
{
	if(number==NUM1) return WARN_GRANDE_1;
	else if(number==NUM2) return WARN_GRANDE_2;
	else if(number==NUM3) return WARN_GRANDE_3;
	else return "";
}
/***********************预警库结束*********************************/

/***********************请假调班申请开始*********************************/
const APPLY_STATUS_10 = "未审核";
const APPLY_STATUS_20 = "已驳回";
const APPLY_STATUS_30 = "已通过";
/**
 *获取申请状态
 */
function getApplyStatus(number)
{
	if(number==NUM10) return APPLY_STATUS_10;
	else if(number==NUM20) return APPLY_STATUS_20;
	else if(number==NUM30) return APPLY_STATUS_30;
	else return "";
}
/**
 * 出库申请下拉框
 * @param id
 */
function getApplyStatus_select(id)
{
	$(id).empty();
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+APPLY_STATUS_10+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+APPLY_STATUS_20+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+APPLY_STATUS_30+'</option>';
	$(id).append(option);
}
/***********************请假调班申请结束*********************************/



/***********************库存管理开始*********************************/
const OUT_STATUS_10 = "待审批";
const OUT_STATUS_20 = "已驳回";
const OUT_STATUS_30 = "已通过";
const OUT_STATUS_40 = "已撤销";
const OUT_STATUS_50 = "已过期";

const REPERTORY_STATUS_10 = "出库充足";
const REPERTORY_STATUS_20 = "预警库存";
/**
 * 获取出库申请状态
 * @param number
 * @returns
 */
function getOutStatus(number)
{
	if(number==NUM10) return OUT_STATUS_10;
	else if(number==NUM20) return OUT_STATUS_20;
	else if(number==NUM30) return OUT_STATUS_30;
	else if(number==NUM40) return OUT_STATUS_40;
	else if(number==NUM50) return OUT_STATUS_50;
	else return "";
}
/**
 * 出库申请下拉框
 * @param id
 */
function getOutStatus_select(id)
{
	$(id).empty();
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+OUT_STATUS_10+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+OUT_STATUS_20+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM30+'">'+OUT_STATUS_30+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM40+'">'+OUT_STATUS_40+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM50+'">'+OUT_STATUS_50+'</option>';
	$(id).append(option);
}

/**
 * 获取当前库存状态
 * @param number
 * @returns
 */
function getRepertoryStatus(number)
{
	if(number==NUM10) return REPERTORY_STATUS_10;
	else if(number==NUM20) return REPERTORY_STATUS_20;
	else return "";
}
/**
 * 当前库存下拉框
 * @param id
 */
function getRepertoryStatus_select(id)
{
	$(id).empty();
	var option = '<option value="" selected="selected">全部</option>';
	$(id).append(option);
	var option = '<option value="'+NUM10+'">'+REPERTORY_STATUS_10+'</option>';
	$(id).append(option);
	var option = '<option value="'+NUM20+'">'+REPERTORY_STATUS_20+'</option>';
	$(id).append(option);
}
/***********************库存管理结束*********************************/



/************************调拨状态开始***********************************/
const COMMIT_STATUS_1 = "待审核";
const COMMIT_STATUS_2 = "已通过";
const COMMIT_STATUS_3 = "已驳回";
/**
 *获取调拨状态
 */
function getAppropriationStatus(number)
{
	if(number==NUM1) return COMMIT_STATUS_1;
	else if(number==NUM2) return COMMIT_STATUS_2;
	else if(number==NUM3) return COMMIT_STATUS_3;
	else return "";
}
/************************调拨状态结束***********************************/