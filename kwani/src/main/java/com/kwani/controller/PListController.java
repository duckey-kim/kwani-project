package com.kwani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kwani.service.PListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recommend/*" )
@AllArgsConstructor
public class PListController {

private PListService plservice;
	
	//일반 사용자 추천 페이지
	@GetMapping("/common")
	public void list(Model model) {
		
		//장르별 플레이리스트 id와 이름을 보여준다 
		//플레이리스트 번호와 이름만 보여주기
		log.info("allplist...");
		model.addAttribute("allplist", plservice.getAllList());	
	}
	
	//플레이리스트 상세 페이지
	@GetMapping("/plylst")
	public void plylst(Integer plylstId, Model model) {
		
		System.out.println(plylstId);
		log.info("plist name....");
		System.out.println(plservice.getListName(plylstId));
		
		//plylstId값과 같은 id값을 가진 plylstNm을 가져온다  
		model.addAttribute("plistName", plservice.getListName(plylstId));
		
		//plylstId 값을 통해 같은 id 값을 가진 플레이리스트 목록을 가져온다
		model.addAttribute("plistListDtl", plservice.getListDtl(plylstId));	
	} 
	
	
	
	
	 
	
	
	
	
	
	
	
}
