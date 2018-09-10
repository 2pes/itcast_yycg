<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<style>
.textbox-label, .textbox-label-before {
	text-align: center !important;
}
</style>
<div style="width: 730px; margin: 0 auto;">
	<form class="easyui-form" id="userform" action="${baseurl}user/addsysusersubmit" method="post" data-options="novalidate:true">

		<div style="margin: 20px 0;">
			<input class="easyui-textbox" id="sysuser_userid" name="sysuserCustom.userid" style="width: 48%" data-options="label:'用户账号：',required:true">
			<input class="easyui-textbox" id="sysuser_username" name="sysuserCustom.username" style="width: 48%" data-options="label:'用户名称：',required:true">
		</div>
		<div style="margin: 20px 0;">
			<input class="easyui-passwordbox" id="sysuser_password" name="sysuserCustom.pwd" style="width: 48%" data-options="label:'用户密码：',required:true">
			<select class="easyui-combobox" name="sysuserCustom.groupid" id="sysuser_groupid" style="width: 48%" data-options="label:'用户类型：'">
				<option value="">请选择</option>
				<option value="1">卫生局</option>
				<option value="2">卫生院</option>
				<option value="3">卫生室</option>
				<option value="4">供货商</option>
				<option value="0">系统管理员</option>
			</select>
		</div>
		<div style="margin: 20px 0;">
			<input class="easyui-textbox" name="sysuserCustom.sysmc" style="width: 48%" data-options="label:'单位名称：',required:true">
			<label class="textbox-label textbox-label-before" style="text-align: left; height: 30px; line-height: 30px;">用户状态：</label>
			<!-- <input class="easyui-switchbutton" name="sysuserCustom.userstate" data-options="onText:'正常',offText:'暂停'"> -->
			<input class="easyui-radiobutton" name="sysuserCustom.userstate" value="1" label="正常">
			<input class="easyui-radiobutton" name="sysuserCustom.userstate" value="0" label="暂停">
		</div>
		<div style="margin: 20px 0;">
		<label class="textbox-label textbox-label-before" style="text-align: left; height: 30px; line-height: 30px;">角色分配：</label>
			<input class="easyui-radiobutton" name="sysuserCustom.userrole" value="1" label="超级管理员">
			<input class="easyui-radiobutton" name="sysuserCustom.userrole" value="0" label="管理员">
			<input class="easyui-radiobutton" name="sysuserCustom.userrole" value="0" label="管理员">
		</div>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="sysusersave()" style="width: 80px">提交</a>
			<a href="javascript:void(0)" class="easyui-linkbutton" onclick="parent.closemodalwindow()" style="width: 80px">关闭</a>
		</div>
	</form>
	<!-- sysuser_useridTip用于显示提示信息，提示div的id等于校验input的id+Tip -->
	<div id="sysuser_useridTip"></div>
</div>
<script>
	function submitForm() {
		$('#userform').form('submit', {
			onSubmit : function() {
				return $(this).form('enableValidation').form('validate');
			}
		});
	}

	function sysusersave() {
		jquerySubByFId('userform', sysusersave_callback, null, "json");

	}
	function sysusersave_callback(data) {
		message_alert(data);

	}
	function clearForm() {
		$('#userform').form('clear');
		parent.closemodalwindow();

	}
</script>


