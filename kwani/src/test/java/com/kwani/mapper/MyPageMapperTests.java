package com.kwani.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.PlaylistVO;
import com.kwani.mapper.MyPageMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageMapperTests {

	@Setter(onMethod_ = @Autowired)
	private MyPageMapper mapper;

	@Test
	public void testGetListLibrary() {
		log.info(mapper.getListLibrary("qwani@"));
	}

	@Test
	public void testGetListLikedArtist() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetListLikedTrack() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetListLikedAlbum() {
		fail("Not yet implemented");
	}

	@Test
	public void testGetListPlaylist() {
		fail("Not yet implemented");
	}

	@Test
	public void testInsertPlaylist() {

		PlaylistVO playlistVO = new PlaylistVO();
		playlistVO.setEmail("1ho@");
		playlistVO.setNm("");

		log.info("Before : " + playlistVO);
		mapper.insertPlaylist(playlistVO);
		log.info("After : " + playlistVO);
	}

	@Test
	public void testGetPlaylistDetail() {
		fail("Not yet implemented");
	}

}
