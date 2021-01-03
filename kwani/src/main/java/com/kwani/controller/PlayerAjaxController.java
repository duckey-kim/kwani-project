package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.domain.UserVO;
import com.kwani.service.PlayerService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class PlayerAjaxController {
	
	@Setter(onMethod_=@Autowired)
	private PlayerService playerService;
	
	private final static String USER = "user";

	@PostMapping(value="/user/track")
	public String updateUser(HttpSession session,@RequestBody String trackId) {
		UserVO user = (UserVO)session.getAttribute(USER);
		
		log.info("user is :"+user);
		Integer intTrackId = Integer.valueOf(trackId);
		String resultStr ="no login";
		//테스트용 email
		
		if(user!=null) {
			String email = user.getEmail();
			System.out.println(email +"의 최신 들은곡 update");
			int result=playerService.mergeHistory(email, intTrackId);
			if(result==1) {
				resultStr="update success";
			}
		}
		System.out.println("----");
		System.out.println("track id is :"+trackId);
		return resultStr;
	}
	
	
}
