package com.kwani.domain;

import lombok.Data;

@Data
public class EmailVO {
	// email 발송시 필요한 것은?  	

	private String title;
	private String content;
	private String receiver;
	
}
