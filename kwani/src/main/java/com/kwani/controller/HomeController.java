package com.kwani.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kwani.domain.HomeVO;
import com.kwani.service.HomeService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Log4j
@Controller
@AllArgsConstructor
public class HomeController {

	private UserService service;
	
	private HomeService HomeService;

	@GetMapping({ "/", "/home" })
	public String home(Model model, HttpSession session, String startDate, String finishDate, String inputGenreName) {
		
		
		System.out.println("!!!!!!!!!!!!!!!!!!! : " + startDate);
		System.out.println("@@@@@@@@@@@@@@@@@@@ : " + finishDate);
		
		
		List<HomeVO> getList = HomeService.getList();
		System.out.println(getList);
		
		model.addAttribute("List", HomeService.getList());
		

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
		int month = calendar.get(calendar.MONTH) + 1;
		int date = calendar.get(calendar.DATE);

		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("date", date);

		return "/home";
	}
	
	
//	@GetMapping(value = "/{startDate}/{finishDate}/{genreName}", produces = {
//			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<List<HomeVO>> getImg(@PathVariable("startDate") String startDate, 
//			@PathVariable("finishDate") String finishDate, @PathVariable("genreName") String genreName) {
//		
//		log.info("getImg@@@@@");
//		
//		return new ResponseEntity<>(HomeService.getImg(startDate, finishDate, genreName), HttpStatus.OK);
//	}
	
	
	
	
	
	
	
	
	@GetMapping("/recommend")
	public String moveToRcmd() {
		// recommend 혹은 recommend/ 까지만 입력해서 url 이동하면 일반 추천 페이지로 보내준다
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

