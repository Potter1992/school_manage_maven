function ajaxFileUpload() {
    if ($("#s_img").val() == ""&&$("#role_name").text()=="学院经办人") {
        alert("请先提交签字图片");
    } else {
        $.ajaxFileUpload({
            url: '../approve/approveAgree?s_no=' + $("#s_no").text(), //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 's_img', //文件上传域的ID
            dataType: 'HTML', //返回值类型 一般设置为json
            success: function (data, status)//服务器成功响应处理函数
            {
                /* 	alert("123");
                 alert(data);  */
                location.reload();
                if (typeof (data.error) != 'undefined') {
                    if (data.error != '') {
                        alert(data.error);
                    } else {
                        alert(data.msg);
                    }
                }
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        })
        return false;
    }
}
