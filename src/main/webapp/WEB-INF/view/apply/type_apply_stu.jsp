<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="css_js.jsp"></jsp:include>
<title>申请页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	$(function() {
		var change_type = $("#change_type").val();
		$.post("findByChangeType", {
			q : change_type
		}, function(data) {
		});
	});
	$(document).ready(function() {
		var academy = $("#s_after_academy").val();
		$.post("getSubjectbyAcademy", {
			q : academy
		}, function(data) {
			var html = "";
			if (data == "无") {
				html += "<option>无</option>";
				$("#s_after_subject").html(html);
			} else {
				for ( var i in data) {
					html += "<option>" + data[i].zymc + "</option>";
				}
				$("#s_after_subject").html(html);
			}
		});
		$("#s_after_academy").change(function() {
			var academy = $("#s_after_academy").val();
			$.post("getSubjectbyAcademy", {
				q : academy
			}, function(data) {
				var html = "";
				for ( var i in data) {
					html += "<option>" + data[i].zymc + "</option>";
					if (data[i].zymc == undefined) {
						html = "";
						html += "<option>无</option>";
					}
				}
				$("#s_after_subject").html(html);
			});
		});
	});
</script>
</head>

<body>
	<blockquote class="border-main quote-floatleft float-right"
		style="width: 59%;">
		<p>
		<div class="border border-green radius-big  "
			style="width: 100%; padding: 8px 10px;">
			<div class="alert alert-yellow">
				<span class="close rotate-hover"></span><strong>注意：</strong>如果您不需要填写学院和专业的话,请填写您原来的信息,否则请承担相应的责任。
			</div>
			<input type="text" style="display: none;" id="change_type"
				value="${change.c_name}" /> <label id="option_label">学院:</label> <select
				id="s_after_academy" class="input" name="stu.s_after_academy">
				<option>无</option>
				<c:forEach items="${list_academy}" var="academy">
					<option>${academy.xymc}</option>
				</c:forEach>
			</select> <label id="option_label">专业:</label> <select id="s_after_subject"
				class="input" name="stu.s_after_subject">
				<option></option>
			</select>
			<div class="form-group">
				<div class="field ">
					<label id="option_label">年级:</label>
					<select class=" input" name="stu.s_after_grade">
						<option><%=new Date().getYear() - 4 + 1900%></option>
						<option><%=new Date().getYear() - 3 + 1900%></option>
						<option><%=new Date().getYear() - 2 + 1900%></option>
						<option><%=new Date().getYear() - 1 + 1900%></option>
						<option><%=new Date().getYear() + 1900%></option>
						<option><%=new Date().getYear() + 1 + 1900%></option>
					</select>
				</div>
			</div>
			<label id="option_label" style="display: none;">班级:</label> <input
				type="text" class="input" style="display: none;" value="未分配"
				name="stu.s_after_class" placeholder="异动后班级" /> <label
				id="option_label">学籍状态:</label><input type="radio"
				name="stu.s_after_status" value="有" checked="checked"> 有<input
				type="radio" name="stu.s_after_status" value="无"
				style="margin-left: 20px"> 无<br>

			<label id="option_label">注册状态:</label><input type="radio"
				name="stu.s_after_regist" value="有" checked="checked"> 有 <input
				type="radio" name="stu.s_after_regist" value="无"
				style="margin-left: 20px">无<br> <label
				id="option_label">在校状态:</label> <input type="radio"
				name="stu.s_after_school" value="有" checked="checked"> 有 <input
				type="radio" name="stu.s_after_school" value="无"
				style="margin-left: 20px">无<br> <input type="submit"
				value="提交申请" class=" btn btn-primary radius-big  " id="submit_apply"
				style="width: 100%; height: 100px" />
		</div>

		</p>
	</blockquote>
</body>
</html>