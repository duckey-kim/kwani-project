package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import com.kwani.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	private UserService service;

	@GetMapping({ "/", "/home" })
	public String home(Model model, HttpSession session) {

		if (session.getAttribute("userEmail") != null) {
			String userNick = service.get((String) session.getAttribute("userEmail")).getNick();

			System.out.println("userNick : " + userNick);

			// 1-1. 세션값과 회원의 닉네임을 home으로 전달한다.

			model.addAttribute("sessionName", session.getAttribute("userEmail"));
			model.addAttribute("userNick", userNick);
		}

		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		return "/home";
	}

	@GetMapping("/recommend")
	public String moveToRcmd() {
		// recommend 혹은 recommend/ 까지만 입력해서 url 이동하면 일반 추천 페이지로 보내준다
		return "redirect:/recommend/common";
	}
	
	@GetMapping("/admin")
	public String moveToAdmin() {
		return "/admin/home";
	}
	@GetMapping({"/admin/modify","/admin/modify/"})
	public String moveToAdminModify() {
		return "/admin/modify/home";
	}
}
