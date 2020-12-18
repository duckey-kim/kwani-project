<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">


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
					<a href="/">Baam</a>
				</div>
				<div id="navbarUtil">
					<button class="subnavbtn" onclick="openSearch()">
						<i class="fa fa-search"></i>
					</button>
					<a href="/">Home</a> <a href="/recommend/common">Recommend</a> <a
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
					<form action="/recommend/search" method="get" name="searchForm"
						onsubmit="return checkTxt();">
						<input type="text" placeholder="Search.." name="searchTxt"
							value="">
						<button type="submit" id="searchBtn">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!--myOverlay-->
		</div>
		<!--header-->