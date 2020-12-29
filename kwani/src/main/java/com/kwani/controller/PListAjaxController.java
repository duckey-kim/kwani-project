package com.kwani.controller;

import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.domain.PListVO;
import com.kwani.service.PListService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RestController
@RequestMapping("/plylst/*")
public class PListAjaxController {

	private PListService plistService;
	
	/*
	 * //회원 플레이리스트 목록 보여주기
	 * 
	 * @GetMapping(value = "/userList", produces = {MediaType.APPLICATION_XML_VALUE,
	 * MediaType.APPLICATION_JSON_UTF8_VALUE}) public ResponseEntity <List<PListVO>>
	 * getListPlylst(@PathVariable("email") String email){
	 * System.out.println("email: " + email);
	 * 
	 * return new ResponseEntity<>(plistService.getListPlylst(email),
	 * HttpStatus.OK);
	 * 
	 * }
	 */
	
	/*
	 * //플레이리스트 곡 추가
	 * 
	 * @PostMapping(value = "/inserttrack" , produces =
	 * {MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	 * public ResponseEntity <List<PListVO>> insertTrack(@RequestParam(value =
	 * "trackList[]") Set<Integer> trackList,
	 * 
	 * @RequestParam Integer plylstId, HttpSession session){
	 * 
	 * String email = (String)session.getAttribute("userEmail");
	 * 
	 * List<PListVO> playlist = plistService.insertTrackList(trackList, plylstId,
	 * email);
	 * 
	 * 
	 * 
	 * return }
	 */
	
	
	//플레이리스트 새로 만들기
	
	
	

}
