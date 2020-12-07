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
	
	//�÷��̸���Ʈ �� ������---------------------------------------------------------
	@Test
	public void testGetListName() {
		PListVO plist = mapper.getListName(1);
	}
	
	@Test
	public void testGetListDtl() { 
		List<PListVO> plist = mapper.getListDtl(2);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           
	}

	//�Ϲ� ��õ ������ ����----------------------------------------------------
	@Test
	public void testGetAllList() {
		mapper.getAllList().forEach(plistO -> log.info(plistO));
	}
	
	//�뷡 �˻� ������
	@Test
	public void testGetSearchRst() {
		List<PListVO> pinfo = mapper.getSearchRst("태연");
		
		log.info(pinfo);
	}
	
	//검색 시 노래 가사 결과 
	@Test
	public void testGetSearchLyrics() {
		List<PListVO> pinfo = mapper.getSearchLyrics("이");
		
		log.info(pinfo);
	}
	
	//검색 시 아티스트 결과만 중복 없이 나오게 하기
	@Test
	public void testGetSearchArtist() {
		List<PListVO> pinfo = mapper.getSearchArtist("태연");
		
		log.info(pinfo);
	}
	//------------------------------------------------------------------------
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
}
