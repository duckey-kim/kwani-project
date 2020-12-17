package com.kwani.service;

import java.util.List;
import java.util.Map;

public interface LikeAndPlaylistService {

	// 이메일과 트랙아이디로 트랙 좋아요 여부 확인 메서드
	public Map<String, String> checkLikeTrack(String sessionName, Integer trackId);

	// 이메일과 앨범아이디로 앨범 좋아요 여부 확인 메서드
	public Map<String, String> checkLikeAlbum(String sessionName, Integer albumId);

	// 이메일과 가수아이디로 가수 좋아요 여부 확인 메서드
	public Map<String, String> checkLikeArtist(String sessionName, Integer gropId);

	// 유저의 저장된 플레이리스트들을 가져오는 메서드
	public List<Map<String, String>> getPlaylists(String sessionName);

	// 플레이리스트에 있는 트랙의 개수 가져오는 메서드
	public Map<String, String> countPlaylistTracks(Integer plylstId);

	// 사용자가 해당 앨범 수록곡 중 좋아요한 곡 ID 가져오는 메서드
	public List<Map<String, String>> getLikeTracksInAlbum(String sessionName, Integer albumId);

	// 사용자가 해당 가수의 곡 중 좋아요한 곡 ID 가져오는 메서드
	public List<Map<String, String>> getLikeTracksInArtist(String sessionName, Integer gropId);
	
	// 플레이리스트의 존재여부를 확인하는 메서드
	public Map<String, String> isPlaylistExist(Integer plylstId);
	
	// 플레이리스트의 있는 트랙 아이디 가져오는 메서드
	public List<Map<String, String>> getTracksInPlaylist(Integer plylstId);
			
	// 플레이리스트에 트랙 추가하는 메서드
	public int insertTrackIntoPlaylist(Integer plylstId, Integer trackId);

	// 노래 좋아요 추가 메서드
	public int insertLikeTrack(String sessionName, Integer trackId);

	// 노래 좋아요 취소 메서드
	public int deleteLikeTrack(String sessionName, Integer trackId);

	// 앨범 좋아요 추가 메서드
	public int insertLikeAlbum(String sessionName, Integer albumId);

	// 앨범 좋아요 취소 메서드
	public int deleteLikeAlbum(String sessionName, Integer albumId);

	// 가수 좋아요 추가 메서드
	public int insertLikeArtist(String sessionName, Integer gropId);

	// 가수 좋아요 취소 메서드
	public int deleteLikeArtist(String sesionName, Integer gropId);

}
