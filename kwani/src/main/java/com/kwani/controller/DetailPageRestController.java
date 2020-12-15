package com.kwani.controller;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.service.LikeAndPlaylistService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/detail/*")
@Log4j
@AllArgsConstructor
public class DetailPageRestController {

	private LikeAndPlaylistService likeAndPlaylistService;

	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/addLikeTrack", produces = "text/plane")
	public String addLikeTrack(@RequestBody String trackId, HttpSession session) {

		log.info("addLikeTrack");
		
		String sessionName = (String) session.getAttribute("userEmail");

		int result = likeAndPlaylistService.insertLikeTrack(sessionName, Integer.parseInt(trackId));

		return result == 1 ? "1" : "0";

	}

	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/removeLikeTrack", produces = "text/plane")
	public String removeLikeTrack(@RequestBody String trackId, HttpSession session) {

		log.info("removeLikeTrack");
		
		String sessionName = (String) session.getAttribute("userEmail");

		int result = likeAndPlaylistService.deleteLikeTrack(sessionName, Integer.parseInt(trackId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/addLikeAlbum", produces = "text/plane")
	public String addLikeAlbum(@RequestBody String albumId, HttpSession session) {

		log.info("addLikeAlbum");
		
		String sessionName = (String) session.getAttribute("userEmail");

		int result = likeAndPlaylistService.insertLikeAlbum(sessionName, Integer.parseInt(albumId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/removeLikeAlbum", produces = "text/plane")
	public String removeLikeAlbum(@RequestBody String albumId, HttpSession session) {

		log.info("removeLikeAlbum");

		String sessionName = (String) session.getAttribute("userEmail");

		int result = likeAndPlaylistService.deleteLikeAlbum(sessionName, Integer.parseInt(albumId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/addLikeArtist", produces = "text/plane")
	public String addLikeArtist(@RequestBody String gropId, HttpSession session) {

		log.info("addLikeArtist");
		
		String sessionName = (String) session.getAttribute("userEmail");

		int result = likeAndPlaylistService.insertLikeArtist(sessionName, Integer.parseInt(gropId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/removeLikeArtist", produces = "text/plane")
	public String removeLikeArtist(@RequestBody String gropId, HttpSession session) {

		log.info("removeLikeArtist");

		String sessionName = (String) session.getAttribute("userEmail");

		int result = likeAndPlaylistService.deleteLikeArtist(sessionName, Integer.parseInt(gropId));

		return result == 1 ? "1" : "0";

	}
}
