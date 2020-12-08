package com.kwani.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;

public interface TableMapper {
	public int insertArtist(@Param("artist")ArtistVO artist,@Param("upUser")String upUser);
	
	public int insertAlbum(@Param("album")AlbumVO album,@Param("upUser")String upUser);
	
	public int insertTrack(@Param("track")TracksVO track,@Param("upUser") String upUser);
	
	public int insertUser(@Param("user")UserVO user,@Param("upUser") String upUser);
	
	public int insertArtistTrack(@Param("trackId")Integer trackId,@Param("gropId")Integer gropId, @Param("upUser")String upUser);
	
	public int insertArtistGroup(@Param("gropId")Integer gropId ,@Param("soloId")Integer soloId,@Param("upUser")String upUser);
	
	public List<AlbumVO> getAlbumList();
	
	public AlbumVO getAlbum(String albumTtl);
	
	public List<TracksVO> getTrackList();
	
	public TracksVO getTracks(String trackTtl);
	
	public TracksVO checkTracks(TracksVO tracks);
	
	public List<ArtistVO> getArtistList();
	
	public ArtistVO getArtist(String nm);
	
	
	public ArtistVO getArtistById(Integer gropId);
	
	
	public AdminVO getAdmin(AdminVO admin);
	
	public UserVO getUser(String email);
	
	public List<TracksVO> getTracksToInsert();

	public TracksVO getTracksById(Integer trackId);

	public Object getTracksArtistTrack(Integer trackId);
	
	public Object getArtistGroup(@Param("gropId")Integer gropId ,@Param("soloId")Integer soloId);
	
	public AlbumVO getAlbumById(Integer albumId);
	
	public Integer getSeqGropCurrval();
	
	public List<UserVO> getUserList();
	
	public int updateAlbum(@Param("upUser")String upUser,@Param("album")AlbumVO album);
	
	public int updateArtist(@Param("upUser")String upUser,@Param("artist")ArtistVO artist);
	
	public int updateTracks(@Param("upUser")String upUser,@Param("track")TracksVO track);
	
	public int updateUser(@Param("upUser")String upUser,@Param("user")UserVO user);
	

}
