package com.kwani.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.kwani.domain.UserVO;
import com.kwani.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/mypage/*")
@RestController
@Log4j
@AllArgsConstructor
public class MyPageRestController {

	private MyPageService myPageService;

	// 좋아요 곡 삭제
	@PostMapping(value="/liketrack/remove", produces = {"text/plane"})
	public String removeLikeTrack(@RequestBody String trackId, HttpSession session, Model model) {
		
		UserVO user = (UserVO) session.getAttribute("user");
		String email = user.getEmail();
		
		Integer trackIdValue = Integer.parseInt(trackId);
		
		int result = myPageService.removeLikeTrack(trackIdValue, email);
		
		return result == 1? "SUCCESS" : "FAIL";
	}
	
	// 좋아요 곡 추가
	@PostMapping(value="/addliketrack", produces = {"text/plane"})
	public String addLikeTrack(@RequestBody String trackId, HttpSession session, Model model) {
		
		UserVO user = (UserVO) session.getAttribute("user");
		String email = user.getEmail();
		
		Integer trackIdValue = Integer.parseInt(trackId);
		
		int result = myPageService.addLikeTrack(trackIdValue, email);
		
		return result == 1? "SUCCESS" : "FAIL";
	}
	
	// 최근들은 곡 목록 가져오기
	@GetMapping(value = "/libraryList", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String getLibraryList(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");
		String email = user.getEmail();

		Gson gson = new Gson();
		String data = gson.toJson(myPageService.getListLibrary(email));

		return data;
	}

	// 좋아하는 곡 목록 가져오기
	@GetMapping(value = "/likeList", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String getLikeTrackList(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");
		String email = user.getEmail();

		Gson gson = new Gson();
		String data = gson.toJson(myPageService.getListLikedTrack(email));

		return data;
	}
	
	// 플레이리스트 곡 추가
	@PostMapping(value = "/playlist/inserttrack" , produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String insertTrack(@RequestParam(value = "trackList[]") Set<Integer> trackList, @RequestParam Integer plylstId, HttpSession session) {
		
		UserVO user = (UserVO) session.getAttribute("user");
		String email = user.getEmail();
				
		Gson gson = new Gson();
		String result = gson.toJson("FAILED");
		
		if(myPageService.checkValidPlaylist(plylstId, email)) {
			myPageService.insertTrackList(trackList, plylstId, email);
			
			List<Map<String,String>> playlist = myPageService.getListPlaylistDetail(plylstId, email);
			//TODO: null check
			String trackId = String.valueOf(playlist.get(0).get("TRACK_ID"));
			myPageService.modifyPlaylistImg(plylstId, Integer.parseInt(trackId));
			result = gson.toJson(playlist);
		}
		return result;
	}
	
	// 플레이리스트 곡 삭제
	@PostMapping(value = "/playlist/deletetrack", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String deleteTrack(@RequestParam(value = "trackList[]") Set<Integer> trackList, @RequestParam(value = "plylstId") Integer plylstId, HttpSession session) {

		UserVO user = (UserVO) session.getAttribute("user");
		String email = user.getEmail();
		
		Gson gson = new Gson();
		String result = gson.toJson("FAIL");
		
		for(Integer trackId : trackList) {
			if(myPageService.checkValidTrackInPlaylist(plylstId, trackId)) {
				myPageService.removePlaylistTrack(trackList, plylstId);
				
				List<Map<String,String>> playlist = myPageService.getListPlaylistDetail(plylstId, email);			
				if(playlist.size() == 0) {
					myPageService.modifyPlaylistBasicImg(plylstId);
					return gson.toJson("EMPTY");
				}
				//TODO: null check
				String firstTrackId = String.valueOf(playlist.get(0).get("TRACK_ID"));	
				myPageService.modifyPlaylistImg(plylstId, Integer.parseInt(firstTrackId));
					result = gson.toJson(playlist);
					System.out.println(result);
				}
		}
		return result;
	}
}
