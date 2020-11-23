package com.kwani.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.kwani.domain.PListVO;

public interface ListMapper {
	//�÷��̸���Ʈ �� ������
	public PListVO getListName(int plylstId);
	
	public List<PListVO> getListDtl(int plylstId);
	

	//�Ϲ���õ ������ ���� 
	public List<PListVO> getAllList();
	
	//�뷡 �˻� ������ 	
	public List<PListVO> getSearchRst(String searchTxt);
	
	
}
