package com.school.controller;

import com.jfinal.aop.ClearInterceptor;
import com.jfinal.core.Controller;

public class IndexController extends Controller {
	/**
	 * 首页
	 */
	@ClearInterceptor
	public void index() {
		render("index.jsp");
	}
	/**
	 * 跳转到login中的学生登陆后的页面
	 */

	public void login_after_student() {
		render("login/login_after_student.jsp");
	}
}
