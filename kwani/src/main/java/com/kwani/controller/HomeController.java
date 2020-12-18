package com.kwani.controller;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kwani.service.HomeService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class HomeController {

	private UserService service;

	private HomeService HomeService;

	@GetMapping({ "/", "/home" })
	public String home(Model model, HttpSession session, String startDate, String finishDate, String genreName) {

		model.addAttribute("slideImg", HomeService.getSlideImg());
		model.addAttribute("list", HomeService.getList());

		if (session.getAttribute("userEmail") != null) {
			String userNick = service.get((String) session.getAttribute("userEmail")).getNick();

			System.out.println("userNick : " + userNick);

			// 1-1. 세션값과 회원의 닉네임을 home으로 전달한다.
			model.addAttribute("sessionName", session.getAttribute("userEmail"));
			model.addAttribute("userNick", userNick);
		}

		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		Calendar calendar = Calendar.getInstance();

		model.addAttribute("year", calendar.get(calendar.YEAR));
		model.addAttribute("month", calendar.get(calendar.MONTH) + 1);
		model.addAttribute("date", calendar.get(calendar.DATE));

		return "/home";
	}

	@GetMapping("/recommend")
	public String moveToRcmd() {
		
		return "redirect:/recommend/common";
	}

	@GetMapping("/admin")
	public String moveToAdmin() {
		return "/admin/home";
	}

	@GetMapping({ "/admin/modify", "/admin/modify/" })
	public String moveToAdminModify() {
		return "/admin/modify/home";
	}

}
