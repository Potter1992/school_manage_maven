<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="css_js.jsp"></jsp:include>
<title>申请页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<form action="save_apply" id="search-form" method="post" class="form form-block">
		<div class="panel-body" style="padding: 40px;">
			
				<jsp:include page="type_apply_stu_info.jsp"></jsp:include><!--学生异动的基本信息  -->
				<jsp:include page="type_apply_stu.jsp"></jsp:include><!-- 学生异动后信息填写 -->
				<jsp:include page="Liability.jsp"></jsp:include><!--责任书  -->
				<!--  <input type="text" name="s_before_academy" class="input academy drop open" id="s_before_academy"
        placeholder="请输入学院" onclick="getcomplete('#s_before_academy','getAcademy');"> -->
				<!-- <input type="text" class="input" name="s_after_academy"
                id="s_after_academy" placeholder="异动后学院"
                onclick="getcomplete1('#s_after_academy','getAcademy');" /> <input
                type="text" class="input" name="s_before_subject"
                id="s_before_subject" placeholder="异动前专业"
                onclick="getcomplete_subject('#s_before_subject','getSubject');" />
            <input type="text" class="input" name="s_after_subject"
                id="s_after_subject" placeholder="异动后专业"
                onclick="getcomplete_subject1('#s_after_subject','getSubject');" />
                	id: 学号:s_no 姓名:s_name 密码:s_password 性别:s_sex 签字图片s_img 异动类型:c_id
	异动前学院:s_before_academy 异动后学院s_after_academy 异动前专业:s_before_subject
	异动后专业s_after_subject 异动前班级s_before_class 异动后班级s_after_class
	异动前年级:s_before_grade 异动后年级s_after_grade 学制:s_year 专业代码(前后,根据学生所选专业定)
	s_before_subject_no s_after_subject_no 异动前是否有学籍s_before_status
	异动后是否有学籍s_after_status 学历(前后)s_before_education s_after_education
	是否注册(前后) s_before_regist s_after_regist 是否在校(前后) s_before_school
	s_after_school 异动时间s_changetime-->
			</div>
</form>
</body>
</html>

