<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div class="table-responsive" id="remove">
		<table class="table">
			<thead>
				<tr class="text-main">
					<td>申请人学号</td>
					<td>申请人姓名</td>
					<td>申请类型</td>
					<td>申请人签字</td>
					<!-- <td class="text-dot">操作</td> -->
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${stu_lists }" var="stu">
					<tr id="hover">
						<td>${stu.s_no }</td>
						<td>${stu.s_name }</td>
						<td>${stu.c_name }</td>
						<td><img width="50px" height="25px"
							src="<%=request.getContextPath() %>${stu.s_img }" /></td>
						<%-- <td><a class="icon-edit" href="handle_approve/${app.a_id}" id="edit_approve" style="color: red;">修改</a>
							<a href="deleteApprove/${app.a_id}" class="icon-recycle">删除</a></td> --%>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</div>
	</body>
</html>