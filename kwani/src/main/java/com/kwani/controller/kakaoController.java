package com.kwani.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.JsonNode;
import com.kwani.domain.UserVO;
import com.kwani.kakaoapi.kakaoRestApi;
import com.kwani.kakaoapi.kakaoUserInfo;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.Setter;


@Controller
@RequestMapping("/user/*")
public class kakaoController {

	private kakaoRestApi kakaoRestApi = new kakaoRestApi();
	
	@Autowired
	private UserService service;

	@RequestMapping(value = "/kakao", method = RequestMethod.GET)
	public String kakaoConnect() {
		
		
		StringBuffer url = new StringBuffer();
		url.append("https://kauth.kakao.com/oauth/authorize?");
		url.append("client_id=" + "7b616e203dffda99d64fb8dffc8c42e7");
		url.append("&redirect_uri=http://localhost:8181/user/kakaoLogin");
		url.append("&response_type=code");

		return "redirect:" + url.toString();
	}

	@RequestMapping(value = "/kakaoLogin", produces = "application/json", method = { RequestMethod.GET, RequestMethod.POST })
	public String kakaoLogin(@RequestParam("code") String code, String email, RedirectAttributes rttr, HttpSession session,
			HttpServletRequest request, HttpServletResponse response, String checked) throws IOException {

		System.out.println("kakao code:" + code);
			
		JsonNode access_token = kakaoRestApi.getKakaoAccessToken(code);
		
		System.out.println("access_token : " + access_token);
		
		System.out.println("only get access_token:" + access_token.get("access_token"));

		JsonNode userInfo = kakaoUserInfo.getKakaoUserInfo(access_token.get("access_token"));
		
		System.out.println("userInfo : " + userInfo);

		String userNick = null;
		String kakaoEmail = "";
		String kakaoImg = "";

		// 유저정보 카카오에서 가져오기 Get properties
		JsonNode properties = userInfo.path("properties");
		JsonNode kakao_account = userInfo.path("kakao_account");
		
		
		System.out.println("properties : " + properties);
		System.out.println("kakao_account : " + kakao_account);
		
		userNick = properties.path("nickname").asText();
		kakaoEmail = kakao_account.path("email").asText();
		kakaoImg = properties.get("thumbnail_image").asText();
		
		System.out.println("kakaoImg : " + kakaoImg);
		System.out.println("kakaoEmail : " + kakaoEmail);
		System.out.println("userNick : " + userNick);
		// 정보가 없으면,
		// 저장된 이메일과 카카오 이메일 비교.
		if (service.get(kakaoEmail) == null) {
			// 회원가입 페이지로 이동한다.
			rttr.addFlashAttribute("kakaoEmail", kakaoEmail);
			
			return "redirect:/user/socialRegister";
		}
		
		System.out.println(kakaoEmail);
		
		// 서버에 정보가 있으면 쿠키와 세션을 발급한다.
		if (!(service.checkWithdrawUser(kakaoEmail, rttr))) {
			service.cookieSession(kakaoEmail, checked, request, response);
			service.setSysdateForSocial(kakaoEmail);
		} else {
			System.out.println("!!!!!!!!!!!!!!!!!");
			return "redirect:/user/login";
		}
		return "redirect:/home";
	}
}
