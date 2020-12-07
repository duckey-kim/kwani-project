package com.kwani.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kwani.domain.PListVO;

public interface ListMapper {
	//플레이리스트 상세 페이지
		public PListVO getListName(Integer plylstId);
		
		public List<PListVO> getListDtl(Integer plylstId);
		

		//일반추천 페이지 관련 
		public List<PListVO> getAllList();
		
		//노래 검색 페이지 	
		public List<PListVO> getSearchRst(String searchTxt);
		
		//검색 시 가사 결과 나오게 하기
		public List<PListVO> getSearchLyrics(String searchTxt);
		
		//검색 시 아티스트 결과만 중복없이 나오게 하기
		public List<PListVO> getSearchArtist(String searchTxt);
		
}
