package com.kwani.service;

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

//로그인 체크기능 여기에 작성?

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
	public boolean remove(String email) {

		log.info("회원의 정보를 삭제한다." + email);

		return mapper.delete(email) == 1;
	}

	@Override
	public boolean userInfoModify(UserVO user) {

		log.info("회원의 정보를 수정한다.");

		return mapper.userInfoModify(user) == 1;
	}

	@Override
	public UserVO get(String email) {

		log.info("선택한 회원의 정보를 가져온다." + email);

		return mapper.get(email);

	}

	@Override
	public boolean isUserIdValid(String email, RedirectAttributes rttr) {

		// 1. 사용자가 입력한 값으로 DB에 일치하는 정보가 있는지 확인한다.
		// 이메일 일치여부 확인.
		if (mapper.get(email) == null) {
			
			String msg = "유효하지 않은 이메일입니다";
			
			rttr.addFlashAttribute("msg", msg);
		}
		return false;
	}

	@Override
	public boolean isUserPwdValid(String pwd, String email, RedirectAttributes rttr) {

		// 비밀번호 일치여부 확인.
		// 1. DB에 있는 사용자 정보를 입력받은 정보를 매개로 불러온다.

		String userPwd = mapper.get(email).getPwd();
		
		System.out.println(userPwd);
		System.out.println(pwd);
		// 1-2. DB에서 가져온 정보와 입력받은 정보가 일치하는지 확인한다.
		if (!(userPwd.equals(pwd))) {
			String pwdMsg = "유효하지 않은 비밀번호입니다";
			// 3-1. 페이지에서 정보를 비교하려면, 서버의 정보를 넘겨줘야 한다.
			rttr.addFlashAttribute("userPwd", userPwd);
			rttr.addFlashAttribute("pwdMsg", pwdMsg);
		}
		return false;
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
	public boolean checkRegister(UserVO user, RedirectAttributes rttr, Model model) {

		// 입력받은 값들을 DB에 저장한다. (email로 DB에 있는지 없는지 판단한다.)
		// 1. 입력한 email값을 DB에서 가져오고, 있는지 없는지 체크한다.

		// 2. 사용자가 입력한 email과 같은 값을 DB에서 가져온다.
		UserVO savedEmail = mapper.get(user.getEmail());

		System.out.println("user.getEmail : " + user.getEmail());
		System.out.println("savedEmail : " + savedEmail);
		// 3. 입력한 이메일이 null인지 아닌지 확인한다.
		// 3-1. 만약 입력한 값이 저장되어 있지 않으면(null)이면,
		if (savedEmail == null) {
			// 3-2. DB에 저장한다.
			if (user.getEmail() != null) {
				mapper.insert(user);
				System.out.println("user : " + user);

				return true;
			}
			// 3-3. DB에 있으면 alert을 띄운다.
		} else {
			String msg = "이미 존재하는 이메일입니다.";
			model.addAttribute("msg", msg);
		}
		return false;

	}

//	@Override
//	public boolean checkLogin(String email, String pwd, String checked, HttpServletRequest request,
//			HttpServletResponse response, RedirectAttributes rttr) {
//		
//		// 1. DB에서 유저의 email과 password를 가져온다.
//		String userEmail = mapper.get(email).getEmail();
//		String userPwd = mapper.get(email).getPwd();
//		
//		
//
//		// 2. 입력받은 정보가 DB에 저장된 정보와 일치하는지 비교한다.
//		// 2-1. 만약 정보가 둘 다 일치하면 home로 이동한다.
//		if (userEmail.equals(email) && userPwd.equals(pwd)) {
//
//			return true;
//		// 2-2. 정보가 둘 중 하나라도 일치하지 않으면 login으로 이동한다.
//		} else {
//			String pwdMsg = "비밀번호가 일치하지 않습니다";
//			rttr.addFlashAttribute("userInputEmail", userEmail);
//			rttr.addFlashAttribute("userInputPwd", userPwd);
//			rttr.addFlashAttribute("pwdMsg", pwdMsg);
//			rttr.addFlashAttribute("email", email);
//			rttr.addFlashAttribute("pwd", pwd);
//			System.out.println("로그인 실패!!");
//
//			return false;
//		}
//	}
//
//	@Override
//	public void cookieSession(String email, String checked, HttpServletRequest request,
//			HttpServletResponse response) {
//
//		Cookie ck = null;
//		String userEmail = mapper.get(email).getEmail();
//
//		// 정보가 일치하면 쿠키를 생성한다.
//		// 만약 checked가 on이면,
//		if (("on").equals(checked)) {
//			// 쿠키를 추가한다.
//			ck = new Cookie("cookie", userEmail);
//			response.addCookie(ck);
//			ck.setMaxAge(5);
//
//			System.out.println("cookieName : " + ck.getName());
//			System.out.println("cookieValue : " + ck.getValue());
//		}
//		// 로그인을 성공하면 session을 생성한다.
//		HttpSession session = request.getSession();
//		session.setAttribute("userEmail", userEmail);
//
//		System.out.println("세션을 생성합니다 : " + session.getAttribute("userEmail"));
//		System.out.println("로그인 성공!!");
//	}

	
	@Override
	public UserVO userInfoCheck(String email) {

		log.info("자신의 정보를 수정하기 위해 회원의 정보를 가져온다." + email);

		return mapper.userInfoCheck(email);
	}
}
