package com.kwani.domain;

import lombok.Data;

@Data
public class TracksVO {
	
	private Integer trackId;
	private String trackTtl;
	private Integer ttlTrack;
	private String trackUrl;
	private Integer albumId;
	private Integer moodCd;
	private Integer genreCd;
	private Integer situCd;
	private Integer stusCd;
	private String trackLyrics;
	private Integer trackOrder;
	
	public TracksVO(Integer trackId, String trackTtl, Integer ttlTrack, String trackUrl, Integer albumId,
			Integer moodCd, Integer genreCd, Integer situCd, Integer stusCd, String trackLyrics,Integer trackOrder) {
		super();
		this.trackId = trackId;
		this.trackTtl = trackTtl;
		this.ttlTrack = ttlTrack;
		this.trackUrl = trackUrl;
		this.albumId = albumId;
		this.moodCd = moodCd;
		this.genreCd = genreCd;
		this.situCd = situCd;
		this.stusCd = stusCd;
		this.trackLyrics = trackLyrics;
		this.trackOrder=trackOrder;
	}
	public TracksVO() {
		this(null,"",0,"",0,0,0,0,0,"",0);
	}





}
