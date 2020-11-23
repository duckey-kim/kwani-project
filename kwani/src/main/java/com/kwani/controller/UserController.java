package com.kwani.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.UserVO;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/user/*")
@AllArgsConstructor
@Controller
@Log4j
public class UserController {

	private UserService service;

	@GetMapping("/register")
	public String register() {

		return "/user/register";
	}

	@GetMapping("/userInfoCheck")
	public String userInfoCheck() {

		return "/user/userInfoCheck";

	}

	@GetMapping("/userInfoModify")
	public String userInfoModify(HttpSession session, Model model) {

		return "/user/userInfoModify";
	}

//	-------------------------------------------------------------------------------------------------------

	@RequestMapping(value = "/userInfoCheckAction", method = { RequestMethod.GET, RequestMethod.POST })
	public String userInfoCheckAction(String email, String pwd, HttpSession session, Model model,
			RedirectAttributes rttr) {

		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		// 1. 사용자가 입력한 값으로 DB에 일치하는 정보가 있는지 확인한다.
		// 이메일 일치여부 확인.
		if (service.get(email) == null) {
			// msg에 null을 담아서,
			String msg = "유효하지 않은 이메일입니다";
			// jsp로 보낸다.
			rttr.addFlashAttribute("msg", msg);

			return "redirect:/user/userInfoCheck";
		}

		// 2-1. DB에 있는 사용자 정보를 입력받은 정보를 매개로 불러온다.
		// 비밀번호 일치여부 확인.
		String userPwd = service.get(email).getPwd();
		// 2-2. DB에서 가져온 정보와 입력받은 정보가 일치하는지 확인한다.
		if (!(userPwd.equals(pwd))) {

			String pwdMsg = "유효하지 않은 비밀번호입니다";

			// 3-1. 페이지에서 정보를 비교하려면, 서버의 정보를 넘겨줘야 한다.
			rttr.addFlashAttribute("userPwd", userPwd);
			rttr.addFlashAttribute("pwdMsg", pwdMsg);

			return "redirect:/user/userInfoCheck";
		}
		// 2-1. 일치하면 userInfoModify로 이동한다.
		return "redirect:/user/userInfoModify";
	}

	@RequestMapping(value = "/logoutAction", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		session.invalidate();

		return "redirect:/home";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@CookieValue(value = "cookie", required = false, defaultValue = "0") String cookie,
			String checked, HttpServletRequest request, Model model) {

		service.checkCookie(cookie, checked, request, model);

		return "/user/login";
	}

	@PostMapping("/registerAction")
	public String register(UserVO user, RedirectAttributes rttr, Model model) {

		if (service.checkRegister(user, rttr, model) == false) {

			return "/user/register";
		} else

			return "redirect:/home";

	}

	@PostMapping("/loginAction")
	public String get(Model model, String email, String pwd, String checked, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr) {

		// 사용자가 입력한 email이 DB에 없는경우에 alert을 띄운다.

		System.out.println("DB에 저장된 이메일 : " + service.get(email));
		System.out.println("userInput : " + email);

		// 1. 만약 사용자가 입력한 정보가 DB에 없으면,
		if (service.get(email) == null) {
			// msg에 null을 담아서,
			String msg = "가입하지 않은 이메일이거나, 잘못 입력된 이메일입니다";
			// jsp로 보낸다.
			rttr.addFlashAttribute("msg", msg);

			return "redirect:/user/login";
		}

		// 2. 정보가 있으면, 일치여부를 확인하고, home으로 이동한다.
		// 쿠키 초기화.
		Cookie ck = null;

		// 1. DB에서 유저의 email과 password를 가져온다.
		String userEmail = service.get(email).getEmail();
		String userPwd = service.get(email).getPwd();

		// 2. 입력받은 정보가 DB에 저장된 정보와 일치하는지 비교한다.
		// 2-1. 만약 정보가 둘 다 일치하면 home로 이동한다.
		if (userEmail.equals(email) && userPwd.equals(pwd)) {

			// 정보가 일치하면 쿠키를 생성한다.
			// 만약 checked가 on이면,
			if (("on").equals(checked)) {
				// 쿠키를 추가한다.
				ck = new Cookie("cookie", userEmail);
				response.addCookie(ck);
				ck.setMaxAge(5);

				System.out.println("cookieName : " + ck.getName());
				System.out.println("cookieValue : " + ck.getValue());
			}
			// 로그인을 성공하면 session을 생성한다.
			HttpSession session = request.getSession();
			session.setAttribute("userEmail", userEmail);

			System.out.println("세션을 생성합니다 : " + session.getAttribute("userEmail"));
			System.out.println("로그인 성공!!");

			return "redirect:/home";

			// 2-2. 정보가 둘 중 하나라도 일치하지 않으면 login으로 이동한다.
		} else {

			String pwdMsg = "비밀번호가 일치하지 않습니다";

			rttr.addFlashAttribute("userInputEmail", userEmail);
			rttr.addFlashAttribute("userInputPwd", userPwd);
			rttr.addFlashAttribute("pwdMsg", pwdMsg);
			rttr.addFlashAttribute("email", email);
			rttr.addFlashAttribute("pwd", pwd);

			System.out.println("로그인 실패!!");

			return "redirect:/user/login";
		}
	}

	@PostMapping("/userInfoModifyAction")
	public String userInfoModifyAction(HttpSession session, UserVO user, RedirectAttributes rttr, Model model) {

		System.out.println("sessionName : " + session.getAttribute("userEmail"));
		// 회원의 이메일은 변경할 수 없다.

		// 이메일 값을 서버에서 가져와서 input창에 보여줘야하고, 변경할 수 없어야 한다.

		// 회원의 정보를 수정한다.
		// 회원이 원하는 사진, nick, pwd으로 수정한다.

		log.info("회원의 정보를 수정한다." + user);

		if (service.userInfoModify(user)) {
			rttr.addFlashAttribute("result", "success");

			// 수정이 완료되면, 완료되었다는 modal을 띄우고,
		}
		// home으로 이동한다.
		return "redirect:/home";

	}

	@PostMapping("/withdrawal")
	public String remove(@RequestParam("email") String email, RedirectAttributes rttr) {

		log.info("회원의 정보를 삭제한다.");

		if (service.remove(email)) {

			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/home";

	}

}
