package com.kwani.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kwani.domain.AttachFileDTO;
import com.kwani.domain.UserVO;
import com.kwani.service.UserService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@RequestMapping("/user/*")
@AllArgsConstructor
@Controller
@Log4j
public class UserController {

	private UserService service;

	@GetMapping("/register")
	public String register(HttpSession session, RedirectAttributes rttr) {
//		if (service.checkSession(session, rttr)) {
//			return "redirect:/home";
//		}
		return "/user/register";
	}

	@GetMapping("/withdrawal")
	public String remove(HttpSession session, RedirectAttributes rttr) {
		System.out.println("sessionName : " + session.getAttribute("userEmail"));

//		if (service.checkSession(session, rttr)) {
//			return "redirect:/user/checkUserInfo";
//		}

		return "user/withdrawal";
	}

	@GetMapping("/checkUserInfo")
	public String checkUserInfo(HttpSession session, RedirectAttributes rttr) {

		if (service.checkSession(session, rttr)) {
			return "redirect:/home";
		}

		return "/user/checkUserInfo";
	}

	@GetMapping("/modifyUserInfo")
	public String modifyUserInfo(HttpSession session, RedirectAttributes rttr, Model model) {

		model.addAttribute("sessionName", session.getAttribute("userEmail"));

		return "/user/modifyUserInfo";
	}


//	-----------------------------------------------------------------------------------------------------------------------------
//	---------------------------------------------------회원의 이미지를 수정한다.-------------------------------------------------------

	// 파일이 저장된 년/월/일을 명시한다.
	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	// 저장되는 파일의 형식을 확인한다.
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");

		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	// 파일의 정보를 명시, 브라우저에서 출력하기 위한 작업.
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		System.out.println("fileName : " + fileName);

		File file = new File("/Users/hoya/eclipse/Spring/kwani2/src/main/webapp/resources/image/userUpload/" + fileName);

		System.out.println("/display - file : " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 업로드하는 파일을 ajax통신으로 처리,
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity uploadAjaxPost(MultipartFile uploadFile) {

		AttachFileDTO list = new AttachFileDTO();

		// 이미지가 저장될 폴더.
		String uploadFolder = "/Users/hoya/eclipse/Spring/kwani2/src/main/webapp/resources/image/userUpload/";
		// 이미지가 저장될 폴더경로.
		String uploadFolderPath = getFolder();

		// 저장될 폴더와 폴더경로를 받아서 업로드될 경로를 생성?
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		System.out.println("upload path : " + uploadPath);

		// 지정된 위치에 폴더가 없으면, 새로운 폴더를 만든다.
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		AttachFileDTO attachDTO = new AttachFileDTO();

		String uploadFileName = uploadFile.getOriginalFilename();

		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

		System.out.println("only file name : " + uploadFileName);

		attachDTO.setFileName(uploadFileName);

		UUID uuid = UUID.randomUUID();
		uploadFileName = uuid.toString() + "_" + uploadFileName;

		try {
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile);

			attachDTO.setUuid(uuid.toString());
			attachDTO.setUploadPath(uploadFolderPath);

			// check image type file
			if (checkImageType(saveFile)) {

				attachDTO.setImage(true);

				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 180, 180);

				thumbnail.close();
			}

			list = attachDTO;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} // end catch
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

//	------------------------------------------------------------------------------------------------------------------------------

	@PostMapping("/registerAction")
	public String register(UserVO user, String email, RedirectAttributes rttr, Model model) {

		if (service.checkRegister(user, email, rttr, model) == false)
			return "/user/register";
		else
			return "redirect:/home";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@CookieValue(value = "cookie", required = false, defaultValue = "0") String cookie,
			String checked, HttpServletRequest request, Model model) {

		service.checkCookie(cookie, checked, request, model);

		return "/user/login";
	}

	@PostMapping("/loginAction")
	public String get(Model model, String email, String pwd, String checked, HttpServletRequest request,
			HttpServletResponse response, RedirectAttributes rttr) {
		// 회원 로그인.
		// checkUserIdPwd가 true면(즉, 사용자가 입력한 정보가 서버에 없으면)
		if (!(service.isUserIdValid(email, rttr))) {
			// login.jsp로 이동한다.
		} else if (service.checkUserIdPwd(email, pwd, rttr)) {

			if (service.cookieSession(email, checked, request, response))
				return "redirect:/home";
		}
		return "redirect:/user/login";
	}

	@RequestMapping(value = "/logoutAction", method = { RequestMethod.GET, RequestMethod.POST })
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		System.out.println("sessionName : " + session.getAttribute("userEmail"));
		session.invalidate();

		return "redirect:/home";
	}

	@RequestMapping(value = "/checkUserInfoAction", method = { RequestMethod.GET, RequestMethod.POST })
	public String userInfoCheckAction(String email, String pwd, String btnValue, HttpSession session, Model model,
			RedirectAttributes rttr) {
		
		System.out.println(btnValue);
		
		System.out.println("sessionName : " + session.getAttribute("userEmail"));
		// 정보가 일치하면 userInfoModify로 이동하고,
		if (service.checkUserIdPwd(email, pwd, rttr)) {
			
			if (btnValue.equals("updateBtn")) {
				return "redirect:/user/modifyUserInfo";
			} else {
				return "redirect:/user/withdrawal";
			}
		} else
			// 일치하지 않으면 userInfoModify로 이동한다.
			return "redirect:/user/checkUserInfo";
	}

	@PostMapping("/modifyUserInfoAction")
	public String modifyUserInfoAction(HttpSession session, UserVO user, RedirectAttributes rttr, Model model) {

		System.out.println("sessionName : " + session.getAttribute("userEmail"));
		// 회원의 정보를 수정한다.
		if (service.modifyUserInfo(user)) {
			rttr.addFlashAttribute("result", "success");
		}
		// home으로 이동한다.
		return "redirect:/home";
	}

	@PostMapping("/withdrawalAction")
	public String withdrawalAction(UserVO user, String email, HttpSession session, RedirectAttributes rttr) {

		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		if (service.withdrawal(user)) {
			rttr.addFlashAttribute("result", "success");
		}
		session.invalidate();
		System.out.println("회원탈퇴이후 세션 : " + session.getAttribute("userEmail"));

		return "redirect:/home";
	}

}