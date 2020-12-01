package com.kwani.controller;

import java.util.List;
import java.util.Map;

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
@AllArgsConstructor		// 서비스 타입의 객체와 연동
public class DetailPageController {

	private TrackPageService trackService;
	private AlbumPageService albumService;
	private ArtistPageService artistService;

	@GetMapping("/track")
	public String trackPage(@ModelAttribute("trackId") Integer trackId, Model model) {

		// getTrackList의 결과를 result에 담는다.
		List<Map<String, String>> result = trackService.getTrackList(trackId);

		// result가 비어있는 지 확인 후 비어있으면 NoInfo 페이지로 보낸다.
		if (isNotValidId(result)) {
			return "/detail/NoInfo";
		}

		log.info("getTrackList");
		model.addAttribute("getTrackList", result);

		log.info("getAlbumList");
		model.addAttribute("getAlbumList", trackService.getAlbumList(trackId));

		return "/detail/track";
	}


	@GetMapping("/album")
	public String albumPage(@ModelAttribute("albumId") Integer albumId, Model model) {

		// getAlbumInfoList의 결과를 result에 담는다.
		List<Map<String, String>> result = albumService.getAlbumInfoList(albumId);

		// result가 비어있는 지 확인 후 비어있으면 NoInfo 페이지로 보낸다.
		if (isNotValidId(result)) {
			return "/detail/NoInfo";
		}

		log.info("getAlbumInfoList");
		model.addAttribute("getAlbumInfoList", result);

		log.info("getAlbumArtistList");
		model.addAttribute("getAlbumArtistList", albumService.getAlbumArtistList(albumId));

		return "/detail/album";
	}

	@GetMapping("/artist")
	public String artistPage(@ModelAttribute("gropId") Integer gropId, Model model) {

		// getArtistInfo의 결과를 result에 담는다.
		Map<String, String> result = artistService.getArtistInfo(gropId);

		// result가 비어있는 지 확인 후 비어있으면 NoInfo 페이지로 보낸다.
		if (result == null) {
			return "/detail/NoInfo";
		}

		log.info("getArtistInfo");
		model.addAttribute("getArtistInfo", result);

		log.info("getArtistTrackList");
		model.addAttribute("getArtistTrackList", artistService.getArtistTrackList(gropId));

		log.info("getArtistAlbumList");
		model.addAttribute("getArtistAlbumList", artistService.getArtistAlbumList(gropId));
		
		return "/detail/artist";
	}

	@GetMapping("/NoInfo")
	public void noInfoPage() {

	}

	private boolean isNotValidId(List<Map<String, String>> result) {
		return result.isEmpty();
	}
}
