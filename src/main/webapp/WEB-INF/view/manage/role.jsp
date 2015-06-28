<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>角色管理</title>
    <jsp:include page="css_js.jsp"/>
    <style type="text/css">
        .table tr td {
            text-align: left;
        }

        .table tr:HOVER {
            background: #D1EEEE;
        }

        a :HOVER {
            color: blue;
        }

        td a {
            margin-left: 5px;
        }
    </style>
</head>
<body>
<a href="#" class="button bg-green" style="margin-bottom: 10px;"
   onclick="hiddenAdd_role();">添加角色</a>

<div id="add_Role" class="hidden">

    角色名称:<input class="input" id="role_name_add"/>
    角色等级:<select class="input" id="role_level_add" style="margin-top: 10px">
    <option>学生</option>
    <option>院级</option>
    <option>处级</option>
    <option>校级</option>
</select>
    <a class="button bg-red" href="#" onclick="addRole();" style="margin-top: 10px">提交</a>
    <button type="button btn-green" onclick="beforeHide();">返回</button>
</div>
<table class="table" id="roles">
    <tr>
        <th>角色名称</th>
        <th>角色等级</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${role}" var="r">
        <tr>
            <td>${r.r_name}</td>
            <td>${r.r_level}</td>

            <td><a class="icon-edit text-red"
                   href="#" onclick="deleteRole(${r.r_id});">删除</a>
                    <%--onclick="deleteRole(${r.r_id});deleteRole?role_id=${r.r_id}"--%>
                <a class="icon-recycle"
                   href="updateRole?r_id=${r.r_id}">修改</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>