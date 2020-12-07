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

	//�÷��̸���Ʈ �� ������ ����----------------------------------------------
	@Test
	public void getGetListName() {
		
		log.info(plservice.getListName(3));
	}
	
	@Test
	public void getGetListDtl() {
		
		log.info(plservice.getListDtl(2));
	}
	
	
	//�Ϲ� ��õ ������ ����-----------------------------------------
	@Test
	public void getGetAllList() {
		
		plservice.getAllList().forEach(plist -> log.info(plist));
	}
	
    //�뷡 �˻� ������ 
	@Test
	public void testGetSearchRst() {
		
		log.info(plservice.getSearchRst("�¿�"));
	}
	
	//검색 결과에 가사 나오게 하기
	@Test
	public void testGetSearchLyrics() {
		
		log.info(plservice.getSearchLyrics("이"));
	}
	
	//검색 결과에 아티스트 결과 중복없이 나오게 하기
	@Test
	public void testGetSearchArtist() {
		
		log.info(plservice.getSearchArtist("태연"));
	}
	
}
