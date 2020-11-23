package com.kwani.domain;

import lombok.Data;

@Data
public class TracksVO {
	
	private Integer trackId;
	private String trackTtl;
	private String ttlTrack;
	private String trackUrl;
	private String tMoodCode;
	private String tGenreCode;
	private String tSituCode;
	private String tStusCode;
	private Integer albumId;
	public TracksVO(Integer trackId, String trackTtl, String ttlTrack, String trackUrl, String tMoodCode,
			String tGenreCode, String tSituCode, String tStusCode, Integer albumId) {
		super();
		this.trackId = trackId;
		this.trackTtl = trackTtl;
		this.ttlTrack = ttlTrack;
		this.trackUrl = trackUrl;
		this.tMoodCode = tMoodCode;
		this.tGenreCode = tGenreCode;
		this.tSituCode = tSituCode;
		this.tStusCode = tStusCode;
		this.albumId = albumId;
	}

	public TracksVO() {
		this(null,"","","","","","","",null);
	}
}
