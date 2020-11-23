package com.kwani.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class PListVO {

	private int trackId;
	private String nm;
	private String trackTtl;
	private int plylstId;
	private String plylstNm;
	private int rcmdPlylstId;
	private String rcmdPlylstNm;
	
	private String type;
	private String genreCd;
	private Date debutDt;
	private String albumTtl;
	private String imgPath;
	private String sex;
	private int albumId;
	private int gropId;
	private String albumImg;
}
