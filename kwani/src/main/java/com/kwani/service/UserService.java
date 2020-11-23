package com.kwani.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.UserVO;

public interface UserService {

	// 회원의 정보를 등록.
	public void register(UserVO user);
	
	// 정보삭제.
	public boolean remove(String email);
	
	// 정보 가져오기.
	public UserVO get(String email);
	
	// 회원자신의 정보를 수정.
	public boolean userInfoModify(UserVO user);
	
	// 회원정보수정을 위한 로그인. 					
	public UserVO userInfoCheck(String email);
	
	
	
	
	
	
	// 아이디 중복여부 확인.
	public boolean isUserIdValid(String email, RedirectAttributes rttr);
	
	// 비밀번호 확인.
	public boolean isUserPwdValid(String pwd, String email, RedirectAttributes rttr);
	
	// 쿠키존재여부를 확인.
	public void checkCookie(@CookieValue(value = "cookie", required = false, defaultValue = "0") String cookie, 
			String checked, HttpServletRequest request, Model model);
	
//	// 로그인작업 처리. 
//	public boolean checkLogin(String email, String pwd, String checked, HttpServletRequest request, 
//			HttpServletResponse response, RedirectAttributes rttr);
//	
//	// 로그인 성공시, 쿠키와 세션을 생성.
//	public void cookieSession(String email, String checked, HttpServletRequest request,
//			HttpServletResponse response);
	
	// 회원가입시, 사용자의 가입여부를 확인.
	public boolean checkRegister(UserVO user, RedirectAttributes rttr, Model model);
	
	
	
}
