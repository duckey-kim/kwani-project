package com.kwani.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.HomeVO;
import com.kwani.domain.PListVO;

public interface HomeMapper {

	public List<HomeVO> getList();
	
	public List<HomeVO> getSlideImg();
	
	public List<HomeVO> getImg(@Param("startDate") String startDate, 
			@Param("finishDate") String finishDate, @Param("genreName") String genreName);
	
	public List<HomeVO> getAllList();
}
