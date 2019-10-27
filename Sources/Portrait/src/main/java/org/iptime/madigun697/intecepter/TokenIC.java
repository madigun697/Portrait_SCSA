package org.iptime.madigun697.intecepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class TokenIC implements HandlerInterceptor {

	/*
	 * Authorization code와 Access token을 확인하여 Controller를 분기 
	 */
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		if(request.getParameter("token") != null || session.getAttribute("token") != null) {
			request.getRequestDispatcher("hello.do").forward(request, response);
			System.out.println("1");
			return false;
		} else {
			
			System.out.println("3");
			return true;
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
