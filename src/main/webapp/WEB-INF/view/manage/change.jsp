<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>异动管理表</title>

    <style type="text/css">
        select {
            margin-top: 10px;
        }

        option {
            bottom: 14px;
            opacity: 1;
        }

        option :HOVER {
            bottom: 30px;
            opacity: 1;
        }

    </style>
    <script type="text/javascript">
        function change_onchange() {
            var change_name = $("#change").val();
            $.post("setRoleAndSort", {
                c_name: change_name
            }, function (data) {
                /* alert(data); */
            });
        }
        function rolechange_show() {
            $("#rolechange").removeClass("hidden");
            $("#add_rolechange").addClass("hidden");
        }
        function rolechange_add() {
            $("#rolechange").addClass("hidden");
            $("#add_rolechange").removeClass("hidden");
        }
        function change_query() {
            var c_name = $("#change_query").val();
            if (c_name == "---------请选择异动类型-------") {
                var html = "<strong class='text-dot'  style='text-align: center;'>请选择异动类型</strong>";
                $("#rc_detail").html(html);
            } else {
                $.post("getRoleAndSort",
                        {
                            c_name: c_name
                        },
                        function (data) {
                            var html = "";
                            if (data.length == 0) {
                                html = "";
                                html += "<strong class='text-dot'  style='text-align: center;'>您查询的数据不存在</strong>";
                            } else {
                                html += "<tr ><th style='text-align:center;'>异动类型</th><th style='text-align:center;'>角色名称</th><th style='text-align:center;'>顺序</th><th style='text-align:center;'>总步骤</th></tr>";
                                for (var per = 0; per < data.length; per++) {
                                    html += "<tr><td>" + data[per].c_name
                                            + " </td>";
                                    html += "<td>" + data[per].r_name
                                            + " </td>";
                                    html += "<td>" + data[per].rc_sort
                                            + " </td>";
                                    html += "<td>" + data[per].c_number
                                            + " </td></tr>";
                                }
                            }
                            $("#rc_detail").html(html);
                        });
            }
        }
    </script>
</head>
<body>
<strong></strong>
<!-- 	选中异动类型>显示角色名称 添加顺序 异动id(复学) 顺序 角色id(教务) -->
<div id="handler">
    <a href="#" class="button bg-green float-left"
       onclick="rolechange_show();">查询</a>
    <a href="#" class="button bg-green " style="margin-left: 30px;"
       onclick="rolechange_add();">添加</a>
</div>
<div id="right">
    <!-- <strong class="text-white bg-main">请选择要查看的异动类型</strong> -->
    <div id="rolechange" class="hidden" style="margin-top: 100px">
        <select class="input button" id="change_query" name="c_name"
                onchange="change_query();">
            <option>---------请选择异动类型-------</option>
            <c:forEach items="${change}" var="c">
                <option>${c.c_name}</option>
            </c:forEach>
        </select>
        <!--左侧显示异动类型所对应的角色和顺序  -->
        <div id="show_result">
            <!-- 显示异动角色查询结果 -->
            <jsp:include page="rolechange_show.jsp"/>
        </div>
    </div>
    <div id="add_rolechange" class="hidden">
        <!-- 增加异动角色 -->
        <jsp:include page="rolechange_add.jsp"/>
    </div>
</div>
</body>
</html>