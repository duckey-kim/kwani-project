package com.kwani.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PListVO {

	private Integer trackId;
	private String nm;
	private String trackTtl;
	private Integer plylstId;
	private String plylstNm;
	private Integer rcmdPlylstId;
	private String rcmdPlylstNm;
	private String rcmdPlylstImg;
	
	private String type;
	private String genreCd;
	private Date debutDt;
	private String albumTtl;
	private String imgPath;
	private String sex;
	private Integer albumId;
	private Integer gropId;
	private String albumImg;
	private String gropImg;
}
