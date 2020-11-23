package com.kwani.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kwani.mapper.AlbumPageMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AlbumPageServiceImpl implements AlbumPageService {

	//AlbumPageMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private AlbumPageMapper mapper;


	@Override
	public List<Map<String, String>> getAlbumInfoList(Integer albumId) {

		log.info("getAlbumInfoList............");

		return mapper.getAlbumInfoList(albumId);

	}

	@Override
	public List<Map<String, String>> getAlbumArtistList(Integer albumId) {

		log.info("getAlbumArtistList..................");

		return mapper.getAlbumArtistList(albumId);
	}

}
