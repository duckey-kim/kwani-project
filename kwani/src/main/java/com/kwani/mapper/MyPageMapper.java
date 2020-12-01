package com.kwani.mapper;

import java.util.List;
import java.util.Map;

import com.kwani.domain.PlaylistVO;
import com.kwani.domain.TrackVO;
import com.kwani.domain.UserVO;

public interface MyPageMapper {

	public int insertSelectKeyPlaylist(PlaylistVO playlistVO);
	public int updatePlaylist(PlaylistVO playlistVO);
	public int deletePlaylist(Integer plylstId);	
	public int countPlaylistTrack(Integer plylstId);
	
	public int insertTrack(Integer plylstId, Integer trackId, Integer plyNo);

	public UserVO getUser(String email);

	public List<PlaylistVO> getListPlaylist(String email);
	public List<Map<String,String>> getListLibrary(String email);
	public List<Map<String,String>> getLikedTrackList(String email);
	public List<Map<String,String>> getListLikedArtist(String email);
	public List<Map<String,String>> getListLikedTrack(String email);
	public List<Map<String,String>> getListLikedAlbum(String email);
	public List<Map<String,String>> getPlaylistDetail(Integer plylstId);
	
	public List<Map<String,String>> findTrack(String searchTxt);
	
	//public void insertPlaylistDetail(PlaylistDetailVO playlistDetailVO);

}
