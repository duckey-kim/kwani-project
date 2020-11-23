package com.kwani.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.mapper.TrackPageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TrackPageMapperTests {

	//TrackPageMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private TrackPageMapper mapper;

	@Test
	public void testGetTrackList() {
		mapper.getTrackList(12).forEach(a -> log.info(a));
	}

	@Test
	public void testGetAlbumList() {
		mapper.getAlbumList(12).forEach(a -> log.info(a));
	}
}
