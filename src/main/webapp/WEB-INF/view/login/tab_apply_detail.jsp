<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
td:HOVER {
	color: blue;
}
.even{
 border:1px solid green;
  width:200px;height:auto;
  text-shadow:#996600 5px 5px 10px;
}
</style>
<script type="text/javascript">
	$(function() {
		$("td:even").addClass("even");/* 给奇数行添加样式*/
		/* $("td:odd").addClass("odd");  偶数行添加样式*/
	});
</script>
</head>
<body>
	<input type="text" id="r_level" value="${stu.r_level}"
		style="display: none;" />
	<table
		class="table table-hover table-condensed   text-big  table-bordered" id="table">
		<tr>
			<td>学号:</td>
			<td>${stu.s_no}</td>
			<td>姓名:</td>
			<td>${stu.s_name}</td>
		</tr>

		<tr>
			<td>性别:</td>
			<td>${stu.s_sex}</td>
			<td>签字图片:</td>
			<td><img class="radius " alt="签字图片"
				src="<%=request.getContextPath() %>${stu.s_img }"
				style="width: 100px; height: 60px"></td>
		</tr>
		<tr>
			<td>异动类型:</td>
			<td style="color: red;">${stu.c_name}${change.c_name}</td>
		</tr>

		<tr>
			<td>原学院:</td>
			<td>${stu.s_before_academy}</td>
			<td>现学院:</td>
			<td>${stu.s_after_academy}</td>

		</tr>

		<tr>
			<td>原专业:</td>
			<td>${stu.s_before_subject}</td>
			<td>现专业:</td>
			<td>${stu.s_after_subject}</td>

		</tr>

		<tr>
			<td>原班级:</td>
			<td>${stu.s_before_class}</td>
			<td>现班级:</td>
			<td>${stu.s_after_class}</td>

		</tr>

		<tr>
			<td>原学籍状态:</td>
			<td>${stu.s_before_status}</td>
			<td>现学籍状态:</td>
			<td>${stu.s_after_status}</td>

		</tr>

		<tr>
			<td>原学历:</td>
			<td>${stu.s_before_education}</td>
			<td>现学历:</td>
			<td>${stu.s_after_education}</td>

		</tr>
		<tr>
			<td>之前是否注册:</td>
			<td>${stu.s_before_regist}</td>
			<td>之后是否注册:</td>
			<td>${stu.s_after_regist}</td>
		</tr>
		<tr>
			<td>之前是否在校:</td>
			<td>${stu.s_before_school}</td>
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