package com.kwani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwani.service.PListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/search/*")
@AllArgsConstructor
public class SearchController {
	
	private PListService plservice;	

	//검색 결과에서 artist 탭 누른 결과 페이지
	@GetMapping("/artist")
	public void searchArtist(@ModelAttribute("searchTxt")String searchTxt, Model model) {
		
		log.info("searchArtist");
		
		model.addAttribute("searchArtist", plservice.getSearchArtist(searchTxt));
	}

	//검색 결과에서 album 탭 누른 결과 페이지
	@GetMapping("/album")
	public void searchAlbum(@ModelAttribute("searchTxt")String searchTxt, Model model) {
		
		log.info("searchAlbum");
		
		//model.addAttribute("searchAlbum", )
	}
}
