<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style type="text/css">
        #hover:HOVER {
            color: blue;
        }
    </style>
</head>
<body>
<a href="add_approve" class="button bg-green"
   style="margin-bottom: 10px;">添加审核人</a>
<%-- com.school.model.Approve_person@6c7941f4 {a_academy:无学院, a_id:1,
a_part:教务处负责人, a_img:, a_password:132, a_name:处级干部, r_id:4,
a_account:123456789, a_type:处级 ${approve} --%>
<jsp:include page="approve_list.jsp"/><!-- 审核人列表 -->

</body>
</html>