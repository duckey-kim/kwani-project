package com.kwani.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ArtistPageServiceTests {

	//ArtistPageService 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = { @Autowired })
	private ArtistPageService service;

	@Test
	public void testExit() {

		log.info(service);
		assertNotNull(service);
	}
	
	@Test
	public void testGetArtistInfo() {
		
		service.getArtistInfo(1);
	}

	@Test
	public void testGetArtistTrackList() {

		service.getArtistTrackList(1).forEach(a -> log.info(a));
	}

	@Test
	public void testGetArtistAlbumList() {

		service.getArtistAlbumList(1).forEach(a -> log.info(a));
	}
}
