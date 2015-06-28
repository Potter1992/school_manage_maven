<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <jsp:include page="css_js.jsp"/>
    <meta name="renderer" content="webkit">
    <title>学生异动管理</title>
    <script type="text/javascript">
        function getRoleJSP() {
            $("#tab-role-detail").load("getRoleJSP");
        }
        function deleteRole(r_id) {
            $.post("deleteRole", {role_id: r_id}, function (data) {
                if (data == 1) {
                    getRoleJSP();
                } else {
                    alert("删除失败");
                }
            });
        }
        function hiddenAdd_role() {
            $("#add_Role").removeClass();
            $("#roles").hide();
        }
        /*增加角色  */
        function addRole() {
            var role_name = $("#role_name_add").val();

            var role_level = $("#role_level_add").val();
            if (role_name == "" || role_level == "") {
                alert("角色名称或等级不能为空");
            } else {
                $.post("addRole", {
                    role_name: role_name,
                    role_level: role_level
                }, function (data) {
                    if (data == 0) {
                        alert("重复了");
                    }else{
                        alert("成功了");
                    }
                });
            }
        }
        function beforeHide(){
            $("#roles").show();
            $("#add_Role").hide();
        }
    </script>
</head>
<body>

<jsp:include page="head.jsp"/><!-- 管理员页面头部 -->
<div class="tab-body">
    <div id="tab-panel-manage">
        <div class="tab-panel active" id="tab-approve-detail">
            <!-- 审核成员管理 -->
            <jsp:include page="approve.jsp"/>
        </div>
        <div class="tab-panel " id="tab-change-detail">
            <!-- 异动管理 -->
            <jsp:include page="change.jsp"/>
        </div>

        <div class="tab-panel " id="tab-role-detail">
        </div>
    </div>
</div>
<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>