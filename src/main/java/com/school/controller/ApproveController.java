package com.school.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import com.jfinal.core.Controller;
import com.jfinal.kit.PathKit;
import com.jfinal.upload.UploadFile;
import com.school.model.Apply_approve;
import com.school.model.Student_apply;

public class ApproveController extends Controller {

	/**
	 * 进行审核通过后操作
	 */
		public void approveAgree() {
			String r_name=getSessionAttr("r_name");
			String snoString= getPara("s_no");
			if (r_name.equals("学院经办人") ){
				UploadFile file=getFile("s_img");
				if (file==null) {
					setAttr("msg", "必须上传签字文件");
					forwardAction("/login/login_index");
				}
				
				Student_apply student_apply=Student_apply.me.findBySno(snoString);
				String pathImg=handleImage(snoString,file);
				student_apply.set("s_img", pathImg);
				student_apply.update();
			}
			
			if (Apply_approve.me.agree(snoString)) {
//				renderJson("成功");
				forwardAction("/login/login_index");
			} else {
				renderText("更新失败");
			}
	}
		/**
		 * 处理上传图片,返回图片路径
		 */
		public String handleImage(String sno,UploadFile file) {
			String savepath = "/upload/image/student/";// 定义您的图片路径基于webroot
//			UploadFile file = getFile("");// 获取前台上传文件
			if (file == null) {
				return null;
			}
			String nameString = sno;// 自定义名称img_name
			String fileName = file.getFileName();// 获取文件名
			String subStringName = fileName.substring(fileName.lastIndexOf("."),
					fileName.length());// 文件后缀名
			String paString = savepath + nameString + subStringName;// 文件路径
			File fi = new File(PathKit.getWebRootPath() + paString);// 创建新的文件
			file.getFile().renameTo(fi);// 给保存的文件重新命名
			return paString;
		}
}
