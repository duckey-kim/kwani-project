package com.kwani.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwani.service.PListService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recommend/*")
@AllArgsConstructor
public class PListController {

	private UserService userService;
	private PListService plservice;

	// 일반 사용자 추천 페이지
	@GetMapping("/common")
	public void list(Model model) {

		// 장르별 플레이리스트 id와 이름을 보여준다
		// 플레이리스트 번호와 이름만 보여주기
		log.info("allplist...");
		model.addAttribute("allplist", plservice.getAllList());
	}

	// 플레이리스트 상세 페이지
	@GetMapping("/plylst")
	public void plylst(Integer plylstId, Model model, HttpSession session) {

		System.out.println(plylstId);
		log.info("plist name....");
		System.out.println(plservice.getListName(plylstId));

		// plylstId값과 같은 id값을 가진 plylstNm을 가져온다
		model.addAttribute("plistName", plservice.getListName(plylstId));

		// plylstId 값을 통해 같은 id 값을 가진 플레이리스트 목록을 가져온다
		model.addAttribute("plistListDtl", plservice.getListDtl(plylstId));

		
		//세션 체크를 해서 세션이 있으면(로그인했다면) 
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
	
	
	
	//덕환부분
	
	
	
	@GetMapping("/member")
	public void memberRecommend(HttpSession session,Model model) {
		int genreCode = plservice.getUserLikeGenre(session,100);
		int typeCode = plservice.getUserLikeType(session,200);
		List<Map<String,String>> listByGenre =plservice.recommendGenre(genreCode);
		List<Map<String,String>> listByType = plservice.recommendType(typeCode);
		
		model.addAttribute("genreList",listByGenre);
		model.addAttribute("typeList",listByType);
	}
}


