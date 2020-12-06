<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/modifyUserInfo.css">
</head>
<body>
	<div id="main">
		<div id="header">
			<div id="header_cover">
				<video id="video" src="/resources/video/AudioWave.mp4"
					type="video/mp4" autoplay muted loop></video>
			</div>
			<div id="header_navbar">
				<div id="musicPlayer">musicPlayer</div>
				<div id="pageLogo">
					<a href="/">Last.fm</a>
				</div>
				<div id="navbarUtil">
					<button class="subnavbtn" onclick="openSearch()">
						<i class="fa fa-search"></i>
					</button>
					<a href="/">Home</a> <a href="#">Recommend</a> <a href="#">Find
						music</a> <a href="#">My Page</a> <a href="/user/logoutAction">Logout</a>
				</div>
			</div>
			<div id="myOverlay" class="overlay">
				<div class="overlay-content">
					<form action="/action_page.php">
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!--myOverlay-->

		</div>
		<div id="body">
			<div id="leftSideBar"></div>
			<div id="bodyContent">
				<div class="loginBox">
					<div class="h1">
						<h1>Settings</h1>
					</div>
					<div class="utilBtnContainer">
						<input type="button" class="update" value="개인정보변경">
					</div>

					<form action="/user/modifyUserInfoAction" method="POST"
						enctype="multipart/form-data">
						<div class="userImgContainer">
							<div class="userImgDiv">
								<p id="imgMsg" style="display: none">${imgMsg}</p>
								<img src="/resources/image/userUpload/${userImg}"
									style="width: 100%; height: 100%; display: none;"
									name="userImg" id="userImg" />
							</div>
							<div class="uploadImg">
								<input type='file' name='uploadFile' class="uploadFile"
									id="userImg" accept="image/png, image/jpeg, image/jpg">
							</div>
						</div>
						<div class="fieldEmail">
							<input class="inputEmail" name="email" value="${sessionName}"
								id="email" placeholder="Email" type="email" readonly />
						</div>
						<div class="fieldNick">
							<input class="inputNick" id="nick" name="nick"
								placeholder="Nickname" type="text" required />
						</div>
						<div class="fieldPwd">
							<input class="inputPwd" id="password" placeholder="Password"
								type="password" name="pwd" required />
						</div>
						<input id="saveUserImg" type="hidden" value="" name="userImg">
						<div class="successBtnContainer">
							<button class="successBtn" type="submit"
								onclick="return checkInput()">SUCCESS</button>
						</div>
					</form>
					<!-- </form> -->
				</div>
				<!-- loginBox -->
			</div>
			<!-- bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!-- body -->
		<div id="footer"></div>
	</div>
</body>

<%-- <%@include file="../includes/header.jsp"%> --%>


<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->

<script type="text/javascript">
	console.log('${sessionName}');
	console.log('${userImg}');
	console.log('${imgMsg}');

	let imgMsg = document.getElementById("imgMsg");
	let userImg = document.getElementById("userImg");

	if ('${imgMsg}' != "")
		imgMsg.style.display = "block";
	else {
		userImg.style.display = "block";
		if (userImg.style.display = "block") {
			$("input[name='userImg']").val('${userImg}');
			console.log($("input[name='userImg']").val());
			$("#userImg").attr("name", '${userImg}');
			console.log($("#userImg").attr('name'));
		}
	}

	function checkInput() {

		let nick = document.getElementById("nick").value;
		let pwd = document.getElementById("password").value;
		// 정규식
		// 비밀번호 : 영어+특수문자+숫자를 섞어서 (8~16)자리 
		let pwdPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		// 이름 : 한글만 2~4글자
		let nickPattern = /^[가-힣]{2,6}$/;

		if (nick.length == 0) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		if (nickPattern.test(nick) == false) {
			alert("닉네임은 한글 2~6글자로만 가능합니다.");
			return false;
		}

		if (pwd.length == 0) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (pwdPattern.test(pwd) == false) {
			alert("비밀번호는 영어+특수문자+숫자를 섞어서 (8~16)자리만 가능합니다.");
			return false;
		}
		alert("정보가 수정되었습니다!");
		return true;

	}

	$(document)
			.ready(
					function() {

						let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
						let maxSize = 5242880; // 5MB

						function checkExtension(fileName, fileSize) {

							if (fileSize >= maxSize) {
								alert("파일 사이즈 초과");
								return false;
							}

							if (regex.test(fileName)) {
								alert("해당 종류의 파일은 업로드할 수 없습니다.");
								return false;
							}
							return true;
						}

						$(function() {
							$("input[name='uploadFile']").change(function() {
								fileUpload();
							});
						});

						let cloneObj = $(".uploadImg").clone();

						let fileUpload = function() {
							// formData라는 객체를 생성.
							let formData = new FormData();
							// name이 uploadFile인 놈을 inputFile에 저장.
							let inputFile = $("input[name='uploadFile']");

							// 여기서 파일의 이름을 사용자의 이메일로 바꾸는 건가?

							// 첫번째 요소를 files에 저장.
							let files = inputFile[0].files[0];

							console.log("files.name : " + files.name);

							// 파일이 업로드 성공했을 때 input의 value가 변경되어야 한다.

							// 파일의 사이즈가 초과하거나 지정한 종류가 아니면 false를 반환.
							if (!checkExtension(files.name, files.size)) {
								return false;
							}
							// formData에 추가.
							formData.append("uploadFile", files);

							$
									.ajax({
										url : '/user/uploadAjaxAction',
										processData : false,
										contentType : false,
										data : formData,
										type : 'POST',
										dataType : 'json',
										success : function(result) {
											alert("업로드 성공!");
											showUploadedFile(result);

											$("#saveUserImg")
													.val(
															'${sessionName}'
																	+ "."
																	+ files.name
																			.split(".")[1]);
											console.log("sessionName : "
													+ $("#saveUserImg").val()
													+ ".");
										}
									}); //$.ajax

							let userImgDiv = $(".userImgDiv");

							function showUploadedFile(userImgArr) {

								let str = "";

								$(userImgArr)
										.each(
												function(i, obj) {

													if (!obj.image) {
														str += "<img style='width:100%;height:100%;' src='/resources/image/ImgErr.png'>"
																+ obj.fileName;
													} else {
														let fileCallPath = encodeURIComponent(obj.uploadPath
																+ "/s_"
																+ obj.fileName);
														str += "<img style='width:100%;height:100%;' src='/user/display?fileName="
																+ fileCallPath
																+ "'>";
													}
												});
								userImgDiv.html(str);
							}
						};
					});

	window.onscroll = function() {
		myFunction()
	};
	let navbar = document.getElementById("header_navbar");
	let sticky = navbar.offsetTop;

	function myFunction() {
		if (window.pageYOffset >= sticky) {
			navbar.classList.add("sticky")
		} else {
			navbar.classList.remove("sticky");
		}
	}

	function openSearch() {
		document.getElementById("myOverlay").style.display = "block";
	}

	let overlay = document.getElementById('myOverlay');

	window.onclick = function(event) {
		if (event.target == overlay) {
			overlay.style.display = "none";
		}
	}
</script>
</html>