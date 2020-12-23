package com.kwani.service;



import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;

public interface TableService {

	public boolean insertUser(UserVO user, RedirectAttributes rttr, String upUser);
	
	public boolean albumInputValid(AlbumVO album, RedirectAttributes rttr);
	
	public boolean albumValid(AlbumVO album, RedirectAttributes rttr);


	public boolean insertAlbum(AlbumVO album,String upUser, RedirectAttributes rttr);


	public boolean trackInputValid(TracksVO track, RedirectAttributes rttr);

	public boolean insertTrack(TracksVO track, String upUser, RedirectAttributes rttr);

	public boolean artistInputValid(ArtistVO artist, RedirectAttributes rttr);

	public void insertArtist(ArtistVO artist, String upUser, RedirectAttributes rttr);
	
	public List<TracksVO> getTracksToInsert();

	public void getArtist(String nm,RedirectAttributes rttr);

	public boolean checkGropId(Integer gropId);

	public boolean checkTrackId(Integer trackId);
	
	public boolean insertArtistTrack(Integer trackId,Integer gropId,String upUser, RedirectAttributes rttr);

	public void setMngrSession(HttpServletRequest request, String mngrId);
	
	public boolean checkAdmin(AdminVO admin, RedirectAttributes rttr);
	
	public boolean insertArtistGroup(Integer gropId ,Integer soloId,String upUser, RedirectAttributes rttr);

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

	public List<ArtistVO> getArtistList();
	
	public ArtistVO getArtistById(Integer gropId);

	public boolean updateArtist(ArtistVO artist, String upUser, RedirectAttributes rttr);
	
	public List<TracksVO> getTrackList();
	
	public TracksVO getTracksById(Integer trackId);

	public boolean updateTrack(TracksVO track, String upUser, RedirectAttributes rttr);
	
	public List<UserVO> getUserList();
	
	public UserVO getUserByEmail(String email);

	public boolean updateUser(UserVO user, String upUser, RedirectAttributes rttr);

	public <T> String setImgName(T obj, MultipartFile imgFile);

	public <T> void setImgColumn(T obj, String fileName);

	public void saveImgFile(String uploadFolder, String fileName, MultipartFile imgFile) throws IllegalStateException, IOException;

	public List<Map<String, String>> getGenreCount();

	public List<Map<String, String>> getPlayCount();
	
	
	
	

}
