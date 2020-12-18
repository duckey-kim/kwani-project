<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
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
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
</head>

<%@include file="../includes/header.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Login</h1>
			</div>
			<form action="/user/loginAction" method="POST">
				<div class="loginForm">
					<div class="fieldEmail">
						<input class="inputEmail" id="email" placeholder="Email"
							type="email" name="email" value="${cookieValue}" />
					</div>
					<div class="fieldPwd">
						<input class="inputPwd" id="password" placeholder="Password"
							type="password" name="pwd" /> <input class="input" type="hidden"
							name="prevPath" value="${prevPath}">
					</div>
					<button class="loginBtn" type="submit"
						onclick="return checkInput()">LOGIN</button>
					<div class="remember">
						<label for="rememberCheck"> <input type="checkbox"
							class="rememberCheckBox" id="myCheck" name="checked"
							onclick="remember()">
						</label>
						<div class="span1">
							<span>Remember me</span>
						</div>
						<div class="span2">
							<span>Forgot your <a href="/search/findUserPwd">password</a>?
							</span>
						</div>
					</div>
					<p id="text" style="display: none">Checkbox is CHECKED!</p>
				</div>
			</form>
			<div class="socialLoginBtn">
				<a href="/user/kakao" class="kakaoBtn">KaKao</a> <a href="#"
					class="googleBtn">Instagram</a> <a href="#" class="naverBtn">Facebook</a>
			</div>
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
	let email = document.getElementById("email").value;
	let pwd = document.getElementById("password").value;

	/* 서버에 입력한 정보가 없을 때, null일 때 */

	if ('${pwdMsg}' != "") {
		if ('${userInputPwd}' != '%{pwd}') {
			alert('${pwdMsg}');
		}
	}

	if ("${msg}" != "") {
		alert("${msg}");
	}

	function checkInput() {

		let email = document.getElementById("email").value;
		let pwd = document.getElementById("password").value;

		if (email.length == 0) {
			alert('이메일을 입력하세요');
			return false;
		}

		if (pwd.length == 0) {
			alert('비밀번호를 입력하세요');
			return false;
		}

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

	function remember() {
		var checkBox = document.getElementById("myCheck");
		var text = document.getElementById("text");
		if (checkBox.checked == true) {
			text.style.display = "block";
		} else {
			text.style.display = "none";
		}
	}
</script>


</html>


