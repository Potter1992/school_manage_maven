<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="css_js.jsp"></jsp:include>
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		$("#error").hide();
		$("#addApprove input").addClass("input");
		$.post("../manage/getAcademy", "", function(data) {
			var html = "";
			html += "<option>无学院</option>";
			for ( var i in data) {
				html += "<option>" + data[i].xymc + "</option>";
			}
			$("#academy").html(html);
		});
		$.post("../manage/getR_name", "", function(data) {
			var html = "";
			for ( var i in data) {
				html += "<option>" + data[i].r_name + "</option>";
			}
			$("#r_name").html(html);
		});
		/* ajax#../manage/validate_account?account=:错误提示(用户已注册) */
	});
</script>


</head>
<body>
	<jsp:include page="head.jsp"></jsp:include><!-- 管理员页面头部 -->
	<form action="addApprove" id="addApprove" method="post" class="form"
		enctype="multipart/form-data">
		<table class="table">
			<tr>
				<td><label>审核账号:<small id="error" class=" text-dot" >账号已存在</small></label></td>
				<td>
					<div class="form-group" id="account_exited">
						<input class="input " type="text" name="app.a_account"
							id="account" value="${app.a_account }"
							onchange="change_account();" data-validate="required:* "
							placeholder="审核账号">
						<script type="text/javascript">
							function change_account() {
								/* alert("123"); */
								/* $("#account").onchange(function(){ */
								$.ajax({
									url : "../manage/validate_account",
									type : "GET",
									data : {
										account : $("#account").val()
									},
									dataType : "json",
									success : function(data) {
										var flag=data.validate_account;
										/* alert(data.validate_account); */
										if (flag=="false") {
											$("#account_exited").removeClass("check-success");
											$("#account_exited").addClass("check-error");
											$("#error").show();
										}else{
											$("#account_exited").removeClass("check-error");
											$("#error").hide();
										}
									}
								});
								/* }); */
							}
						</script>
					</div>
				</td>
				<td><label>审核密码:</label></td>
				<td>
					<div class="form-group">
						<input type="text" name="app.a_password"
							value="${app.a_password }" data-validate="required:*"
							placeholder="审核密码">
					</div>
				</td>

				<td><label>审核姓名:</label></td>
				<td>
					<div class="form-group">
						<input type="text" name="app.a_name" data-validate="required:*"
							placeholder="审核姓名" value="${app.a_name}">
					</div>
				</td>
			</tr>
			<tr>
				<td><label>审核部门:</label></td>
				<td>
					<div class="form-group">
						<input type="text" name="app.a_part" data-validate="required:*"
							placeholder="审核部门" value="${app.a_part}">
					</div>
				</td>

				<!-- <input type="text" name="app.a_type"placeholder="审核级别"></td>r_level -->
				<td><label>审核角色:</label></td>
				<td><select id="r_name" name="r_name" class="input"
					value="${r_name}">
						<option>审核角色</option>
				</select> <!-- <input type="text" name="app.r_id" placeholder="审核角色"></td>r_name -->
			</tr>
			<tr>
				<td><label>审核学院:</label></td>
				<td><select id="academy" name="app.a_academy" class="input"
					value="${app.a_academy }">
						<option>学院</option>
				</select> <!-- 上传-start -->
				<td><label>审核签字: <small style="color: red;">png格式</small></label></td>
				<td>

					<div class="form-group">
						<div class="field" style="float: left">
							<a class="button  icon-upload " href="#"
								style="display: inline-block; width: auto; height: 40px; background: white-space; position: relative; overflow: hidden;">
								上传签字图片<input type="file"
								style="position: absolute; right: 0; top: 0; font-size: 100px; opacity: 0; filter: alpha(opacity = 0);"
								name="app.a_img" data-validate="required:必须上传"
								accept="image/png" value="${app.a_img }">
							</a>
						</div>
					</div>
				</td>
				<!-- 上传-end -->
			</tr>

		</table>
		<div class="form-button">
			<input class="button bg-red" type="submit" value="增加审核人" /> <a
				href="../manage/index" class="button bg-green"
				style="margin-top: 10px;">返回</a>
		</div>
	</form>
</body>
</html>