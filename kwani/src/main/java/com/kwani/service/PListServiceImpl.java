package com.kwani.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kwani.domain.PListVO;
import com.kwani.mapper.ListMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PListServiceImpl implements PListService{
	
	private ListMapper mapper;
	
	//플레이리스트 상세 페이지 관련-----------------------------------------------
	@Override
	public PListVO getListName(int plylstId){
		
		log.info("getListName......" + plylstId);
		
		return mapper.getListName(plylstId);
	}
	
	@Override
	public List<PListVO> getListDtl(int plylstId){
		
		log.info("getListDtl......" + plylstId);
		
		return mapper.getListDtl(plylstId);
	}
	
	//일반 추천 페이지 관련----------------------------------------------------
	@Override
	public List<PListVO> getAllList(){
		
		log.info("getAllList........리스트정보만!");
		
		return mapper.getAllList();
	}

	//노래 검색 페이지
	@Override
	public List<PListVO> getSearchRst(String searchTxt) {
		
		log.info("search result......" + searchTxt);
		
		return mapper.getSearchRst(searchTxt);
	}
	
	


}
