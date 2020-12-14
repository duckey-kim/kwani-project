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
public class LikeAndPlaylistMapperTests {

	// ArtistPageMapper 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = @Autowired)
	private LikeAndPlaylistMapper mapper;

	@Test
	public void testCheckLikeTrack() {
		mapper.checkLikeTrack("a@naver.com", 1);
	}

	@Test
	public void testCheckLikeAlbum() {
		mapper.checkLikeAlbum("a@naver.com", 3);
	}

	@Test
	public void testCheckLikeArtist() {
		mapper.checkLikeArtist("a@naver.com", 7);
	}

	@Test
	public void testGetPlaylists() {
		mapper.getPlaylists("a@naver.com");
	}

	@Test
	public void testGetLikeTracksInAlbum() {
		mapper.getLikeTracksInAlbum("a@naver.com", 2).forEach(a -> log.info(a));
	}

	@Test
	public void testGetLikeTracksInArtist() {
		mapper.getLikeTracksInArtist("a@naver.com", 11).forEach(a -> log.info(a));
	}

}
