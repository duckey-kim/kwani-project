package com.kwani.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface LikeAndPlaylistMapper {

		// 이메일과 트랙아이디로 트랙 좋아요 여부 확인 메서드
		public Map<String, String> checkLikeTrack(@Param("sessionName") String sessionName, @Param("trackId") Integer trackId);

		// 이메일과 앨범아이디로 앨범 좋아요 여부 확인 메서드
		public Map<String, String> checkLikeAlbum(@Param("sessionName") String sessionName, @Param("albumId") Integer albumId);
		
		// 이메일과 가수아이디로 가수 좋아요 여부 확인 메서드
		public Map<String, String> checkLikeArtist(@Param("sessionName") String sessionName, @Param("gropId") Integer gropId);
		
		// 유저의 저장된 플레이리스트들을 가져오는 메서드
		public List<Map<String, String>> getPlaylists(String sessionName);

		// 사용자가 해당 앨범 수록곡 중 좋아요한 곡 ID 가져오는 메서드
		public List<Map<String, String>> getLikeTracksInAlbum(@Param("sessionName") String sessionName, @Param("albumId") Integer albumId);
				
		// 사용자가 해당 가수의 곡 중 좋아요한 곡 ID 가져오는 메서드
		public List<Map<String, String>> getLikeTracksInArtist(@Param("sessionName") String sessionName, @Param("gropId") Integer gropId);
		
		// 노래 좋아요 추가 메서드
		public int insertLikeTrack(@Param("sessionName") String sessionName, @Param("trackId") Integer trackId);
		
		// 노래 좋아요 취소 메서드
		public int deleteLikeTrack(@Param("sessionName") String sessionName, @Param("trackId") Integer trackId);
		
		// 앨범 좋아요 추가 메서드
		public int insertLikeAlbum(@Param("sessionName") String sessionName, @Param("albumId") Integer albumId);
		
		// 앨범 좋아요 취소 메서드
		public int deleteLikeAlbum(@Param("sessionName") String sessionName, @Param("albumId") Integer albumId);
		
		// 가수 좋아요 추가 메서드
		public int insertLikeArtist(@Param("sessionName") String sessionName, @Param("gropId") Integer gropId);
		
		// 가수 좋아요 취소 메서드
		public int deleteLikeArtist(@Param("sessionName") String sesionName, @Param("gropId") Integer gropId);
}
