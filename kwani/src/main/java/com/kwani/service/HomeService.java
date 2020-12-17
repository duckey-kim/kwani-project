package com.kwani.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.HomeVO;

public interface HomeService {

	// 앨범 타이틀, 앨범이미지, 아티스트 이름을 6개만 뽑아 가져온다.
	public List<HomeVO> getList();
	
	public List<HomeVO> getSlideImg();
	
	public List<HomeVO> getImg(@Param("startDate") String startDate, @Param("finishDate") String finishDate, @Param("genreName") String genreName);
	
}
