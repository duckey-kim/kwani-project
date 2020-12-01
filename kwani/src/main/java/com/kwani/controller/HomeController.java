package com.kwani.controller;


import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

		
		Calendar calendar = Calendar.getInstance();
		
		int year = calendar.get(calendar.YEAR);
		int month = calendar.get(calendar.MONTH)+1;
		int date = calendar.get(calendar.DATE);
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("date", date);
		
		return "/home";
	}
}
