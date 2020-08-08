
    function beforeUploadFun(opt){
        opt.otherData =[{"name":"name","value":"zxm"}];
    }
    function onUploadFun(opt,data){
        showMsg(data);
        uploadTools.uploadError(opt);//显示上传错误
    };
    
    (function(window) {

    	  var svgSprite = '<svg>' +
    	    '' +
    	    '<symbol id="icon-shanchu" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M640.512 216.44288l0-76.8-258.048 0 0 76.8-171.008 0 0 73.728 601.088 0 0-73.728L640.512 216.44288zM239.104 340.34688l44.032 536.576 457.728 0 44.032-536.576L239.104 340.34688zM426.496 774.52288l-70.656 0 0-342.016 70.656 0L426.496 774.52288zM546.304 774.52288l-69.632 0 0-342.016 69.632 0L546.304 774.52288zM670.208 774.52288l-72.704 0 0-342.016 72.704 0L670.208 774.52288z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-gou" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M800.06837 245.25068 387.101897 658.217153 223.927537 495.043816c-24.418133-24.416086-64.004733-24.416086-88.422865 0-24.414039 24.415063-24.414039 64.003709 0 88.419795l195.480136 195.48116c13.023618 13.020548 36.738739 18.950607 56.342216 18.022469 19.475564 0.924045 42.872436-5.006014 55.889915-18.024515l445.271226-445.271226c24.418133-24.418133 24.418133-64.004733 0-88.420819C864.072079 220.832548 824.486502 220.832548 800.06837 245.25068z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-wenjian" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M877.095385 165.809231l-29.144615-29.144615L818.806154 107.52C751.458462 38.990769 711.325538 0 669.538462 0L354.461538 0C267.421538 0 196.923077 70.498462 196.923077 157.538462l0 275.692308L78.769231 433.230769c-21.661538 0-39.384615 17.723077-39.384615 39.384615l0 236.307692c0 21.661538 17.723077 39.384615 39.384615 39.384615l118.153846 0 0 118.153846c0 87.04 70.498462 157.538462 157.538462 157.538462l472.615385 0c87.04 0 157.538462-70.498462 157.538462-157.538462L984.615385 315.076923C984.615385 273.329231 945.624615 233.156923 877.095385 165.809231zM905.846154 866.461538c0 43.323077-35.446154 78.769231-78.769231 78.769231L354.461538 945.230769c-43.323077 0-78.769231-35.446154-78.769231-78.769231l0-118.153846 393.846154 0c21.661538 0 39.384615-17.723077 39.384615-39.384615l0-236.307692c0-21.661538-17.723077-39.384615-39.384615-39.384615L275.692308 433.230769 275.692308 157.538462c0-43.323077 35.446154-78.769231 78.769231-78.769231l287.113846 0C669.932308 85.858462 669.538462 120.910769 669.538462 155.569231L669.538462 275.692308c0 21.661538 17.723077 39.384615 39.384615 39.384615l118.153846 0c39.384615 0 78.769231 0 78.769231 39.384615L905.846154 866.461538z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-wenjian1" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M992 128 493.248 128 374.656 9.344C368.64 3.392 360.512 0 352 0l-320 0C14.336 0 0 14.336 0 32l0 704C0 753.664 14.336 768 32 768L384 768c17.664 0 32-14.336 32-32S401.664 704 384 704L64 704 64 64l274.752 0 118.656 118.656C463.36 188.608 471.488 192 480 192L960 192l0 512-320 0c-17.664 0-32 14.336-32 32S622.336 768 640 768l352 0c17.664 0 32-14.336 32-32l0-576C1024 142.336 1009.664 128 992 128zM640 640c8.192 0 16.384-3.136 22.656-9.344 12.48-12.48 12.48-32.768 0-45.248l-127.936-128c-12.544-12.48-32.832-12.48-45.248 0l-128 128c-12.48 12.48-12.48 32.768 0 45.248 12.48 12.48 32.768 12.48 45.248 0L480 557.248 480 992C480 1009.664 494.4 1024 512 1024s32-14.336 32-32L544 557.248l73.344 73.344C623.616 636.864 631.808 640 640 640z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-qingchu" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M31.030303 15.515152 31.030303 15.515152 31.030303 15.515152ZM739.886545 920.234667q-36.864 0-123.159273 30.068364t-120.242424 30.068364q-37.825939 0-124.121212-30.068364t-117.325576-30.068364q-18.432 0-40.246303 5.833697t-35.405576 11.139879-34.909091 15.018667q-12.598303 5.833697-18.432 8.254061t-15.018667 5.337212-13.094788 2.916848q-3.878788-0.961939-6.795636-2.916848-3.878788-1.954909-4.375273-8.254061t1.458424-16.011636 5.833697-24.234667l10.674424-31.992242q5.833697-17.470061 12.598303-38.787879 14.553212-41.704727 27.648-79.530667t23.769212-72.73503q11.636364-34.909091 18.432-56.257939l7.757576-20.355879 726.295273 0q35.87103 201.69697 51.386182 304.500364 1.954909 13.591273 1.954909 23.272727 0 4.840727-0.496485 8.254061t-0.961939 6.299152-2.420364 5.337212-3.878788 3.382303q-5.833697 1.954909-9.712485 2.916848-1.954909 0.961939-5.337212 0.496485t-8.254061-1.954909-8.719515-2.916848-7.757576-2.420364q-6.795636-2.916848-21.348848-7.757576-28.113455-11.636364-46.545455-17.470061-5.833697-1.954909-13.591273-3.878788t-17.470061-3.878788-21.348848-4.840727q-4.840727-0.961939-9.712485-1.458424t-9.712485-1.458424-9.712485-0.961939l-9.712485-1.954909-9.216 0t-9.216-0.496485-9.712485-0.496485zM861.090909 557.583515l-606.052848 0q-24.234667 0-42.170182-17.935515t-17.935515-43.163152q25.227636-33.947152 81.454545-121.204364 45.583515-61.098667 99.886545-61.098667l90.174061 0 30.068364-242.439758 14.553212-17.470061q8.719515-9.712485 32.488727-26.189576t44.125091-16.477091 43.628606 14.553212q5.833697 3.878788 10.674424 7.757576t9.216 7.757576 8.254061 7.261091 6.795636 7.261091l12.598303 15.515152-30.068364 242.439758 89.212121 0q25.227636 0 54.30303 16.973576t49.462303 48.003879q56.257939 86.295273 79.530667 117.325576 0 27.151515-17.935515 44.125091t-42.170182 16.973576z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-shangchuan" viewBox="0 0 1040 1024">' +
    	    '' +
    	    '<path d="M374.978277 343.568916c0 0-61.903885-62.009286-145.889695-11.366885-75.143421 48.349171-61.854766 136.832412-61.854766 136.832412S0.325411 502.828107 0.325411 680.117952c3.721765 177.001273 181.261297 178.816618 181.261297 178.816618l266.50475 0.285502L448.091458 669.715021 320.298933 669.715021 512.024559 480.224296l191.697997 189.490725L575.907519 669.715021l0 189.504028 258.773671-0.285502c0 0 165.217902 0.14224 188.43672-168.250982 11.041474-184.189999-159.709445-220.490763-159.709445-220.490763s19.425422-272.650727-220.35671-303.734676C437.509449 144.596236 374.978277 343.568916 374.978277 343.568916z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-cha" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M511.728 97.943c-228.547 0-413.821 185.274-413.821 413.821s185.274 413.821 413.821 413.821c228.548 0 413.821-185.274 413.821-413.821s-185.274-413.821-413.821-413.821zM720.272 681.129c11.492 11.598 11.402 30.313-0.196 41.8s-30.313 11.401-41.802-0.197l-166.086-167.652-167.985 166.418c-11.598 11.489-30.313 11.4-41.8-0.198s-11.4-30.312 0.197-41.8l167.985-166.418-166.76-168.332c-11.489-11.597-11.4-30.313 0.198-41.8s30.312-11.4 41.8 0.198l166.76 168.332 167.997-166.429c11.6-11.489 30.314-11.4 41.801 0.198 11.49 11.597 11.4 30.313-0.197 41.8l-167.998 166.429 166.087 167.652z"  ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '<symbol id="icon-wenjian2" viewBox="0 0 1024 1024">' +
    	    '' +
    	    '<path d="M923.84 276.288a37.952 37.952 0 0 0-10.752-29.312L696.192 30.4a37.888 37.888 0 0 0-30.272-10.624H191.104c-40.576 0-73.408 32.832-73.408 73.28v842.816c0 40.512 32.832 73.344 73.408 73.344h660.288c40.512 0 73.344-32.832 73.344-73.344V276.288h-0.896z m-255.808-165.696l165.888 165.696h-165.888V110.592z m183.424 825.344H191.104V93.12h403.52v219.904c0 20.224 16.448 36.672 36.608 36.672h220.16v586.24z" fill="" ></path>' +
    	    '' +
    	    '</symbol>' +
    	    '' +
    	    '</svg>'
    	  var script = function() {
    	    var scripts = document.getElementsByTagName('script')
    	    return scripts[scripts.length - 1]
    	  }()
    	  var shouldInjectCss = script.getAttribute("data-injectcss")

    	  /**
    	   * document ready
    	   */
    	  var ready = function(fn) {
    	    if (document.addEventListener) {
    	      if (~["complete", "loaded", "interactive"].indexOf(document.readyState)) {
    	        setTimeout(fn, 0)
    	      } else {
    	        var loadFn = function() {
    	          document.removeEventListener("DOMContentLoaded", loadFn, false)
    	          fn()
    	        }
    	        document.addEventListener("DOMContentLoaded", loadFn, false)
    	      }
    	    } else if (document.attachEvent) {
    	      IEContentLoaded(window, fn)
    	    }

    	    function IEContentLoaded(w, fn) {
    	      var d = w.document,
    	        done = false,
    	        // only fire once
    	        init = function() {
    	          if (!done) {
    	            done = true
    	            fn()
    	          }
    	        }
    	        // polling for no errors
    	      var polling = function() {
    	        try {
    	          // throws errors until after ondocumentready
    	          d.documentElement.doScroll('left')
    	        } catch (e) {
    	          setTimeout(polling, 50)
    	          return
    	        }
    	        // no errors, fire

    	        init()
    	      };

    	      polling()
    	        // trying to always fire before onload
    	      d.onreadystatechange = function() {
    	        if (d.readyState == 'complete') {
    	          d.onreadystatechange = null
    	          init()
    	        }
    	      }
    	    }
    	  }

    	  /**
    	   * Insert el before target
    	   *
    	   * @param {Element} el
    	   * @param {Element} target
    	   */

    	  var before = function(el, target) {
    	    target.parentNode.insertBefore(el, target)
    	  }

    	  /**
    	   * Prepend el to target
    	   *
    	   * @param {Element} el
    	   * @param {Element} target
    	   */

    	  var prepend = function(el, target) {
    	    if (target.firstChild) {
    	      before(el, target.firstChild)
    	    } else {
    	      target.appendChild(el)
    	    }
    	  }

    	  function appendSvg() {
    	    var div, svg

    	    div = document.createElement('div')
    	    div.innerHTML = svgSprite
    	    svgSprite = null
    	    svg = div.getElementsByTagName('svg')[0]
    	    if (svg) {
    	      svg.setAttribute('aria-hidden', 'true')
    	      svg.style.position = 'absolute'
    	      svg.style.width = 0
    	      svg.style.height = 0
    	      svg.style.overflow = 'hidden'
    	      prepend(svg, document.body)
    	    }
    	  }

    	  if (shouldInjectCss && !window.__iconfont__svg__cssinject__) {
    	    window.__iconfont__svg__cssinject__ = true
    	    try {
    	      document.write("<style>.svgfont {display: inline-block;width: 1em;height: 1em;fill: currentColor;vertical-align: -0.1em;font-size:16px;}</style>");
    	    } catch (e) {
    	      console && console.log(e)
    	    }
    	  }

    	  ready(appendSvg)


    	})(window)
    
    
    
    
    
    
    
    
    /**
     * Created by zxm on 2017/8/30.
     */
    $.fn.extend({
        "initUpload":function(opt) {
            if (typeof opt != "object") {
                showMsg('参数错误!');
                return;
            }
            var uploadId = $(this).attr("id");
            if(uploadId==null||uploadId==""){
                showMsg("要设定一个id!",null);
            }
            $.each(uploadTools.getInitOption(uploadId), function (key, value) {
                if (opt[key] == null) {
                    opt[key] = value;
                }
            });
            uploadTools.initWithLayout(opt);//初始化布局
            uploadTools.initWithDrag(opt);//初始化拖拽
            uploadTools.initWithSelectFile(opt);//初始化选择文件按钮
            uploadTools.initWithUpload(opt);//初始化上传
            uploadTools.initWithCleanFile(opt);
            uploadFileList.initFileList(opt);
        }
    });
    /**
     * 上传基本工具和操作
     */
    var uploadTools = {
        /**
         * 基本配置参数
         * @param uploadId
         * @returns {{uploadId: *, url: string, autoCommit: string, canDrag: boolean, fileType: string, size: string, ismultiple: boolean, showSummerProgress: boolean}}
         */
        "getInitOption":function(uploadId){
            //url test测试需要更改
            var initOption={
                "uploadId":uploadId,
                "uploadUrl":"#",//必须，上传地址
                "autoCommit":false,//是否自动上传
                "canDrag":true,//是否可以拖动
                "fileType":"*",//文件类型
                "size":"-1",//文件大小限制,单位kB
                "ismultiple":true,//是否选择多文件
                "filelSavePath":"",//文件上传地址，后台设置的根目录
                "beforeUpload":function(opt){//在上传前面执行的回调函数
                },
                "onUpload":function(opt){//在上传之后
                    //showMsg("hellos",null);
                }

            };
            return initOption;
        },
        /**
         * 初始化布局
         * @param opt 参数对象
         */
        "initWithLayout":function(opt){
            var uploadId = opt.uploadId;
            //选择文件和上传按钮模板
            var btsStr = "";
            btsStr += "<div class='uploadBts'>";
            btsStr += "<div>";
            btsStr += "<div class='selectFileBt'>选择文件</div>";
            btsStr += "</div>";
            /*btsStr += "<div class='uploadFileBt'>";
            btsStr += "<i class='iconfont icon-shangchuan'></i>";
            btsStr += " </div>";*/
            btsStr += "<div class='cleanFileBt' style='color:red;margin-top:12px;font-size: 13px;'>";
            btsStr += "清除";
            btsStr += " </div>";
            btsStr += "</div>";
            $("#"+uploadId).append(btsStr);
            //添加文件显示框
            var boxStr = "<div class='box'></div>";
            $("#"+uploadId).append(boxStr);
        },
        /**
         * 初始化拖拽事件
         * @param opt 参数对象
         */
        "initWithDrag":function(opt){
            var canDrag = opt.canDrag;
            var uploadId = opt.uploadId;
            if(canDrag){
                $(document).on({
                    dragleave:function(e){//拖离 
                        e.preventDefault();
                    },
                    drop:function(e){//拖后放 
                        e.preventDefault();
                    },
                    dragenter:function(e){//拖进 
                        e.preventDefault();
                    },
                    dragover:function(e){//拖来拖去 
                        e.preventDefault();
                    }
                });
                var box = $("#"+uploadId+" .box").get(0);
                if(box!=null){
                    //验证图片格式，大小，是否存在
                    box.addEventListener("drop",function(e) {
                        uploadEvent.dragListingEvent(e,opt);
                    });
                }
            }
        },
        /**
         * 初始化选择文件按钮
         * @param opt
         */
        "initWithSelectFile":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+" .uploadBts .selectFileBt").on("click",function(){
                uploadEvent.selectFileEvent(opt);
            });
        },
        /**
         * 初始化文件上传
         * @param opt
         */
        "initWithUpload":function(opt){
            var uploadId = opt.uploadId;
            custom_opt = opt;
            $("#"+uploadId+" .uploadBts .uploadFileBt").on("click",function(){
            	uploadEvent.uploadFileEvent(opt);
            });
            $("#"+uploadId+" .uploadBts .uploadFileBt i").css("color","#0099FF");
        },
        /**
         * 添加文件到列表
         * */
        "addFileList":function(fileList,opt){
            var uploadId = opt.uploadId;
            var boxJsObj =  $("#"+uploadId+" .box").get(0);
            var fileListArray=uploadFileList.getFileList(opt);
            var fileNumber = uploadTools.getFileNumber(opt);
            if(fileNumber+fileList.length>opt.maxFileNumber){
                showMsg("最多只能上传"+opt.maxFileNumber+"个文件",null);
                return;
            }
            var imgtest=/image\/(\w)*/;//图片文件测试
            var fileTypeArray = opt.fileType;//文件类型集合
            var fileSizeLimit = opt.size;//文件大小限制
            for(var i=0;i<fileList.length;i++){
                //判断文件是否存在
                if(uploadTools.fileIsExit(fileList[i],opt)){
                    showMsg("文件（"+fileList[i].name+"）已经存在！",null);
                    continue;
                }
                var fileTypeStr =  uploadTools.getSuffixNameByFileName(fileList[i].name);
                //文件大小显示判断
                if(fileSizeLimit!=-1&&fileList[i].size>(fileSizeLimit*1000)){
                    showMsg("文件（"+fileList[i].name+"）超出了大小限制！请控制在"+fileSizeLimit+"KB内",null);
                    continue;
                }
                //文件类型判断
                if(fileTypeArray=="*"||uploadTools.isInArray(fileTypeStr,fileTypeArray)){
                    var fileTypeUpcaseStr = fileTypeStr.toUpperCase();
                    if(imgtest.test(fileList[i].type)){
                        //var imgUrlStr = window.webkitURL.createObjectURL(fileList[i]);//获取文件路径
                        var imgUrlStr ="";//获取文件路径
                        if (window.createObjectURL != undefined) { // basic
                            imgUrlStr = window.createObjectURL(fileList[i]);
                        } else if (window.URL != undefined) { // mozilla(firefox)
                            imgUrlStr = window.URL.createObjectURL(fileList[i]);
                        } else if (window.webkitURL != undefined) { // webkit or chrome
                            imgUrlStr = window.webkitURL.createObjectURL(fileList[i]);
                        }
                        var fileModel = uploadTools.getShowFileType(true,fileTypeUpcaseStr,fileList[i].name,imgUrlStr,fileListArray.length);
                        $(boxJsObj).append(fileModel);
                    }else{
                        var fileModel = uploadTools.getShowFileType(false,fileTypeUpcaseStr,fileList[i].name,null,fileListArray.length);
                        $(boxJsObj).append(fileModel);
                    }
                    uploadTools.initWithDeleteFile(opt);
                    fileListArray[fileListArray.length] = fileList[i];
                }else{
                    showMsg("不支持该格式文件上传:"+fileList[i].name);
                }
            }
            uploadFileList.setFileList(fileListArray,opt);

        },
         /**
         * 判断某个值是否在这个数组内
         * */
        "isInArray":function(strFound,arrays){
            var ishave = false;
            for(var i=0;i<arrays.length;i++){
                if(strFound==arrays[i]){
                    ishave = true;
                    break;
                }
            }
            return ishave;
        },
        /**
         * 返回显示文件类型的模板
         * @param isImg 是否式图片：true/false
         * @param fileType 文件类型
         * @param fileName 文件名字
         * @param isImgUrl 如果事文件时的文件地址默认为null
         */
        "getShowFileType":function(isImg,fileType,fileName,isImgUrl,fileCodeId){
            var showTypeStr="<div class='fileType'>"+fileType+"</div> <i class='iconfont icon-wenjian'></i>";//默认显示类型
            var modelStr="";
            if(isImg){//图片
                if(isImgUrl!=null&&isImgUrl!="null"&&isImgUrl!=""){//图片显示类型
                    showTypeStr = "<img src='"+isImgUrl+"'/>";
                }
                modelStr+="<div class='fileItem'  fileCodeId='"+fileCodeId+"'>";
                //modelStr+="<div class='imgShow' onclick=\"showLarge('"+showTypeStr+"')\">";
                modelStr+="<div class='imgShow' onclick=\"showLarge(this)\">";
                
                modelStr+=showTypeStr;
                modelStr+=" </div>";
                modelStr+="<div class='custom_fileName' style='display:none;'>";
                modelStr+=fileName;
                modelStr+=" </div>";
                modelStr+="<div class='status'>";
                modelStr+="<i class='glyphicon glyphicon-trash'></i><span class='fileName' title="+fileName+">"+(fileName.length<=5?fileName:fileName.substring(0,5)+'..')+"</<span>";
                modelStr+="</div>";
                modelStr+=" </div>";
            }else{//文件
            	
            	//showTypeStr="<div class='fileType'>"+fileType+"</div> <i class='iconfont icon-wenjian'></i>";//默认显示类型
            	
            	showTypeStr = "<div class='fileType'>"+fileType+"</div><img style='margin-top:5px;' src='"+getRootPath()+"/public/images/file.png'/>";
            	
            	 modelStr+="<div class='fileItem'  fileCodeId='"+fileCodeId+"'>";
                
            	 modelStr+="<div class='' style='width: 115px;height: 70px;'>";
                 modelStr+=showTypeStr;
                 modelStr+="</div>";
           
                 modelStr+="<div class='status'>";
                 modelStr+="<i class='glyphicon glyphicon-trash'></i><span class='fileName' title="+fileName+">"+(fileName.length<=5?fileName:fileName.substring(0,5)+'..')+"</<span>";
                 modelStr+="</div>";
                 modelStr+=" </div>";
            }
            
           
            return modelStr;
        },
        
        /**
         * 删除文件
         * @param opt
         */
        "initWithDeleteFile":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+" .fileItem .status i").on("click",function(){
                uploadEvent.deleteFileEvent(opt,this);
            })
        },
        /**
         * 获取文件个数
         * @param opt
         */
        "getFileNumber":function(opt){
            var number = 0;
            var fileList = uploadFileList.getFileList(opt);
            for(var i=0;i<fileList.length;i++){
                if(fileList[i]!=null){
                    number++;
                }
            }
            return number;
        },
        /**
         * 禁用文件上传
         */
        "disableFileUpload":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+" .uploadBts .uploadFileBt").off();
            $("#"+uploadId+" .uploadBts .uploadFileBt i").css("color","#DDDDDD");

        },
        /**
         * 禁用文件清除
         */
        "disableCleanFile":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+" .uploadBts .cleanFileBt").off();
            $("#"+uploadId+" .uploadBts .cleanFileBt i").css("color","#DDDDDD");
        },
        /**
         * 初始化清除文件
         * @param opt
         */
        "initWithCleanFile":function(opt){

            var uploadId = opt.uploadId;
            $("#"+uploadId+" .uploadBts .cleanFileBt").on("click",function(){
                uploadEvent.cleanFileEvent(opt);
            });
            $("#"+uploadId+" .uploadBts .cleanFileBt i").css("color","#0099FF");

        },
        /**
         * 文件是否已经存在
         * */
        "fileIsExit":function(file,opt){
            var fileList = uploadFileList.getFileList(opt);
            var ishave = false;
            for(var i=0;i<fileList.length;i++){
                //文件名相同，文件大小相同
                if(fileList[i]!=null&&fileList[i].name ==file.name&&fileList[i].size==file.size){
                    ishave = true;
                }
            }
            return ishave;
        },
        /**
         * 获取文件名后缀
         * @param fileName 文件名全名
         * */
        "getSuffixNameByFileName":function(fileName){
            var str = fileName;
            var pos = str.lastIndexOf(".")+1;
            var lastname = str.substring(pos,str.length);
            return lastname;
        },
        /**
         * 清除选择文件的input
         * */
        "cleanFilInputWithSelectFile":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+"_file").remove();
        },
        /**
         * 上传文件
         */
        "uploadFile":function(opt){
            var uploadUrl = opt.uploadUrl;
            var fileList = uploadFileList.getFileList(opt);

            var formData = new FormData();
            var fileNumber = uploadTools.getFileNumber(opt);
            if(fileNumber<=0){
                showMsg("没有文件，不支持上传",null);
                return;
            }
            if(opt.otherData!=null&&opt.otherData!=""){
                for(var j=0;j<opt.otherData.length;j++){
                    formData.append(opt.otherData[j].name,opt.otherData[j].value);
                }
            }
            console.log("zxm1:"+JSON.stringify(formData));

            for(var i=0;i<fileList.length;i++){
                if(fileList[i]!=null){
                    formData.append("file",fileList[i]);
                }
            }
            

            formData.append("filelSavePath",opt.filelSavePath);
            if(uploadUrl!="#"&&uploadUrl!="") {
                uploadTools.disableFileUpload(opt);//禁用文件上传
                uploadTools.disableCleanFile(opt);//禁用清除文件
    						console.log("zxm2:"+JSON.stringify(formData));;		
               /* $.ajax({
                    type: "post",
                    url: uploadUrl,
                    data: formData,
                    processData: false,
                    contentType: false,
                      beforeSend: function(request) {
                     request.setRequestHeader("filePath", file_path);
                     }, 
                    success: function (data) {
                        uploadTools.initWithCleanFile(opt);
                        setTimeout(function () {
                            opt.onUpload(opt, data)
                        }, 500);
                    },
                    error: function (e) {

                    }
                });*/

            }

        },
        /**
         * 上传文件失败集体显示
         * @param opt
         */
        "uploadError":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+" .box .fileItem .status>i").addClass("iconfont icon-cha");
        },

    }

    /**
     * 上传事件操作
     * */
    var uploadEvent = {
        /**
         * 拖动时操作事件
         */
        "dragListingEvent":function(e,opt){

            e.preventDefault();//取消默认浏览器拖拽效果 
            var fileList = e.dataTransfer.files;//获取文件对象
            uploadTools.addFileList(fileList,opt);
            if(opt.autoCommit){
                uploadEvent.uploadFileEvent(opt);
            }

        },
        /**
         * 删除文件对应的事件
         * */
        "deleteFileEvent":function(opt,obj){
            var fileItem = $(obj).parent().parent();
            var fileCodeId = fileItem.attr("fileCodeId");
            var fileListArray = uploadFileList.getFileList(opt);
            delete fileListArray[fileCodeId];
            uploadFileList.setFileList(fileListArray,opt);
            fileItem.remove();

        },
        /**
         * 选择文件按钮事件
         * @param opt
         */
        "selectFileEvent":function(opt){
            var uploadId = opt.uploadId;
            var ismultiple = opt.ismultiple;
            var inputObj=document.createElement('input');
            inputObj.setAttribute('id',uploadId+'_file');
            inputObj.setAttribute('type','file');
            inputObj.setAttribute("style",'visibility:hidden');
            if(ismultiple){//是否选择多文件
                inputObj.setAttribute("multiple","multiple");
            }
            $(inputObj).on("change",function(){
                uploadEvent.selectFileChangeEvent(this.files,opt);
            });
            document.body.appendChild(inputObj);
            inputObj.click();
        },
        /**
         * 选择文件后对文件的回调事件
         * @param opt
         */
        "selectFileChangeEvent":function(files,opt){
            uploadTools.addFileList(files,opt);
            uploadTools.cleanFilInputWithSelectFile(opt);

            if(opt.autoCommit){
                uploadEvent.uploadFileEvent(opt);
            }
        },
        /**
         * 清除选择文件的input
         * */
        "cleanFilInputWithSelectFile":function(opt){
            var uploadId = opt.uploadId;
            $("#"+uploadId+"_file").remove();
        },
        /**
         * 上传文件的事件
         * */
        "uploadFileEvent":function(opt){
            opt.beforeUpload(opt);

            uploadTools.uploadFile(opt);
        },
        /**
         * 清除文件事件
         */
        "cleanFileEvent":function(opt){
            var uploadId = opt.uploadId;
            if(opt.showSummerProgress){
                $("#"+uploadId+" .subberProgress").css("display","none");
                $("#"+uploadId+" .subberProgress .progress>div").css("width","0%");
                $("#"+uploadId+" .subberProgress .progress>div").html("0%");
            }
            uploadTools.cleanFilInputWithSelectFile(opt);
            uploadFileList.setFileList([],opt);
            $("#"+uploadId+" .box").html("");
            uploadTools.initWithUpload(opt);//初始化上传
        }

    }
    var uploadFileList={
        "initFileList":function(opt){
            opt.fileList = new Array();
        },
        "getFileList":function(opt){
            return opt.fileList;
        },
        "setFileList":function(fileList,opt){
            opt.fileList = fileList;
        }
    } 
    /**
     * 显示大图
     */
    function showLarge(id)
    {
    	var html = $(id).html();
    	var fileName = $(id).siblings(".custom_fileName").html();
    	html += '<p style="text-align: center;margin-top:15px;">'+fileName+'<p>';
    	$("#img_content").html(html);
    	$("#img_content img").prop("height","300");
    	$("#img_content img").prop("width","500");
    	$("#com-alertImg").modal("show");
    }	