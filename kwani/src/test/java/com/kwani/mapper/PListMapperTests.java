package com.kwani.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kwani.domain.PListVO;
import com.kwani.mapper.ListMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class PListMapperTests {

	@Setter(onMethod_ = @Autowired)
	private ListMapper mapper;
	
	//플레이리스트 상세 페이지---------------------------------------------------------
	@Test
	public void testGetListName() {
		PListVO plist = mapper.getListName(1);
	}
	
	@Test
	public void testGetListDtl() { 
		List<PListVO> plist = mapper.getListDtl(2);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	}

	//일반 추천 페이지 관련----------------------------------------------------
	@Test
	public void testGetAllList() {
		mapper.getAllList().forEach(plistO -> log.info(plistO));
	}
	
	//노래 검색 페이지
	@Test
	public void testGetSearchRst() {
		List<PListVO> pinfo = mapper.getSearchRst("태연");
		
		log.info(pinfo);
	}
	
	
	//------------------------------------------------------------------------
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}
