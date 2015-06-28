<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>首页</title>
<jsp:include page="css_js.jsp"></jsp:include>
<!-- <meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0"> -->
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


</head>


<body>
	<div class="container">
		<div class="line">
			<div class="xs6 xm4 xs3-move xm4-move">
				<br /> <br />

				<form action="validate_student" method="post">
					<div class="panel">
						<div class="panel-head">
							<strong>学生申请验证</strong>
						</div>
						<div class="panel-body" style="padding: 30px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input" name="s_no" placeholder="学号 "
										value="${s_no}" /> <span class="icon icon-user"></span>
								</div>
								<div>
									<font color="red">${msg}</font>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input" name="s_password"
										placeholder="密码(请输入教务系统的密码)" /> <span class="icon icon-key"
										style="margin-top: 10px"></span> <br> 异动类型: <select
										class="input" id="c_name" name="c_name">
										<c:forEach items="${change_data}" var="data">
											<option name="c_id">${data.c_name}</option>
										</c:forEach>

									</select>
								</div>
							</div>
						</div>
						<div class="panel-foot text-center">
							<input type="submit"
								class="button button-block bg-dot text-big radius-rounded"
								value="申请" />
						</div>

					</div>
				</form>

			</div>
		</div>
	</div>


</body>
</html>
