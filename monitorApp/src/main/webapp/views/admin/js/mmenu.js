(function($) {
	$.fn.MainMenu = function(callback) {

		var menu_arr = [];
		var subNode = {};
		var nodes = {};

		/*------------------------------------
		* 首页
		*------------------------------------*/
		nodes = {
			title : "首页",
			isDir : true,
			image : "views/admin/images//icon/icon_home.svg",
			id : "mm_homepage",
			nodes : []
		};

		/*系统状态*/
		/*subNode = {
			title : "系统状态",
			isDir : false,
			image : "",
			id : "mm_homepage_systemstate"
		};
		nodes.nodes.push(subNode);*/

		menu_arr.push(nodes);

		nodes = {
				title : "主预览",
				isDir : true,
				image : "views/admin/images/icon/icon_analysis.svg",
				id : "mm_shexiang",
				nodes : []
			};

		subNode = {
			title : "监控摄像",
			isDir : false,
			image : "",
			id : "mm_shexiang_shezhi"
		};
		nodes.nodes.push(subNode);
		menu_arr.push(nodes);
		
		
		nodes = {
			title : "视频回放",
			isDir : true,
			image : "views/admin/images/icon/icon_stock.svg",
			id : "mm_shexiang_chunchu",
			nodes : []
		};
		subNode = {
			title : "回放地址设置",
			isDir : false,
			image : "",
			id : "mm_shexiang_shezhi_chunchu"
		};
		nodes.nodes.push(subNode);
		menu_arr.push(nodes);
		
		
		nodes = {
			title : "电子地图",
			isDir : true,
			image : "views/admin/images/icon/icon_assessment.svg",
			id : "mm_equip_map",
			nodes : []
		};
		subNode = {
			title : "设备地图位置",
			isDir : false,
			image : "",
			id : "mm_equip_location"
		};
		nodes.nodes.push(subNode);
		menu_arr.push(nodes);
		
		
		/*------------------------------------
		 * 库存管理
		 *------------------------------------*/
        /*nodes = {
            title : "库存管理",
            isDir : true,
            image : "views/admin/images/icon/icon_stock.svg",
            id : "mm_repertory",
            nodes : []
        };

        subNode = {
            title : "当前库存",
            isDir : false,
            image : "",
            id : "mm_repertory_dqkc"
        };
        nodes.nodes.push(subNode);

        subNode = {
            title : "入库记录",
            isDir : false,
            image : "",
            id : "mm_repertory_rkjl"
        };
        nodes.nodes.push(subNode);

        subNode = {
            title : "调拨/出库记录",
            isDir : false,
            image : "",
            id : "mm_repertory_dbckjl"
        };
        nodes.nodes.push(subNode);

        menu_arr.push(nodes);*/

		/*------------------------------------
		* 设备管理
		*------------------------------------*/
		nodes = {
			title : "设备管理",
			isDir : true,
			image : "views/admin/images/icon/icon_equipment.svg",
			id : "mm_devicemanage",
			nodes : []
		};

		subNode = {
			title : "所有设备",
			isDir : false,
			image : "",
			id : "mm_devicemanage_fjxt"
		};
		nodes.nodes.push(subNode);

		/*subNode = {
			title : "设备区域",
			isDir : false,
			image : "",
			id : "mm_regionmanage_sbqy"
		};
		nodes.nodes.push(subNode);

        subNode = {
            title : "库存管理",
            isDir : false,
            image : "",
            id : "mm_repertory_management"
        };
        nodes.nodes.push(subNode);*/

		menu_arr.push(nodes);



		
		nodes = {
			title : "基础设置",
			isDir : true,
			image : "views/admin/images/icon/icon_set.svg",
			id : "mm_systemmanage",
			nodes : []
		};

		subNode = {
			title : "分组管理",
			isDir : false,
			image : "",
			id : "mm_systemmanage_fzgl"
		};
		nodes.nodes.push(subNode);

		subNode = {
			title : "用户管理",
			isDir : false,
			image : "",
			id : "mm_systemmanage_yhgl"
		};
		nodes.nodes.push(subNode);

		
		
		/*subNode = {title:"设备种类管理",
				   isDir:false,
				   image:"",
				   id:"mm_systemmanage_deviceKind"	
		};
		nodes.nodes.push(subNode);*/
		
		menu_arr.push(nodes);


		nodes = {
				title : "日志管理",
				isDir : true,
				image : "views/admin/images/icon/icon_abnormal.svg",
				id : "mm_rizhi",
				nodes : []
			};

		subNode = {title:"请求历史记录",
				isDir:false,
				image:"",
				id:"mm_TaskHistoryManager_task"	
		};
		nodes.nodes.push(subNode);
		
		subNode = {title:"登录历史记录",
				isDir:false,
				image:"",
				id:"mm_TaskHistoryManager_task_login"	
		};
		nodes.nodes.push(subNode);
		menu_arr.push(nodes);
		
		
		function isDirHaveChild(id) {
			for (var i = 0; i < menu_arr.length; i++) {
				var node = menu_arr[i];
				if (node.id == id) {
					if (node.nodes.length == 0) {
						return false;
					} else {
						return true;
					}
				}
			}
			return false;
		}

		return this.each(function() {
			$this = $(this);

			for (var i = 0; i < menu_arr.length; i++) {

				var nodes = menu_arr[i];

				var dirMenu = '<div class="panel-heading" id="gh_'
						+ i
						+ '" data-toggle="collapse" data-target="#'
						+ nodes.id
						+ '" role="tab">'
						+ '<ul class="nav nav-pills">'
						+ '<li>'
						+ '<img class="menu_group_img" src="'
						+ nodes.image
						+ '" />'
						+ '</li>'
						+ '<li>'
						+ '<h4 class="panel-title menu_group_text">'
						+ nodes.title
						+ '</h4>'
						+ '</li>'
						// + '<li>'
						// + '<span class="glyphicon glyphicon-chevron-up right menu_group_arrow"></span>'
						// + '</li>'
						+ '</ul>' + '</div>';

				$this.append(dirMenu);

				if (nodes.nodes.length == 0)
					continue;

				var itemMenu = '<div id="'
						+ nodes.id
						+ '" class="panel-collapse collapse" role="tabpanel" aria-labelledby="gh_'
						+ i + '">';

				for (var j = 0; j < nodes.nodes.length; j++) {
					var node = nodes.nodes[j];

					itemMenu += '<ul class="nav subMenu">' + '<li>'
							+ '<div id="' + node.id
							+ '" class="menu-item-left">' + node.title
							+ '</div>' + '</li>' + '</ul>';
				}

				itemMenu += '</div>';

				$this.append(itemMenu);
			}
			$(".panel-heading").click(
					function(e) {
						/* 切换折叠指示图标 */
						//首页
						var id = e.currentTarget.id;
						if(id=="gh_0")
						{
							//getMessage();
							//去掉首页样式
							var parent = document.getElementById("gh_0");
							parent.style.color="";
							var child = parent.children[0].children[0].children[0];
							child.src = child.src.replace("_hover.svg", ".svg");
							$(".main_menu div ul li div").each(function(index,item)
							{
								var class_id = $(item)[0].id;
								document.getElementById(class_id).style.background = '';
								document.getElementById(class_id).style.color = '';

								var parent = document.getElementById(class_id).parentElement.parentElement.parentElement.previousSibling;
								parent.style.color="";
								var child = parent.children[0].children[0].children[0];
								child.src = child.src.replace("_hover.svg", ".svg");
							});
							var parent = document.getElementById(id);
							parent.style.color="#fff";
							var child = parent.children[0].children[0].children[0];
							child.src = child.src.replace(".svg", "_hover.svg");
							//跳转到首页
							var frame = document.getElementById('rt_frame_conent');
							frame.src = getRootPath()+'/loginAndout/toPage?path=admin/home/home';

							return;
						}

						$(this).find("span").toggleClass("glyphicon-chevron-down");
						$(this).find("span").toggleClass("glyphicon-chevron-up");
					});

			$(".menu-item-left").click(function(e) {
				callback(e.target.id);
			});
		});
	};
})(jQuery);