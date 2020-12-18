package com.kwani.domain;

import lombok.Data;

@Data
public class ArtistVO {

	private Integer gropId;
	private String nm;
	private String sex;
	private String type;
	private String debutDt;
	private Integer stusCd;
	private String gropImg;
	public ArtistVO(Integer gropId, String nm, String sex, String type, String debutDt, Integer stusCd,String gropImg) {
		super();
		this.gropId = gropId;
		this.nm = nm;
		this.sex = sex;
		this.type = type;
		this.debutDt = debutDt;
		this.stusCd = stusCd;
		this.gropImg=gropImg;
	}
	
	public ArtistVO() {
		this(null, "", "", "", "", null,"");
	}
	
}
