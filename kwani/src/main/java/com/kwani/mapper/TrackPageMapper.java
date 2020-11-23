package com.kwani.mapper;

import java.util.List;
import java.util.Map;

public interface TrackPageMapper {

	//가수정보와 곡 리스트 불러오는 메서드
	public List<Map<String, String>> getTrackList(Integer trackId);
	
	//해당 노래를 부른 가수들의 앨범 불러오는 메서드
	public List<Map<String, String>> getAlbumList(Integer trackId);
	
}
