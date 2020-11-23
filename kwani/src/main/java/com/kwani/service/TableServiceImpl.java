package com.kwani.service;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;
import com.kwani.mapper.TableMapper;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class TableServiceImpl implements TableService {

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
		UserVO getUser = mapper.getUser(user.getEmail());
		if (getUser == null) {
			int result = mapper.insertUser(user);
			if (result == 1) {
				rttr.addFlashAttribute("msg", "유저 작성 성공");
				return true;
			} else {
				rttr.addFlashAttribute("msg", "유저등록 실패");
			}
		} else {
			rttr.addFlashAttribute("msg", "이미있는 유저입니다");
		}
		return false;
	}

	// 빈 앨범객체인지 확인
	@Override
	public void getAlbumForTrack(String albumTtl, RedirectAttributes rttr) {
		AlbumVO getAlbum = mapper.getAlbum(albumTtl);
		if ("".equals(getAlbum.getAlbumTtl())) {
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
		AlbumVO getAlbum = mapper.getAlbum(album.getAlbumTtl());
		if (getAlbum == null) {
			int result = mapper.insertAlbum(album);
			if (result == 1) {
				rttr.addFlashAttribute("msg", "앨범 작성 성공");
				return true;
			} else {
				rttr.addFlashAttribute("msg", "앨범 등록 실패");
			}
		} else {
			rttr.addFlashAttribute("msg", "이미있는 앨범입니다");
		}
		return false;

	}

	// 앨범타이틀로 테이블에서 앨범 가져오기
	// 없으면 빈 앨범객체를 준다
	@Override
	public AlbumVO getAlbum(String albumTtl) {
		// ttl로 찾아서 있으면 리턴
		// 없으면 빈앨범 리턴
		AlbumVO getAlbum = mapper.getAlbum(albumTtl);
		return getAlbum == null ? new AlbumVO() : getAlbum;
	}

	// 입력받은 TracksVO의 유효성 검사
	@Override
	public boolean trackInputValid(TracksVO track, RedirectAttributes rttr) {
		if (track.getAlbumId() == null || "".equals(track.getTrackTtl()) || "".equals(track.getTrackUrl())) {

			rttr.addFlashAttribute("msg", "input을 입력해주세요");
			return true;
		}
		return false;

	}

	// 테이블에 유저 입력
	@Override
	public int insertUser(UserVO user) {
		return mapper.insertUser(user);
	}

	// 테이블에 앨범 입력
	@Override
	public int insertAlbum(AlbumVO album) {
		return mapper.insertAlbum(album);
	}

	// 테이블에 TracksVO 입력
	// 아이디로 가져와서 트랙브이오가 존재하는데 albumId가 같다면 이미존재하는 노래
	// 그렇지 않은경우에 등록
	// 테이블에 등록안되어 있다면 등록
	@Override
	public void insertTrack(TracksVO track, RedirectAttributes rttr) {
		// trackvo 추가			
		// input check
		// title이랑 albumId가 똑같다면 중복
		// albumId가 없다면 등록실패
		// input check
		
		
		TracksVO getTrack = mapper.getTracks(track.getTrackTtl());
		String msg = "";
		if (getTrack != null) {
			if (getTrack.getAlbumId().equals(track.getAlbumId())) {
				msg = "같은 앨범으로 등록된 노래가 있습니다";
			} else if (mapper.getAlbumById(track.getAlbumId()) == null) {
				msg = "없는 앨범입니다";
			} else {
				if (mapper.insertTrack(track) == 1) {
					msg = "곡을 등록합니다";
				} else {
					msg = "곡 등록 실패 ";
				}

			}
		}

		rttr.addFlashAttribute("msg",msg);
	}

	// 입력받은 ArtistVO 유효성 검사

	@Override
	public boolean artistInputValid(ArtistVO artist) {
		return "".equals(artist.getNm()) || artist.getNm().length() > 30 || "".equals(artist.getDebutDt());
	}

	// 가수name으로 중복확인
	// 중복이 아닐경우 테이블에 등록 artist_group에도 자기자신 등록
	// 소녀시대 : 소녀시대
	@Override
	@Transactional
	public int insertArtist(ArtistVO artist) {
		ArtistVO getArtist = mapper.getArtist(artist.getNm());
		int result = -1;
		if (getArtist == null) {
			result = mapper.insertArtist(artist);
			ArtistVO insertArtist = mapper.getArtist(artist.getNm());
			int artistId = insertArtist.getGropId();
			mapper.insertArtistGroup(artistId, artistId);
		}
		return result;
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
	public ArtistVO getArtist(String nm) {
		ArtistVO getArtist = mapper.getArtist(nm);

		return getArtist == null ? new ArtistVO() : getArtist;
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
	public int insertArtistTrack(Integer trackId, Integer gropId) {
		return mapper.insertArtistTrack(trackId, gropId);
	}

	// admin로그인시 session 작성
	@Override
	public void setMngrSession(HttpServletRequest request, String mngrId) {
		HttpSession session = request.getSession(true);
		session.setAttribute("mngrId", mngrId);
		System.out.println("adminController debug ::  session create");

	}

	// loginform에 입력한 admin을 테이블과 비교함
	@Override
	public boolean checkAdmin(AdminVO admin) {
		AdminVO getAdmin = mapper.getAdmin(admin.getMngrId());
		return getAdmin.getMngrId().equals(admin.getMngrId()) && getAdmin.getPwd().equals(admin.getPwd());
	}

	@Override
	public boolean adminValid(AdminVO admin, RedirectAttributes rttr) {
		AdminVO getAdmin = mapper.getAdmin(admin.getMngrId());
		if (getAdmin == null) {
			rttr.addFlashAttribute("msg", "없는 ID입니다");
			return false;
		} else {
			if (getAdmin.getMngrId().equals(admin.getMngrId()) && getAdmin.getPwd().equals(admin.getPwd())) {
				rttr.addFlashAttribute("msg", "로그인성공");
				return true;
			} else {
				rttr.addFlashAttribute("msg", "비밀번호 일치하지않음");
			}
		}
		return false;
	}

	@Override
	public boolean adminInputValid(AdminVO admin, RedirectAttributes rttr) {
		if ("".equals(admin.getMngrId()) && "".equals(admin.getPwd())) {
			rttr.addFlashAttribute("msg", "입력사항을 입력해주세요");
			return true;
		} else
			return false;
	}

	@Override
	public int insertArtistGroup(Integer gropId, Integer soloId) {
		return mapper.insertArtistGroup(gropId, soloId);
	}

	// gropId,soloId가 artist테이블에 있는지 확인
	@Override
	public boolean checkInputValid(Integer gropId, Integer soloId) {

		return mapper.getArtistById(gropId) == null || mapper.getArtistById(soloId) == null;
	}

	// 입력한 artist_group테이블에 데이터 있는지 확인
	@Override
	public boolean checkInTableArtistGroup(Integer gropId, Integer soloId) {

		return mapper.getArtistGroup(gropId, soloId) == null;
	}

	@Override
	public boolean checkInTable(Integer gropId, Integer soloId) {

		return checkGropId(gropId) && checkGropId(soloId);
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
}
