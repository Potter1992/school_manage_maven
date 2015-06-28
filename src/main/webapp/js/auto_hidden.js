$(document).ready(function() {
	var r_level = $("#r_level").val();
	if (r_level == "学生") {
		$("#manage").hide();
		$("#manage_hidden").hide();
		$("#tab-manage-detail").hide();
		$("#tab-panel-manage").hide();
	}
	if (r_level == "院级" || r_level == "处级" || r_level == "校级") {
		$("#apply").hide();
		$("#manage_hidden").hide();
		$("#manage").hide();
		$("#tab-panel-manage").hide();
	}

}); 