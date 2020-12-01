package com.kwani.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.PlaylistVO;
import com.kwani.service.MyPageService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MyPageServiceTests {

	@Setter(onMethod_ = {@Autowired})
	private MyPageService myPageService;
	
	@Test
	public void testRegisterPlaylist() {
		
		PlaylistVO playlistVO = new PlaylistVO();
		playlistVO.setEmail("1ho@");
		playlistVO.setNm("");
		playlistVO.setDesc("");
		
		log.info("Before : " + playlistVO);
		myPageService.createPlaylist(playlistVO);
		log.info("After : " + playlistVO);
		
	}

}
