package com.kwani.service;

import java.util.List;

import com.kwani.domain.PListVO;

public interface PListService {
	
	////플레이리스트 상세 페이지 관련-----------------------------------
	public PListVO getListName(int plylstId);

	public List<PListVO> getListDtl(int plylstId);
	
	//일반추천 페이지 관련-------------------------------------------
	public List<PListVO> getAllList();
	
	//노래 검색 페이지----------------------------------------------
	//검색해서 나온 결과값 불러오기
	public List<PListVO> getSearchRst(String searchTxt);


}
