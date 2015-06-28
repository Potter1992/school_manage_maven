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
<jsp:include page="css_js.jsp"></jsp:include>
 <script type="text/javascript">
 		$(function(){
 			if($("#r_name").val()=="学院经办人"){

 				$(".apply_img").show();
 			}else{
				$(".apply_img").hide();
			}

 		});
 </script>

</head>
<body>
	<input type="text" id ="r_name" value="${r_name}" hidden="hidden">
	<div class="lefter">
		<div class="logo">
			<strong class="text-big">学生异动管理</strong>
		</div>
		<div></div>
	</div>
	<div class="righter nav-navicon" id="admin-nav">
		<div class="mainer">
			<div class="admin-navbar" style="margin-top: 16px">
				<span class="float-right"> <a
					class="button button-little bg-yellow" href="unLogin">注销登录</a>
				</span>
				<ul class="nav nav-inline admin-nav">
					<li class="active"><a href="#" class="icon-cog"> 详情</a>
						<ul>
							<li id="alert_main">
								<div class="alert alert-info" style="background-color: #eee">
									<button type="button" class="close" data-dismiss="alert"
										></button>
									<h4>提示!</h4>
									<strong>警告!</strong> 请注意你的个人隐私安全.
								</div>
								<div class=" text-center text-gray fadein-right">
									查看学生申请详情请点击你要查看的学生简要信息
									<div class="alert alert-yellow" id="alert">
										<span class="close"></span><strong>注意：</strong>
										${app.a_name}有${size }条未审核的学生申请信息。
									</div>
								</div>
							</li>
						</ul></li>
				</ul>
			</div>
			<jsp:include page="bread.jsp"></jsp:include>
		</div>
	</div>
	<div class="admin radius" style="margin-top: 10px;">
		<div class="tab">
			<div class="tab-head">
				<strong id="role_name">${r_name }</strong>
				<ul class="tab-nav" style="margin-top: 10px; margin-left: 10px;">
					<li class="active"><a class=" badge-corner"
						href="#tab-student-detail" id="student">学生申请<span
							class="badge bg-red">${size }</span></a></li>
					<li><a href="#tab-process-detail" id="process">进度详情</a></li>
				</ul>
			</div>
			<div class="tab-body">
				<div class="tab-panel  active" id="tab-student-detail">
					<!-- 学生申请 -->
					<jsp:include page="student_apply_detail_dialog.jsp"></jsp:include>
				</div>
				<div class="tab-panel  " id="tab-process-detail">
					<jsp:include page="student_process_detail_dialog.jsp"></jsp:include>
					<!-- 进度详情 -->
				</div>
			</div>
		</div>
		<p class="text-right text-gray">${msg}</p>
	</div>

</body>
</html>