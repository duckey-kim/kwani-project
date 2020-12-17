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
	
	@Test
	public void testGetSlideImg() {
		
		log.info(mapper.getSlideImg());
	}
	
	@Test
	public void testGetImg() {
		log.info(mapper.getImg("1980", "2013", "인디음악"));
	}
	
}
