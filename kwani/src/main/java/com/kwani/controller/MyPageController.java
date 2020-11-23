package com.kwani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping(value = "/mypage/*", method=RequestMethod.POST)
@Log4j
@AllArgsConstructor
public class MyPageController {
	
	private MyPageService myPageService;

	// 전체보기 (플레이리스트, 좋아요, 최근들은 곡 요약)
	// TODO: session 연결
	@RequestMapping(value = "/overview", method= {RequestMethod.POST, RequestMethod.GET})
	public String overview(Model model) {

		String email="a@naver.com";
		
		model.addAttribute("libraryList", myPageService.getListLibrary(email));
		model.addAttribute("likedArtistList", myPageService.getListLikedArtist(email));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(email));
		model.addAttribute("likedAlbumList", myPageService.getListLikedAlbum(email));
		model.addAttribute("user", myPageService.getUser(email));
		
		return "/mypage/overview";
	}

	// 좋아요
	@PostMapping("/like")
	public String like(@ModelAttribute("user") UserVO user, Model model) {
		
		model.addAttribute("likedArtistList", myPageService.getListLikedArtist(user.getEmail()));
		model.addAttribute("likedTrackList", myPageService.getListLikedTrack(user.getEmail()));
		model.addAttribute("likedAlbumList", myPageService.getListLikedAlbum(user.getEmail()));		

		return "/mypage/like";
	}

	// 최근들은 곡
	@PostMapping("/library")
	public String trackList(@ModelAttribute("user") UserVO user, Model model) {
		
		model.addAttribute("libraryList", myPageService.getListLibrary(user.getEmail()));
		model.addAttribute("user", myPageService.getUser(user.getEmail()));

		return "/mypage/library";
	}

	// 플레이리스트 목록 보여주기
	@RequestMapping(value = "/playlist", method= {RequestMethod.POST, RequestMethod.GET})
	public String playlist(@ModelAttribute("user") UserVO user, Model model, RedirectAttributes rttr) {
		
		System.out.println("어디가문젠데");
		System.out.println( "*****" + myPageService.getListPlaylist(user.getEmail()));
		model.addAttribute("playlist", myPageService.getListPlaylist(user.getEmail()));
		System.out.println("?????????");
		
		return "/mypage/playlist";
	}

	// 플레이리스트 상세 보여주기
	@PostMapping("/playlistDetail")
	public String playlistDetail(@ModelAttribute("plylstId")Integer plylstId, @ModelAttribute("user") UserVO user, Model model) {
		
		model.addAttribute("playlistDetail", myPageService.getPlaylistDetail(plylstId));
		model.addAttribute("trackCount", myPageService.countPlaylistTrack(plylstId));
		
		return "/mypage/playlistDetail";
	}
	
	
	// *****************************************
	// ************* 2차 개발 미완성 **************
	// *****************************************
	// 플레이리스트 생성 수정 삭제
	// 새 플레이리스트 seq 만들고 넘겨주는 페이지
	@PostMapping("/playlist/create")
	public String playlistCreate(@ModelAttribute("user") UserVO user, Model model) {
		
		PlaylistVO playlistVO = new PlaylistVO();
		playlistVO.setEmail(user.getEmail());
		playlistVO.setNm("제목을 입력하세요.");
		playlistVO.setDesc("내용을 입력하세요.");
		
		myPageService.setPlaylistId(playlistVO);
		
		model.addAttribute("plylstId", playlistVO.getPlylstId());
		System.out.println(playlistVO.getPlylstId());
		model.addAttribute("user", user);
		System.out.println("create" + user);
		
		return "/mypage/playlistView";
	}
	
	@PostMapping("/playlist/delete")
	public String deletePlaylist(@ModelAttribute("plylstId") Integer plylstId, @ModelAttribute("user") UserVO user, RedirectAttributes rttr) {
		
		myPageService.removePlaylist(plylstId);
		rttr.addFlashAttribute("user", user);

		return "redirect:/mypage/playlist";
	}
	
	
	// 플레이리스트 생성 및 수정 페이지
	@PostMapping("/playlist/modify")
	public String getPlaylistEdit(@ModelAttribute("playlistVO") PlaylistVO playlistVO, @ModelAttribute("user") UserVO user, RedirectAttributes rttr) {
		
		myPageService.modifyPlaylist(playlistVO);
		rttr.addFlashAttribute("user", user);
		
		return "redirect:/mypage/playlist";
	}
	
//	@PostMapping("/playlist/addtrack")
//	public String addTrack(Model model) {
//		
//		// search keyword 받으면 (일단 곡제목으로)
//		// 검색한 곡들 보여주기
//		// 버튼 누르면 보내기 playlist/123으로 보내기
//		
//		//model.addAttribute("findTrackList", myPageMapper.findTrack(trackTitle));
//		
//		return "/mypage/addTrack";
//	}

}