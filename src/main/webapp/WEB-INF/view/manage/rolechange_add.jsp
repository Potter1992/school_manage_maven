<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript">
        function changeSort() {
            $("#validate_msg").addClass("hidden");
            var change_cName = $("#change").val();
            var change_roleName = $("#role_name").val();
            if (change_cName != null && change_roleName != null) {
                $.post("setRoleSort", {
                    c_name: change_cName,
                    r_name: change_roleName
                }, function (data) {
                    var html = "<option>" + data + "</option>"
                    $("#rc_sort").html(html);
                });
            } else {
                //提交项目https://github.com/Potter1992/school_manage.git
                alert("异动类型或角色不能为空");
            }
        }
        function change_detail() {
            $("#validate_msg").addClass("hidden");
            var c_name = $("#change").val();
            $.post("changeByC_id", {
                c_name: c_name
            }, function (data) {
                $("#iframe").remove("src");
                var args = 'changeByC_id?c_name=' + c_name;
                $("#iframe").attr("src", args);
            });
            changeSort();
        }

        function saveRoleAndChange() {
            changeSort();
            var c_name = $("#change").val();
            var r_name = $("#role_name").val();
            var rc_sort = $("#rc_sort").val();
            if (c_name == "" || r_name == "" || rc_sort == null) {
                alert("异动类型或角色或顺序不能为空");
            } else {
                $.post("saveRoleAndChange", {
                    c_name: c_name,
                    r_name: r_name,
                    rc_sort: rc_sort
                }, function (data) {
                    if (data == "505") {//重复
                        $("#validate_msg").removeClass();
                        $("#validate_msg").addClass("text-dot");
                    } else {
                        $("#validate_msg").removeClass();
                        $("#validate_msg").addClass("text-green");
                        $('#iframe').attr('src', $('#iframe').attr('src'));
                        $("#role_name").find("option[value='']").attr("selected",
                                true);
                        changeSort();
                    }
                });
            }
        }
    </script>
    <style type="text/css">
        #change {
            margin-top: 20px;
        }
        #role_name,#rc_sort{
            margin-top: 15px;
        }
    </style>
    <script type="text/javascript">
    $(document).ready(function () {
        $("#iframe").load(function () {
            $(this).height(0); //用于每次刷新时控制IFRAME高度初始化
            var height = $(this).contents().height() + 10;
            $(this).height(height < 500 ? 500 : height);
        });
    });

</script>
</head>
<body>
<div id="change_left" class="float-left">
    <!-- <form action="saveRoleAndChange" method="post"> -->
    <select class="input" id="change" name="c_name"
            onchange="change_detail()">
        <option value="">---------请选择异动类型-------</option>
        <c:forEach items="${change}" var="c">
            <option>${c.c_name}</option>
        </c:forEach>

    </select>
    <!-- 需要添加的步骤总数步骤总数:<input type="text" id="sort_sum" onchange="change_onchange();"/> -->
    <div id="validate_msg" class=" text-dot hidden">角色已分配</div>
    <select class="input" id="role_name" name="r_name" onchange="changeSort();">
        <option value="">---------请选择角色名称-------</option>
        <c:forEach items="${rList }" var="role">
            <option>${role.r_name }</option>
        </c:forEach>
    </select> <select class="input" id="rc_sort" name="rc_sort">
    <option>1</option>
</select> <input style="margin-top: 30px" class="button bg-red text-white"
                 type="button" value="添加异动角色关系" onclick="saveRoleAndChange();">
</div>

<div id="change_right" class="float-left" style="margin-left: 30px;">
    <iframe id="iframe" src="changeByC_id" scrolling="no"
            width="500px" frameborder="0" marginwidth="0" marginheight="0"></iframe>
</div>


</body>
</html>