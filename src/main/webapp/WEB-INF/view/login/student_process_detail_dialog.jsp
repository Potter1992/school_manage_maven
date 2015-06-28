<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(document).ready(function() {
		var nn = $("#num").text();
		for (var n = 0; n < 3; n++) {
			var num = $("#step" + n).text();
			var nums = $("#steps" + n).text();
			var percent = Math.round((num / nums) * 100);
			$("#progress-number" + n).css("width", percent + "%");
			$("#progress-number" + n).text("进度:" + percent + "%");
		}
	});
</script>
<style type="text/css">
dd div {
	display: inline;
}
</style>
</head>
<body>
	<div class="collapse">
		<c:forEach items="${appsList}" var="s" varStatus="c">
			<dl class="dl-inline clearfix">
				<dt>学号:${s.s_no }</dt>
				<dd>
					当前步数:
					<div id="step${c.index}">${s.aa_current_step}</div>
					总步骤
					<div id="steps${c.index}">${s.aa_steps }</div><br>
					<div class="progress">
						<div class="progress-bar" id="progress-number${c.index}"
							style="width: 50%;">进度：50%</div>
					</div>
				</dd>
			</dl>
			<div id="num" style="display: none;">${c.count}</div>



		</c:forEach>

	</div>
</body>
</html>