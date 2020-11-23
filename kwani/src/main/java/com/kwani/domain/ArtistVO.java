package com.kwani.domain;

import lombok.Data;

@Data
public class ArtistVO {

	private Integer gropId;
	private String nm;
	private String sex;
	private String type;
	private String debutDt;
	private String gStatusCode;
	public ArtistVO(Integer gropId, String nm, String sex, String type, String debutDt, String gStatusCode) {
		super();
		this.gropId = gropId;
		this.nm = nm;
		this.sex = sex;
		this.type = type;
		this.debutDt = debutDt;
		this.gStatusCode = gStatusCode;
	}
	
	public ArtistVO() {
		this(null, "", "", "", "", "");
	}
	
}
