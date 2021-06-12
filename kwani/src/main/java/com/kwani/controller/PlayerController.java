package com.kwani.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.kwani.domain.UserVO;
import com.kwani.service.MyPageService;
import com.kwani.service.PlayerService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/player")
@Log4j
public class PlayerController {

	@Setter(onMethod_ = @Autowired)
	private MyPageService myPageService;

	@Setter(onMethod_ = @Autowired)
	private PlayerService playerService;

	private static final String USER = "user";

	// 좋아요 한 노래 전체 듣기
	@GetMapping("/like")
	public String playNomalList(HttpSession session, HttpServletResponse response, Model model) {

		System.out.println("/like");
		UserVO user = (UserVO)session.getAttribute(USER);
		String email = user.getEmail();
		List<Map<String, String>> listMap = playerService.getListLikedTrack(email);
		List<Map<String, String>> currentList = new ArrayList<Map<String, String>>();
		// 현재재생목록과 합치기
		playerService.setCurrentList(currentList, session);

		currentList = playerService.getListFromTable(listMap, currentList);
		Map<String, String> videoMap = new HashMap<String, String>();

		// List<Map> => javascript array로 변환
		String nomalList = playerService.setScriptArr(currentList);

		currentList.forEach(map -> {
			videoMap.put(map.get("TRACK_URL"), String.valueOf(map.get("TRACK_ID")));
		});
		Gson gson = new Gson();
		String serializeString = gson.toJson(videoMap);

		model.addAttribute("videoMap", serializeString);
		model.addAttribute("playList", nomalList);
		model.addAttribute("listNm", "현재재생목록");

		return "/musicplayer";
	}

	// 앨범 전체 듣기
	@RequestMapping(value = "/album",method = {RequestMethod.POST,RequestMethod.GET})
	public String playAlbum(HttpSession session, Integer albumId, Model model, HttpServletResponse response) {
		System.out.println("/album");
		log.info("이곳은 앨범전체를 플레이 하는 곳입니다");
		List<Map<String, String>> listMap = playerService.getTrackUrlInAlbum(albumId);
		List<Map<String, String>> currentList = new ArrayList<Map<String, String>>();

		// 현재재생목록과 합치기
		playerService.setCurrentList(currentList, session);

		currentList = playerService.getListFromTable(listMap, currentList);
		// url:videoId map만들기
		Map<String, String> videoMap = new HashMap<String, String>();

		// List<Map> => javascript array로 변환
		String nomalList = playerService.setScriptArr(currentList);

		currentList.forEach(map -> {
			videoMap.put(map.get("TRACK_URL"), String.valueOf(map.get("TRACK_ID")));
		});
		Gson gson = new Gson();
		String serializeString = gson.toJson(videoMap);

		model.addAttribute("videoMap", serializeString);
		model.addAttribute("playList", nomalList);
		model.addAttribute("listNm", "현재재생목록");
		return "/musicplayer";
	}

	// 노래 한곡 듣기 클릭시
	@GetMapping("/track")
	public String playTrack(HttpSession session, Integer[] trackId, Model model, HttpServletResponse response) {
		System.out.println("/track");
		List<Map<String, String>> currentList = new ArrayList<Map<String, String>>();

		// trackId로 가져온 노래정보
		List<Map<String, String>> listMap = playerService.getTracksUrl(trackId);

		// 현재재생목록과 합치기
		playerService.setCurrentList(currentList, session);

		currentList = playerService.getListFromTable(listMap, currentList);
		// url:videoId map만들기
		Map<String, String> videoMap = new HashMap<String, String>();

		// List<Map> => javascript array로 변환
		String nomalList = playerService.setScriptArr(currentList);

		currentList.forEach(map -> {
			videoMap.put(map.get("TRACK_URL"), String.valueOf(map.get("TRACK_ID")));
		});
		Gson gson = new Gson();
		String serializeString = gson.toJson(videoMap);

		model.addAttribute("videoMap", serializeString);
		model.addAttribute("playList", nomalList);
		model.addAttribute("listNm", "현재재생목록");

		return "/musicplayer";
	}

//	리스트 듣기 현재재생목록이 아닌 새로운 리스트로
	// 로그인 한사람만
	@GetMapping("/list")
	public String playList(HttpSession session, Integer listId, Model model) {
		System.out.println("/list");
		log.info("list를 재생하는 곳");
		List<Map<String, String>> listMap = playerService.getUserPlayList(listId);

		Map<String, String> videoMap = new HashMap<String, String>();

		listMap.forEach(map -> {
			videoMap.put(map.get("TRACK_URL"), String.valueOf(map.get("TRACK_ID")));
		});

		Gson gson = new Gson();
		String serializeString = gson.toJson(videoMap);
		model.addAttribute("videoMap", serializeString);
		String playlistNm = listMap.get(0).get("LISTNM");
		String nomalList = playerService.setScriptArr(listMap);
		model.addAttribute("currentList", listMap);
		// 리스트에 들어가 있는 노래 ,가수등의 정보
		model.addAttribute("list", listMap);
		// 리스트
		model.addAttribute("playList", nomalList);
		// 리스트 name
		model.addAttribute("listNm", playlistNm);

		return "/musicplayer";

	}

	// 유저의 최신들은곡 전체 듣기
	@GetMapping("/library")
	public String playNomalList2(HttpSession session, Model model, HttpServletResponse response) {
		System.out.println("/library");
		String email = (String) session.getAttribute(USER);
		List<Map<String, String>> listMap = myPageService.getListLibrary(email);
		List<Map<String, String>> currentList = new ArrayList<Map<String, String>>();
		// 현재재생목록과 합치기
		playerService.setCurrentList(currentList, session);

		currentList = playerService.getListFromTable(listMap, currentList);
		// url:videoId map만들기
		Map<String, String> videoMap = new HashMap<String, String>();

		// List<Map> => javascript array로 변환
		String nomalList = playerService.setScriptArr(currentList);

		currentList.forEach(map -> {
			videoMap.put(map.get("TRACK_URL"), String.valueOf(map.get("TRACK_ID")));
		});
		System.out.println("vidoeMap :" + videoMap);
		Gson gson = new Gson();
		String serializeString = gson.toJson(videoMap);

		model.addAttribute("videoMap", serializeString);
		model.addAttribute("playList", nomalList);
		model.addAttribute("listNm", "현재재생목록");

		return "/musicplayer";
	}

}
