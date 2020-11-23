package com.kwani.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;
import com.kwani.service.TableService;

import lombok.Setter;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = @Autowired)
	private TableService tableService;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping({ "/inputartistandgroup", "/inputtracks", "/inputuser", "/inputartist", "/inputalbum", "/loginform" })
	public void basic2() {

	}

	@GetMapping({ "/", "/home" })
	public String basic() {
		return "/admin/home";
	}

	@GetMapping("/inputartistandtrack")
	public void inputArtistTrack(Model model) {
		List<TracksVO> trackList = tableService.getTracksToInsert();
		model.addAttribute("trackList", trackList);

	}

	@GetMapping("/logout")
	public String adminLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/admin/loginform";
	}

	@PostMapping("/getArtist")
	public String getArtist(String nm, RedirectAttributes rttr) {
		String msg = "input 유효성을 지켜주세요";
		nm = nm.trim();
		if (!tableService.inputStringValid(nm,rttr)) {
			ArtistVO getArtist = tableService.getArtist(nm);
			if (tableService.isEmptyArtist(getArtist)) {
				msg = "일치하는 가수가 없습니다";
			} else {
				msg = "일치하는 가수를 찾았습니다";
				rttr.addFlashAttribute("artist", getArtist);
			}
		}
		List<TracksVO> trackList = tableService.getTracksToInsert();
		rttr.addFlashAttribute("trackList", trackList);
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin/inputartistandtrack";
	}

	@PostMapping("/getArtistGroup")
	public String getArtistGroup(String nm, RedirectAttributes rttr) {
		String msg = "가수이름을 입력하세요";
		if (!tableService.inputStringValid(nm,rttr)) {
			ArtistVO getArtist = tableService.getArtist(nm.trim());
			if (tableService.isEmptyArtist(getArtist)) {
				msg = "일치하는 가수가 없습니다";
			} else {
				msg = "일치하는 가수를 찾았습니다";
				rttr.addFlashAttribute("artist", getArtist);
			}
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin/inputartistandgroup";
	}

	@PostMapping("/getAlbum")
	public String getAlbum(String albumTtl, RedirectAttributes rttr) {
		// ajax로 변환해야할듯?
		// 앨범타이블로 앨범을 가져온다
		// 일치하는 앨범이 없으면 없다고 알려준다.
		// 일치하는 앨범이 있으면 rttr에 담는다
		albumTtl = albumTtl.trim();
		System.out.println("/getAlbum");

		if (!tableService.inputStringValid(albumTtl, rttr)) {
			tableService.getAlbumForTrack(albumTtl, rttr);

		}
		return "redirect:/admin/inputtracks";
	}

	@PostMapping("/inputalbumAction")
	public String inputAlbum(AlbumVO album, RedirectAttributes rttr) {

		String path = "/inputalbum";
		System.out.println(album);
		if (tableService.albumInputValid(album, rttr)) {
		} else if (tableService.albumValid(album, rttr)) {
			path = "/home";

		}
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputtracksAction")
	public String uploadTracks(TracksVO track, RedirectAttributes rttr) {
		System.out.println(track);
		// trackvo 추가
		// input check
		// title이랑 albumId가 똑같다면 중복
		// albumId가 없다면 등록실패
		// input check
		if (tableService.trackInputValid(track, rttr)) {
		} else {
			tableService.insertTrack(track, rttr);
		}
		return "redirect:/admin/inputtracks";

	}

	@PostMapping("/inputuserAction")
	public String uploadUser(UserVO user, RedirectAttributes rttr) {
		// input user
		// 1.email,pwd,nick null check =>userInputValid
		// 2.email 중복 체크 -> userValid

		String path = "/inputuser";
		System.out.println(user);
		if (tableService.userInputValid(user, rttr)) {
		} else if (tableService.userValid(user, rttr)) {
			path = "/home";
		}
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputartistAction")
	public String uploadArtist(ArtistVO artist, RedirectAttributes rttr) {
		// 가수등록
		// 입력체크
		// 가수name으로 중복확인
		// 중복이 아닐경우 테이블에 등록 artist_group에도 자기자신 등록
		// 소녀시대 : 소녀시대
		String msg = "정보 입력이 다되지 않았습니다";
		String path = "/inputartist";
		if (!tableService.artistInputValid(artist)) {
			int result = tableService.insertArtist(artist);
			if (result == 1) {
				msg = "artist 등록 성공";
				path = "/home";
			} else if (result == -1) {
				msg = "중복되는 artist 가 있습니다";
			} else if (result == 0) {
				msg = "artist 등록 실패";
			}
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputartisttracksAction")
	public String uploadArtistTrack(Integer trackId, Integer gropId, RedirectAttributes rttr) {
		System.out.println(trackId + "  :  " + gropId);
		// trackid 가 t_tracks에 있는지 확인
		// gropId가 t_artist에 있는지 확인
		// trackid가 t_artist_tracks에 있으면 에러

		// groupId가 있고
		// table에 trackId가 있는데 artist_tracks에 없으면
		// insert
		// 그렇지 않다면 에러
		String msg = "존재하지 않는 그룹입니다";
		if (!tableService.checkGropId(gropId)) {
			if (tableService.checkTrackId(trackId)) {
				int result = tableService.insertArtistTrack(trackId, gropId);
				if (result == 1) {
					msg = "Artist Tracks Insert 성공";
				} else {
					msg = "Artist Tracks Insert 실패";
				}
			} else {
				msg = "이미 테이블에 존재하는 track입니다";
			}
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin/inputartistandtrack";

	}

	@PostMapping("/inputartistgroupAction")
	public String uploadArtistGroup(Integer gropId, Integer soloId, RedirectAttributes rttr) {
		// grop,solo아이디가 null일지 체크
		// grop,solo아이디가 grouptable에 존재하는지 체크
		// 없으면 리턴
		// table에 있고
		// groupid,soloid가 artistgroup table에 있으면 에러
		// 그렇지 않으면 insert
		String msg = "";
		String path = "/inputartistandgroup";
		if (tableService.checkInputValid(gropId, soloId)) {
			msg = "gropId,soloId를 입력해주세요";
		} else if (tableService.checkInTable(gropId, soloId)) {
			msg = "등록되지 않은 가수ID입니다";

		} else if (!tableService.checkInTableArtistGroup(gropId, soloId)) {
			msg = "이미 아티스트그룹 테이블에 저장된 그룹입니다";
		} else {

			int result = tableService.insertArtistGroup(gropId, soloId);
			if (result == 1) {
				msg = "ARTIST_GROUP 에 입력 성공";
				path = "/home";
			} else {
				msg = "ARTIST_GROUP에 입력 실패";
			}
		}
		rttr.addFlashAttribute("msg", msg);
		return "redirect:/admin" + path;

	}

	@PostMapping("/loginAction")
	public String loginManager(AdminVO admin, RedirectAttributes rttr, HttpServletRequest request) {

		// 입력단 check tableService.adminInputValid
		// id값으로 admin을 가져온다. 없다면 아이디가 잘못된거다 tableService.adminValid
		// 아이디가 같고 pwd같으면 로그인 성공 -> /admin/home으로
		// 그렇지 않으면 로그인 실패 -> /admin/loginform으로

		String path = "/loginform";
		if (tableService.adminInputValid(admin, rttr)) {
		} else if (tableService.adminValid(admin, rttr)) {
			path = "/home";
			tableService.setMngrSession(request, admin.getMngrId());
		}

		return "redirect:/admin/" + path;

	}

}
