package com.kwani.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kwani.domain.PListVO;

public interface ListMapper {
	//플레이리스트 상세 페이지
	public PListVO getListName(int plylstId);
	
	public List<PListVO> getListDtl(int plylstId);
	

	//일반추천 페이지 관련 
	public List<PListVO> getAllList();
	
	//노래 검색 페이지 	
	public List<PListVO> getSearchRst(String searchTxt);
	
	
}
