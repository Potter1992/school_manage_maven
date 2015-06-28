package com.school.Interceptor;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class LoginInterceptor implements Interceptor {

	public void intercept(ActionInvocation ai) {
		System.out.println("123");
		// 获取请求路径
		System.out.println(ai.getActionKey());
		///apply/save_apply  login/login_after_student login/login_approveOrstu
		String urlString2 = "/manage/changeByC_id/manage/saveRoleAndChange/apply/validate_student/apply/getSubjectbyAcademy/login/login_approveOrstu/index/login/login_student/apply/apply_form/apply/validate_student";// 拦截的路径
		if (urlString2.contains(ai.getActionKey())) {
			ai.invoke();//跳过拦截器
		} else {
			HttpSession session = ai.getController().getSession();
			//获取当前session
			System.out.println(session.getAttribute("app_person"));
			System.out.println(session.getAttribute("stu"));
			System.out.println(session.getAttribute("current_student"));
			
			if (session.getAttribute("app_person") != null
					|| session.getAttribute("stu") != null
					|| session.getAttribute("current_student")!=null) {

				ai.invoke();
			} else {
				try {
					ai.getController().getResponse().sendRedirect("../index");
				} catch (IOException e) {
					System.out.println("跳转失败");
					e.printStackTrace();
				}
			}

		}
	}
}
