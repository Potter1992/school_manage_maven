<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>首页</title>
<jsp:include page="css_js.jsp"></jsp:include>
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>


<body>
	<div class="container">
		<div class="line">
			<div class="xs6 xm4 xs3-move xm4-move">
				<br />
				<br />

				<form action="<%=request.getContextPath() %>/login/login_approveOrstu" method="post">
					<div class="panel">
						<div class="panel-head">
							<strong>登录管理系统</strong>
						</div>
						<div class="panel-body" style="padding:30px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input" name="username"
										placeholder="登录账号" value="${username}" />
									<span class="icon icon-user" style="margin-top: 7px;"></span>
								</div>
								<div ><font color="red">${msg}</font></div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input" name="password"
										placeholder="登录密码" />
									<span class="icon icon-key" style="margin-top:10px"></span>
								</div>
							</div>
						</div>
						<div class="panel-foot text-center">
							<button
								class="button button-block bg-sub text-big radius-rounded">立即登录后台</button>
						</div>
						
					</div>
				</form>
				<div class="panel-foot text-center">
						<a href="apply/apply_form" class="button button-block bg-dot text-big radius-rounded">申请</a>
				</div>
			</div>
		</div>
	</div>


</body>
</html>
