package com.kwani.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.service.PListService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PListServiceTests {
	  
	@Setter(onMethod_ = {@Autowired })
	private PListService plservice;
	
	@Test
	public void testExist() {
		
		log.info(plservice);
		assertNotNull(plservice);
	}

	//플레이리스트 상세 페이지 관련----------------------------------------------
	@Test
	public void getGetListName() {
		
		log.info(plservice.getListName(3));
	}
	
	@Test
	public void getGetListDtl() {
		
		log.info(plservice.getListDtl(2));
	}
	
	
	//일반 추천 페이지 관련-----------------------------------------
	@Test
	public void getGetAllList() {
		
		plservice.getAllList().forEach(plist -> log.info(plist));
	}
	
    //노래 검색 페이지 
	@Test
	public void testGetSearchRst() {
		
		log.info(plservice.getSearchRst("태연"));
	}
	
	
	
	
}
