package com.kwani.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kwani.service.PListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recommend/*" )
@AllArgsConstructor
public class PListController {

	private PListService plservice;
	
	//�Ϲ� ����� ��õ ������
	@GetMapping("/common")
	public void list(Model model) {
		
		//�帣�� �÷��̸���Ʈ id�� �̸��� �����ش� 
		//�÷��̸���Ʈ ��ȣ�� �̸��� �����ֱ�
		log.info("allplist...");
		model.addAttribute("allplist", plservice.getAllList());	
	}
	
	//�÷��̸���Ʈ �� ������
	@PostMapping("/plylst")
	public void plylst(@ModelAttribute("plylstId")int plylstId, Model model) {
		
		System.out.println(plylstId);
		log.info("plist name....");
		System.out.println(plservice.getListName(plylstId));
		//plylstId���� ���� id���� ���� plylstNm�� �����´�  
		model.addAttribute("plistName", plservice.getListName(plylstId));
		//plylstId ���� ���� ���� id ���� ���� �÷��̸���Ʈ ����� �����´�
		model.addAttribute("plistListDtl", plservice.getListDtl(plylstId));	
	}
	
	//�뷡 �˻� ������
	@GetMapping("/search")
	public void search(@ModelAttribute("searchTxt")String searchTxt, Model model) {
		//�˻�â�� �Է��� ���� �ؽ�Ʈ�� search �������� �����ش�
		//search ���������� �� ���� �޾Ƽ� ���� ��ġ�ϴ� ����� �����ش�
		System.out.println("@@@");
		log.info("search result....");
		model.addAttribute("searchRst", plservice.getSearchRst(searchTxt));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
