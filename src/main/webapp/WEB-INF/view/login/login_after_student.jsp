<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>学生异动管理</title>
<jsp:include page="../login/css_js.jsp"></jsp:include>

</head>

<body>
	<div class="lefter">
		<div class="logo">
			<strong class="text-big">学生异动管理</strong>
		</div>
	</div>
	<div class="righter nav-navicon" id="admin-nav">
		<div class="mainer">
			<div class="admin-navbar">
				<span class="float-right"> <a
					class="button button-little bg-yellow" href="unLogin">注销登录</a>
				</span>
				<ul class="nav nav-inline admin-nav" style="margin-top: 13px">
					<li class="active"><a href="#" class="icon-cog"> 详情</a>
						<ul>
							<li class="container">
								<p class="fadein-right">您好${ stu.s_name}同学</p>
							</li>
							<div class="alert alert-red">
									<span class="close"></span><strong>注意：</strong>
									如果想修改申请的内容,请重新申请。
								</div>
						</ul></li>
				</ul>
			</div>

		</div>
	</div>

	<div class="admin radius">

		<div class="tab">
			<jsp:include page="tab-head.jsp"></jsp:include>
			<div class="tab-body">
				<div class="tab-panel active" id="tab-apply-detail">
					<jsp:include page="tab_apply_detail.jsp"></jsp:include>
				</div>
				<div class="tab-panel" id="tab-process-detail">
					<jsp:include page="tab-process-detail.jsp"></jsp:include>
				</div>



			</div>
		</div>
		<p class="text-right text-gray">
			基于<a class="text-gray" target="_blank" href="http://www.pintuer.com">拼图前端框架</a>构建
		</p>
	</div>

	<div class="hidden">
		<script src="../js/stat.php" language="JavaScript"></script>
	</div>
</body>
</html>
<!-- id: 学号:s_no 姓名:s_name 密码:s_password 性别:s_sex 签字图片s_img 异动类型:c_id
						异动前学院:s_before_academy 异动后学院s_after_academy 异动前专业:s_before_subject
						异动后专业s_after_subject 异动前班级s_before_class 异动后班级s_after_class
						异动前年级:s_before_grade 异动后年级s_after_grade 学制:s_year
						专业代码(前后,根据学生所选专业定) s_before_subject_no s_after_subject_no
						异动前是否有学籍s_before_status 异动后是否有学籍s_after_status
						学历(前后)s_before_education s_after_education 是否注册(前后)
						s_before_regist s_after_regist 是否在校(前后) s_before_school
						s_after_school 异动时间s_changetime -->