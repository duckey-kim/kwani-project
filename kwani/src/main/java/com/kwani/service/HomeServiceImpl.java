package com.kwani.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kwani.domain.HomeVO;
import com.kwani.domain.PListVO;
import com.kwani.mapper.HomeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class HomeServiceImpl implements HomeService {
	
	private HomeMapper mapper;
	
	@Override
	public List<HomeVO> getList() {
		
		log.info(mapper.getList());
		
		return mapper.getList();
	}
	
	@Override
	public List<HomeVO> getSlideImg() {
		
		log.info(mapper.getSlideImg());
		
		return mapper.getSlideImg();
	}

	@Override
	public List<HomeVO> getImg(String startDate, String finishDate, String genreName) {
		log.info(mapper.getImg(startDate, finishDate, genreName));
		
		return mapper.getImg(startDate, finishDate, genreName);
	}
	
	@Override
	public List<HomeVO> getAllList(){
		
		log.info("getAllList........리스트정보만!");
		
		return mapper.getAllList();
	}
	

}
