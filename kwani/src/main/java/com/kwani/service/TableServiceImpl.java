package com.kwani.service;

import java.io.File;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;
import com.kwani.mapper.TableMapper;

import lombok.Setter;

@Service
public class TableServiceImpl implements TableService {

	@Setter(onMethod_ = @Autowired)
	private TableMapper mapper;

	// 입력한 유저정보 nullCheck
	@Override
	public boolean userInputValid(UserVO user, RedirectAttributes rttr) {
		if ("".equals(user.getEmail()) | "".equals(user.getNick()) | "".equals(user.getPwd())) {
			rttr.addFlashAttribute("msg", "입력사항을 입력해주세요");
			return true;
		}
		return false;
	}

	// email로 작성된 유저가 있는지 체크
	@Override
	public boolean userValid(UserVO user, RedirectAttributes rttr) {
		if (mapper.getUser(user.getEmail()) == null) {
			return true;
		}
		rttr.addFlashAttribute("msg", "이미있는 email입니다");
		return false;
	}

	@Override
	public boolean insertUser(UserVO user, RedirectAttributes rttr, String upUser) {

		int result = mapper.insertUser(user, upUser);

		if (result == 1) {
			rttr.addFlashAttribute("msg", "유저등록성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "유저등록실패");

		return false;
	}

	// 빈 앨범객체인지 확인
	@Override
	public void getAlbumForTrack(String albumTtl, RedirectAttributes rttr) {
		AlbumVO getAlbum = mapper.getAlbum(albumTtl);
		if (getAlbum == null) {
			rttr.addFlashAttribute("msg", "입력하신 앨범은 없습니다");
		} else {
			rttr.addFlashAttribute("album", getAlbum);
		}
	}

	// 빈 아티스트 객체인지 확인
	@Override
	public boolean isEmptyArtist(ArtistVO getArtist) {

		return "".equals(getArtist.getNm());
	}

	// 입력된 album의 정보확인
	@Override
	public boolean albumInputValid(AlbumVO album, RedirectAttributes rttr) {
		if ("".equals(album.getAlbumTtl()) | "".equals(album.getRlesDt())) {
			rttr.addFlashAttribute("msg", "입력사항을 입력해주세요");
			return true;
		}

		return false;
	}

	// 테이블에 앨범객체가 있는지 확인한다.
	@Override
	public boolean albumValid(AlbumVO album, RedirectAttributes rttr) {
		if (mapper.getAlbum(album.getAlbumTtl()) == null) {
			return true;
		}
		rttr.addFlashAttribute("msg", "이미있는 앨범입니다");
		return false;
	}

	// 테이블에 앨범 입력
	@Override
	public boolean insertAlbum(AlbumVO album, String upUser, RedirectAttributes rttr) {
		int result = mapper.insertAlbum(album, upUser);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "앨범등록");
			return true;
		}
		rttr.addFlashAttribute("msg", "앨범등록실패");

		return false;
	}

	// 입력받은 TracksVO의 유효성 검사
	// albumId,trackTtl,trackUrl
	@Override
	public boolean trackInputValid(TracksVO track, RedirectAttributes rttr) {

		if (track.getAlbumId() == null || "".equals(track.getTrackTtl()) || "".equals(track.getTrackUrl())) {

			rttr.addFlashAttribute("msg", "input을 입력해주세요");
			return true;
		}
		if (mapper.getAlbumById(track.getAlbumId()) == null) {
			rttr.addFlashAttribute("msg", "없는 앨범입니다");
			return true;
		}
		return false;

	}

	@Override
	public boolean trackValid(TracksVO track, RedirectAttributes rttr) {
		if (mapper.checkTracks(track) != null) {
			rttr.addFlashAttribute("msg", "앨범ID가 중복됩니다");
			return false;
		}
		return true;
	}

	@Override
	public boolean insertTrack(TracksVO track, String upUser, RedirectAttributes rttr) {
		// 테이블에 TracksVO 입력
		// 테이블에 등록안되어 있다면 등록

		if (mapper.insertTrack(track, upUser) == 1) {
			rttr.addFlashAttribute("msg", "곡 등록");
			return true;
		}
		rttr.addFlashAttribute("msg", "곡 등록 실패");
		return false;
	}

	// 입력받은 ArtistVO 유효성 검사

	@Override
	public boolean artistInputValid(ArtistVO artist, RedirectAttributes rttr) {

		if ("".equals(artist.getNm()) || artist.getNm().length() > 30 || "".equals(artist.getDebutDt())) {
			return true;
		}
		return false;
	}

	@Override
	public boolean artistValid(ArtistVO artist, RedirectAttributes rttr) {
		if (mapper.getArtist(artist.getNm()) == null) {
			return true;
		}
		rttr.addFlashAttribute("msg", "등록되어있는 가수입니다");
		return false;
	}

