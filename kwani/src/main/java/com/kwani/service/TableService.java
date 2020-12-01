package com.kwani.service;



import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;

public interface TableService {

	
	
	
	public boolean insertUser(UserVO user, RedirectAttributes rttr);
	
	public boolean albumInputValid(AlbumVO album, RedirectAttributes rttr);
	
	public boolean albumValid(AlbumVO album, RedirectAttributes rttr);


	public boolean insertAlbum(AlbumVO album,RedirectAttributes rttr);


	public boolean trackInputValid(TracksVO track, RedirectAttributes rttr);

	public boolean insertTrack(TracksVO track, RedirectAttributes rttr);

	public boolean artistInputValid(ArtistVO artist, RedirectAttributes rttr);

	public void insertArtist(ArtistVO artist, RedirectAttributes rttr);
	
	public List<TracksVO> getTracksToInsert();

	public void getArtist(String nm,RedirectAttributes rttr);

	public boolean checkGropId(Integer gropId);

	public boolean checkTrackId(Integer trackId);
	
	public boolean insertArtistTrack(@Param("trackId")Integer trackId,@Param("gropId")Integer gropId, RedirectAttributes rttr);

	public void setMngrSession(HttpServletRequest request, String mngrId);


	
	public boolean checkAdmin(AdminVO admin, RedirectAttributes rttr);

	
	public boolean insertArtistGroup(@Param("gropId")Integer gropId ,@Param("soloId")Integer soloId, RedirectAttributes rttr);

	public boolean checkInTableArtistGroup(Integer gropId, Integer soloId, RedirectAttributes rttr);

	public boolean checkInputValid(Integer gropId, Integer soloId, RedirectAttributes rttr);

	public boolean checkInTableArtist(Integer gropId, Integer soloId, RedirectAttributes rttr);


	public boolean isEmptyArtist(ArtistVO getArtist);

	public void getAlbumForTrack(String albumTtl, RedirectAttributes rttr);

	
	public boolean inputStringValid(String string, RedirectAttributes rttr);

	public boolean adminInputValid(AdminVO admin, RedirectAttributes rttr);

	public boolean userInputValid(UserVO user, RedirectAttributes rttr);

	public boolean artistValid(ArtistVO artist, RedirectAttributes rttr);

	public boolean userValid(UserVO user, RedirectAttributes rttr);

	public boolean trackValid(TracksVO track, RedirectAttributes rttr);
	
	public List<AlbumVO> getAlbumList();
	
	public AlbumVO getAlbumById(Integer albumId);

	public boolean updateAlbum(AlbumVO album, String upUser, RedirectAttributes rttr);
	
	
	
	
	
	

}
