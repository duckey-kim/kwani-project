package com.kwani.service;

import java.util.List;
import java.util.Map;

import com.kwani.domain.PlaylistVO;
import com.kwani.domain.UserVO;

public interface MyPageService {

	public int setPlaylistId(PlaylistVO playlistVO);
	public int modifyPlaylist(PlaylistVO playlistVO);
	public int countPlaylistTrack(Integer plylstId);
	public int removePlaylist(Integer plylstId);

	public List<Map<String,String>> getListLibrary(String email);
	public List<Map<String,String>> getListLikedArtist(String email);
	public List<Map<String,String>> getListLikedTrack(String email);
	public List<Map<String,String>> getListLikedAlbum(String email);
	public List<Map<String,String>> getListPlaylist(String email);
	public List<Map<String,String>> getPlaylistDetail(Integer plylstId);
	public UserVO getUser(String email);


	//public int registerPlaylist(PlaylistVO playlistVO);
	//public void registerPlaylistDetail(PlaylistDetailVO playlistDetailVO);
	
}
