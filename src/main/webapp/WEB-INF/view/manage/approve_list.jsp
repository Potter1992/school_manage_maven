<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核人详情列表</title>
<style type="text/css">
#edit_approve {
	color: red;
}

.pagination a {
	display: inline-block;
	border: solid 1px #ddd;
	border-radius: 4px;
}

.pagination span {
	color: #333;
	padding: 8px 12px;
	line-height: 18px;
	display: block;
	transition: all 1s cubic-bezier(0.175, 0.885, 0.32, 1) 0s;
	display: inline-block;
	border: solid 1px #ddd;
	border-radius: 4px;
	background-color: gray;
}

#edit_approve :HOVER {
	color: black;
}
</style>
</head>
<body>
	<div class="table-responsive" id="remove">
		<table class="table">
			<thead>
				<tr class="text-main">
					<td>审核人账号</td>
					<td>审核人姓名</td>
					<td>审核人密码</td>
					<td>审核人级别</td>
					<td>审核人签字</td>
					<td>审核人角色类型</td>
					<td>审核人学院</td>
					<td>操作</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${approve_page.list }" var="app">
					<tr id="hover">
						<td>${app.a_account }</td>
						<td>${app.a_name }</td>
						<td>${app.a_password }</td>
						<td>${app.a_type }</td>
						<td><img width="50px" height="25px"
							src="<%=request.getContextPath() %>${app.a_img }" /></td>
						<td>${app.r_name }</td>
						<td>${app.a_academy }</td>
						<td><a class="icon-edit" href="handle_approve/${app.a_id}"
							id="edit_approve">修改</a> <a href="deleteApprove/${app.a_id}"
							class="icon-recycle">删除</a></td>
					</tr>


				</c:forEach>

			</tbody>

		</table>

		<c:set var="currentPage" value="${approve_page.pageNumber}" />
		<c:set var="totalPage" value="${approve_page.totalPage}" />
		<c:set var="actionUrl" value="../manage/index?page=" />
		<c:set var="urlParas" value="" />

		<%-- 	<%@ include file="_paginate.jsp"%> approve_page  totalRow  pageSize    --%>
		<c:if test="${urlParas==null}">
			<c:set var="urlParas" value="" />
		</c:if>
		<c:if test="${(totalPage > 0) && (currentPage <= totalPage)}">
			<c:set var="startPage" value="${currentPage - 4}" />
			<c:if test="${startPage < 1}">
				<c:set var="startPage" value="1" />
			</c:if>
			<c:set var="endPage" value="${currentPage + 4}" />
			<c:if test="${endPage > totalPage}">
				<c:set var="endPage" value="totalPage" />
			</c:if>

			<ul class="pagination">
				<c:if test="${currentPage <= 8}">
					<c:set var="startPage" value="1" />
				</c:if>

				<c:if test="${(totalPage - currentPage) < 8}">
					<c:set var="endPage" value="${totalPage}" />
				</c:if>

				<c:choose>
					<c:when test="${currentPage == 1}">
						<span class="disabled prev_page" >上页</span>
					</c:when>
					<c:otherwise>
						<a href="${actionUrl}${currentPage - 1}${urlParas}"
							class="prev_page">上页</a>
					</c:otherwise>
				</c:choose>

				<c:if test="${currentPage > 8}">
					<a href="${actionUrl}${1}${urlParas}">${1}</a>
					<a href="${actionUrl}${2}${urlParas}">${2}</a>
					<a class="gap">…</a>
				</c:if>

				<c:forEach begin="${startPage}" end="${endPage}" var="i">
					<c:choose>
						<c:when test="${currentPage == i}">
							<span class="current">${i}</span>
						</c:when>
						<c:otherwise>
							<a href="${actionUrl}${i}${urlParas}">${i}</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>

				<c:if test="${(totalPage - currentPage) >= 8}">
					<a class="gap">…</a>
					<a href="${actionUrl}${totalPage - 1}${urlParas}">${totalPage - 1}</a>
					<a href="${actionUrl}${totalPage}${urlParas}">${totalPage}</a>
				</c:if>

				<c:choose>
					<c:when test="${currentPage == totalPage}">
						<span class="disabled next_page">下页</span>
					</c:when>
					<c:otherwise>
						<a href="${actionUrl}${currentPage + 1}${urlParas}"
							class="next_page" rel="next">下页</a>
					</c:otherwise>
				</c:choose>
			</ul>
		</c:if>
	</div>
</body>
</html>