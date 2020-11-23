package com.kwani.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwani.mapper.AlbumPageMapper;
import com.kwani.mapper.ArtistPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ArtistPageServiceImpl implements ArtistPageService {

	//ArtistPageMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private ArtistPageMapper mapper;

	@Override
	public Map<String, String> getArtistInfo(Integer gropId) {
		
		log.info("getArtistInfo");
		
		return mapper.getArtistInfo(gropId);
	}
	

	@Override
	public List<Map<String, String>> getArtistTrackList(Integer gropId) {

		log.info("getTrackList............");

		return mapper.getArtistTrackList(gropId);

	}

	@Override
	public List<Map<String, String>> getArtistAlbumList(Integer gropId) {

		log.info("getAlbumList..................");

		return mapper.getArtistAlbumList(gropId);
	}

}
