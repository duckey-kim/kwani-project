package com.kwani.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HomeMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private HomeMapper mapper;
	
	@Test
	public void testGetList() {
		
		log.info(mapper.getList());
	}
	
//	@Test
//	public void testgetGenreCdFromYear() {
//		log.info(mapper.getGenreCdFromYear("2000", "2009"));
//	}
//	
//	@Test
//	public void testGetGenreCdFromGenreName() {
//		log.info(mapper.getGenreCdFromGenreName("발라드"));
//	}
	
	@Test
	public void testGetImg() {
		log.info(mapper.getImg("2000", "2009", "락"));
	}
	
}
