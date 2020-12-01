package com.kwani.domain;

import lombok.Data;

@Data
public class AlbumVO {

	private Integer albumId;
	private String albumImg;
	private String albumTtl;
	private String rlesDt;
	//0 사용중
	//1 사용금지
	private String stusCd;
	
	public AlbumVO(Integer albumId, String albumImg, String albumTtl, String rlesDt,String stusCd) {
		this.albumId = albumId;
		this.albumImg = albumImg;
		this.albumTtl = albumTtl;
		this.rlesDt = rlesDt;
		this.stusCd = stusCd;
		
	}
	
	public AlbumVO() {
		this(null, "", "", "","0");
	}
}
