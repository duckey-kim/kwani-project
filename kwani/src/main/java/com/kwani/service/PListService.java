package com.kwani.service;

import java.util.List;

import com.kwani.domain.PListVO;

public interface PListService {
	
	////�÷��̸���Ʈ �� ������ ����-----------------------------------
	public PListVO getListName(int plylstId);

	public List<PListVO> getListDtl(int plylstId);
	
	//�Ϲ���õ ������ ����-------------------------------------------
	public List<PListVO> getAllList();
	
	//�뷡 �˻� ������----------------------------------------------
	//�˻��ؼ� ���� ����� �ҷ�����
	public List<PListVO> getSearchRst(String searchTxt);


}
