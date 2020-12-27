package com.kwani.mapper;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TableMapperTests {

	@Setter(onMethod_ = @Autowired)
	private TableMapper mapper;

	public void testgetAdmin() {
		AdminVO admin = new AdminVO();
		admin.setMngrId("duckhwan");
		admin.setPwd("1234");
		log.info("      our  MANSER :" + mapper.getAdmin(admin));
	}

	public void testgetTrack() {
		TracksVO track = new TracksVO();
		track.setTrackTtl("사계");
		track.setAlbumId(1);
		log.info(mapper.checkTracks(track));
	}

	public void testUpdateAlbum() {
		AlbumVO album = new AlbumVO();
		album.setAlbumImg("52.jpg");
		album.setAlbumTtl("52..album");
		album.setAlbumId(52);
		System.out.println("update result is :" + mapper.updateAlbum("duckhwan", album));

	}

	public void insertAlbum() {
		AlbumVO album = new AlbumVO();
		album.setAlbumImg("53.jpg");
		album.setAlbumTtl("53..album");
		album.setStusCd(1);
		album.setAlbumId(53);
		System.out.println("앨범 입력 결과 :" + mapper.insertAlbum(album, "duckhwan"));
	}

	public void insertTrack() {
		TracksVO track = new TracksVO();
		track.setTrackTtl("새로운곡");
		track.setTtlTrack(1);
		track.setTrackUrl("a.naver");
		track.setAlbumId(1);
		track.setMoodCd(1);
		track.setGenreCd(1);
		track.setSituCd(1);
		track.setStusCd(1);
		track.setTrackLyrics("새로운 가사");
		track.setTrackOrder(1);
		System.out.println(track);
		System.out.println("곡 입력 결과 " + mapper.insertTrack(track, "duckhwan"));
	}

	public void updateTracks() {
		TracksVO track = new TracksVO();
		track.setTrackTtl("97번째 곡");
		track.setTtlTrack(1);
		track.setTrackUrl("a.!!naver");
		track.setAlbumId(1);
		track.setMoodCd(1);
		track.setGenreCd(1);
		track.setSituCd(1);
		track.setStusCd(1);
		track.setTrackLyrics("새로운 가사");
		track.setTrackOrder(0);
		track.setTrackId(97);
		System.out.println("앨범 업데이트 결과 :" + mapper.updateTracks("duckhwan", track));
	}

	@Test
	public void updateUser() {
		UserVO user = mapper.getUser("k@naver.com");
		user.setNick("duckey");
		System.out.println("update result 1?" + mapper.updateUser("duckhwan", user));

	}

	@Test
	public void getCount() {
		List<Map<String, String>> getlist = mapper.getGenreCount();
		log.info(getlist);
	}

	@Test
	public void getCount2() {
		List<Map<String, String>> getList = mapper.getCountPlay();
		log.info(getList);
	}

	@Test
	public void getgenreCode() {
		List<Map<String, String>> getList = mapper.getCodeTable(100);
		log.info(getList);

	}

	@Test
	public void getGenre() {
		Map<Integer,Integer> map = new HashMap<Integer, Integer>();
		List<Integer> codeList = mapper.getCodeNo(100);
		codeList.forEach(i->map.put(i, 0));
		List<Integer> list = mapper.getGenre("a@naver.com");
		
		Iterator<Integer> it = list.iterator();
		while(it.hasNext()) {
			int value = it.next();
			log.info("장르코드 :"+value);
			for(Map.Entry<Integer, Integer> entry : map.entrySet()) {
				if((entry.getKey()&value)==entry.getKey()) {
					log.info("들은 장르 코드 :"+entry.getKey());
					map.put(entry.getKey(), entry.getValue()+1);
				}
			}
		}
		log.info("update Map "+map);
		int genreCode =map.entrySet().stream().max((o1,o2) -> o1.getValue() > o2.getValue() ? 1 : -1).get().getKey();
		
		log.info("많이 들은 장르 :"+ mapper.getCodeName(100,genreCode));
		log.info("int is :"+mapper.recommendGenre(genreCode));
		
	}
	
	@Test
	public void test() {
		log.info("int is :"+mapper.recommendGenre(2));
	}
	
	@Test
	public void test2() {
		Map<Integer,Integer> map = new HashMap<Integer, Integer>();
		List<Integer> codeList = mapper.getCodeNo(200);
		codeList.forEach(i->map.put(i, 0));
		List<Integer> list = mapper.getTheme("a@naver.com");
		
		Iterator<Integer> it = list.iterator();
		while(it.hasNext()) {
			int value = it.next();
			log.info("type CODE :"+value);
			for(Map.Entry<Integer, Integer> entry : map.entrySet()) {
				if((entry.getKey()&value)==entry.getKey()) {
					log.info("들은 type 코드 :"+entry.getKey());
					map.put(entry.getKey(), entry.getValue()+1);
				}
			}
		}
		log.info("update Map "+map);
		int typeCode =map.entrySet().stream().max((o1,o2) -> o1.getValue() > o2.getValue() ? 1 : -1).get().getKey();
		log.info("많이 들은 타입 Id :  "+typeCode);
		log.info("많이 들은 타입은 :"+mapper.getCodeName(200, typeCode));
		
	}

}
