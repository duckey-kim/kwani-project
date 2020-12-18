package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
public class MyPageAjaxController {

	private MyPageService myPageService;

	// 최근들은 곡 목록 가져오기
	@GetMapping(value = "/libraryList", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String getLibraryList(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");

		Gson gson = new Gson();
		String data = gson.toJson(myPageService.getListLibrary(user.getEmail()));

		return data;
	}

	// 좋아하는 곡 목록 가져오기
	@GetMapping(value = "/likeList", produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public String getLikeTrackList(HttpSession session, Model model) {

		UserVO user = (UserVO) session.getAttribute("user");

		Gson gson = new Gson();
		String data = gson.toJson(myPageService.getListLikedTrack(user.getEmail()));

		return data;
	}

}
