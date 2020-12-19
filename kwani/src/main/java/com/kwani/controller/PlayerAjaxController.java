package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.service.PlayerService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class PlayerAjaxController {
	
	@Setter(onMethod_=@Autowired)
	private PlayerService playerService;
	
	private final static String USER_EMAIL = "userEmail";

	@PostMapping(value="/user/track")
	public String updateUser(HttpSession session,@RequestBody String trackId) {
		String email = (String)session.getAttribute(USER_EMAIL);
		Integer intTrackId = Integer.valueOf(trackId);
		String resultStr ="실패";
		//테스트용 email
		email = "a@naver.com";
		if(!"".equals(email)) {
			int result=playerService.mergeHistory(email, intTrackId);
			if(result==1) {
				resultStr="성공";
			}
		}
		System.out.println("mngrId :"+email);
		System.out.println("----");
		System.out.println("track id is :"+trackId);
		return resultStr;
	}
	
	
}
