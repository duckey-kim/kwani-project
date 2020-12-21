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

<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/login.css">
</head>

<%@include file="../includes/mainHeader.jsp"%>

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

			<div id="clickOverlay" onclick="off()">
				<div id="text">
					COMING SOON
					<hr>
				<p id="demo"></p>
				</div>
			</div>
			<!-- clickOverlay -->
			<div class="socialLoginBtn">
				<a href="/user/kakao" class="kakaoBtn">KaKao</a> <a href="#"
					class="googleBtn" onclick="on()">Instagram</a> <a href="#"
					class="naverBtn" onclick="on()">Google</a>
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

<script>
	function on() {
		document.getElementById("clickOverlay").style.display = "block";
	}

	function off() {
		document.getElementById("clickOverlay").style.display = "none";
	}

	// Set the date we're counting down to
	var countDownDate = new Date("Jan 7, 2021 00:00:00").getTime();

	// Update the count down every 1 second
	var countdownfunction = setInterval(function() {

		// Get todays date and time
		var now = new Date().getTime();

		// Find the distance between now an the count down date
		var distance = countDownDate - now;

		// Time calculations for days, hours, minutes and seconds
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);

		// Output the result in an element with id="demo"
		document.getElementById("demo").innerHTML = days + "d " + hours + "h "
				+ minutes + "m " + seconds + "s ";

		// If the count down is over, write some text 
		if (distance < 0) {
			clearInterval(countdownfunction);
			document.getElementById("demo").innerHTML = "EXPIRED";
		}
	}, 1000);
</script>


</html>


