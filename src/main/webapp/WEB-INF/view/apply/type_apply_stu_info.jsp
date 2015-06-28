<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="field field-icon-right">
		<div style="width: 100%; height: 40px">
			<div class=" border border-blue radius-big float-left "
				id="option_head"
				style="width: auto; padding-left: 10px; padding-right: 10px;">${student.xm }的信息</div>
			<div class="border border-blue radius-big float-right"
				id="option_head"
				style="width: auto; padding-left: 10px; padding-right: 10px">${change.c_name }信息</div>
		</div>
		<div class="border border-green radius-big float-left"
			id="before_info" style="width: 40%; padding: 10px 20px">
			<table></table>
			<input type="text" name="stu.c_id" value="${change.c_id }"
				style="display: none;"> <input type="text"
				name="stu.s_password" value="${student.xsmm }"
				style="display: none;"> <label id="option_label">学号:</label><input
				readonly="readonly" type="text" class="none" id="s_no"
				name="stu.s_no" placeholder="学号" value="${student.xh }" /><label
				id="option_label ">姓名:</label> <input readonly="readonly"
				type="text" class="none" id="s_name" name="stu.s_name"
				placeholder="姓名" value="${student.xm }" /> <br> <label
				id="option_label">性别:</label><input class="none" readonly="readonly"
				type="text" name="stu.s_sex" value="${student.xb}"><label
				id="option_label id="option_label">您所在的学院:</label> <select
				id="s_before_academy" readonly="readonly" class="none"
				name="stu.s_before_academy">
				<option>${student.xy}</option>

			</select> <br> <label id="option_label">您的专业:</label> <select
				id="s_before_subject" class="none" name="stu.s_before_subject">
				<option>${student.zymc}</option>
			</select><br> <label id="option_label">您所在的年级:</label> <input type="text"
				class="none" readonly="readonly" name="stu.s_before_grade"
				placeholder="异动前年级" readonly="readonly" value="${student.dqszj}" />
			<br> <label id="option_label">您所在的班级:</label> <input type="text"
				class="none" name="stu.s_before_class" readonly="readonly"
				placeholder="异动前班级" value="${student.xzb }" /><br> <label
				id="option_label">学制:</label> <input type="text" class="none"
				readonly="readonly" name="stu.s_year" placeholder="学制"
				value="${student.xz }" /> <label id="option_label">学籍状态:</label> <input
				type="text" readonly="readonly" name="stu.s_before_status"
				value="${student.xjzt}" class="none" /> <label id="option_label">学历状态:</label>
			<input type="text" class="none" readonly="readonly"
				name="stu.s_before_education" placeholder="学历前"
				value="${student.cc}" /> <br> <label id="option_label">注册状态:</label>
			<input type="text" name="stu.s_before_regist" class="none"
				readonly="readonly" value="${student.zc }"> <br> <label
				id="option_label">在校状态:</label> <input type="text" class="none"
				readonly="readonly" name="stu.s_before_school" value="${student.zx}">

		</div>
	</div>
</body>
</html>