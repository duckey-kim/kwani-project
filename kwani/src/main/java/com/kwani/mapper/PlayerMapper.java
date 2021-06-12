package com.kwani.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface PlayerMapper {
	public List<Map<String, String>> getAlbumList(Integer albumId);


	public List<Map<String, String>> getTracksUrl(Integer[] trackArr);

	public List<Map<String, String>> getUserPlayList(Integer plylstId);

	public int mergeHistory(@Param("trackId") Integer trackId, @Param("email") String email);

	public List<Map<String, String>> getListLikedTrack(String email);

	public List<Map<String, String>> getListLibrary(String email);

}
