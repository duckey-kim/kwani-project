package com.kwani.mapper;

import java.util.List;
import java.util.Map;

public interface AlbumPageMapper {

	//앨범 정보 가져오는 메서드
	public List<Map<String, String>> getAlbumInfoList(Integer albumId);
	
	//앨범 참여 가수 가져오는 메서드
	public List<Map<String, String>> getAlbumArtistList(Integer albumId);
	
}
