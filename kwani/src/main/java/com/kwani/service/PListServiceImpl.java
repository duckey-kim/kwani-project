package com.kwani.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.kwani.domain.Criteria;
import com.kwani.domain.PListVO;
import com.kwani.mapper.ListMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PListServiceImpl implements PListService {

	private ListMapper mapper;

	// 플레이리스트 상세 페이지 관련-----------------------------------------------
	@Override
	public PListVO getListName(Integer plylstId) {

		log.info("getListName......" + plylstId);

		return mapper.getListName(plylstId);
	}

	@Override
	public List<PListVO> getListDtl(Integer plylstId) {

		log.info("getListDtl......" + plylstId);

		return mapper.getListDtl(plylstId);
	}

	// 일반 추천 페이지 관련----------------------------------------------------
	@Override
	public List<PListVO> getAllList() {

		log.info("getAllList........리스트정보만!");

		return mapper.getAllList();
	}

	// search 페이지 - 가수명으로 검색한 결과
	@Override
	public List<PListVO> getSearchRst(String searchTxt) {

		log.info("search result......" + searchTxt);

		return mapper.getSearchRst(searchTxt);
	}

	
	//search 페이지 - 아티스트명으로 앨범 검색한 결과
	@Override
	public List<PListVO> getSearchAlbum(String searchTxt){
		
		log.info("search album...." + searchTxt);
		
		return mapper.getSearchAlbum(searchTxt);
	}
	
	//search 페이지 - 곡명으로 검색한 결과

	@Override
	public List<PListVO> getSearchRstWithSong(String searchTxt) {

		log.info("search result with song......." + searchTxt);

		return mapper.getSearchRstWithSong(searchTxt);
	}

	// search 페이지 - 곡명으로 검색한 결과
	@Override
	public List<PListVO> getSearchRstWithAlbum(String searchTxt) {

		log.info("search result with album......." + searchTxt);

		return mapper.getSearchRstWithAlbum(searchTxt);
	}

	// 검색 결과에 가사 나오게 하기
	@Override
	public List<PListVO> getSearchLyrics(String searchTxt) {

		log.info("search lyrics......" + searchTxt);

		return mapper.getSearchLyrics(searchTxt);
	}

	// 검색 결과에 아티스트 결과 중복없이 나오게 하기
	@Override
	public List<PListVO> getSearchArtist(String searchTxt) {

		log.info("search artist......" + searchTxt);

		return mapper.getSearchArtist(searchTxt);
	}

	// search/artist 페이지
	@Override
	public List<PListVO> getSearchArtistWithPaging(Criteria cri, String searchTxt) {

		log.info("get artist List with criteria: " + cri);

		return mapper.getListWithPagingArtist(cri, searchTxt);
	}

	// search/song 페이지에서 아티스트명으로 검색
	@Override
	public List<PListVO> getSearchSongWithPaging1(Criteria cri, String searchTxt) {

		log.info("get song List with criteria: " + cri);

		return mapper.getListWithPagingSong1(cri, searchTxt);
	}

	// search/song 페이지에서 곡명으로 검색
	@Override
	public List<PListVO> getSearchSongWithPaging2(Criteria cri, String searchTxt) {

		log.info("get song List with criteria: " + cri);

		return mapper.getListWithPagingSong2(cri, searchTxt);
	}

	// search/album 페이지에서 아티스트명으로 검색
	@Override
	public List<PListVO> getSearchAlbumWithPaging1(Criteria cri, String searchTxt) {

		log.info("get album List with criteria: " + cri);

		return mapper.getListWithPagingAlbum1(cri, searchTxt);
	}

	// search/album 페이지에서 앨범명으로 검색
	@Override
	public List<PListVO> getSearchAlbumWithPaging2(Criteria cri, String searchTxt) {

		log.info("get album List with criteria: " + cri);

		return mapper.getListWithPagingAlbum2(cri, searchTxt);
	}

	// search/lyrics 페이지에서 가사 결과 나오게 하기
	@Override
	public List<PListVO> getSearchLyricsWithPaging(Criteria cri, String searchTxt) {

		log.info("get album List with criteria: " + cri);

		return mapper.getListWithPagingLyrics(cri, searchTxt);
	}

	// search/lyrics 페이지에서 가사 테이블 총 개수 구하기
	@Override
	public int getTotalCountLyrics(String searchTxt) {

		log.info("lyrics table's count:" + searchTxt);

		return mapper.getTotalCountLyrics(searchTxt);
	}

	// search/artists 페이지에서 아티스트 테이블 총 개수 구하기
	@Override
	public int getTotalCountArtist(String searchTxt) {

		log.info("artists table's count: " + searchTxt);

		return mapper.getTotalCountArtist(searchTxt);
	}

	// search/song -> 아티스트명으로 검색한 결과 테이블 총 개수 구하기
	@Override
	public int getTotalCountSongArtist(String searchTxt) {

		log.info("song table's count: " + searchTxt);

		return mapper.getTotalCountSongArtist(searchTxt);
	}

	// search/song -> 곡명으로 검색한 결과 테이블 총 개수 구하기
	@Override
	public int getTotalCountSongTitle(String searchTxt) {

		log.info("song table's count: " + searchTxt);

		return mapper.getTotalCountSongTitle(searchTxt);
	}

	// search/album -> 아티스트명으로 검색한 결과 테이블 총 개수 구하기
	@Override
	public int getTotalCountAlbumArtist(String searchTxt) {

		log.info("song table's count: " + searchTxt);

		return mapper.getTotalCountAlbumArtist(searchTxt);
	}

	// search/album -> 앨범명으로 검색한 결과 테이블 총 개수 구하기
	@Override
	public int getTotalCountAlbumTitle(String searchTxt) {

		log.info("song table's count: " + searchTxt);

		return mapper.getTotalCountAlbumTitle(searchTxt);
	}

	// 로그인했을 때 필요한 것들
	// 회원 플레이리스트 목록 가져오기
	@Override

	public List<PListVO> getListPlylst(String email){
		
		log.info("plylst list......");
		

		return mapper.getListPlylst(email);
	}

	// 회원이 좋아요한 곡 가져오기
	@Override

	public List<PListVO> getLikedTrack(String email){
		
		log.info("liked track....." );
		

		return mapper.getLikedTrack(email);
	}

	// 회원이 좋아요한 곡 가져오기
	@Override

	public List<PListVO> getLikedArtist(String email) {

		log.info("liked artist....." + email);

		return mapper.getLikedArtist(email);
	}

	// 덕환부분
	@Override
	public int getUserLikeGenre(String email, int i) {
		List<Integer> codeList = mapper.getCodeNo(i);

		Map<Integer, Integer> map = new HashMap<>();
		codeList.forEach(cd -> map.put(cd, 0));
		List<Integer> list = mapper.getGenre(email);
		log.info("likeGenre : "+list);
		Iterator<Integer> it = list.iterator();
		while (it.hasNext()) {
			int value = it.next();
			for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
				if ((entry.getKey() & value) == entry.getKey()) {
					map.put(entry.getKey(), entry.getValue() + 1);
				}
			}
		}
		return map.entrySet().stream().max((o1, o2) -> o1.getValue() > o2.getValue() ? 1 : -1).get().getValue() == 0 ? 0
				: map.entrySet().stream().max((o1, o2) -> o1.getValue() > o2.getValue() ? 1 : -1).get().getKey();

	}

	@Override
	public List<Map<String, String>> recommendGenre(int genreCode) {
		List<Map<String, String>> list = Collections.emptyList();
		if (genreCode != 0) {

			list = mapper.recommendGenre(genreCode);
		}
		return list;
	}

	@Override
	public int getUserLikeType(String email, int i) {
		List<Integer> codeList = mapper.getCodeNo(i);

		Map<Integer, Integer> map = new HashMap<>();
		codeList.forEach(cd -> map.put(cd, 0));
		List<Integer> list = mapper.getTheme(email);
		log.info("likeTypeList :"+list);
		Iterator<Integer> it = list.iterator();
		while (it.hasNext()) {
			int value = it.next();
			for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
				if ((entry.getKey() & value) == entry.getKey()) {
					map.put(entry.getKey(), entry.getValue() + 1);
				}
			}
		}
		return map.entrySet().stream().max((o1, o2) -> o1.getValue() > o2.getValue() ? 1 : -1).get().getValue() == 0 ? 0
				: map.entrySet().stream().max((o1, o2) -> o1.getValue() > o2.getValue() ? 1 : -1).get().getKey();

	}

	@Override
	public List<Map<String, String>> recommendType(int typeCode) {
		List<Map<String, String>> list = Collections.emptyList();
		if (typeCode != 0) {
			list = mapper.recommendType(typeCode);
		}
		return list;
	}


}






















