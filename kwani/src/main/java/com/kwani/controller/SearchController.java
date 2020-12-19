package com.kwani.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwani.domain.Criteria;
import com.kwani.domain.PListVO;
import com.kwani.domain.PageDTO;
import com.kwani.service.PListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/search/*")
@AllArgsConstructor
public class SearchController {
	
	private PListService plservice;	

	//검색 결과에서 '아티스트' 탭 누른 결과 페이지
	@GetMapping("/artist")
	public void searchArtist(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri) {
		
		log.info("searchArtist" + cri);
		List<PListVO> searchArtistList = plservice.getSearchArtistWithPaging(cri, searchTxt);
		model.addAttribute("searchArtist",searchArtistList);
		
		int total = plservice.getTotalCountArtist(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	//검색 결과에서 '곡' 탭 누른 결과 페이지 -> 아티스트명으로 검색
	@GetMapping("/songartist")
	public void searchSongArtist(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri) {
		
		log.info("searchSongArtist" + cri);		

		List<PListVO> searchSongList = plservice.getSearchSongWithPaging1(cri, searchTxt);
		model.addAttribute("searchSong", searchSongList);
		
		int total = plservice.getTotalCountSongArtist(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));	
	}
	
	//검색 결과에서 '곡' 탭 누른 결과 페이지 -> 곡명으로 검색
	@GetMapping("/songtitle")
	public void searchSongTitle(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri) {
		
		log.info("searchSongTitle" + cri);
		
		List<PListVO> searchSongList2 = plservice.getSearchSongWithPaging2(cri, searchTxt);
		model.addAttribute("searchSong2", searchSongList2);
		
		int total = plservice.getTotalCountSongTitle(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	//검색 결과에서 '앨범' 탭 누른 결과 페이지 -> 아티스트명으로 검색
	@GetMapping("/albumartist")
	public void searchAlbumArtist(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri) {
		
		log.info("searchAlbumArtist" + cri);
		
		List<PListVO> searchAlbumList = plservice.getSearchAlbumWithPaging1(cri, searchTxt);
		model.addAttribute("searchAlbum", searchAlbumList);
		
		int total = plservice.getTotalCountAlbumArtist(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	   
	}
	
	//검색 결과에서 '앨범' 탭 누른 결과 페이지 -> 앨범명으로 검색
	@GetMapping("/albumtitle")
	public void searchAlbumTitle(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri) {
		
		log.info("searchAlbumTitle" + cri);
		
		List<PListVO> searchAlbumList2 = plservice.getSearchAlbumWithPaging2(cri, searchTxt);
		model.addAttribute("searchAlbum2", searchAlbumList2);
		
		int total = plservice.getTotalCountAlbumTitle(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	//검색 결과에서 '가사' 탭 누른 결과 페이지
	@GetMapping("/lyrics")
	public void searchLyrics(@ModelAttribute("searchTxt")String searchTxt, Model model, Criteria cri) {
		
		System.out.println("searchLyrics" + cri);
		
		List<PListVO> searchLyricsList = plservice.getSearchLyricsWithPaging(cri, searchTxt);
		model.addAttribute("searchLyrics", searchLyricsList);
		
		int total = plservice.getTotalCountLyrics(searchTxt);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}