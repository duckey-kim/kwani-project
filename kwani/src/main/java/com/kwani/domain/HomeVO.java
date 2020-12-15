package com.kwani.domain;

import lombok.Data;

@Data
public class HomeVO {
	
	private Integer gropId;
	private Integer albumId;
	private String name;
	private String albumImg;
	private String albumTtl;
	
	private String debutDt;
	private String gropImg;
	private String cdNm;
	private String cdNo;
	private String genreCd;
	
	private String startDate;
	private String finishDate;
}
