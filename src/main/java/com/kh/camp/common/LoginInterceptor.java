package com.kh.camp.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.camp.member.model.vo.Member;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("member");
		
		if( loginMember == null ) {
			System.out.println("비 로그인 상태에서 접근 시도 : " + request.getRequestURI());
			
			request.setAttribute("loc", "/");
			request.setAttribute("msg", "로그인 후 이용해 주세요!");
			request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
