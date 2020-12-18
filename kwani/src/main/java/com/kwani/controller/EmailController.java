package com.kwani.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.EmailSender;
import com.kwani.domain.EmailVO;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
@RequestMapping("/search/*")
public class EmailController {

	private UserService service;

	@Autowired
	private EmailSender emailSender;
	
	// 비밀번호 찾는 페이지.
	@GetMapping("/findUserPwd")
	public void findUserPwd() {
		log.info("findUserPwd");
	}
	
	@GetMapping("/findUserPwd1")
	public void findUserPwd1() {
		log.info("findUserPwd1");
	}
	
	// ModelAndView : 데이터와 내가 이동할 페이지를 저장한다.
	@RequestMapping("/findUserPwdAction")
	public ModelAndView sendEmailAction(String IdEmail, String email, RedirectAttributes rttr) throws Exception {
		
		ModelAndView mav;
		
		EmailVO emailVO = new EmailVO();
		
		System.out.println("IdEmail : " + IdEmail);
		// 임시번호를 받는 이메일.
		String realEmail = email;
		System.out.println("사용자가 비밀번호를 받을 이메일 : " + realEmail);
		
		if (service.checkWithdrawUser(IdEmail)) {
			System.out.println(service.checkWithdrawUser(IdEmail));
			rttr.addFlashAttribute("msg", "입력하신 이메일은 유효하지 않습니다. 다른 이메일을 입력하세요.");
			mav = new ModelAndView("redirect:/search/findUserPwd1");
			
			return mav;
		}
		
		// 서버에 저장된 비밀번호가 이메일로 전송된 번호로 변경된다.
		service.modifyPwd(IdEmail, service.newPwd());
		
		String newPwd = (String) service.get(IdEmail).getPwd();
		
		emailVO.setTitle("임시비밀번호 발급 이메일입니다.");
		emailVO.setContent("안녕하세요!" + "" + IdEmail + "님의 임시비밀번호는" + newPwd + "입니다." + "로그인 후 새로운 비밀번호로 변경해주세요!");
		emailVO.setReceiver(realEmail);
		emailSender.SendEmail(emailVO);
		
		rttr.addFlashAttribute("msg", "임시비밀번호가 발급되었습니다. 이메일을 확인해주세요.");
		
		mav = new ModelAndView("redirect:/user/login");
		return mav;
		
	}
}