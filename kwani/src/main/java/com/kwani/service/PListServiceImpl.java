package com.kwani.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kwani.domain.PListVO;
import com.kwani.mapper.ListMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PListServiceImpl implements PListService{
	
	private ListMapper mapper;
	
	//�÷��̸���Ʈ �� ������ ����-----------------------------------------------
	@Override
	public PListVO getListName(int plylstId){
		
		log.info("getListName......" + plylstId);
		
		return mapper.getListName(plylstId);
	}
	
	@Override
	public List<PListVO> getListDtl(int plylstId){
		
		log.info("getListDtl......" + plylstId);
		
		return mapper.getListDtl(plylstId);
	}
	
	//�Ϲ� ��õ ������ ����----------------------------------------------------
	@Override
	public List<PListVO> getAllList(){
		
		log.info("getAllList........����Ʈ������!");
		
		return mapper.getAllList();
	}

	//�뷡 �˻� ������
	@Override
	public List<PListVO> getSearchRst(String searchTxt) {
		
		log.info("search result......" + searchTxt);
		
		return mapper.getSearchRst(searchTxt);
	}
	
	


}
