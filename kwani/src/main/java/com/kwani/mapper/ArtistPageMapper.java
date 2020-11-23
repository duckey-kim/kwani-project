package com.kwani.mapper;

import java.util.List;
import java.util.Map;

public interface ArtistPageMapper {
	
	//가수 정보 가져오는 메서드
	public Map<String, String> getArtistInfo(Integer gropId);

	//가수의 노래 리스트 가져오는 메서드
	public List<Map<String, String>> getArtistTrackList(Integer gropId);
	
	//가수의 앨범 리스트 가져오는 메서드
	public List<Map<String, String>> getArtistAlbumList(Integer gropId);
	
}
