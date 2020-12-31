package com.kwani.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
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
	
	@Setter(onMethod_ =@Autowired )
	ServletContext servletContext;
	final static private String ALBUM_PATH = "C:\\Users\\cukik\\git\\kwani-project\\kwani\\src\\main\\webapp\\resources\\image\\album";
	final static private String ARTIST_PATH = "C:\\Users\\cukik\\git\\kwani-project\\kwani\\src\\main\\webapp\\resources\\image\\artist";
	final static private String USER_PATH = "C:\\Users\\cukik\\git\\kwani-project\\kwani\\src\\main\\webapp\\resources\\image\\userUpload";

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@GetMapping({ "/inputartistandgroup", "/inputuser", "/inputartist", "/inputalbum", "/loginform" })
	public void basic2() {
	}
	@GetMapping("/inputtracks")
	public void inputtracks(HttpSession session, Model model) {
		List<Map<String,String>> codeList= tableService.getCodeTable(100);
		model.addAttribute("codeList",codeList);
	}
	@GetMapping({ "/", "/home" })
	public String basic(Model model) {
		//장르에 대한 곡
		Map<Integer,Integer>getList =tableService.getGenreCount();
		List<Map<String,String>>getCountList =tableService.getPlayCount();
		
		Gson gson = new Gson();
		String genreJson = gson.toJson(getList);
		String countJson = gson.toJson(getCountList);
		model.addAttribute("getList",genreJson);
		model.addAttribute("getListPlay",countJson);
		return "/admin/home";
	}

	@GetMapping("/inputartistandtrack")
	public void inputArtistTrack(Model model, HttpSession session) {
		List<TracksVO> trackList = tableService.getTracksToInsert();
		model.addAttribute("mngrId", (String) session.getAttribute("mngrId"));
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
	public String inputAlbum(AlbumVO album, String upUser, RedirectAttributes rttr, MultipartFile imgFile) {
		// 유효성 검사후 t_album에 앨범 VO 저장
		// 입력받은 파일의 이름을 album의 타이틀로 바꾼다.
		// albumVO 프로퍼티 albumImg의 값을 앨범타이틀.확장자로 변경
		// 파일네임을 album타이틀+입력받은 파일의 확장자로 변경

		String path = "/inputalbum";

		if (tableService.albumInputValid(album, rttr) && tableService.inputStringValid(upUser, rttr)) {
		} else if (tableService.albumValid(album, rttr)) {

			String fileName = tableService.setImgName(album, imgFile);
			tableService.setImgColumn(album, fileName);

			try {
				tableService.saveImgFile(ALBUM_PATH, fileName, imgFile);

				if (tableService.insertAlbum(album, upUser, rttr)) {
					path = "/home";
				}
			} catch (Exception e) {

				rttr.addFlashAttribute("msg", e.getMessage());
			}

		}
		rttr.addFlashAttribute("album", album);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputtracksAction")
	public String inputTracks(TracksVO track, String upUser, RedirectAttributes rttr) {
		// track데이터 추가
		// input check albumId,trackTtl,trackUrl 이고 albumId가 album테이블에 존재하는지
		// trackTtl과 albumId가 같은 데이터가 있으면 중복
		//
		String path = "/inputtracks";
		if (tableService.trackInputValid(track, rttr) && tableService.inputStringValid(upUser, rttr)) {
		} else if (tableService.trackValid(track, rttr)) {
			if (tableService.insertTrack(track, upUser, rttr)) {
				path = "/home";
			}
		}
		rttr.addFlashAttribute("track", track);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputuserAction")
	public String inputUser(UserVO user, String upUser, RedirectAttributes rttr,MultipartFile imgFile) {
		// input user
		// 1.email,pwd,nick null check =>userInputValid
		// 2.email 중복 체크 -> userValid
		// 2-1 email 중복이 아니면 t_user에 user를 등록한다

		String path = "/inputuser";
		if (tableService.userInputValid(user, rttr)&&tableService.inputStringValid(upUser, rttr)) {
		} else if (tableService.userValid(user, rttr)) {
			String fileName = tableService.setImgName(user, imgFile);
			tableService.setImgColumn(user, fileName);

			try {
				tableService.saveImgFile(USER_PATH, fileName, imgFile);
				if (tableService.insertUser(user, rttr, upUser)) {
					path = "/home";
				}
			}catch (Exception e) {
				rttr.addFlashAttribute("msg",e.getMessage());
			}
		}
		rttr.addFlashAttribute("user", user);
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputartistAction")
	public String inputArtist(ArtistVO artist, String upUser, RedirectAttributes rttr, MultipartFile imgFile) {
		// 가수등록요청
		// 1.입력체크 ->tableService.artistInputValid
		// 2.가수name으로 중복확인 ->tableService.artistValid
		// 2-1.중복이 아닐경우 테이블에 등록 artist_group에도 자기자신 등록
		// 소녀시대 : 소녀시대
		String path = "/home";

		if (!tableService.artistInputValid(artist, rttr) && !tableService.inputStringValid(upUser, rttr)) {
			if (tableService.artistValid(artist, rttr)) {

				String fileName = tableService.setImgName(artist, imgFile);
				tableService.setImgColumn(artist, fileName);

				try {
					tableService.saveImgFile(ARTIST_PATH, fileName, imgFile);
					tableService.insertArtist(artist, upUser, rttr);
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
	public String uploadArtistTrack(Integer trackId, Integer gropId, String upUser, RedirectAttributes rttr) {
		System.out.println(trackId + "  :  " + gropId);
		// 1-1 input gropId가 t_artist에 있는지 확인
		// 1-1 input trackid 가 t_tracks,t_artist_track 있는지 확인
		// 1-1-2 trackid가 t_artist_tracks에 있으면 에러

		// 1-2 t_artist_track에 gropId,trackId 등록
		String path = "/inputartistandtrack";
		if (!tableService.checkGropId(gropId) && tableService.checkTrackId(trackId)) {
			if (tableService.insertArtistTrack(trackId, gropId, upUser, rttr)) {
				path = "/home";
			}
		}
		return "redirect:/admin" + path;

	}

	@PostMapping("/inputartistgroupAction")
	public String inputArtistGroup(Integer gropId, Integer soloId, String upUser, RedirectAttributes rttr) {
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
				if (tableService.insertArtistGroup(gropId, soloId, upUser, rttr)) {
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

// 앫범 수정하는 흐름
	@GetMapping("/album")
	public void getAlbumlist(Model model) {
		List<AlbumVO> albumList = tableService.getAlbumList();
		model.addAttribute("albumList", albumList);

	}

	@GetMapping("/modify/album")
	public void getAlbum(@RequestParam("albumId") Integer albumId, Model model, HttpSession session) {

		AlbumVO getAlbum = tableService.getAlbumById(albumId);
		String mngrId = (String) session.getAttribute("mngrId");
		model.addAttribute("album", getAlbum);
		model.addAttribute("mngrId", mngrId);
	}

	@PostMapping("/modifyAlbumAction")
	public String modifyAlbum(AlbumVO album, String upUser, RedirectAttributes rttr, MultipartFile imgFile) {
		String path = "/modify/album?albumId=" + album.getAlbumId();
		if (tableService.albumInputValid(album, rttr) && tableService.inputStringValid(upUser, rttr)) {
		} else if (!tableService.albumValid(album, rttr)) {

			String fileName = tableService.setImgName(album, imgFile);
			tableService.setImgColumn(album, fileName);
			try {
				tableService.saveImgFile(ALBUM_PATH, fileName, imgFile);
				if (tableService.updateAlbum(album, upUser, rttr)) {
					path = "/home";
				}
			} catch (Exception e) {
				rttr.addFlashAttribute("msg", e.getMessage());
			}
		}
		rttr.addFlashAttribute("album", album);
		return "redirect:/admin" + path;

	}

	// 가수 수정하는 부분 흐름
	@GetMapping("/artist")
	public void getArtistList(Model model) {
		List<ArtistVO> artistList = tableService.getArtistList();
		model.addAttribute("artistList", artistList);
	}

	@GetMapping("/modify/artist")
	public void getArtist(@RequestParam("gropId") Integer gropId, Model model, HttpSession session) {
		ArtistVO artist = tableService.getArtistById(gropId);
		String mngrId = (String) session.getAttribute("mngrId");

		model.addAttribute("artist", artist);
		model.addAttribute("mngrId", mngrId);

	}

	@PostMapping("/modifyArtistAction")
	public String modifyArtist(ArtistVO artist, String upUser, RedirectAttributes rttr, MultipartFile imgFile) {
		System.out.println("modifyArtist");
		String path = "/modify/artist?gropId=" + artist.getGropId();
		if (tableService.artistInputValid(artist, rttr) && tableService.inputStringValid(upUser, rttr)) {
		} else if (!tableService.artistValid(artist, rttr)) {

			String fileName = tableService.setImgName(artist, imgFile);
			tableService.setImgColumn(artist, fileName);

			try {
				tableService.saveImgFile(ARTIST_PATH, fileName, imgFile);
				if (tableService.updateArtist(artist, upUser, rttr)) {
					path = "/modify";
				}
			} catch (Exception e) {
				rttr.addFlashAttribute("msg", e.getMessage());
			}
		}
		return "redirect:/admin" + path;

	}

	// 노래 수정하는 흐름
	@GetMapping("/tracks")
	public void getTrackList(Model model) {
		List<TracksVO> trackList = tableService.getTrackList();
		model.addAttribute("trackList", trackList);
	}

	@GetMapping("/modify/tracks")
	public void getTracks(@RequestParam("trackId") Integer trackId, Model model, HttpSession session) {
		TracksVO track = tableService.getTracksById(trackId);
		String mngrId = (String) session.getAttribute("mngrId");
		model.addAttribute("track", track);
		model.addAttribute("mngrId", mngrId);
	}

	@PostMapping("/modifyTracksAction")
	public String modifyTracks(TracksVO track, String upUser, RedirectAttributes rttr) {
		String path = "/modify/tracks?trackId=" + track.getTrackId();
		if (tableService.trackInputValid(track, rttr) && tableService.inputStringValid(upUser, rttr)) {
		} else if (!tableService.trackValid(track, rttr)) {
			if (tableService.updateTrack(track, upUser, rttr)) {
				path = "/modify";
			}
		}
		return "redirect:/admin" + path;
	}

//	유저 수정하는 흐름
	@GetMapping("/user")
	public void getUserList(Model model) {
		List<UserVO> userList = tableService.getUserList();
		model.addAttribute("userList", userList);
	}

	@GetMapping("/modify/user")
	public void getUser(@RequestParam("email") String email, Model model, HttpSession session) {
		UserVO user = tableService.getUserByEmail(email);
		String mngrId = (String) session.getAttribute("mngrId");
		model.addAttribute("user", user);
		model.addAttribute("mngrId", mngrId);
	}

	@PostMapping("/modifyUserAction")
	public String modifyUser(UserVO user, String upUser, RedirectAttributes rttr,MultipartFile imgFile) {
		String path = "/modify/user?email=" + user.getEmail();
		if (tableService.userInputValid(user, rttr) && tableService.inputStringValid(upUser, rttr)) {}
		else if(!tableService.userValid(user, rttr)) {
			
			String fileName = tableService.setImgName(user, imgFile);
			tableService.setImgColumn(user, fileName);
			try {
				tableService.saveImgFile(USER_PATH, fileName, imgFile);
				if (tableService.updateUser(user, upUser, rttr)) {
					path = "/modify";
				}
			} catch (Exception e) {
				rttr.addFlashAttribute("msg",e.getMessage());
			}
		}
		return "redirect:/admin" + path;

	}
}
