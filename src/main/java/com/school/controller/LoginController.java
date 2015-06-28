package com.school.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Before;
import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.Controller;
import com.school.model.Apply_approve;
import com.school.model.Approve_person;
import com.school.model.Change;
import com.school.model.Role;
import com.school.model.Role_change;
import com.school.model.Student_apply;

public class LoginController extends Controller {
	public void login_after_student() {
		render("login_after_student.jsp");
	}

	public void login_after_leader() {
		render("login_after_leader.jsp");
	}

	// /**
	// * 检测用户是否登陆
	// */
	// public void login_validate() {
	// HttpSession session = getSession();
	// session.invalidate();
	// render("../index/index.jsp");
	// }

	/**
	 * 验证学生是否登陆
	 */
	public String login_stu() {
		String username = getPara("username").trim();
		String password = getPara("password").trim();
		Student_apply student_apply = Student_apply.me.findFirstBySnoAndPwd(
				username, password);
		setSessionAttr("stu", student_apply);// 设置当前用户
		return username;
	}

	/*
	 * 登录验证--学生
	 */

	public void login_student() {
		String userString = login_stu();// 设置学生

		Student_apply stu = getSessionAttr("stu");

		if (stu != null && !stu.equals("")) {
			stu.put("c_name",
					Change.me.findNameChangeByIDString(stu.getInt("c_id")).get(
							"c_name"));
			Apply_approve apply_approve = Apply_approve.me.findByS_no(stu
					.getStr("s_no"));
			setAttr("apps", apply_approve);
			// 根据c_id获得学生要申请的总步数
			render("login_after_student.jsp");
		} else {
			setAttr("msg", "帐号或密码错误或者你没有资格访问");
			setAttr("username", userString);
			render("../index/index.jsp");
		}
	}

	/**
	 * 登陆验证
	 */

	public void login_approveOrstu() {// 判断角色的类型
		String username = getPara("username").trim();
		String password = getPara("password").trim();

		Approve_person approve_person = Approve_person.me.findByLogin(username,
				password);
		if (approve_person != null && !approve_person.equals("")) {
			setSessionAttr("app_person", approve_person);
			login_index();
		} else {
			login_student();// 判断是否为学生，yes是特定页面
		}
	}

	/*
	 * 登录验证--审核人员
	 */

	public void login_index() {
		Approve_person app = getSessionAttr("app_person");
		int r_id = app.get("r_id");

		// 根据角色id取得角色类型
		Role role_1 = Role.me.getRoleByID(r_id);
		String role = role_1.getStr("r_level");
		setSessionAttr("r_name", role_1.getStr("r_name"));
		if (role == null) {
			setAttr("msg", "您没有相应的权限来访问此页面");
			render("../index/index.jsp");
		} else {
			setSessionAttr("r_name", role_1.getStr("r_name"));
		}
		if (role.equals("管理员")) {// 如果是管理员的话直接调到管理模块
//			setSessionAttr("role", Role.me.findAll());
			setSessionAttr("manage", app);//为了拦截而做的session
			redirect("/manage/index");
		} else {
			String academy_app = app.get("a_academy").toString().trim();
			Role_change rc = Role_change.me.findFirstByR_id(r_id);
			if (rc == null) {
				setAttr("msg", "未给您添加角色异动权限");
				render("login_after_leader.jsp");
			} else {
				int rc_sort = rc.getInt("rc_sort");
				getStudent_apply(academy_app, rc_sort);// 这里可能用到分页
				setAttr("app", app);
				if (app.get("a_academy").equals("无学院")) {
					// rc_sort与当前步数进行比较
					List<Apply_approve> aList = Apply_approve.me
							.findByCurrent_step(rc_sort);
					setAttr("appsList", aList);
				} else {
					List<Apply_approve> aList = Apply_approve.me
							.findA_academyAndCurrent_step(academy_app, rc_sort);
					setAttr("appsList", aList);
				}
				// 获取学生申请的数据,根据审核人的学院,如果没有学院就全部显示,并且还要根据审核人是否已经审核
				render("login_after_leader.jsp");
			}
		}
	}
	/**
	 * 打印申请表
	 */
	public void printBystudent() {
		// 获得打印学生的学号
		String stu_snoString = getPara("s_no");

	}

	/**
	 * 获得学生申请的数据,并放到request中,或者根据学院获得学生信息(根据院级的需要,不需要其他学院看见)
	 */
	public void getStudent_apply(String academy, int sort) {
		// 如果申请人的所在学院为空的话,则认为此审核人的角色级别在院级以上,故所有的信息可以输出
		boolean nn = academy.trim().equals("无学院");
		if (academy.trim().equals("无学院")) {
			List<Apply_approve> apply_approves = Apply_approve.me
					.findByCurrent_step(sort);
			List<Student_apply> student_appliess = new ArrayList<Student_apply>();
			// 获得他们的学号
			for (Apply_approve apply_approve : apply_approves) {
				student_appliess.add(Student_apply.me.findBySno(apply_approve
						.getStr("s_no")));

			}
			// 判断记录表中的当前步数(顺序)和异动申请表中的顺序是否一致 当大于时则显示以前的数据
			// 首先获得当前角色id,并获得顺序,然后和步数相比
			for (Student_apply student_apply : student_appliess) {
				student_apply.put(
						"c_name",
						Change.me.findNameChangeByIDString(
								student_apply.getInt("c_id")).get("c_name"));
			}
			setAttr("size", student_appliess.size());
			setAttr("stulist", student_appliess);
		} else {
			List<Apply_approve> apply_approves = Apply_approve.me
					.findByCurrent_stepCut(sort);
			List<Student_apply> student_appliess = new ArrayList<Student_apply>();
			// 获得他们的学号
			for (Apply_approve apply_approve : apply_approves) {
				student_appliess.add(Student_apply.me.findBySno(apply_approve
						.getStr("s_no")));
			}
			List<Student_apply> student_appliesss = new ArrayList<Student_apply>();
			for (Student_apply student_apply : student_appliess) {
				if (student_apply.get("s_before_academy").equals(academy)) {
					student_appliesss.add(student_apply);
				}
			}
			for (Student_apply student_apply : student_appliess) {
				student_apply.put(
						"c_name",
						Change.me.findNameChangeByIDString(
								student_apply.getInt("c_id")).get("c_name"));
			}
			setSessionAttr("size", student_appliesss.size());
			setSessionAttr("stulist", student_appliesss);
		}

	}

	/**
	 * 根据学院获得异动类型
	 */
	public List<Student_apply> getChangeName(String academy) {
		List<Student_apply> student_applies = Student_apply.me
				.findByAcademy(academy);
		for (Student_apply student_apply : student_applies) {
			student_apply.put(
					"c_name",
					Change.me.findNameChangeByIDString(
							student_apply.getInt("c_id")).get("c_name"));
		}

		return student_applies;
	}
}
