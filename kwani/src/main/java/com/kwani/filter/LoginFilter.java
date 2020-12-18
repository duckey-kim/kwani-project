package com.kwani.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter {

	private static final String USER_EMAIL="userEmail";
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		// url : /admin/loginform을 제외하면 요청에 대해서
		// 만약에 admin로그인이 안되어 있다면 /admin/loginform으로 가게한다.
		// 로그인되었으면 chain do filter
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession(true);
		String requestURI =httpRequest.getRequestURI();
		System.out.println(requestURI);
		request.setAttribute("prevPath", requestURI);
		if (!isLogIn(session) && !httpRequest.getRequestURI().contains("/user/login")) {
			
			RequestDispatcher rd = request.getRequestDispatcher("/user/login");
			rd.forward(request, response);
			return;
			
		}
		chain.doFilter(request, response);

	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}
	private boolean isLogIn(HttpSession session) {
		return session.getAttribute(USER_EMAIL) != null;
	}

}
