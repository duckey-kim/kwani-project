package com.kwani.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwani.domain.Criteria;
import com.kwani.domain.PListVO;
import com.kwani.domain.PageDTO;
import com.kwani.domain.UserVO;
import com.kwani.service.PListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/search/*")
@AllArgsConstructor
public class SearchController {
	
	private PListService plservice;	

	//검색 결과에서 '아티스트' 탭 누른 결과 페이지
	@GetMapping("/artist")
	public void searchArtist(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri, HttpSession session) {
		
		log.info("searchArtist" + cri);
		List<PListVO> searchArtistList = plservice.getSearchArtistWithPaging(cri, searchTxt);
		model.addAttribute("searchArtist",searchArtistList);
		
		int total = plservice.getTotalCountArtist(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
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

	//검색 결과에서 '곡' 탭 누른 결과 페이지 -> 아티스트명으로 검색
	@GetMapping("/songartist")
	public void searchSongArtist(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri, HttpSession session) {
		
		log.info("searchSongArtist" + cri);		

		List<PListVO> searchSongList = plservice.getSearchSongWithPaging1(cri, searchTxt);
		model.addAttribute("searchSong", searchSongList);
		
		int total = plservice.getTotalCountSongArtist(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));	
		
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
	
	//검색 결과에서 '곡' 탭 누른 결과 페이지 -> 곡명으로 검색
	@GetMapping("/songtitle")
	public void searchSongTitle(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri, HttpSession session) {
		
		log.info("searchSongTitle" + cri);
		
		List<PListVO> searchSongList2 = plservice.getSearchSongWithPaging2(cri, searchTxt);
		model.addAttribute("searchSong2", searchSongList2);
		
		int total = plservice.getTotalCountSongTitle(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
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
	
	//검색 결과에서 '앨범' 탭 누른 결과 페이지 -> 아티스트명으로 검색
	@GetMapping("/albumartist")
	public void searchAlbumArtist(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri, HttpSession session) {
		
		System.out.println("searchAlbumArtist" + cri);
		
		List<PListVO> searchAlbumList = plservice.getSearchAlbumWithPaging1(cri, searchTxt);
		System.out.println(searchAlbumList);
		model.addAttribute("searchAlbum", searchAlbumList);
		
		int total = plservice.getTotalCountAlbumArtist(searchTxt);
		System.out.println("total : "+total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));

		model.addAttribute("sessionName", session.getAttribute("user"));
	}
	
	//검색 결과에서 '앨범' 탭 누른 결과 페이지 -> 앨범명으로 검색
	@GetMapping("/albumtitle")
	public void searchAlbumTitle(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri, HttpSession session) {
		
		log.info("searchAlbumTitle" + cri);
		
		List<PListVO> searchAlbumList2 = plservice.getSearchAlbumWithPaging2(cri, searchTxt);
		model.addAttribute("searchAlbum2", searchAlbumList2);
		
		int total = plservice.getTotalCountAlbumTitle(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		model.addAttribute("sessionName", session.getAttribute("user"));
	}
	
	
	//검색 결과에서 '가사' 탭 누른 결과 페이지
	@GetMapping("/lyrics")
	public void searchLyrics(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri, HttpSession session) {
		
		System.out.println("searchLyrics" + cri);
		
		List<PListVO> searchLyricsList = plservice.getSearchLyricsWithPaging(cri, searchTxt);
		model.addAttribute("searchLyrics", searchLyricsList);
		
		int total = plservice.getTotalCountLyrics(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
		model.addAttribute("sessionName", session.getAttribute("user"));
	}
	
}
