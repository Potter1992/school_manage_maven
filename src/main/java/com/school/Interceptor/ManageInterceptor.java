package com.school.Interceptor;

import java.io.IOException;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class ManageInterceptor implements Interceptor {


    public void intercept(ActionInvocation ai) {
        if (ai.getController().getSessionAttr("manage")!=null) {
            ai.invoke();
        }else {
            try {
                ai.getController().getResponse().sendRedirect("../index");
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
    }
}
