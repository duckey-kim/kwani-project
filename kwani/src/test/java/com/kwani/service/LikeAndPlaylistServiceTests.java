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
public class LikeAndPlaylistServiceTests {

	// ArtistPageService 인터페이스의 구현체를 주입받아 동작
	@Setter(onMethod_ = { @Autowired })
	private LikeAndPlaylistService service;

	@Test
	public void testExit() {

		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testCheckLikeTrack() {

		service.checkLikeTrack("a@naver.com", 1);
	}

	@Test
	public void testCheckLikeAlbum() {

		service.checkLikeAlbum("a@naver.com", 1);
	}

	@Test
	public void testCheckLikeArtist() {

		service.checkLikeArtist("a@naver.com", 7);
	}

	@Test
	public void testGetPlaylists() {

		service.getPlaylists("a@naver.com").forEach(a -> log.info(a));
	}

	@Test
	public void testGetLikeTracksInAlbum() {

		service.getLikeTracksInAlbum("a@naver.com", 2);
	}

	@Test
	public void testGetLikeTracksInArtist() {

		service.getLikeTracksInArtist("a@naver.com", 11);
	}

	@Test
	public void testInsertLikeTrack() {

		service.insertLikeTrack("a@naver.com", 17);
	}

	@Test
	public void testDeleteLikeTrack() {

		service.deleteLikeTrack("a@naver.com", 17);
	}

	@Test
	public void testInsertLikeAlbum() {

		service.insertLikeAlbum("a@naver.com", 7);
	}

	@Test
	public void testDeleteLikeAlbum() {

		service.deleteLikeAlbum("a@naver.com", 7);
	}

	@Test
	public void testInsertLikeArtist() {

		service.insertLikeArtist("a@naver.com", 12);
	}

	@Test
	public void testDeleteLikeArtist() {

		service.deleteLikeArtist("a@naver.com", 12);
	}
	
	@Test
	public void testCountPlaylistTracks() {
		
		service.countPlaylistTracks(2);
	}
	
	@Test
	public void testGetTracksInPlaylist() {
		
		service.getTracksInPlaylist(2).forEach(a -> log.info(a));
	}
	
	@Test
	public void testInsertTrackIntoPlaylist() {
		
		service.insertTrackIntoPlaylist(1, 6);
		
	}
	
	@Test
	public void testIsPlaylistExist() {
		
		service.isPlaylistExist(10);
	}
}
