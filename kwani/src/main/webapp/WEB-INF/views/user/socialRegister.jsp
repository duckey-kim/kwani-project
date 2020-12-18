<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>register</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.js"
	integrity="sha256-kRbW+SRRXPogeps8ZQcw2PooWEDPIjVQmN1ocWVQHRY="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.1.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Open Sans'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/socialRegister.css">

</head>

<%@include file="../includes/header.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Sign Up</h1>
			</div>
			<form action="/user/socialRegisterAction" method="post">
				<div class="loginForm">
					<div class="emailField">
						<input class="inputEmail" id="email" placeholder="Email"
							type="email" name="email" value="${kakaoEmail}" readonly />
					</div>
					<div class="nickField">
						<input class="inputNick" id="nick"
							placeholder="Nickname (한글만 2~6글자)" name="nick" />
					</div>
					<div class="hiddenField">
						<input class="inputPwd" type="hidden" name="pwd" value="${uuid}">
						<input type="hidden" name="userImg"> <input type="hidden"
							name="moodCd"> <input type="hidden" name="genreCd">
						<input type="hidden" name="situCd"> <input type="hidden"
							name="stusCd" value="1" /> <input type="hidden" name="lastDt">
						<input type="hidden" name="inUser"> <input type="hidden"
							name="inDate"> <input type="hidden" name="upUser">
						<input type="hidden" name="upDate">
						<button class="loginBtn" type="submit"
							onclick="return checkInput()">Sign Up</button>
						<div class="infoUtil">
							<span>Already user our site? <a href="/user/login">Log
									in</a> here
							</span><br> <span>Forgot your Password? <a
								href="/search/findUserPwd">Reset</a> in here
							</span>
						</div>
					</div>
				</div>
			</form>
			<!-- socialLoginBtn -->
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

<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->


<script type="text/javascript">
	console.log('${uuid}');
	console.log('${email}');

	let b = $(".inputPwd").val();
	let a = $(".inputEmail").val();

	console.log(a);
	console.log(b);

	if ('${msg}' != "") {
		alert('${msg}');
	}

	function checkInput() {

		let email = document.getElementById("email").value;
		let nick = document.getElementById("nick").value;

		// 정규식
		// 비밀번호 : 영어+특수문자+숫자를 섞어서 (8~16)자리 
		let pwdPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		// 이름 : 한글만 2~4글자
		let nickPattern = /^[가-힣]{2,6}$/;

		if (email.length == 0) {
			alert("아이디(이메일)를(을) 입력하세요.");
			return false;
		}

		if (nick.length == 0) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		if (nickPattern.test(nick) == false) {
			alert("닉네임은 한글 2~6글자로만 가능합니다.");
			return false;
		}

		alert("회원가입이 완료되었습니다.");
		return true;
	}

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