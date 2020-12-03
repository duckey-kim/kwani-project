package com.kwani.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class AlbumVO {

	private Integer albumId;
	private String albumImg;
	private String albumTtl;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
	private Date rlesDt;
	private Integer stusCd;
	
	public AlbumVO(Integer albumId, String albumImg, String albumTtl, Date rlesDt,Integer stusCd) {
		this.albumId = albumId;
		this.albumImg = albumImg;
		this.albumTtl = albumTtl;
		this.rlesDt = rlesDt;
		this.stusCd = stusCd;
		
	}
	
	public AlbumVO() {
		this(null, "", "", null,0);
	}
}
