<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>根据类型id查看的页面</title>
<jsp:include page="css_js.jsp"></jsp:include>
<style type="text/css">
tr:HOVER {
	color: rgb(0, 152, 204);
}

#table tr th {
	text-align: center;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".del").click(function() {
			var r_id=$(this).attr("value_role");
			var c_id=$(this).attr("value_change");
			$.post("deleteChangeRole",{
				r_id:r_id,
				c_id:c_id
			},function(data){
				window.location.reload();
			});
		});
	});
</script>
</head>
<body>
	<strong class="text-dot">${msg}</strong>
	<table class="table" id="table">
		<tr>
			<th>异动类型</th>
			<th>角色名称</th>
			<th>顺序</th>
			<th>总步骤</th>
			<th>操作</th>
		</tr>
		<c:forEach items="${changeRole_list }" var="change">
			<tr>
				<td>${change.c_name }</td>
				<td>${change.r_name }</td>
				<td>${change.rc_sort }</td>
				<td>${change.c_number }</td>
				<!--使用异步删除  -->
				<td><a href="#" style="color: orangered" class="del" value_role="${change.r_id }" value_change="${change.c_id }">删除</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>