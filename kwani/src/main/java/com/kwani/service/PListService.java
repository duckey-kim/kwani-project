package com.kwani.service;

import java.util.List;
import java.util.Set;

import com.kwani.domain.Criteria;
import com.kwani.domain.PListVO;
import com.kwani.domain.UserVO;

public interface PListService {
	
	////플레이리스트 상세 페이지 관련-----------------------------------
	public PListVO getListName(Integer plylstId);

	public List<PListVO> getListDtl(Integer plylstId);
	
	//일반추천 페이지 관련-------------------------------------------
	public List<PListVO> getAllList();
	
	
	//search 페이지 - 가수명으로 검색한 결과
	public List<PListVO> getSearchRst(String searchTxt);
	
	//search 페이지 - 아티스트명으로 앨범 검색한 결과
	public List<PListVO> getSearchAlbum(String searchTxt);
	
	//search 페이지 - 곡명으로 검색한 결과
	public List<PListVO> getSearchRstWithSong(String searchTxt);
		
	//search 페이지 - 앨범명으로 검색한 결과
	public List<PListVO> getSearchRstWithAlbum(String searchTxt);
	
	//검색 결과에 가사 나오게 하기
	public List<PListVO> getSearchLyrics(String searchTxt);
	
	//검색 결과에 아티스트 중복없이 나오게 하기
	public List<PListVO> getSearchArtist(String searchTxt);
	
	//search/artist 페이지
	public List<PListVO> getSearchArtistWithPaging(Criteria cri, String searchTxt);
	
	//search/song 페이지에서 아티스트명으로 검색한 결과
	public List<PListVO> getSearchSongWithPaging1(Criteria cri, String searchTxt);
	//search/song 페이지에서 곡명으로 검색한 결과
	public List<PListVO> getSearchSongWithPaging2(Criteria cri, String searchTxt);
	
	//search/album 페이지에서 아티스트명으로 검색한 결과
	public List<PListVO> getSearchAlbumWithPaging1(Criteria cri, String searchTxt);	
	//search/album 페이지에서 앨범명으로 검색한 결과
	public List<PListVO> getSearchAlbumWithPaging2(Criteria cri, String searchTxt);
	
	//search/lyrics 페이지에서 가사 결과 나오게 하기
	public List<PListVO> getSearchLyricsWithPaging(Criteria cri, String searchTxt);
	
	
	//search/lyrics 페이지에서 가사 테이블 총 개수 구하기
	public int getTotalCountLyrics(String searchTxt);
	
	//search/artist 페이지에서 아티스트 테이블 총 개수 구하기
	public int getTotalCountArtist(String searchTxt);
	
	//search/song -> 아티스트명 검색 결과 테이블 총 개수 구하기
	public int getTotalCountSongArtist(String searchTxt);
	
	//search/song -> 곡명 검색 결과 테이블 총 개수 구하기
	public int getTotalCountSongTitle(String searchTxt);
	
	//search/album -> 아티스트명 검색 결과 테이블 개수 구하기
	public int getTotalCountAlbumArtist(String searchTxt);
	
	//search/album -> 앨범명 검색 결과 테이블 개수 구하기
	public int getTotalCountAlbumTitle(String searchTxt);
	
	
	//로그인했을 때 필요한 것들
	//회원 플레이리스트 목록 가져오기
	public List<PListVO> getListPlylst(String email);
	
	//회원이 좋아요한 곡 가져오기
	public List<PListVO> getLikedTrack(String email);
	
	//회원이 좋아요한 아티스트 목록 가져오기
	public List<PListVO> getLikedArtist(String email);
	

	//모달창 - 플레이리스트 추가 관련 
	//기존 플레이리스트에 곡 추가
	public void insertTrackList(Set<Integer> trackId, Integer plylstId, String email);
}















