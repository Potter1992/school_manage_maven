package com.school.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.jfinal.core.Controller;
import com.jfinal.ext.kit.ModelKit;
import com.jfinal.kit.JsonKit;
import com.jfinal.plugin.activerecord.DbPro;
import com.jfinal.plugin.activerecord.Record;
import com.school.model.Apply_approve;
import com.school.model.Change;
import com.school.model.Student_apply;
import com.school.model.Xydmb;
import com.school.model.Zfxfzb_xsjbxxb;
import com.school.model.Zydmb;

/**
 * 当输入完密码时进行验证，学号和密码是否正确，此时需从oral数据库中查询学生的基本信息
 * 
 * @author liulei
 * 
 */
public class ApplyController extends Controller {
	/**
	 * 注销重新登录
	 */
	public void unLogin() {
		HttpSession session = getSession();
		session.invalidate();
		redirect("/index");
	}

	/**
	 * 渲染申请页面,点击申请时进行申请学生学号密码验证，并获取学生的信息，初始化申请页面,取出异动类型
	 */
	public void apply_form() {

		List<Change> changess = Change.me.findAll();
		// setAttr("change_data", changess);
		setSessionAttr("change_data", changess);
		render("validate_student.jsp");
	}

	/**
	 * 验证用户输入的学号和密码,获取异动类型的id
	 */
	public void validate_student() {
		String para_sno = getPara("s_no").toString().trim();
		String para_password = getPara("s_password").toString().trim();
		String change_name = getPara("c_name");
		// 根据id获取异动类型的名称
		Change change = Change.me.findIDChangeByName(change_name);

		List<Zfxfzb_xsjbxxb> student = Zfxfzb_xsjbxxb.me.findWithValidate(
				para_sno, para_password);

		if (student != null && student.size() > 0) {
			List<Xydmb> academies = Xydmb.me.findAll();
			setAttr("list_academy", academies);
			setSessionAttr("current_student", student.get(0));
			setAttr("student", getSessionAttr("current_student"));
			setAttr("change", change);
			render("apply_stu.jsp");
		} else {
			setAttr("s_no", para_sno);
			setAttr("msg", "登陆失败,学号或密码不正确");
			render("validate_student.jsp");
		}
	}

	/**
	 * 保存学生提交的表单到学生申请表中和申请记录表中数据库
	 */
	public void save_apply() {

		Student_apply student_apply = getModel(Student_apply.class, "stu");
		// 根据获得的专业获得学历
		Record record = ModelKit.toRecord(student_apply);

		if (student_apply != null) {
			String academy = student_apply.get("s_after_academy").toString()
					.trim();
			String subject = student_apply.get("s_after_subject").toString()
					.trim();
			String flaString = "无";
			if (academy.equals(flaString)) {
				academy = student_apply.getStr("s_before_academy");
				subject = student_apply.getStr("s_before_subject");
			}
			String zydm_after = Zydmb.me.findByacademyAndSubject(academy,
					subject);

			String zydm_before = Zydmb.me.findByacademyAndSubject(student_apply
					.get("s_before_academy").toString().trim(), student_apply
					.get("s_before_subject").toString().trim());
			// 专业有没有??
			record.set("s_after_subject_no", zydm_after);// 学生异动后专业代码
			record.set("s_before_subject_no", zydm_before);// 学生异动后专业代码

			String education = Zydmb.me.getZydmCC(zydm_after);
			record.set("s_after_education", education);
			if (updateGetIDBySno(student_apply.get("s_no").toString(), record)) {// 如果学号存在就更新,不存在就save

				Student_apply student_apply2 = Student_apply.me
						.findFirstBySnoAndPwd(student_apply.get("s_no")
								.toString(), student_apply.get("s_password")
								.toString());

				setAttr("stu", student_apply2);
				Change change = Change.me
						.findNameChangeByIDString((int) student_apply2
								.getInt("c_id"));
				// (int) student_apply.get("c_id"));
				setAttr("change", change);
				// 保存成功后交给审批人进行处理
				if (save_apply_approve(student_apply)) {
					Apply_approve apply_approve = Apply_approve.me
							.findByS_no(student_apply.get("s_no").toString());
					setAttr("apps", apply_approve);
					forwardAction("/login/login_after_student");
				} else {
					setAttr("msg", "对不起您没有记录");
					forwardAction("/login/login_after_student");
				}

			} else {
				record.set("s_changetime", getCurrentTime().toString());
				if (DbPro.use().save("student_apply", record)) {
					forwardAction("/login/login_after_student");
				} else {
					renderText("保存失败");
				}
			}
		} else {
			renderText("申请信息为空");
		}
	}

	/**
	 * 保存到申请记录表中
	 */
	public boolean save_apply_approve(Student_apply student_apply) {
		Record record = new Record();
		String stu_sno = student_apply.get("s_no");// 得到要保存的学号,时间,异动类型id,当前审核人的层次,下一个审核人的层次(通过role_change表进行获取)
		record.set("s_no", stu_sno);
		int c_id = student_apply.get("c_id");// 得到异动类型的id就可以得到异动的步数,类型======貌似没有什么用
		// 对了可以得到角色_异动表中的信息 角色id 角色异动顺序 审核人的层次 就可以定制下一个审核人的层次
		record.set("c_id", c_id);
		record.set("aa_current_step", 2);
		record.set("aa_steps", Change.me.findStepsByC_id(c_id).get("c_number"));
		String time = getCurrentTime().toString();
		record.set("aa_time", time);
		if (Apply_approve.me.saveByRecordorUpdate(record)) {
			return true;
		} else {
			return false;
		}
		// 获得院校----->为了限制各个院之间的查看问题
		// 异动类型表给规定好才可以,role_change中有顺序

	}

	/**
	 * 
	 * 根据学号获得id
	 */
	public boolean updateGetIDBySno(String sno, Record record) {

		Student_apply student_apply = Student_apply.me.findBySno(sno);
		if (student_apply != null) {
			record.set("s_id", student_apply.get("s_id"));

			record.set("s_changetime", getCurrentTime().toString());
			DbPro.use().update("student_apply", "s_id", record);
			return true;
		} else {
			return false;
		}

	}

	/**
	 * 获得当前时间
	 */
	public String getCurrentTime() {
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat(
				"yyyy/MM/dd HH:mm:ss");
		String currentTimedate = dateFormat.format(now);
		return currentTimedate;
	}

	/**
	 * 获得专业数据
	 */
	public void getSubjectbyAcademy() {
		String para = getPara("q");

		if (para.equals("无")) {
			String ppString = JsonKit.toJson("无");
			renderJson(ppString);
		} else {
			List<Zydmb> zydmbs = Zydmb.me.findByAcademy(para);
			renderJson(zydmbs);
		}
	}

	/**
	 * 根据异动类型获得不同的数据,显示要提交的数据
	 */
	public void findByChangeType() {
		String para = getPara("q");
		Change change = Change.me.findIDChangeByName(para);

		renderJson(change);
	}
}
