package com.kwani.service;


import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.UserVO;
import com.kwani.mapper.UserMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

	private UserMapper mapper;
	
	

	@Override
	public void register(UserVO user) {
		log.info("회원의 정보를 등록한다." + user);
		mapper.insert(user);
	}

	@Override
	public boolean withdrawal(UserVO user) {
		log.info("회원탈퇴로 인해 회원의 권한을 변경한다.");

		return mapper.withdrawal(user) == 1;
	}

	@Override
	public boolean modifyUserInfo(UserVO user) {
		log.info("회원의 정보를 수정한다.");
		return mapper.modifyUserInfo(user) == 1;
	}
	
	
	@Override
	public boolean updateUserImg(UserVO user) {
		
		log.info("회원의 이미지를 수정한다.");
		return mapper.updateUserImg(user) == 1;
	}

	@Override
	public UserVO get(String email) {
		log.info("선택한 회원의 정보를 가져온다." + email);
		return mapper.get(email);
	}
	
	
	@Override
	public boolean checkWithdrawUser(String IdEmail) {
		log.info("탈퇴한 회원인지 확인한다.");
		System.out.println("탈퇴한 회원인지 확인한다.");
		System.out.println(IdEmail);

		// 2를 반환하면 탈퇴한 회원.
		if (mapper.checkWithdrawUser(IdEmail) == 2) {
			System.out.println(mapper.checkWithdrawUser(IdEmail));
			return true;
		// 2가 아니면 활동중인 회원.
		} else 
			return false;
	}
	
	
	
	@Override
	public boolean checkUserIdPwd(String email, String pwd, RedirectAttributes rttr) {
		log.info("회원이 입력한 정보와 서버에 저장된 정보를 비교한다.");
		
		if (mapper.checkUserIdPwd(email, pwd) == 1)
			return true;
		 else {
			String msg = "이메일 혹은 비밀번호가 일치하지 않습니다.";
			rttr.addFlashAttribute("msg", msg);
			return false;
		 }
	}
	
	@Override
	public boolean isUserIdValid(String email, RedirectAttributes rttr) {
		// 1. 사용자가 입력한 값으로 DB에 일치하는 정보가 있는지 확인한다.
		// 이메일 일치여부 확인.
		if (mapper.isUserIdVaild(email) != 1) {
			String msg = "유효하지 않은 이메일입니다";
			rttr.addFlashAttribute("msg", msg);

			return false;
		}
		return true;
	}
	
	
	@Override
	public boolean checkSession(HttpSession session, RedirectAttributes rttr) {
		// 로그인하지 않은 사용자의 접근을 차단한다.
		
		if(session.getAttribute("userEmail") != null)
			return false;
		else {
			String msg = "로그인 후 이용하실 수 있습니다.";
			rttr.addFlashAttribute("sessionMsg", msg);
			return true;
		}
	}
	
	
	
	@Override
	public void checkCookie(String cookie, String checked, HttpServletRequest request, Model model) {
		// 쿠키는 배열로 반환된다. 쿠키 값이 없으면 null을 반환한다.
		// 쿠키값을 초기화한다.
		String cookieValue = "";

		// 저장된 쿠키들을 가져온다.
		Cookie[] cookies = request.getCookies();

		// 만약 같은 쿠키가 있고,
		if (cookies != null) {
			// 저장된 쿠키중에서
			for (int i = 0; i < cookies.length; i++)
				// 이름이 같으면,
				if (cookies[i].getName().equals("cookie"))
					// 초기화된 쿠키 값에 쿠키배열에서 찾은 쿠키값을 저장한다.
					cookieValue = cookies[i].getValue();
			model.addAttribute("cookieValue", cookieValue);
			model.addAttribute("checked", true);
		} else {
			model.addAttribute("checked", false);
		}
		System.out.println("cookieValue : " + cookieValue);
		System.out.println("checked : " + checked);
	}

	@Override
	public boolean checkRegister(UserVO user, String email, RedirectAttributes rttr, Model model) {
		// 입력받은 값들을 DB에 저장한다. (email로 DB에 있는지 없는지 판단한다.)
		// 
		if (mapper.isUserIdVaild(email) != 1) {
			
			mapper.insert(user);
			return true;
		} else {
			String msg = "이미 존재하는 이메일입니다.";
			model.addAttribute("msg", msg);
		}
		return false;
	}

	@Override
	public boolean cookieSession(String email, String checked, HttpServletRequest request,
			HttpServletResponse response) {

		Cookie ck = null;
		String userEmail = mapper.get(email).getEmail();
		// 정보가 일치하면 쿠키를 생성한다.
		// 만약 checked가 on이면,
		if (("on").equals(checked)) {
			// 쿠키를 추가한다.
			ck = new Cookie("cookie", userEmail);
			response.addCookie(ck);
			ck.setMaxAge(10);
			System.out.println("cookieName : " + ck.getName());
			System.out.println("cookieValue : " + ck.getValue());
		}
		// 로그인을 성공하면 session을 생성한다.
		HttpSession session = request.getSession();
		session.setAttribute("userEmail", userEmail);
		System.out.println("세션을 생성합니다 : " + session.getAttribute("userEmail"));
		System.out.println("로그인 성공!!");

		return true;
	}

	@Override
	public UserVO checkUserInfo(String email) {
		log.info("자신의 정보를 수정하기 위해 회원의 정보를 가져온다." + email);
		return mapper.checkUserInfo(email);
	}

	// 임시 비밀번호 생성해주는 작업.
	@Override
	public String newPwd() { 

		String uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다.

		// 새로운 비밀번호를 생성한다.
		for (int i = 0; i < 1; i++) {
			uuid = uuid.substring(0, 8); // uuid를 앞에서부터 8자리 잘라줌.
			System.out.println(i + ") " + uuid);
		}
		return uuid;
	}

	@Override
	public void modifyPwd(String IdEmail, String uuid) {
		
		System.out.println("IdEmail : " + IdEmail);
		System.out.println("uuid : " + uuid);
		// 여기서 기존의 비밀번호를 uuid로 바꿔줘야 한다.
		mapper.modifyPwd(IdEmail, uuid);
	}

	

}
