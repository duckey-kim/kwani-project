package com.kwani.domain;

import lombok.Data;

@Data
public class AlbumVO {

	private Integer albumId;
	private String albumImg;
	private String albumTtl;
	private String rlesDt;
	private String trackTot;
	private String aMoodCode;
	private String aGenreCode;
	private String aStusCode;
	private String aSituCode;
	public AlbumVO(Integer albumId, String albumImg, String albumTtl, String rlesDt, String trackTot, String aMoodCode,
			String aGenreCode, String aStusCode, String aSituCode) {
		super();
		this.albumId = albumId;
		this.albumImg = albumImg;
		this.albumTtl = albumTtl;
		this.rlesDt = rlesDt;
		this.trackTot = trackTot;
		this.aMoodCode = aMoodCode;
		this.aGenreCode = aGenreCode;
		this.aStusCode = aStusCode;
		this.aSituCode = aSituCode;
	}
	
	public AlbumVO() {
		this(null, "", "", "","", "", "", "", "");
	}
}
