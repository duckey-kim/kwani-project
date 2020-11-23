package com.kwani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kwani.service.AlbumPageService;
import com.kwani.service.ArtistPageService;
import com.kwani.service.TrackPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/detail/*")
@AllArgsConstructor		//서비스 타입의 객체와 연동
public class DetailPageController {
	
	private TrackPageService trackService;
	private AlbumPageService albumService;
	private ArtistPageService artistService;
	
	@GetMapping("/track")
	public void trackPage(@ModelAttribute("trackId") Integer trackId, Model model) {
		
		log.info("getTrackList");
		model.addAttribute("getTrackList", trackService.getTrackList(trackId));
		
		log.info("getAlbumList");
		model.addAttribute("getAlbumList", trackService.getAlbumList(trackId));
	}
	
	@GetMapping("/album")
	public void albumPage(@ModelAttribute("albumId") Integer albumId, Model model) {
		
		log.info("getAlbumInfoList");
		model.addAttribute("getAlbumInfoList", albumService.getAlbumInfoList(albumId));
		
		log.info("getAlbumArtistList");
		model.addAttribute("getAlbumArtistList", albumService.getAlbumArtistList(albumId));
	}
	
	@GetMapping("/artist")
	public void artistPage(@ModelAttribute("gropId") Integer gropId, Model model) {
		
		log.info("getArtistInfo");
		model.addAttribute("getArtistInfo", artistService.getArtistInfo(gropId));
		
		log.info("getArtistTrackList");
		model.addAttribute("getArtistTrackList", artistService.getArtistTrackList(gropId));
		
		log.info("getArtistAlbumList");
		model.addAttribute("getArtistAlbumList", artistService.getArtistAlbumList(gropId));
	}
	
}
