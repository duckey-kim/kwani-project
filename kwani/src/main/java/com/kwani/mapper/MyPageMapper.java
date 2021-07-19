package com.kwani.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.Criteria;
import com.kwani.domain.PlaylistVO;
import com.kwani.domain.UserVO;

public interface MyPageMapper {

	public Integer insertSelectKeyPlaylist(PlaylistVO playlistVO);
	
	public Integer insertLikeTracks(@Param("trackId")Integer trackId, @Param("email")String email);
	public Integer insertLikeArtists(@Param("artistId")Integer artistId, @Param("email")String email);
	public Integer insertLikeAlbums(@Param("albumId")Integer albumId, @Param("email")String email);
	
	public Integer updatePlaylist(@Param("plylst")PlaylistVO plyalistVO, @Param("email")String email);
	public Integer updatePlaylistImg(@Param("plylstId")Integer plylstId, @Param("trackId")Integer trackId);
	public Integer updatePlaylistBasicImg(@Param("plylstId")Integer plylstId);
	public Integer countPlaylist(String email);
	public Integer countPlaylistTrack(Integer plylstId);
	public Integer insertTrack(@Param("plylstId")Integer plylstId, @Param("trackId")Integer trackId);
	
	public Integer deleteLikeTracks(@Param("trackId")Integer trackId, @Param("email")String email);
	public Integer deleteLikeArtists(@Param("artistId")Integer artistId, @Param("email")String email);
	public Integer deleteLikeAlbums(@Param("albumId")Integer albumId, @Param("email")String email);
	
	public Integer deletePlaylist(@Param("plylstId")Integer plylstId, @Param("email")String email);
	public Integer deletePlaylistDetail(@Param("plylstId")Integer plylstId);
	public Integer deletePlaylistTrack(@Param("trackId")Integer trackId, @Param("plylstId")Integer plylstId);
	public Integer getOnePlaylist(@Param("plylstId")Integer plylstId, @Param("email")String email);
	public Integer getOneTrackInPlaylist(@Param("plylstId")Integer plylstId, @Param("trackId")Integer trackId);
	/*페이징*/
	public Integer getTotalCountLibrary(@Param("cri")Criteria cri, @Param("email") String email);

	public UserVO getUser(String email);

	public PlaylistVO getOnePlaylistVO(@Param("plylstId")Integer plylstId, @Param("email")String email);
	public List<Integer> getPlaylistTrackList(@Param("plylstId")Integer plylstId, @Param("email")String email);
	public List<PlaylistVO> getListPlaylist(String email);
	public List<Map<String,String>> getListLibrary(String email);
	/*현재 개발중*/
	public List<Map<String,String>> getListLibraryWithPaging(@Param("cri") Criteria cri, @Param("email") String email);	
	public List<Map<String,String>> getLikedTrackList(String email);
	public List<Map<String,String>> getListLikedArtist(String email);
	public List<Map<String,String>> getListLikedTrack(String email);
	public List<Map<String,String>> getListLikedAlbum(String email);
	public List<Map<String,String>> getPlaylistDetail(@Param("plylstId")Integer plylstId, @Param("email")String email);

}
