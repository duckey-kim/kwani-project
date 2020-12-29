package com.kwani.controller;

import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.kwani.domain.UserVO;
import com.kwani.service.HomeService;
import com.kwani.service.PListService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class HomeController {

	private PListService plservice;

	private HomeService HomeService;

	@GetMapping({ "/", "/home" })
	public String home(Model model, HttpSession session, String startDate, String finishDate, String genreName) {

		model.addAttribute("slideImg", HomeService.getSlideImg());
		model.addAttribute("list", HomeService.getList());

		if (session.getAttribute("user") != null) {
			
			UserVO user = (UserVO) session.getAttribute("user");
			System.out.println("userNick : " + user.getNick());
			

			// 1-1. 세션값과 회원의 닉네임을 home으로 전달한다.
			model.addAttribute("sessionName", session.getAttribute("user"));
			model.addAttribute("userNick", user.getNick());
		}

		System.out.println("sessionName : " + session.getAttribute("user"));

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

	
	@GetMapping("/search") 
	public void search(@ModelAttribute("searchTxt")String searchTxt, Model model, HttpSession session) {
		
		//검색창에 입력한 가수 텍스트를 search 페이지에 보내준다
		//search 페이지에서 그 값을 받아서 값과 일치하는 결과를 보여준다
		System.out.println("@@@");
		log.info("search result....");
		System.out.println(searchTxt);
			
		//검색  시 가수명으로 결과 나오게 하기
		model.addAttribute("searchRst", plservice.getSearchRst(searchTxt));
		
		//검색 시  곡명으로 결과 나오게 하기(곡 목록만)
		model.addAttribute("searchRstWithSong", plservice.getSearchRstWithSong(searchTxt));
		
		//검색 시 앨범명으로 결과 나오게 하기(곡 목록만)
		model.addAttribute("searchRstWithAlbum", plservice.getSearchRstWithAlbum(searchTxt));
				
		//검색 결과 시 노래 가사 결과 나오게 하기
		model.addAttribute("searchLyrics", plservice.getSearchLyrics(searchTxt));
			
		//검색 결과 시 아티스트 결과 중복없이 나오게 하기
		model.addAttribute("searchArtist", plservice.getSearchArtist(searchTxt)); 	
		
		
		if(session.getAttribute("userEmail") != null) {
			
			//트랙 정보를 가져온다 
			model.addAttribute("getLikedTrack",plservice.getLikedTrack((String)session.getAttribute("userEmail")));
		  
			//아래 코드는 search.jsp 에서 쓰기! 
			model.addAttribute("getLikedArtist",plservice.getLikedArtist((String)session.getAttribute("userEmail")));
		  
			//회원의 플레이리스트 목록을 가져온다 
			model.addAttribute("getUserPlylst",plservice.getListPlylst((String)session.getAttribute("userEmail"))); 
			
			model.addAttribute("sessionName", session.getAttribute("userEmail"));
			
			System.out.println(session.getAttribute("userEmail"));
		 }
		
	}	
		
		
	

}
