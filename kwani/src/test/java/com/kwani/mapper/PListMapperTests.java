package com.kwani.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kwani.domain.Criteria;
import com.kwani.domain.PListVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PListMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ListMapper mapper;
	
	//�÷��̸���Ʈ �� ������---------------------------------------------------------
	@Test
	public void testGetListName() {
		PListVO plist = mapper.getListName(1);
	}
	
	@Test
	public void testGetListDtl() { 
		List<PListVO> plist = mapper.getListDtl(2);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	}

	//�Ϲ� ��õ ������ ����----------------------------------------------------
	@Test
	public void testGetAllList() {
		mapper.getAllList().forEach(plistO -> log.info(plistO));
	}
	
	//search 페이지 - 가수 이름으로 검색
	@Test
	public void testGetSearchRst() {
		List<PListVO> pinfo = mapper.getSearchRst("태연");
		
		log.info(pinfo);
	}
	
	//search 페이지 - 아티스트명으로 앨범 검색
	@Test
	public void testGetSearchAlbum() {
		List<PListVO> pinfo = mapper.getSearchAlbum("아");
		
		log.info(pinfo);
	}
	
	//search 페이지 - 곡명으로 검색
	@Test
	public void testGetSearchRstWithSong() {
		List<PListVO> pinfo = mapper.getSearchRstWithSong("소");
		
		log.info(pinfo);
	}
	
	//search 페이지 - 앨범명으로 검색
	@Test
	public void testGetSearchRstWithAlbum() {
		List<PListVO> pinfo = mapper.getSearchRstWithAlbum("앨");
		
		log.info(pinfo);
	}
	
	//검색 시 노래 가사 결과 
	@Test
	public void testGetSearchLyrics() {
		List<PListVO> pinfo = mapper.getSearchLyrics("이");
		
		log.info(pinfo);
	}
	
	//검색 시 아티스트 결과만 중복 없이 나오게 하기
	@Test
	public void testGetSearchArtist() {
		List<PListVO> pinfo = mapper.getSearchArtist("태연");
		
		log.info(pinfo);
	}
	
	//search/artist페이지의 페이징처리
	@Test
	public void testPaging() {                                                            
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(1); 
		cri.setAmount(10);
		
		String searchTxt = "태";
		
		List<PListVO> plist = mapper.getListWithPagingArtist(cri, searchTxt);
		
		plist.forEach(board -> log.info(board.getGropId()));
	}
	
	//search/song 페이지의 아티스트명으로 페이징처리
		@Test
		public void testPagingSong1() {                                                            
			
			Criteria cri = new Criteria();
			
			cri.setPageNum(1); 
			cri.setAmount(10);
			
			String searchTxt = "태";
			
			List<PListVO> plist = mapper.getListWithPagingSong1(cri, searchTxt);
			
			plist.forEach(board -> log.info(board.getTrackId()));
		}
	 

	//search/song 페이지의 곡명으로 페이징처리
	@Test
	public void testPagingSong2() {
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(1);
		cri.setAmount(10);
		
		String searchTxt = "소";
		
		List<PListVO> plist = mapper.getListWithPagingSong2(cri, searchTxt);
		
		plist.forEach(board -> log.info(board.getTrackId()));
	}
	
	//search/album 페이지의 아티스트명으로 페이징처리
	@Test
	public void testPagingAlbum1() {
			
		Criteria cri = new Criteria();
			
		cri.setPageNum(1);
		cri.setAmount(10);
			
		String searchTxt = "태";
			
		List<PListVO> plist = mapper.getListWithPagingAlbum1(cri, searchTxt);
			
		plist.forEach(board -> log.info(board.getTrackId()));
	}
	
	//search/album 페이지의 앨범명으로 페이징처리
	@Test
	public void testPagingAlbum2() {
				
		Criteria cri = new Criteria();
				
		cri.setPageNum(1);
		cri.setAmount(10);
				
		String searchTxt = "소";
				
		List<PListVO> plist = mapper.getListWithPagingAlbum2(cri, searchTxt);
				
		plist.forEach(board -> log.info(board.getTrackId()));
	}
	
	//search/lyrics 페이지에서 가사 결과 나오게 하기
	@Test
	public void testPagingLyrics() {
				
		Criteria cri = new Criteria();
				
		cri.setPageNum(2);
		cri.setAmount(10);
				
		String searchTxt = "이";
				
		List<PListVO> plist = mapper.getListWithPagingLyrics(cri, searchTxt);
				
		plist.forEach(board -> log.info(board.getTrackId()));
	}
	
	
	@Test
	public void getTotalLyrics() {
		
		int result = mapper.getTotalCountLyrics("이");
		log.info("이 검색총수는 ?"+result);
	}
	
	@Test
	public void getTotalArtists() {
		
		int result = mapper.getTotalCountArtist("태");
		log.info("총 검색 수는?" + result);
	}
	
	@Test
	public void getTotalCountSongArtist() {
		
		int result = mapper.getTotalCountSongArtist("소");
		log.info("총 검색 수는?" + result);
	}
	
	@Test
	public void getTotalCountSongTitle() {
		
		int result = mapper.getTotalCountSongTitle("소");
		log.info("총 검색 수는?" + result);
	}
	
	@Test
	public void getTotalCountAlbumArtist() {
		
		int result = mapper.getTotalCountAlbumArtist("태");
		log.info("총 검색 수는?" + result);
	}
	
	@Test
	public void getTotalCountAlbumTitle() {
		
		int result = mapper.getTotalCountAlbumTitle("소");
		log.info("총 검색 수는?" + result);
	}
	
	
	//로그인했을 때 필요한 메서드들
	//회원 플레이리스트 목록 가져오기
	@Test
	public void getListPlylst() {
		
		List<PListVO> pinfo = mapper.getListPlylst("a@naver.com");
		
		log.info(pinfo);
	}
	
	//회원이 좋아요한 곡 가져오기
	@Test
	public void getLikedTrack() {
		
		List<PListVO> pinfo = mapper.getLikedTrack("a@naver.com");
		
		log.info(pinfo);
	}
	
	//회원이 좋아요한 아티스트 목록 가져오기
	@Test
	public void getLikedArtist() {
		
		List<PListVO> pinfo = mapper.getLikedArtist("a@naver.com");
		
		log.info(pinfo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
