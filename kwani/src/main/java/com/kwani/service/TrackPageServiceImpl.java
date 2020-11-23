package com.kwani.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwani.mapper.TrackPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class TrackPageServiceImpl implements TrackPageService {

	//TrackPageMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private TrackPageMapper mapper;

	@Override
	public List<Map<String, String>> getTrackList(Integer trackId) {

		log.info("getTrackList............");

		return mapper.getTrackList(trackId);

	}

	@Override
	public List<Map<String, String>> getAlbumList(Integer trackId) {

		log.info("getAlbumList..................");

		return mapper.getAlbumList(trackId);
	}

}
