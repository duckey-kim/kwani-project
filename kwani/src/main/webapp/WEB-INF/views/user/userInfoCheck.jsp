<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/userInfoCheck.css">
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
					<a href="/home">Last.fm</a>
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
					<form action="/user/userInfoCheckAction" method="POST">
						<div class="utilBtnContainer">
							<input type="button" class="update" value="개인정보변경"> <input
								type="button" class="delete" value="회원탈퇴">
						</div>
						<div class="textContainer">
							개인정보를 위해 <br> 이메일과 비밀번호를 입력해주세요.<br>
						</div>
						<div class="fieldEmail">
							<input class="inputEmail" id="email" placeholder="Email"
								type="email" name="email" />
						</div>
						<div class="fieldPwd">
							<input class="inputPwd" id="password" placeholder="Password"
								type="password" name="pwd" /> <input class="input" type="hidden"
								name="targetUrl" value="">
						</div>
						<div class="successBtnContainer">
							<button class="successBtn" type="submit" onclick="checkInput()">SUCCESS</button>
						</div>
					</form>
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
	// 정보를 비교하고 일치하지 않을 때, 다시 현재 페이지로 이동하면 여기서 모달을 띄워야 한다. 

	// 만약 정보가 불일치 하면, 모달창을 띄운다.
	// 서버에서 해당 정보를 가져온다.

	let email = document.getElementById("email").value;
	let pwd = document.getElementById("password").value;

	/* 서버에 입력한 정보가 없을 때, null일 때 */

	console.log('${pwdMsg}');
	
	
	if ("${pwdMsg}" != "") {
		/* if ('${userInputPwd}' != '${pwd}') { */
			alert("${pwdMsg}");
		/* } */
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
</script>


</html>