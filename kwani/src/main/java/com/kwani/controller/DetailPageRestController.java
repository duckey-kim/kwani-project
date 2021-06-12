package com.kwani.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.domain.UserVO;
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
		
		UserVO user =  (UserVO)session.getAttribute("user");
		String email = user.getEmail();

		int result = likeAndPlaylistService.insertLikeTrack(email, Integer.parseInt(trackId));

		return result == 1 ? "1" : "0";

	}

	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/removeLikeTrack", produces = "text/plane")
	public String removeLikeTrack(@RequestBody String trackId, HttpSession session) {

		log.info("removeLikeTrack");
		
		UserVO user =  (UserVO)session.getAttribute("user");
		String email = user.getEmail();

		int result = likeAndPlaylistService.deleteLikeTrack(email, Integer.parseInt(trackId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/addLikeAlbum", produces = "text/plane")
	public String addLikeAlbum(@RequestBody String albumId, HttpSession session) {

		log.info("addLikeAlbum");
		
		UserVO user =  (UserVO)session.getAttribute("user");
		String email = user.getEmail();

		int result = likeAndPlaylistService.insertLikeAlbum(email, Integer.parseInt(albumId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/removeLikeAlbum", produces = "text/plane")
	public String removeLikeAlbum(@RequestBody String albumId, HttpSession session) {

		log.info("removeLikeAlbum");

		UserVO user =  (UserVO)session.getAttribute("user");
		String email = user.getEmail();

		int result = likeAndPlaylistService.deleteLikeAlbum(email, Integer.parseInt(albumId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/addLikeArtist", produces = "text/plane")
	public String addLikeArtist(@RequestBody String gropId, HttpSession session) {

		log.info("addLikeArtist");
		
		UserVO user =  (UserVO)session.getAttribute("user");
		String email = user.getEmail();

		int result = likeAndPlaylistService.insertLikeArtist(email, Integer.parseInt(gropId));

		return result == 1 ? "1" : "0";

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/removeLikeArtist", produces = "text/plane")
	public String removeLikeArtist(@RequestBody String gropId, HttpSession session) {

		log.info("removeLikeArtist");

		UserVO user =  (UserVO)session.getAttribute("user");
		String email = user.getEmail();

		int result = likeAndPlaylistService.deleteLikeArtist(email, Integer.parseInt(gropId));

		return result == 1 ? "1" : "0";

	}
	
	@RequestMapping(method = { RequestMethod.POST }, value = "/addTracksInPlaylist", produces = "text/plane")
	public String addTracksInPlaylist(@RequestParam Integer plylstId, @RequestParam(value = "trackIdArr[]") Set<Integer> trackIdArr) {

		String result = "1";
		
		log.info("addTracksInPlaylist");
		
		System.out.println("넣을 플레이리스트ID : " + plylstId);
		System.out.println("넣을 트랙ID : " + trackIdArr);
		
		Map<String, String> checkPlaylist = likeAndPlaylistService.isPlaylistExist(plylstId);
		if(checkPlaylist == null) {
			System.out.println("존재하지 않는 플레이리스트야~");
			result = "0";
			return result;
		}
		
		List<Map<String, String>> tracksInPlaylist = likeAndPlaylistService.getTracksInPlaylist(plylstId);
		
		ArrayList<Integer> arr = new ArrayList<Integer>();
		for(int i = 0 ; i < tracksInPlaylist.size(); i++) {

			String tmpString = String.valueOf(tracksInPlaylist.get(i).get("TRACK_ID"));
			Integer tmpInteger = Integer.parseInt(tmpString);
			
			arr.add(tmpInteger);
		}
		System.out.println("넣으려는 플레이리스트에 있는 트랙ID : " + arr);
		
		for(Integer value : trackIdArr) {
			System.out.println("트랙ID 하나씩 뽑기 : " + value);
			System.out.println("이 노래 이미 있어? " + arr.contains(value));
			if(!(arr.contains(value))) {
				System.out.println("없으니까 트랙ID : "+ value +"넣어줘");
				likeAndPlaylistService.insertTrackIntoPlaylist(plylstId, value);
			}
		}
		
		return result;

	}
	
	@ResponseBody
	@RequestMapping(method = { RequestMethod.POST }, value = "/countPlaylistTracks", produces = "text/plane")
	public String countPlaylistTracks(@RequestBody String plylstId) {

		log.info("countPlaylistTracks");
		
		Map<String, String> cnt = likeAndPlaylistService.countPlaylistTracks(Integer.parseInt(plylstId));
		String result = cnt.get("count");

		return result;

	}
	
}
