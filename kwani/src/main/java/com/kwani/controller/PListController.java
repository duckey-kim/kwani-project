package com.kwani.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwani.domain.UserVO;
import com.kwani.service.LikeAndPlaylistService;
import com.kwani.service.PListService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recommend/*")
@AllArgsConstructor
public class PListController {

	private PListService plservice;
	private LikeAndPlaylistService likeAndPlaylistService;

	// 일반 사용자 추천 페이지
	@GetMapping("/common")
	public void list(Model model, HttpSession session) {

		// 장르별 플레이리스트 id와 이름을 보여준다
		// 플레이리스트 번호와 이름만 보여주기
		log.info("allplist...");
		model.addAttribute("allplist", plservice.getAllList());
		
		model.addAttribute("sessionName", session.getAttribute("user"));
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
		if(session.getAttribute("user") != null) {
			
			UserVO user = (UserVO)session.getAttribute("user");
			String email = user.getEmail();
		
			//트랙 정보를 가져온다 
			model.addAttribute("getLikedTrack",plservice.getLikedTrack(email));
		  
			//아래 코드는 search.jsp 에서 쓰기! 
			model.addAttribute("getLikedArtist",plservice.getLikedArtist(email));
		  
			//회원의 플레이리스트 목록을 가져온다 
			model.addAttribute("getUserPlylst",plservice.getListPlylst(email)); 
			
			model.addAttribute("sessionName", session.getAttribute("user"));
			
			System.out.println(session.getAttribute("user"));
		 }

	}
	
	
	
	//덕환부분
	
	
	
	@GetMapping("/member")
	public void memberRecommend(HttpSession session,Model model) {
		UserVO user= (UserVO)session.getAttribute("user");
		String email=user.getEmail();
		int genreCode = plservice.getUserLikeGenre(email,100);
		int typeCode = plservice.getUserLikeType(email,200);
		System.out.println("genreCd  :"+genreCode);
		System.out.println("typeCd  :"+typeCode);
		List<Map<String,String>> listByGenre =plservice.recommendGenre(genreCode);
		List<Map<String,String>> listByType = plservice.recommendType(typeCode);
		
		model.addAttribute("getPlaylists", likeAndPlaylistService.getPlaylists(email));
		model.addAttribute("genreList",listByGenre);
		model.addAttribute("typeList",listByType);
	}
}


