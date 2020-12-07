package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kwani.domain.PListVO;
import com.kwani.service.PListService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class HomeController {

	private UserService service;
	private PListService plservice;

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
	
	@GetMapping("/search") 
	public void search(@ModelAttribute("searchTxt")String searchTxt, Model model) {
		
		//검색창에 입력한 가수 텍스트를 search 페이지에 보내준다
		//search 페이지에서 그 값을 받아서 값과 일치하는 결과를 보여준다
		System.out.println("@@@");
		log.info("search result....");
		System.out.println(searchTxt);
			
		model.addAttribute("searchRst", plservice.getSearchRst(searchTxt));
				
		//검색 결과 시 노래 가사 결과 나오게 하기
		model.addAttribute("searchLyrics", plservice.getSearchLyrics(searchTxt));
			
		//검색 결과 시 아티스트 결과 중복없이 나오게 하기
		model.addAttribute("searchArtist", plservice.getSearchArtist(searchTxt));
		
		//type 갖고 오기?
		//PListVO artistType = plservice.getSearchArtist(searchTxt).
		
		
	}	
		
		
	
}
