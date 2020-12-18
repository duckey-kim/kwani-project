package com.kwani.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.domain.HomeVO;
import com.kwani.service.HomeService;

import lombok.AllArgsConstructor;


@Controller
@AllArgsConstructor
@RestController
@RequestMapping("/homeAjax/*")
public class HomeAjaxController {

	private HomeService HomeService;
	
	@GetMapping(value = "/{startDate}/{finishDate}/{genreName}", produces = 
			{MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity <List<HomeVO>> getImg(@PathVariable("startDate") String startDate, 
			@PathVariable("finishDate") String finishDate, @PathVariable("genreName") String genreName,
			Model model) {
		
		System.out.println("startDate : " + startDate);
		System.out.println("finishDate : " + finishDate);
		System.out.println("genreName : " + genreName);
		
		return new ResponseEntity<>(HomeService.getImg(startDate, finishDate, genreName), HttpStatus.OK);
	}

}

