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
	
	
	
	
}
