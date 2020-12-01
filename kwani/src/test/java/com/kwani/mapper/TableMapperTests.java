package com.kwani.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.TracksVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TableMapperTests {
	
	@Setter(onMethod_ =@Autowired )
	private TableMapper mapper;
	
	
	@Test
	public void testgetAdmin() {
		AdminVO admin = new AdminVO();
		admin.setMngrId("duckhwan");
		admin.setPwd("1234");
		log.info("      our  MANSER :"+mapper.getAdmin(admin));
	}
	
	@Test
	public void testgetTrack() {
		TracksVO track = new TracksVO();
		track.setTrackTtl("사계");
		track.setAlbumId(1);
		log.info(mapper.checkTracks(track));
	}
	
	@Test
	public void testUpdateAlbum() {
		AlbumVO album = new AlbumVO();
		album.setAlbumImg("52.jpg");
		album.setAlbumTtl("52..album");
		album.setRlesDt("2020-01-01");
		album.setStusCd("1");
		album.setAlbumId(52);
		System.out.println("update result is :"+mapper.updateAlbum("duckhwan", album));
		
	}

}
