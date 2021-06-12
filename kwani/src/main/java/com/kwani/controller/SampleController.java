package com.kwani.controller;

import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kwani.domain.TracksVO;

import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/sample")
@Log4j
public class SampleController {

	@GetMapping(value = "/getText",produces = "text/plain; charset=UTF-8")
	public String text() {
		log.info("Mime Type :"+MediaType.TEXT_PLAIN_VALUE);
		
		return "안녕하세요";
	}
	@GetMapping(value = "/getSample",produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,MediaType.APPLICATION_XML_VALUE})
	public TracksVO getSample() {
	return new TracksVO(13, "abc", 1, "A.naver.com", 3, 1, 1, 1, 1, "안녕하세요", 1)	;
	}
}
