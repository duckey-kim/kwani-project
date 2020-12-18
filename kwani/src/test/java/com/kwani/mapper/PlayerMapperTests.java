package com.kwani.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
public class PlayerMapperTests {
	
	@Setter(onMethod_ =@Autowired )
	private PlayerMapper playerMapper;
	
	@Test
	public void getAlbumList () {
		List<Map<String,String>> albumList = playerMapper.getAlbumList(1);
		log.info(albumList);
	}
	
	@Test
	public void getTracksUrul() {
		Integer[] arr = new Integer[] {1,2,3,4,5};
		
		List<Map<String,String>> tracksList =playerMapper.getTracksUrl(arr);
		log.info(tracksList);
	}
	
	@Test
	public void getUserPlaylist() {
		List<Map<String,String>> listMap = playerMapper.getUserPlayList(1);
		log.info(listMap);
	}
	
	@Test
	public void mergeHistory() {
		int result = playerMapper.mergeHistory(13, "a@naver.com");
		System.out.println("성공하면 result is 1"+ result);
		
	}
	@Test
	public void testgetlike() {
		playerMapper.getListLikedTrack("a@naver.com");
	}

}
