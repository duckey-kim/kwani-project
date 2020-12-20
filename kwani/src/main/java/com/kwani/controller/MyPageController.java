package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.PlaylistVO;
import com.kwani.domain.UserVO;
import com.kwani.service.MyPageService;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/mypage/*", method = RequestMethod.POST)
@Log4j
@AllArgsConstructor
public class MyPageController {

	private MyPageService myPageService;
	private UserService userService;

	// 전체보기 (플레이리스트, 좋아요, 최근들은 곡 요약)
	@RequestMapping(value = "/overview", method = { RequestMethod.POST, RequestMethod.GET })
	public String overview(HttpSession session, Model model) {

		String email = (String)session.getAttribute("userEmail");
		UserVO userVO = userService.get(email);

		model.addAttribute("libraryList", myPageService.getListLibrary(email));
		model.addAttribute("likedArtistList", myPageService.getListLikedArtist(email));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(email));
		model.addAttribute("likedAlbumList", myPageService.getListLikedAlbum(email));

		session.setAttribute("user", userVO);
		
		return "/mypage/overview";
	}

	// 좋아요
	@PostMapping("/like")
	public String like(HttpSession session, Model model) {

		String email = (String)session.getAttribute("userEmail");

		model.addAttribute("likedArtistList", myPageService.getListLikedArtist(email));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(email));
		model.addAttribute("likedAlbumList", myPageService.getListLikedAlbum(email));

		return "/mypage/like";
	}

	// 최근들은 곡
	@PostMapping("/library")
	public void trackList(HttpSession session, Model model) {

		String email = (String)session.getAttribute("userEmail");
		
		model.addAttribute("libraryList", myPageService.getListLibrary(email));

	}

	// 플레이리스트 목록 보여주기
	@RequestMapping(value = "/playlist", method = { RequestMethod.POST, RequestMethod.GET })
	public String playlist(HttpSession session, Model model) {

		String email = (String)session.getAttribute("userEmail");

		model.addAttribute("playlistVO", myPageService.getListPlaylist(email));
		model.addAttribute("playlistCount", myPageService.countPlaylist(email));

		return "/mypage/playlist";
	}

	// 플레이리스트 상세(곡)보여주기
	@PostMapping("/playlistDetail")
	public String playlistDetail(@ModelAttribute("plylstId") Integer plylstId, HttpSession session, Model model) {

		String email = (String)session.getAttribute("userEmail");

		model.addAttribute("playlistDetail", myPageService.getListPlaylistDetail(plylstId, email));
		model.addAttribute("trackCount", myPageService.countPlaylistTrack(plylstId));

		return "/mypage/playlistDetail";
	}
	
	// TODO : Null check
	// 새 플레이리스트 생성
	@PostMapping("/playlist/create")
	public String createPlaylist(@ModelAttribute("playlistVO") PlaylistVO playlistVO, HttpSession session , Model model) {
			
		String email = (String)session.getAttribute("userEmail");
			
		myPageService.createPlaylist(playlistVO);
		model.addAttribute("playlistVO", playlistVO);
					
		return "redirect:/mypage/playlist/" + playlistVO.getPlylstId();
	}

	// 수정 페이지
	@GetMapping("/playlist/{plylstId}")
	public String showPlaylist(@PathVariable("plylstId")Integer plylstId, HttpSession session , Model model) {
		
		String email = (String)session.getAttribute("userEmail");

		PlaylistVO playlistVO =  myPageService.getOnePlaylistVO(plylstId, email);
		
		if(playlistVO == null) {
			return "errorAccess";
		}
		
		model.addAttribute("playlistVO", playlistVO);		
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(email));
				
		return "/mypage/playlistView";
	}

	// 플레이리스트 삭제
	@PostMapping("/playlist/delete")
	public String deletePlaylist(Integer plylstId, HttpSession session, RedirectAttributes rttr) {

		String email = (String)session.getAttribute("userEmail");
		
		boolean result = myPageService.removePlaylist(plylstId, email);
		
		rttr.addFlashAttribute("successDel", result ? "SUCCESS" : "FAIL");
		
		return "redirect:/mypage/playlist";
	}

	// 플레이리스트 수정
	@PostMapping("/playlist/modify")
	public String getPlaylistEdit(@ModelAttribute("playlistVO") PlaylistVO playlistVO, HttpSession session, RedirectAttributes rttr) {
		
		//유효성체크.. 본인만 수정할 수 있도록
		String email = (String)session.getAttribute("userEmail");
		
		boolean result = myPageService.modifyPlaylist(playlistVO, email);
		
		rttr.addFlashAttribute("result", result ? playlistVO.getNm() : "FAIL");

		return "redirect:/mypage/playlist";
	}

}