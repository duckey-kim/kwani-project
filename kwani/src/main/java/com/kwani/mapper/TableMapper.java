package com.kwani.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;

public interface TableMapper {
	public int insertArtist(ArtistVO artist);
	
	public int insertAlbum(AlbumVO album);
	
	public int insertTrack(TracksVO track);
	
	public int insertUser(UserVO user);
	
	public int insertArtistTrack(@Param("trackId")Integer trackId,@Param("gropId")Integer gropId);
	
	public int insertArtistGroup(@Param("gropId")Integer gropId ,@Param("soloId")Integer soloId);
	
	public List<AlbumVO> getAlbumList();
	
	public AlbumVO getAlbum(String albumTtl);
	
	public List<TracksVO> getTrackList();
	
	public TracksVO getTracks(String trackTtl);
	
	public List<ArtistVO> getArtistList();
	
	public ArtistVO getArtist(String nm);
	
	
	public ArtistVO getArtistById(Integer gropId);
	
	
	public AdminVO getAdmin(String mngrId);
	
	public UserVO getUser(String email);
	
	public List<TracksVO> getTracksToInsert();

	public TracksVO getTracksById(Integer trackId);

	public Object getTracksArtistTrack(Integer trackId);
	
	public Object getArtistGroup(@Param("gropId")Integer gropId ,@Param("soloId")Integer soloId);
	
	public AlbumVO getAlbumById(Integer albumId);
	


	

}
