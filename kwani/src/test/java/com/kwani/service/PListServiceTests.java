package com.kwani.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PListServiceTests {
	  
	@Setter(onMethod_ = {@Autowired })
	private PListService plservice;
	
	@Test
	public void testExist() {
		
		log.info(plservice);
		assertNotNull(plservice);
	}

	//�÷��̸���Ʈ �� ������ ����----------------------------------------------
	@Test
	public void getGetListName() {
		
		log.info(plservice.getListName(3));
	}
	
	@Test
	public void getGetListDtl() {
		
		log.info(plservice.getListDtl(2));
	}
	
	
	//�Ϲ� ��õ ������ ����-----------------------------------------
	@Test
	public void getGetAllList() {
		
		plservice.getAllList().forEach(plist -> log.info(plist));
	}
	
    //search 페이지 - 아티스트명으로 검색
	@Test
	public void testGetSearchRst() {
		
		log.info(plservice.getSearchRst("태"));
	}
	
	//search 페이지 - 곡명으로 검색
	@Test
	public void testGetSearchRstWithSong() {
			
		log.info(plservice.getSearchRstWithSong("소"));
	}
	
	//search 페이지 - 앨범명으로 검색
	@Test
	public void testGetSearchRstWithAlbum() {
				
		log.info(plservice.getSearchRstWithAlbum("앨"));
	}
	
	//검색 결과에 가사 나오게 하기
	@Test
	public void testGetSearchLyrics() {
		
		log.info(plservice.getSearchLyrics("이"));
	}
	
	//검색 결과에 아티스트 결과 중복없이 나오게 하기
	@Test
	public void testGetSearchArtist() {
		
		log.info(plservice.getSearchArtist("태연"));
	}
	
	//search/artist 페이지
	@Test
	public void testGetSearchArtistWithPaging() {
		
		plservice.getSearchArtistWithPaging(new Criteria(1, 10), "태").forEach(board -> log.info(board));
	}
	
	//search/song 페이지에서 아티스트명으로 검색
	@Test
	public void testGetSearchSongWithPaging1() {
		
		plservice.getSearchSongWithPaging1(new Criteria(1, 10), "태").forEach(board -> log.info(board));
	}
	
	//search/song 페이지에서 곡명으로 검색
	@Test
	public void testGetSearchSongWithPaging2() {
			
		plservice.getSearchSongWithPaging2(new Criteria(1, 10), "소").forEach(board -> log.info(board));
	}
	
	//search/album 페이지에서 아티스트명으로 검색
	@Test
	public void testGetSearchAlbumWithPaging1() {
			
		plservice.getSearchAlbumWithPaging1(new Criteria(1, 10), "태").forEach(board -> log.info(board));
	}
	
	//search/album 페이지에서 앨범명으로 검색
	@Test
	public void testGetSearchAlbumWithPaging2() {
				
		plservice.getSearchAlbumWithPaging2(new Criteria(1, 10), "소").forEach(board -> log.info(board));
	}
	
	
	//search/lyrics 페이지에서 가사 결과 나오게 하기
	@Test
	public void testGetSearchLyricsWithPaging() {
				
		plservice.getSearchLyricsWithPaging(new Criteria(1, 10), "이").forEach(board -> log.info(board));
	}
	
	@Test
	public void testGetTotalCountLyrics() {
		
		plservice.getTotalCountLyrics("이");
	}
	
	@Test
	public void testGetTotalCountArtist() {
		
		plservice.getTotalCountArtist("태");
	}
	
	@Test
	public void testGetTotalCountSongArtist() {
		
		plservice.getTotalCountSongArtist("태");
	}
	
	@Test
	public void testGetTotalCountSongTitle() {
		
		plservice.getTotalCountSongTitle("사");
	}
	
	@Test
	public void testGetTotalCountAlbumArtist() {
		
		plservice.getTotalCountAlbumArtist("태");
	}
	
	@Test
	public void testGetTotalCountAlbumTitle() {
		
		plservice.getTotalCountAlbumTitle("소");
	}
	
	
	//로그인했을 때 필요한 것들
	//회원 플레이리스트 목록 가져오기
	@Test
	public void testGetListPlylst() {
		
		plservice.getListPlylst("a@naver.com");
	}
	
	//회원이 좋아요한 곡 가져오기
	@Test
	public void testGetLikedTrack() {
		
		plservice.getLikedTrack("a@naver.com");
	}
	
	//회원이 좋아요한 곡 가져오기
	@Test
	public void testGetLikedArtist() {
			
		plservice.getLikedArtist("a@naver.com");
	}
	
}
