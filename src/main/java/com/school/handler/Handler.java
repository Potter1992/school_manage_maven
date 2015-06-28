package com.school.handler;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Handler extends com.jfinal.handler.Handler{
@Override
	public void handle(String target, HttpServletRequest request,
			HttpServletResponse response, boolean[] isHandled) {
	
				try {
					
					if (request.getServletPath().contains("index")) {
						response.sendRedirect("/index/index");
					}
					
				} catch (IOException e) {
					System.out.println("跳转失败");
					e.printStackTrace();
				}
	}

	

}
