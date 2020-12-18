package com.kwani.service;

import java.util.List;
import java.util.Map;

import com.kwani.domain.PlaylistVO;
import com.kwani.domain.UserVO;

public interface MyPageService {

	public boolean removePlaylist(Integer plylstId, String email);
	public int createPlaylist(PlaylistVO playlistVO);
	public int modifyPlaylist(PlaylistVO playlistVO);
	public int countPlaylistTrack(Integer plylstId);
	public int removePlaylist(Integer plylstId);
	public int countPlaylist(String email);

	public UserVO getOneUser(String email);
	public List<PlaylistVO> getListPlaylist(String email);
	public List<Map<String,String>> getListLibrary(String object);
	public List<Map<String,String>> getListLikedArtist(String email);
	public List<Map<String,String>> getListLikedTrack(String email);
	public List<Map<String,String>> getListLikedAlbum(String email);
	public List<Map<String,String>> getListPlaylistDetail(Integer plylstId, String email);
	public List<Map<String,String>> findTrack(String searchTxt);


	//public int registerPlaylist(PlaylistVO playlistVO);
	//public void registerPlaylistDetail(PlaylistDetailVO playlistDetailVO);
	
}
