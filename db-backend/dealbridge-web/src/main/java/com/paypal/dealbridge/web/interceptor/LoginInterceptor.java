package com.paypal.dealbridge.web.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class LoginInterceptor implements HandlerInterceptor {
	@Value("${login.guestUserId}")
	private int guestUserId;
	
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object obj, Exception exception)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object obj, ModelAndView modelAndView)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("userId") == null) {
			session.setAttribute("userId", guestUserId);
		}
		if (session.getAttribute("area") == null){
			session.setAttribute("area", "上海");
		}
		if (session.getAttribute("latitude") == null){
			session.setAttribute("latitude", 31.219921);
		}
		if (session.getAttribute("longitude") == null){
			session.setAttribute("longitude", 121.526128);
		}
		
		
		return true;
	}

}