	// 가수name으로 중복확인
	// 중복이 아닐경우 테이블에 등록 artist_group에도 자기자신 등록
	// 소녀시대 : 소녀시대
	@Override
	@Transactional
	public void insertArtist(ArtistVO artist, String upUser, RedirectAttributes rttr) {
		// exception은 내가 만들어서 보낼 것이냐
		// 그냥 runtime exception으로 보낼것이냐
		rttr.addFlashAttribute("msg", "가수등록 실패");
		mapper.insertArtist(artist, upUser);

		int artistId = mapper.getSeqGropCurrval();
		mapper.insertArtistGroup(artistId, artistId, upUser);
		rttr.addFlashAttribute("msg", "가수 등록 성공");

	}

	// ARTIST_TRACKS의 테이블에 등록되지 않은 노래 list
	@Override
	public List<TracksVO> getTracksToInsert() {
		List<TracksVO> list = mapper.getTracksToInsert();

		return list == null ? Collections.emptyList() : list;
	}

	// 입력받은 이름으로 가수 객체 가져오기
	// 없으면 빈 객체
	@Override
	public void getArtist(String nm, RedirectAttributes rttr) {
		ArtistVO getArtist = mapper.getArtist(nm);
		if (getArtist == null) {
			rttr.addFlashAttribute("msg", "없는 아티스트입니다");
		} else
			rttr.addFlashAttribute("artist", getArtist);
	}

	// 입력받은 그룹아이디로 테이블에 존재유무
	@Override
	public boolean checkGropId(Integer gropId) {
		return mapper.getArtistById(gropId) == null;
	}

	// trackid 가 테이블 tracks에 있는지 확인
	// trackid가 테이블 t_artist_tracks에 있는지 확인
	@Override
	public boolean checkTrackId(Integer trackId) {
		return mapper.getTracksById(trackId) != null && mapper.getTracksArtistTrack(trackId) == null;
	}

	// 테이블 artist_track에 trackId,gropId 입력
	@Override
	public boolean insertArtistTrack(Integer trackId, Integer gropId, String upUser, RedirectAttributes rttr) {
		if (mapper.insertArtistTrack(trackId, gropId, upUser) == 1) {
			rttr.addFlashAttribute("msg", "등록성공!!");
			return true;
		}
		rttr.addFlashAttribute("msg", "등록실패");
		return false;
	}

	// admin로그인시 session 작성
	@Override
	public void setMngrSession(HttpServletRequest request, String mngrId) {
		HttpSession session = request.getSession(true);
		session.setAttribute("mngrId", mngrId);
		System.out.println("adminController debug ::  session create");

	}

