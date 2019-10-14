<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>

<script type="text/javascript">
	//datagrid列定义
	var columns_v = [ [
			{
				field : 'ck',
				checkbox : true,
				align : 'center',
				width : 120
			},
			{
				field : 'userid',//对应json中的key
				title : '账号',
				align : 'center',
				width : 120
			},
			{
				field : 'username',//对应json中的key
				title : '名称 ',
				align : 'center',
				width : 180
			},
			{
				field : 'groupid',//对应json中的key
				title : '用户类型',
				align : 'center',
				width : 120,
				formatter : function(value, row, index) {//通过此方法格式化显示内容,value表示从json中取出该单元格的值，row表示这一行的数据，是一个对象,index:行的序号
					if (value == '1') {
						return "卫生局";
					} else if (value == '2') {
						return "卫生院";
					} else if (value == '3') {
						return "卫生室";
					} else if (value == '4') {
						return "供货商";
					} else if (value == '0') {
						return "系统管理员";
					}
				}

			},
			{
				field : 'sysmc',//对应json中的key
				title : '所属单位',
				align : 'center',
				width : 120
			},
			{
				field : 'userstate',//对应json中的key
				title : '状态',
				align : 'center',
				width : 120,
				formatter : function(value, row, index) {//通过此方法格式化显示内容,value表示从json中取出该单元格的值，row表示这一行的数据，是一个对象,index:行的序号
					if (value == '1') {
						return "正常";
					} else if (value == '0') {
						return "暂停";
					}
				}
			},
			{
				field : 'operate',
				title : '操作',
				align : 'center',
				width : $(this).width() * 0.1,
				formatter : function(value, row, index) {
					var str = '<a href="#" name="operaEdit" class="easyui-linkbutton" ></a><a href="#" name="operaDel" class="easyui-linkbutton" ></a>';
					return str;
				}
			} ] ];

	//查询方法
	function queryuser() {
		//datagrid的方法load方法要求传入json数据，最终将 json转成key/value数据传入action
		//将form表单数据提取出来，组成一个json
		var formdata = $("#sysuserqueryForm").serializeJson();
		$('#sysuserlist').datagrid('load', formdata);
	}

	$('#sysuserlist').datagrid({
		onLoadSuccess : function(data) {
			$("a[name='operaEdit']").linkbutton({
				text : '编辑',
				plain : true,
				iconCls : 'icon-edit'
			});
			$("a[name='operaDel']").linkbutton({
				text : '删除',
				plain : true,
				iconCls : 'icon-cancel'
			});
		},
		fit : true
	});
</script>

<table id="sysuserlist" class="easyui-datagrid"
	data-options="url:'${baseurl }user/queryuser_result'
			,fitColumns:true
			,singleSelect:false
			,columns:columns_v
			,toolbar:'#sysusertb'
			,pagination : true
			,pagePosition:'bottom'
			,striped : true
			,nowrap : true
			,idField : 'id'
			,clientPaging : false
			,rownumbers : true
			,pageList : [ 15, 30, 50 ]
			,pageSize : 15
			
			">

</table>

<div id="sysusertb" style="padding: 12px 15px;">
	<form id="sysuserqueryForm">
		用户账号：
		<input class="easyui-textbox" style="width: 110px" name="sysuserCustom.userid">
		用户名称：
		<input class="easyui-textbox" style="width: 110px" name="sysuserCustom.username">
		单位名称：
		<input class="easyui-textbox" style="width: 110px" name="sysuserCustom.sysmc">
		用户类型：
		<select class="easyui-combobox" panelHeight="auto" style="width: 150px" name="sysuserCustom.groupid">
			<option value="">请选择</option>
			<option value="1">卫生局</option>
			<option value="2">卫生院</option>
			<option value="3">卫生室</option>
			<option value="4">供货商</option>
			<option value="0">系统管理员</option>
		</select>
		<a href="#" class="easyui-linkbutton" onclick="queryuser()" iconCls="icon-search">查询</a>
		<div style="display: block; float: right;">
			<a href="#" data-options="id : 'btnadd', iconCls:'icon-add',text : '添加'" class="easyui-linkbutton" onclick="createmodalwindow('添加用户信息', 800, 350, '${baseurl}user/addsysuser');"></a>
			<a href="#" data-options="id : 'btnadd', iconCls:'icon-clear',text : '批量删除'" class="easyui-linkbutton"
				onclick="createmodalwindow('添加用户信息', 800, 250, '${baseurl}user/addsysuser');"></a>
		</div>
	</form>
</div>

