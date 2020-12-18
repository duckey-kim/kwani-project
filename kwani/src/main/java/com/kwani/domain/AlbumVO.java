package com.kwani.domain;

import lombok.Data;

@Data
public class AlbumVO {

	private Integer albumId;
	private String albumImg;
	private String albumTtl;
	private String rlesDt;
	private Integer stusCd;
	
	public AlbumVO(Integer albumId, String albumImg, String albumTtl, String rlesDt,Integer stusCd) {
		this.albumId = albumId;
		this.albumImg = albumImg;
		this.albumTtl = albumTtl;
		this.rlesDt = rlesDt;
		this.stusCd = stusCd;
		
	}
	
	public AlbumVO() {
		this(null, "", "", "",0);
	}
}
