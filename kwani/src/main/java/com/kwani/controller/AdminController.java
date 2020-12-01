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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AdminVO;
import com.kwani.domain.AlbumVO;
import com.kwani.domain.ArtistVO;
import com.kwani.domain.TracksVO;
import com.kwani.domain.UserVO;
import com.kwani.service.TableService;

import lombok.Setter;

/**
 * Handles requests for the application home page
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
	

	@GetMapping({ "/", "/home"})
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
		if (!tableService.inputStringValid(nm, rttr)) {
			tableService.getArtist(nm, rttr);
		}
		List<TracksVO> trackList = tableService.getTracksToInsert();
		rttr.addFlashAttribute("trackList", trackList);
		return "redirect:/admin/inputartistandtrack";
	}

	@PostMapping("/getArtistGroup")
	public String getArtistGroup(String nm, RedirectAttributes rttr) {
		if (!tableService.inputStringValid(nm, rttr)) {
			tableService.getArtist(nm, rttr);
		}
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
		if (tableService.albumInputValid(album, rttr)) {
		} else if (tableService.albumValid(album, rttr)) {
			if (tableService.insertAlbum(album, rttr))
				path = "/home";

		}
		rttr.addFlashAttribute("album", album);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputtracksAction")
	public String inputTracks(TracksVO track, RedirectAttributes rttr) {
		// track데이터 추가
		// input check albumId,trackTtl,trackUrl 이고 albumId가 album테이블에 존재하는지
		// trackTtl과 albumId가 같은 데이터가 있으면 중복
		//
		String path = "/inputtracks";
		if (tableService.trackInputValid(track, rttr)) {
		} else if (tableService.trackValid(track, rttr)) {
			if (tableService.insertTrack(track, rttr)) {
				path = "/home";
			}
		}
		rttr.addFlashAttribute("track", track);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputuserAction")
	public String inputUser(UserVO user, RedirectAttributes rttr) {
		// input user
		// 1.email,pwd,nick null check =>userInputValid
		// 2.email 중복 체크 -> userValid
		// 2-1 email 중복이 아니면 t_user에 user를 등록한다

		String path = "/inputuser";
		if (tableService.userInputValid(user, rttr)) {
		} else if (tableService.userValid(user, rttr)) {
			if (tableService.insertUser(user, rttr)) {
				path = "/home";
			}
		}
		rttr.addFlashAttribute("user", user);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputartistAction")
	public String inputArtist(ArtistVO artist, RedirectAttributes rttr) {
		// 가수등록요청
		// 1.입력체크 ->tableService.artistInputValid
		// 2.가수name으로 중복확인 ->tableService.artistValid
		// 2-1.중복이 아닐경우 테이블에 등록 artist_group에도 자기자신 등록
		// 소녀시대 : 소녀시대
		String path = "/home";

		if (!tableService.artistInputValid(artist, rttr)) {
			if (tableService.artistValid(artist, rttr)) {

				try {
					tableService.insertArtist(artist, rttr);
				} catch (Exception e) {
					rttr.addFlashAttribute("artist", artist);
					rttr.addFlashAttribute("msg", e.getMessage());
					e.printStackTrace();
					path = "/inputartist";
				}

			}
		}

		return "redirect:/admin" + path;

	}

	@PostMapping("/inputartisttracksAction")
	public String uploadArtistTrack(Integer trackId, Integer gropId, RedirectAttributes rttr) {
		System.out.println(trackId + "  :  " + gropId);
		// 1-1 input gropId가 t_artist에 있는지 확인
		// 1-1 input trackid 가 t_tracks,t_artist_track 있는지 확인
		// 1-1-2 trackid가 t_artist_tracks에 있으면 에러
		
		// 1-2 t_artist_track에 gropId,trackId 등록
		String path="/inputartistandtrack";
		if (tableService.checkGropId(gropId) && tableService.checkTrackId(trackId)) {
			if(tableService.insertArtistTrack(trackId, gropId,rttr)) {
				path="/home";
			}	
		} 
		return "redirect:/admin"+path;

	}

	@PostMapping("/inputartistgroupAction")
	public String inputArtistGroup(Integer gropId, Integer soloId, RedirectAttributes rttr) {
		// grop,solo아이디가 null일지 체크
		// grop,solo아이디가 grouptable에 존재하는지 체크
		// 없으면 리턴
		// table에 있고
		// groupid,soloid가 artistgroup table에 있으면 에러
		// 그렇지 않으면 insert
		String path = "/inputartistandgroup";
		if (tableService.checkInputValid(gropId, soloId, rttr)) {
		} else if (tableService.checkInTableArtist(gropId, soloId, rttr)) {
			// 테이블에 있는 그룹아이디들
			if (tableService.checkInTableArtistGroup(gropId, soloId, rttr)) {
				// ARTIST_GROUPTABLE에 저장되어있지 않음
				// ARTIST_GROUPTABLE에 저장하자
				if (tableService.insertArtistGroup(gropId, soloId, rttr)) {
					path = "/home";
				}
			}
		}

		return "redirect:/admin" + path;

	}

	@PostMapping("/loginAction")
	public String loginManager(AdminVO admin, RedirectAttributes rttr, HttpServletRequest request) {

		// 입력된 AdminVO check tableService.adminInputValid
		// 입력된 AdminVO admin과 Id,PWD일치하는 데이터가 있는지 확인한다.
		// 데이터가있다면 로그인 성공 /admin/home으로
		// 그렇지 않으면 로그인 실패 - /admin/loginform으로

		String path = "/loginform";
		if (tableService.adminInputValid(admin, rttr)) {
		} else if (tableService.checkAdmin(admin, rttr)) {
			path = "/home";
			tableService.setMngrSession(request, admin.getMngrId());
		}
		rttr.addFlashAttribute("admin", admin);
		return "redirect:/admin" + path;

	}
	
	//=============/admin/modify   ================//
	@GetMapping("/album")
	public String getAlbumlist(Model model) {
		List<AlbumVO> albumList = tableService.getAlbumList();
		model.addAttribute("albumList",albumList);
		
		return "/admin/album";
		
	}
	
	@GetMapping("/modify/album")
	public void getAlbum(@RequestParam("albumId")Integer albumId,Model model,HttpSession session){
		
		AlbumVO getAlbum=tableService.getAlbumById(albumId);
		String mngrId = (String)session.getAttribute("mngrId");
		model.addAttribute("album",getAlbum);
		model.addAttribute("mngrId",mngrId);
	}
	
	@PostMapping("/modifyAlbumAction")
	public String modifyAlbum(AlbumVO album,String upUser,RedirectAttributes rttr) {
		String path="/modify/album?albumId="+album.getAlbumId();
		if(!tableService.albumInputValid(album, rttr)
				&&!tableService.inputStringValid(upUser, rttr)) {
			if(tableService.updateAlbum(album,upUser,rttr)) {
				path="/modify";
			}
		}
		
		
		return "redirect:/admin"+path;
	
	}
	

}