	@Override
	public boolean checkAdmin(AdminVO admin, RedirectAttributes rttr) {

		// 입력받은 admin의 id,pwd 테이블에 일치하는 지 확인하고 없으면 로그인 실패
		if (mapper.getAdmin(admin) != null) {
			rttr.addFlashAttribute("msg", "로그인성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "로그인 실패");

		return false;

	}

	@Override
	public boolean adminInputValid(AdminVO admin, RedirectAttributes rttr) {
		if ("".equals(admin.getMngrId()) && "".equals(admin.getPwd())) {
			rttr.addFlashAttribute("msg", "입력사항을 입력해주세요");
			return true;
		}
		return false;
	}

	// gropId,soloId가 artist테이블에 있는지 확인
	@Override
	public boolean checkInputValid(Integer gropId, Integer soloId, RedirectAttributes rttr) {
		if (mapper.getArtistById(gropId) == null || mapper.getArtistById(soloId) == null) {
			rttr.addFlashAttribute("msg", "그룹아이디 또는 솔로아이디를 확인하세요");
			return true;
		}
		return false;
	}

	// 입력한 artist_group테이블에 데이터 있는지 확인
	@Override
	public boolean checkInTableArtistGroup(Integer gropId, Integer soloId, RedirectAttributes rttr) {

		if (mapper.getArtistGroup(gropId, soloId) == null) {
			// ARTIST_GROUP테이블에 데이터가 없음!
			return true;
		}
		rttr.addFlashAttribute("msg", "ARTIST_GROUP에 있는 데이터 입니다");
		return false;
	}

	@Override
	public boolean checkInTableArtist(Integer gropId, Integer soloId, RedirectAttributes rttr) {
		// 없고 없네

		if (!checkGropId(gropId) && !checkGropId(soloId)) {
			return true;
		}
		rttr.addFlashAttribute("msg", "테이블에 없는 그룹 ID입니다");
		return false;
	}

	@Override
	public boolean insertArtistGroup(Integer gropId, Integer soloId, String upUser, RedirectAttributes rttr) {
		int result = mapper.insertArtistGroup(gropId, soloId, upUser);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "데이터 입력 성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "입력실패");
		return false;
	}

	// 입력한 string 빈문자열인지 확인
	@Override
	public boolean inputStringValid(String string, RedirectAttributes rttr) {
		if ("".equals(string) || string.length() > 100) {
			rttr.addFlashAttribute("msg", "input 유호성 검사 실패 ");
			return true;
		} else
			return false;
	}

	@Override
	public List<AlbumVO> getAlbumList() {
		List<AlbumVO> albumList = mapper.getAlbumList();
		return albumList == null ? Collections.emptyList() : albumList;
	}

	@Override
	public AlbumVO getAlbumById(Integer albumId) {

		AlbumVO getAlbum = mapper.getAlbumById(albumId);
		return getAlbum == null ? new AlbumVO() : getAlbum;
	}

	@Override
	public boolean updateAlbum(AlbumVO album, String upUser, RedirectAttributes rttr) {
		int result = mapper.updateAlbum(upUser, album);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "update 앨범성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "update 실패");
		return false;
	}

	@Override
	public List<ArtistVO> getArtistList() {
		List<ArtistVO> artistList = mapper.getArtistList();
		return artistList == null ? Collections.emptyList() : artistList;
	}

	@Override
	public ArtistVO getArtistById(Integer gropId) {
		ArtistVO artist = mapper.getArtistById(gropId);
		return artist == null ? new ArtistVO() : artist;
	}

	@Override
	public boolean updateArtist(ArtistVO artist, String upUser, RedirectAttributes rttr) {
		System.out.println("updateArtist=====");
		int result = mapper.updateArtist(upUser, artist);
		if (result == 1) {
			System.out.println("업데이트 성공");
			rttr.addFlashAttribute("msg", "update 가수성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "update 실패");
		return false;
	}

	@Override
	public List<TracksVO> getTrackList() {
		List<TracksVO> trackList = mapper.getTrackList();

		return trackList == null ? Collections.emptyList() : trackList;
	}

	@Override
	public TracksVO getTracksById(Integer trackId) {
		TracksVO tracks = mapper.getTracksById(trackId);
		return tracks == null ? new TracksVO() : tracks;
	}

	@Override
	public boolean updateTrack(TracksVO track, String upUser, RedirectAttributes rttr) {
		int result = mapper.updateTracks(upUser, track);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "update 노래 성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "update 노래 실패");
		return false;
	}

	@Override
	public List<UserVO> getUserList() {
		List<UserVO> userList = mapper.getUserList();
		return userList == null ? Collections.emptyList() : userList;
	}

	@Override
	public UserVO getUserByEmail(String email) {
		UserVO user = mapper.getUser(email);
		return user == null ? new UserVO() : user;
	}

	@Override
	public boolean updateUser(UserVO user, String upUser, RedirectAttributes rttr) {
		int result = mapper.updateUser(upUser, user);
		if (result == 1) {
			rttr.addFlashAttribute("msg", "유저 업데이트 성공");
			return true;
		}
		rttr.addFlashAttribute("msg", "유저업데이트 실패");
		return false;
	}

	@Override
	public <T> String setImgName(T obj, MultipartFile imgFile) {

		String fileName = imgFile.getOriginalFilename();
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);
		String extension = fileName.substring(fileName.lastIndexOf("."));
		if (obj instanceof AlbumVO) {
			fileName = ((AlbumVO) obj).getAlbumTtl();
		}
		if (obj instanceof ArtistVO) {
			fileName = ((ArtistVO) obj).getNm();
		}
		if (obj instanceof UserVO) {
			fileName = ((UserVO) obj).getEmail();
		}

		return fileName + extension;

	}
	/*
	 * String fileName=imgFile.getOriginalFilename();
	 * fileName=fileName.substring(fileName.lastIndexOf("\\")+1); String extension=
	 * fileName.substring(fileName.lastIndexOf(".")); return
	 * album.getAlbumTtl()+extension;
	 */

	// album.albumImg 을 albumTtl.확장자로 변경
	@Override
	public <T> void setImgColumn(T obj, String fileName) {
		if (obj instanceof AlbumVO) {
			((AlbumVO) obj).setAlbumImg(fileName);
		} else if (obj instanceof ArtistVO) {
			((ArtistVO) obj).setGropImg(fileName);
		} else if (obj instanceof UserVO) {
			((UserVO) obj).setUserImg(fileName);
		}

	}

	// 주어진 uploadFoler에 fileName으로 imgFile저장
	@Override
	public void saveImgFile(String uploadFolder, String fileName, MultipartFile imgFile)
			throws IllegalStateException, IOException {

		File saveFile = new File(uploadFolder, fileName);

		imgFile.transferTo(saveFile);

	}
}
