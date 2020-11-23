package com.kwani.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminLoginFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		
		// TODO Auto-generated method stub
		//url : /admin/loginform을 제외하면 요청에 대해서 
		//만약에 admin로그인이 안되어 있다면 /admin/loginform으로 가게한다.
		//로그인되었으면 chain do filter
		HttpServletRequest HttpRequest = (HttpServletRequest)request;
		HttpSession session = HttpRequest.getSession(true);
		HttpServletResponse HttpResponse = (HttpServletResponse)response; 
		if(!isLogIn(session)&&!HttpRequest.getRequestURI().contains("login")) {

			HttpResponse.sendRedirect("/admin/loginform");
		}
		chain.doFilter(request, response);
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	private boolean isLogIn(HttpSession session) {
//		HttpSession session = httpRequest.getSession(true);
		// TODO Auto-generated method stub
		return session.getAttribute("mngrId") != null;
	}

}
