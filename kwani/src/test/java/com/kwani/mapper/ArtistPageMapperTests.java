package com.kwani.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.mapper.AlbumPageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ArtistPageMapperTests {
	
	//ArtistPageMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private ArtistPageMapper mapper;
	
	@Test
	public void testGetArtistInfo() {
		mapper.getArtistInfo(1);
	}

	@Test
	public void testGetArtistTrackList() {
		mapper.getArtistTrackList(1).forEach(a -> log.info(a));
	}
	
	@Test
	public void testGetArtistAlbumList() {
		mapper.getArtistAlbumList(1).forEach(a -> log.info(a));
	}
}
