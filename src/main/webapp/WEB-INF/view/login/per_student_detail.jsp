<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<input type="text" id="r_level" value="${stu.r_level}" style="display: none;" />
	<table
		class="table text-little ">
		<tr>
			<td>学号:</td>
			<td>${stu.s_no}</td>
		</tr>	
		<tr>
			<td>姓名:</td>
			<td>${stu.s_name}</td>
		</tr>
		<tr>
			<td>性别:</td>
			<td>${stu.s_sex}</td>

		</tr>
		<tr>
			<td>签字图片:</td>
			<td><img class="radius"" alt="签字图片" src="../upload/image/${stu.s_no}.jpg"
				style="width: 100px; height: 60px"></td>

		</tr>

		<tr>
			<td>异动类型:</td>
			<td style="color: red;">${change.c_name}</td>

		</tr>
		<tr>
			<td>原学院:</td>
			<td>${stu.s_before_academy}</td>

		</tr>
		<tr>
			<td>现学院:</td>
			<td>${stu.s_after_academy}</td>

		</tr>
		<tr>
			<td>原专业:</td>
			<td>${stu.s_before_subject}</td>

		</tr>
		<tr>
			<td>现专业:</td>
			<td>${stu.s_after_subject}</td>

		</tr>
		<tr>
			<td>原班级:</td>
			<td>${stu.s_before_class}</td>

		</tr>
		<tr>
			<td>现班级:</td>
			<td> ${stu.s_after_class} </td>

		</tr>
		<tr>
			<td>原学籍状态:</td>
			<td>${stu.s_before_status}</td>

		</tr>
		<tr>
			<td>现学籍状态:</td>
			<td>${stu.s_after_status}</td>

		</tr>
		<tr>
			<td>原学历:</td>
			<td>${stu.s_before_education}</td>

		</tr>
		<tr>
			<td>现学历:</td>
			<td>${stu.s_after_education}</td>

		</tr>
		<tr>
			<td>之前是否注册:</td>
			<td>${stu.s_before_regist}</td>

		</tr>
		<tr>
			<td>之后是否注册:</td>
			<td>${stu.s_after_regist}</td>

		</tr>
		<tr>
			<td>之前是否在校:</td>
			<td>${stu.s_before_school}</td>

		</tr>
		<tr>
			<td>之后是否在校:</td>
			<td>${stu.s_after_school}</td>

		</tr>
		<tr>
			<td>变动时间:</td>
			<td>${stu.s_changetime}</td>

		</tr>
	</table>
	</body>
</html>