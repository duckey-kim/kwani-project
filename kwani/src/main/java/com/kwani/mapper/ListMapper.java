package com.kwani.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.Criteria;
import com.kwani.domain.PListVO;

public interface ListMapper {
	//플레이리스트 상세 페이지
		public PListVO getListName(Integer plylstId);
		
		public List<PListVO> getListDtl(Integer plylstId);
		

		//일반추천 페이지 관련 
		public List<PListVO> getAllList();
		
		//search 페이지 - 아티스트명으로 검색 	
		public List<PListVO> getSearchRst(String searchTxt);
		
		//search 페이지 - 곡명으로 검색
		public List<PListVO> getSearchRstWithSong(String searchTxt);
		
		//search 페이지 - 앨범명으로 검색
		public List<PListVO> getSearchRstWithAlbum(String searchTxt);
		
		//검색 시 가사 결과 나오게 하기
		public List<PListVO> getSearchLyrics(String searchTxt);
		
		//검색 시 아티스트 결과만 중복없이 나오게 하기
		public List<PListVO> getSearchArtist(String searchTxt);
		
		
		//search/artist 페이지
		public List<PListVO> getListWithPagingArtist(@Param("cri")Criteria cri, @Param("searchTxt")String searchTxt);		
		
		//search/song 페이지에서 아티스트명으로 검색
		public List<PListVO> getListWithPagingSong1(@Param("cri")Criteria cri, @Param("searchTxt")String searchTxt);	
		//search/song 페이지에서 곡명으로 검색
		public List<PListVO> getListWithPagingSong2(@Param("cri")Criteria cri, @Param("searchTxt")String searchTxt);
		
		//search/album 페이지에서 아티스트명으로 검색
		public List<PListVO> getListWithPagingAlbum1(@Param("cri")Criteria cri, @Param("searchTxt")String searchTxt);	
		//search/album 페이지에서 곡명으로 검색
		public List<PListVO> getListWithPagingAlbum2(@Param("cri")Criteria cri, @Param("searchTxt")String searchTxt);
		
		//search/lyrics 페이지에서 가사 나오게 하기
		public List<PListVO> getListWithPagingLyrics(@Param("cri")Criteria cri, @Param("searchTxt")String searchTxt);
		
		
		
		//search/lyrics 가사검색 table 총 수 구하기		
		public int getTotalCountLyrics(String searchTxt);
		
		//search/artist 아티스트 결과 테이블 개수 구하기
		public int getTotalCountArtist(String searchTxt);
		
		//search/song -> 아티스트명 결과 테이블 개수 구하기
		public int getTotalCountSongArtist(String searchTxt);
		
		//search/song -> 곡명 결과 테이블 개수 구하기
		public int getTotalCountSongTitle(String searchTxt);
		
		//search/album -> 아티스트명 검색 결과 테이블 개수 구하기
		public int getTotalCountAlbumArtist(String searchTxt);
		
		//search/album -> 곡명 검색 결과 테이블 개수 구하기
		public int getTotalCountAlbumTitle(String searchTxt);
		
		
		
		//로그인했을 때 필요한 메서드들
		//회원 플레이리스트 목록 가져오기
		public List<PListVO> getListPlylst(String email);
		
		//회원 좋아요한 곡 가져오기
		public List<PListVO> getLikedTrack(String email);
		
		//회원이 좋아요한 아티스트 목록 가져오기
		public List<PListVO> getLikedArtist(String email);
}
