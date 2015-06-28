<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
    <title>Insert title here</title>
    <script type="text/javascript">
        function getagree() {

                var sno = $("#s_no").text();
                $.post("../approve/approveAgree", {
                    q: sno,
                }, function (data) {
                    location.reload();
                });

        }
        $(document).ready(function () {
            var num = 0;
            $(".panel-head").click(function () {
                num += 1;
                if (num % 2 == 0) {
                    if ($(".panel").hasClass("active")) {
                        $(".panel").removeClass("active");
                    }
                }
            });
        });

    </script>
    <style type="text/css">
        #strong strong {
            display: inline;
            margin-left: 10px;
        }

        #strong label {
            color: blue;
        }
    </style>
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/custtom.js"></script>
</head>
<body>
<div class="collapse">
    <input type="text" id ="r_name" value="${r_name}" hidden="hidden">
    <c:forEach items="${stulist}" var="s">
        <!--面板 -->
        <div class="panel">
            <!--面板 头部 -->
            <div class="panel-head" style="cursor: pointer;">
                <h4>
                    申请人:${s.s_name},学号:<strong id="s_no">${s.s_no }</strong>申请类型:<strong>${s.c_name}</strong>
                </h4>
            </div>
            <!--面板 主体 -->
            <div class="panel-body ">
                <blockquote class="border-main">
                    <strong style="color: red;">申请人:${s.s_name},学号:<big>${s.s_no }</big> ,申请类型:${s.c_name}</strong>

                    <div class="form-group apply_img">
                        <input value="${s.s_no }" style="display: none;">
                        <a class="button  icon-upload " href="#"
                           style="display: inline-block; width: auto; height: 40px; background: whitesmoke; position: relative; overflow: hidden;
										margin-bottom: 10px;
										">
                            上传签字图片
                            <small style="color: red">必须上传图片</small>
                            <input type="file" id="s_img"
                                   style="position: absolute; right: 0; top: 0; font-size: 100px; opacity: 0; filter: alpha(opacity = 0);"
                                   name="s_img" accept="image/png" value="${app.a_img }">
                        </a>
                    </div>
                    <button id="<%=request.getContextPath() %>/manage/agree"
                            class="button icon-thumbs-o-up text-red radius-rounded float-right dialogs student_img"
                            data-toggle="click" data-target="#mydialog" data-mask="1"
                            >审核通过
                    </button>
                    <!-- <p>...</p>{s_before_status:有, s_manager_name:null,
                     s_password:123456, s_before_academy:信息管理学院,
                     s_before_class:12计科本, s_after_school:有, s_after_area:德州学院,
                      s_id:37, s_before_subject:计算机科学与技术,
                       s_after_education:null, c_id:11, s_sex:男, s_after_class:未分配, s_before_education:本科,
                        s_before_subject_no:null, s_manager_time:null, s_after_academy:无, s_before_school:是,
                        s_after_subject:无, s_before_grade:2012, s_after_grade:null,
                        s_changetime:2015/05/31 23:50:25, s_after_regist:有,
                         r_level:学生, s_img:null, s_before_regist:是,
                          s_no:201201001003, s_year:4, c_name:保留入学资格, s_after_status:有,
                           s_name:刘磊, s_before_area:德州学院, s_after_subject_no:null} -->

                    <div id="strong">
                        <label>申请前内容:</label><strong>所在学院:</strong>${s.s_before_academy},<strong>所在专业:</strong>${s.s_before_subject }
                        ,<strong>所在班级:</strong>${s.s_before_class},<strong>注册状态:</strong>${s.s_before_regist},<strong>学籍状态:</strong>${s.s_before_status}<br>
                        <label>申请后内容:</label><strong>所在学院:</strong>${s.s_after_academy},<strong>所在专业:</strong>${s.s_after_subject }
                        ,<strong>所在班级:</strong>${s.s_after_class},<strong>注册状态:</strong>${s.s_after_regist},<strong>学籍状态:</strong>${s.s_after_status}


                    </div>

                </blockquote>
                <!-- 对话框 -->
                <div id="mydialog">
                    <div class="dialog">
                        <div class="dialog-head">
                            <span class="dialog-close close rotate-hover"></span> <strong>友情提示</strong>
                        </div>
                        <div class="dialog-body">
                            您确认审核通过<label style="color: red;">申请人:${s.s_name},学号:${s.s_no }:申请类型:${s.c_name}.</label>的申请吗?
                        </div>
                        <div class="dialog-foot">
                            <button class="dialog-close button">取消</button>
                            <button class="button bg-green" onclick="ajaxFileUpload()">确认</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </c:forEach>

</div>
</body>
</html>