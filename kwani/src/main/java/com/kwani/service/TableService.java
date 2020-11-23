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

	
	
	
	public boolean userValid(UserVO user, RedirectAttributes rttr);
	
	public boolean albumInputValid(AlbumVO album, RedirectAttributes rttr);
	
	public boolean albumValid(AlbumVO album, RedirectAttributes rttr);

	public int insertUser(UserVO user);

	public int insertAlbum(AlbumVO album);

	public AlbumVO getAlbum(String albumTtl);

	public boolean trackInputValid(TracksVO track, RedirectAttributes rttr);

	public void insertTrack(TracksVO track, RedirectAttributes rttr);

	public boolean artistInputValid(ArtistVO artist);

	public int insertArtist(ArtistVO artist);
	
	public List<TracksVO> getTracksToInsert();

	public ArtistVO getArtist(String nm);

	public boolean checkGropId(Integer gropId);

	public boolean checkTrackId(Integer trackId);
	
	public int insertArtistTrack(@Param("trackId")Integer trackId,@Param("gropId")Integer gropId);

	public void setMngrSession(HttpServletRequest request, String mngrId);

	public boolean checkAdmin(AdminVO admin);

	
	public boolean adminValid(AdminVO admin, RedirectAttributes rttr);

	
	public int insertArtistGroup(@Param("gropId")Integer gropId ,@Param("soloId")Integer soloId);

	public boolean checkInTableArtistGroup(Integer gropId, Integer soloId);

	public boolean checkInputValid(Integer gropId, Integer soloId);

	public boolean checkInTable(Integer gropId, Integer soloId);


	public boolean isEmptyArtist(ArtistVO getArtist);

	public void getAlbumForTrack(String albumTtl, RedirectAttributes rttr);

	
	public boolean inputStringValid(String string, RedirectAttributes rttr);

	public boolean adminInputValid(AdminVO admin, RedirectAttributes rttr);

	public boolean userInputValid(UserVO user, RedirectAttributes rttr);



	
	
	
	
	
	

}
