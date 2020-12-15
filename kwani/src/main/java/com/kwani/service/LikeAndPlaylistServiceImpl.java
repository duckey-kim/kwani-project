package com.kwani.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwani.mapper.LikeAndPlaylistMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class LikeAndPlaylistServiceImpl implements LikeAndPlaylistService {

	// LikeAndPlaylistMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private LikeAndPlaylistMapper mapper;

	@Override
	public Map<String, String> checkLikeTrack(String sessionName, Integer trackId) {

		log.info("checkLikeTrack");

		return mapper.checkLikeTrack(sessionName, trackId);
	}

	@Override
	public Map<String, String> checkLikeAlbum(String sessionName, Integer albumId) {

		log.info("checkLikeAlbum");

		return mapper.checkLikeAlbum(sessionName, albumId);
	}

	@Override
	public Map<String, String> checkLikeArtist(String sessionName, Integer gropId) {

		log.info("checkLikeArtist");

		return mapper.checkLikeArtist(sessionName, gropId);
	}

	@Override
	public List<Map<String, String>> getPlaylists(String sessionName) {

		log.info("getPlaylists");

		return mapper.getPlaylists(sessionName);
	}

	@Override
	public List<Map<String, String>> getLikeTracksInAlbum(String sessionName, Integer albumId) {

		log.info("getLikeTracksInAlbum");

		return mapper.getLikeTracksInAlbum(sessionName, albumId);
	}

	@Override
	public List<Map<String, String>> getLikeTracksInArtist(String sessionName, Integer gropId) {

		log.info("getLikeTracksInArtist");

		return mapper.getLikeTracksInArtist(sessionName, gropId);
	}

	@Override
	public int insertLikeTrack(String sessionName, Integer trackId) {
		
		log.info("insertLikeTrack");
		
		int result;
		
		try {
			result = mapper.insertLikeTrack(sessionName, trackId);
		}catch (Exception e) {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int deleteLikeTrack(String sessionName, Integer trackId) {
		
		log.info("deleteLikeTrack");
		
		return mapper.deleteLikeTrack(sessionName, trackId);
	}

	@Override
	public int insertLikeAlbum(String sessionName, Integer albumId) {
		
		log.info("insertLikeAlbum");

		int result;
		
		try {
			result = mapper.insertLikeAlbum(sessionName, albumId);
		}catch (Exception e) {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int deleteLikeAlbum(String sessionName, Integer albumId) {
		
		log.info("deleteLikeAlbum");

		return mapper.deleteLikeAlbum(sessionName, albumId);
	}

	@Override
	public int insertLikeArtist(String sessionName, Integer gropId) {
		
		log.info("insertLikeArtist");
		
		int result;
		
		try {
			result = mapper.insertLikeArtist(sessionName, gropId);
		}catch (Exception e) {
			result = 0;
		}
		
		return result;
	}

	@Override
	public int deleteLikeArtist(String sesionName, Integer gropId) {
		
		log.info("deleteLikeArtist");
		
		return mapper.deleteLikeArtist(sesionName, gropId);
	}

}
