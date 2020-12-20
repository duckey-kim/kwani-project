package com.kwani.controller;

import javax.servlet.http.HttpServletRequest;
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

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/mypage/*", method = RequestMethod.POST)
@Log4j
@AllArgsConstructor
public class MyPageController {

	private MyPageService myPageService;

	// 전체보기 (플레이리스트, 좋아요, 최근들은 곡 요약)
	@RequestMapping(value = "/overview", method = { RequestMethod.POST, RequestMethod.GET })
	public String overview(HttpServletRequest request, Model model) {

		String email = "a@naver.com";

		model.addAttribute("libraryList", myPageService.getListLibrary(email));
		model.addAttribute("likedArtistList", myPageService.getListLikedArtist(email));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(email));
		model.addAttribute("likedAlbumList", myPageService.getListLikedAlbum(email));

		UserVO user = myPageService.getOneUser(email);

		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		return "/mypage/overview";
	}

	// 좋아요
	@PostMapping("/like")
	public String like(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");

		model.addAttribute("likedArtistList", myPageService.getListLikedArtist(user.getEmail()));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(user.getEmail()));
		model.addAttribute("likedAlbumList", myPageService.getListLikedAlbum(user.getEmail()));

		return "/mypage/like";
	}

	// 최근들은 곡
	@PostMapping("/library")
	public void trackList(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");
		model.addAttribute("libraryList", myPageService.getListLibrary(user.getEmail()));

	}

	// 플레이리스트 목록 보여주기
	@RequestMapping(value = "/playlist", method = { RequestMethod.POST, RequestMethod.GET })
	public String playlist(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");

		model.addAttribute("playlistVO", myPageService.getListPlaylist(user.getEmail()));
		model.addAttribute("playlistCount", myPageService.countPlaylist(user.getEmail()));

		return "/mypage/playlist";
	}

	// 플레이리스트 상세(곡)보여주기
	@PostMapping("/playlistDetail")
	public String playlistDetail(@ModelAttribute("plylstId") Integer plylstId, HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");

		model.addAttribute("playlistDetail", myPageService.getListPlaylistDetail(plylstId, user.getEmail()));
		model.addAttribute("trackCount", myPageService.countPlaylistTrack(plylstId));

		return "/mypage/playlistDetail";
	}
	
	// TODO : Null check
		// 새 플레이리스트 생성
	@PostMapping("/playlist/create")
	public String createPlaylist(@ModelAttribute("playlistVO") PlaylistVO playlistVO, HttpSession session , Model model) {
			
		UserVO user = (UserVO) session.getAttribute("user");
			
		myPageService.createPlaylist(playlistVO);
		System.out.println(playlistVO);
		model.addAttribute("playlistVO", playlistVO);
					
		return "redirect:/mypage/playlist/" + playlistVO.getPlylstId();
	}

	@GetMapping("/playlist/{plylstId}")
	public String showPlaylist(@PathVariable("plylstId")Integer plylstId, HttpSession session , Model model) {
		
		UserVO user = (UserVO) session.getAttribute("user");
		
		System.out.println(plylstId);
		model.addAttribute("playlistVO", myPageService.getOnePlaylistVO(plylstId, user.getEmail()));		
		System.out.println(myPageService.getOnePlaylist(plylstId, user.getEmail()));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(user.getEmail()));
				
		return "/mypage/playlistView";
	}

	// 플레이리스트 삭제
	@PostMapping("/playlist/delete")
	public String deletePlaylist(Integer plylstId, HttpSession session, RedirectAttributes rttr) {

		UserVO user = (UserVO) session.getAttribute("user");

		boolean result = myPageService.removePlaylist(plylstId, user.getEmail());
		
		rttr.addFlashAttribute("successDel", result ? "SUCCESS" : "FAIL");
		
		return "redirect:/mypage/playlist";
	}

	// 플레이리스트 수정
	@PostMapping("/playlist/modify")
	public String getPlaylistEdit(@ModelAttribute("playlistVO") PlaylistVO playlistVO, HttpSession session, RedirectAttributes rttr) {
		
		//유효성체크.. 본인만 수정할 수 있도록
		UserVO user = (UserVO) session.getAttribute("user");
		
		boolean result = myPageService.modifyPlaylist(playlistVO, user.getEmail());
		
		rttr.addFlashAttribute("result", result ? playlistVO.getNm() : "FAIL");

		return "redirect:/mypage/playlist";
	}

}