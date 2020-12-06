package com.kwani.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.EmailVO;
import com.kwani.domain.UserVO;

public interface UserService {

	// 회원정보등록.
	public void register(UserVO user);

	// 회원정보 가져오기.
	public UserVO get(String email);

	// 회원이미지 존재여부 확인.
	public boolean checkUserImg(String email);

	// 회원이미지 가져오기.
	public UserVO getUserImg(String email);

	// 회원정보수정.
	public boolean modifyUserInfo(UserVO user);

	// 회원정보수정을 위한 로그인.
	public UserVO checkUserInfo(String email);

	// 회원이 회원탈퇴 했을 때, 상태변경.
	public boolean withdrawal(UserVO user);

	// 회원이 입력한 정보와 서버에 저장된 정보가 일치하는지 확인.
	public boolean checkUserIdPwd(String email, String pwd, RedirectAttributes rttr);

	// 회원이 입력한 ID(email)가 서버에 있는지 확인한다.
	public boolean isUserIdValid(String email, RedirectAttributes rttr);

	// 탈퇴한 회원인지 확인한다.
	public boolean checkWithdrawUser(String IdEmail);

	// 서버에 저장된 비밀번호를 이메일로 전송된 번호로 변경한다.
	public void modifyPwd(String IdEmail, String uuid);

	// 임시비밀번호를 생성하는 작업.
	public String newPwd();

	// 쿠키존재여부를 확인.
	public void checkCookie(@CookieValue(value = "cookie", required = false, defaultValue = "0") String cookie,
			String checked, HttpServletRequest request, Model model);

	// 세션존재여부를 확인.
	public boolean checkSession(HttpSession session, Model model);

	// 로그인 성공시, 쿠키와 세션을 생성.
	public boolean cookieSession(String email, String checked, HttpServletRequest request,
			HttpServletResponse response);

	// 회원가입시, 사용자의 가입여부를 확인.
	public boolean checkRegister(UserVO user, String email, RedirectAttributes rttr, Model model);

}
