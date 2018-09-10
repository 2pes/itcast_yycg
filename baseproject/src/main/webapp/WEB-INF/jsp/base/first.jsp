<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>基础框架</title>
<%@ include file="/WEB-INF/jsp/base/common_easyui.jsp"%>
<script type="text/javascript" src="${baseurl}js/menuload.js"></script>
</head>
<body class="easyui-layout" scroll="no">
	<div data-options="region:'north',border:false" style="height: 30px; background: #B3DFDA; padding: 10px; line-height: 20px; overflow: hidden;">
		<SPAN style="padding-right: 20px; float: right;" class="head">
			欢迎当前用户：${activeUser.username}&nbsp;&nbsp;
			<A href=javascript:showhelp()>使用帮助</A>
			&nbsp;&nbsp;
			<A title='修改密码' ref='modifypwd' href="#" rel='${baseurl}user/updatepwd' icon='icon-null' id="modifypwd">修改密码</A>
			&nbsp;&nbsp;
			<A id="loginOut" href=javascript:logout()>退出系统</A>

		</SPAN>
		<SPAN style="padding-left: 10px; font-size: 16px;">
			<IMG align="absmiddle" src="images/blocks.gif" width="20" height="20">
			系统
		</SPAN>
		<SPAN style="padding-left: 15px;" id="News"></SPAN>
	</div>
	<div data-options="region:'west',split:true" style="width: 180px; padding: 5px;">
		<div id="nav" class="easyui-accordion" data-options="fit:true,border:false">
			<!--  导航内容 -->
		</div>
	</div>
	<div data-options="region:'south',border:false" style="height: 30px; background: #A9FACD; padding: 10px; line-height: 20px; overflow: hidden;">
		<div>系统版本号：${version_number}&nbsp;&nbsp;&nbsp;发布日期：${version_date}</div>
	</div>
	<div data-options="region:'center',iconCls:'icon-ok'" id="mainPanle" style="overflow: hidden;">
		<div id="tabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
			<!-- <div title="About" data-options="href:'_content.html'" style="padding: 10px"></div>
			<div title="DataGrid" style="padding: 5px">
				<table class="easyui-datagrid" data-options="url:'datagrid_data1.json',method:'get',singleSelect:true,fit:true,fitColumns:true">
					<thead>
						<tr>
							<th data-options="field:'itemid'" width="80">Item ID</th>
							<th data-options="field:'productid'" width="100">Product ID</th>
							<th data-options="field:'listprice',align:'right'" width="80">List Price</th>
							<th data-options="field:'unitcost',align:'right'" width="80">Unit Cost</th>
							<th data-options="field:'attr1'" width="150">Attribute</th>
							<th data-options="field:'status',align:'center'" width="50">Status</th>
						</tr>
					</thead>
				</table>
			</div> -->
		</div>
	</div>
	<script type="text/javascript">
		//退出系统方法
		function logout() {
			_confirm('您确定要退出本系统吗?', null, function() {
				location.href = '${baseurl}logout.controller';
			})
		}

		var tabOnSelect = function(title) {
			//根据标题获取tab对象
			var currTab = $('#tabs').tabs('getTab', title);
			var iframe = $(currTab.panel('options').content);//获取标签的内容
			
			//var src = iframe.attr('src');//获取iframe的src
			var src = currTab.panel('options').href
			//当重新选中tab时将ifram的内容重新加载一遍，目的是获取当前页面的最新内容
			if (src)
				$('#tabs').tabs('update', {
					tab : currTab,
					
					options : {
						//content : createFrame(src)
						href: src
					//ifram内容
					}
				});

		};

		var _menus;

		$(function() {//预加载方法
			//通过ajax请求菜单
			$.ajax({
				url : '${baseurl}js/menu.json',
				type : 'GET',
				dataType : 'json',
				success : function(data) {
					_menus = data;
					initMenu(_menus);//解析json数据，将菜单生成
				},
				error : function(msg) {
					alert('菜单加载异常!');
				}
			});

			//tabClose();
			//tabCloseEven();
			//加载欢迎页面
			$('#tabs').tabs('add', {
				title : '欢迎使用',
				//content : createFrame('${baseurl}welcome')
				href:'${baseurl}welcome'
			}).tabs({
				//当重新选中tab时将ifram的内容重新加载一遍
				onSelect : tabOnSelect,
				tools:[{
					iconCls:'icon-reload',
					handler:function(){
						alert('add')
					}
				},{
					iconCls:'icon-cancel',
					handler:function(){
						alert('save')
					}
				}]
			});

			//修改密码
			$('#modifypwd').click(menuclick);

		});
	</script>
</body>

</html>