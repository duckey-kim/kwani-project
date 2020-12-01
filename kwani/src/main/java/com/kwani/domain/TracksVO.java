package com.kwani.domain;

import lombok.Data;

@Data
public class TracksVO {
	
	private Integer trackId;
	private String trackTtl;
	private String ttlTrack;
	private String trackUrl;

	private Integer albumId;
	public TracksVO(Integer trackId, String trackTtl, String ttlTrack, String trackUrl, Integer albumId) {
		super();
		this.trackId = trackId;
		this.trackTtl = trackTtl;
		this.ttlTrack = ttlTrack;
		this.trackUrl = trackUrl;
	
		this.albumId = albumId;
	}

	public TracksVO() {
		this(null,"","","",null);
	}
}
