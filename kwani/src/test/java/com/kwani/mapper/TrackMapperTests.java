package com.kwani.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.TrackVO;
import com.kwani.mapper.TrackMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TrackMapperTests {

	@Setter(onMethod_ = @Autowired)
	private TrackMapper mapper;

	@Test
	public void testGetList() {
		mapper.getList().forEach(t -> log.info(t));
	}
	
	@Test
	public void testInsert() {
		TrackVO track = new TrackVO();
		track.setTrackId(9);
		track.setTrackTitle("그대라는시");
		track.setAlbumId(9);
		
		mapper.insert(track);
		
		log.info(track);
		
		mapper.getList().forEach(t -> log.info(t));
	}
	
	@Test
	public void testRead() {
		TrackVO track = mapper.read("분홍신");
		log.info(track);
	}

}
