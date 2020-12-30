<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.js"
	integrity="sha256-kRbW+SRRXPogeps8ZQcw2PooWEDPIjVQmN1ocWVQHRY="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">

<body>
	<div id="main">
		<div id="header">
			<div id="header_cover">
				<video id="video" src="/resources/video/AudioWave.mp4"
					type="video/mp4" autoplay muted loop></video>
			</div>
			<div id="header_navbar">
				<div id="musicPlayer"></div>
				<div id="pageLogo">
					<a href="/">B.A.A.M</a>
				</div>
				<div id="navbarUtil">
					<button class="subnavbtn" onclick="openSearch()">
						<i class="fa fa-search"></i>
					</button>
					<a href="/">Home</a> <a href="/recommend">Recommend</a> <a
						href="/user/register" id="joinBtn">Join</a>
					<div class="dropdown">
						<div class="dropbtn">
							<i class="fas fa-user-circle"></i>
						</div>
						<div id="myDropdown" class="dropdown-content">
							<a href="/mypage/overview" id="toMypageBtn"
								style="display: none">My Page</a> <a href="/user/checkUserInfo">Settings</a>
							<a href="/user/logoutAction" id="logoutBtn" style="display: none">Logout</a>
						</div>
					</div>
				</div>
			</div>

			<div id="myOverlay" class="overlay">
				<div class="overlay-content">
					<form action="/search" method="get" name="searchForm"
						onsubmit="return checkTxt();">
						<input type="text" placeholder="Search.." name="searchTxt"
							value="">
						<button type="submit" id="searchBtn">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!-- myOverlay -->
		</div>
		<!-- header -->