package com.kwani.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.kwani.domain.PlaylistVO;
import com.kwani.domain.UserVO;

public interface MyPageService {

	public void insertTrackList(Set<Integer> trackId, Integer plylstId, String email);
	public boolean checkValidPlaylist(Integer plylstId);
	public boolean checkValidTrackInPlaylist(Integer plylstId, Integer trackId);
	public boolean removePlaylist(Integer plylstId, String email);
	public boolean modifyPlaylist(PlaylistVO playlistVO, String email);
	public int createPlaylist(PlaylistVO playlistVO);
	public int countPlaylist(String email);
	public int countPlaylistTrack(Integer plylstId);
	public int modifyPlaylistImg(Integer plylstId, Integer trackId);
	public int modifyPlaylistBasicImg(Integer plylstId);
	public void removePlaylistTrack(Set<Integer> trackList, Integer plylstId);

	public UserVO getOneUser(String email);

	public List<PlaylistVO> getListPlaylist(String email);
	public List<Map<String,String>> getListLibrary(String object);
	public List<Map<String,String>> getListLikedArtist(String email);
	public List<Map<String,String>> getListLikedTrack(String email);
	public List<Map<String,String>> getListLikedAlbum(String email);
	public List<Map<String,String>> getListPlaylistDetail(Integer plylstId, String email);
	
}
