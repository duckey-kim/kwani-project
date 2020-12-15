package com.kwani.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kwani.domain.HomeVO;
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

//	@Override
//	public List<HomeVO> getImg(String startDate, String finishDate, String genreName) {
//		log.info(mapper.getImg(startDate, finishDate, genreName));
//		
//		return mapper.getImg(startDate, finishDate, genreName);
//	}

//	@Override
//	public List<HomeVO> getGenreCdFromYear(String startDate, String finishDate) {
//		
//		log.info(mapper.getGenreCdFromYear(startDate, finishDate));
//		
//		return mapper.getGenreCdFromYear(startDate, finishDate);
//	}
//
//	@Override
//	public List<HomeVO> getGenreCdFromGenreName(String inputGenreName) {
//		
//		log.info(mapper.getGenreCdFromGenreName(inputGenreName));
//		
//		return mapper.getGenreCdFromGenreName(inputGenreName);
//	}

}
