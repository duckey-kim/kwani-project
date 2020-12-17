package com.kwani.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
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
import org.springframework.web.servlet.ModelAndView;
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

		return "/user/register";
	}

	@GetMapping("/socialRegister")
	public String socialRegister(HttpSession session, Model model) {

		String uuid = service.newPwd();

		model.addAttribute("uuid", uuid);

		return "/user/socialRegister";
	}

	@GetMapping("/withdrawal")
	public String remove(HttpSession session, RedirectAttributes rttr) {
		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		return "user/withdrawal";
	}

	@GetMapping("/checkUserInfo")
	public String checkUserInfo(HttpSession session, RedirectAttributes rttr, Model model) {

		if (!(service.checkSession(session, model))) {
			rttr.addFlashAttribute("redirectMsg", "로그인 후 이용하실 수 있습니다.");
			return "redirect:/home";
		}

		return "/user/checkUserInfo";
	}

	@GetMapping("/modifyUserInfo")
	public String modifyUserInfo(HttpSession session, Model model) {

		if (!(service.checkUserImg((String) session.getAttribute("userEmail")))) {
			String imgMsg = "이미지를 추가해주세요!";
			model.addAttribute("imgMsg", imgMsg);
			model.addAttribute("sessionName", session.getAttribute("userEmail"));

		} else {

			UserVO userVO = service.getUserImg((String) session.getAttribute("userEmail"));

			String userImg = userVO.getUserImg();
			System.out.println("userImg : " + userImg);

			model.addAttribute("sessionName", session.getAttribute("userEmail"));
			model.addAttribute("userImg", userImg);

		}

		System.out.println("sessionName : " + session.getAttribute("userEmail"));

		return "/user/modifyUserInfo";
	}

//	-----------------------------------------------------------------------------------------------------------------------------
//	---------------------------------------------------회원의 이미지를 수정한다.-------------------------------------------------------

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
	public ResponseEntity<byte[]> getFile(String fileName, HttpSession session) {

		System.out.println("/display - fileName : " + fileName);

		File userUploadImg = new File(
				"/Users/hoya/eclipse/Spring/kwani2/src/main/webapp/resources/image/userUpload/" + fileName);

		System.out.println("/display - file : " + userUploadImg);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(userUploadImg.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(userUploadImg), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 업로드하는 파일을 ajax통신으로 처리,
	@SuppressWarnings("rawtypes")
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity uploadAjaxPost(MultipartFile uploadFile, HttpSession session) {

		System.out.println("uploadFile : " + uploadFile.toString());

		AttachFileDTO userImg = new AttachFileDTO();

		// 이미지가 저장될 폴더.
		String uploadFolder = "/Users/hoya/eclipse/Spring/kwani2/src/main/webapp/resources/image/userUpload/";

		// 저장될 폴더와 폴더경로를 받아서 업로드될 경로를 생성?
		File uploadPath = new File(uploadFolder);

		System.out.println("upload path : " + uploadPath);

		// 지정된 위치에 폴더가 없으면, 새로운 폴더를 만든다.
		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		AttachFileDTO attachDTO = new AttachFileDTO();

		String uploadFileName = uploadFile.getOriginalFilename();

		// 파일의 이름을 사용자의 이메일로 변경한다.
		uploadFileName = session.getAttribute("userEmail") + "."
				+ uploadFileName.substring(uploadFileName.lastIndexOf(".") + 1);

		attachDTO.setFileName(uploadFileName);

		System.out.println("change ImgFileName to userEmail : " + uploadFileName);

		try {
			File saveFile = new File(uploadPath, uploadFileName);
			uploadFile.transferTo(saveFile);

			attachDTO.setUploadPath("");

			// check image type file
			if (checkImageType(saveFile)) {

				attachDTO.setImage(true);

				FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));

				Thumbnailator.createThumbnail(uploadFile.getInputStream(), thumbnail, 180, 180);

				thumbnail.close();
			}

			userImg = attachDTO;

		} catch (Exception e) {
			System.out.println(e.getMessage());
		} // end catch
		return new ResponseEntity<>(userImg, HttpStatus.OK);
	}

//	------------------------------------------------------------------------------------------------------------------------------

	@PostMapping("/registerAction")
	public String register(UserVO user, String email, RedirectAttributes rttr, Model model) {

		if (!(service.checkRegister(user, email, rttr, model)))
			return "/user/register";
		else
			return "redirect:/home";
	}

	@PostMapping("/socialRegisterAction")
	public String socialRegisterAction(UserVO user, String email, String checked, HttpServletRequest request,
			HttpServletResponse response) {

		// 회원가입 후,
		service.socialRegister(user);
		// 쿠키와 세션을 발급하고
		service.cookieSession(email, checked, request, response);
		// home으로 이동한다.
		return "redirect:/home";
	}

	@RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
	public String login(@CookieValue(value = "cookie", required = false, defaultValue = "0") String cookie,
			String checked, HttpServletRequest request, Model model) {

		service.checkCookie(cookie, checked, request, model);

		return "/user/login";
	}

	@PostMapping("/loginAction")
	public String get(Model model, String email, String kakaoEmail, String pwd, String checked,
			HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr, ModelAndView mav
			, String prevPath) {
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
	public String modifyUserInfoAction(HttpSession session, UserVO user, RedirectAttributes rttr, Model model,
			MultipartFile uploadFile) {

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

		return "redirect:/home";
	}

}