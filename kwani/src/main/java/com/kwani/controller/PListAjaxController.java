package com.kwani.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.domain.PListVO;
import com.kwani.service.PListService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RestController
@RequestMapping("/plylstAjax/*")
public class PListAjaxController {

	private PListService plistService;
	
	@GetMapping(value = "/{email}", 
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity <List<PListVO>> getListPlylst(@PathVariable("email") String email){
		System.out.println("email: " + email);
		
		return new ResponseEntity<>(plistService.getListPlylst(email), HttpStatus.OK);

	}
	
}
