<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%-- <%@include file="../includes/header.jsp"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="/resources/css/home.css">
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
					<a href="/">Home</a> <a href="/recommend/">Recommend</a> <a
						href="#">Find music</a> <a href="/user/register" id="joinBtn">Join</a>
					<!-- <a href="/mypage/playlist?email=a@naver.com" id="toMypageBtn" style="display:none">My page</a> -->
					<div class="dropdown">
						<div class="dropbtn" onclick="toMyPage()">
							<i class="fas fa-user-circle"></i>
						</div>
						<div id="myDropdown" class="dropdown-content">
							<a href="/mypage/playlist?email=a@naver.com" id="toMypageBtn">My
								Page</a> <a href="/user/checkUserInfo">Settings</a> <a
								href="/user/logoutAction" id="logoutBtn" style="display: none">Logout</a>
						</div>
					</div>
				</div>
			</div>
			<div id="myOverlay" class="overlay">
				<div class="overlay-content">
					<form action="#">
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!--myOverlay-->
		</div>
		<!--header-->



		<div id="body">
			<div id="leftSideBar"></div>
			<div id="bodyContent">
				<div class="sysdate">${year}.${month}.${date}</div>
				<div class="btnDotContainer">
					<div class="contentBtn">오늘의 추천곡</div>
					<div style="text-align: center" class="dotContainer">
						<span class="dot" onclick="currentSlide(1)"></span> <span
							class="dot" onclick="currentSlide(2)"></span> <span class="dot"
							onclick="currentSlide(3)"></span> <span class="dot"
							onclick="currentSlide(4)"></span> <span class="dot"
							onclick="currentSlide(5)"></span> <span class="dot"
							onclick="currentSlide(6)"></span> <span class="dot"
							onclick="currentSlide(7)"></span> <span class="dot"
							onclick="currentSlide(8)"></span>
					</div>
				</div>
				<div class="topContentBox">
					<div class="todayRecmd">
						<div class="recmdContainer_1">
							<div class="recmd_1"></div>
							<div class="recmd_2"></div>
							<div class="recmd_3"></div>
						</div>
						<div class="recmdContainer_2">
							<div class="recmd_4"></div>
							<div class="recmd_5"></div>
							<div class="recmd_6"></div>
						</div>
					</div>
					<div class="slideBox">

						<div class="slides fade">
							<img src="/resources/image/slideSample1.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample2.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample3.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample4.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample5.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample6.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample7.png" class="slideBoxImg"
								alt="">
						</div>
						<div class="slides fade">
							<img src="/resources/image/slideSample8.png" class="slideBoxImg"
								alt="">
						</div>

						<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
							class="next" onclick="plusSlides(1)">&#10095;</a>
					</div>
					<div class="loginFormBox">
						<a href="/user/login" class="loginBtn" id="loginBtn">Login</a>
						<div id="welcomeBtn" class="welcomeBtn" style="display: none">
							환영합니다!<br> ${userNick} 님
						</div>
					</div>
				</div>
				<!-- topContentBox -->

				<div class="bottomContentBox">
					<div class="genreYear">장르 & 연도</div>
					<div class="akinator">아키네이터</div>
				</div>
			</div>
			<!--bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!--body-->
		<div id="footer"></div>
	</div>
	<!--main-->
</body>

<%-- <%@include file="../includes/footer.jsp"%> --%>


<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->

<script type="text/javascript">
	//세션값 잘 넘어왔는지 확인한다.
	console.log('${sessionName}');
	console.log('${userNick}')

	let logoutBtn = document.getElementById("logoutBtn");
	let loginBtn = document.getElementById("loginBtn");
	let welcomeBtn = document.getElementById("welcomeBtn");
	let toMypageBtn = document.getElementById("toMypageBtn");
	let joinBtn = document.getElementById("joinBtn");

	//세션이 있으면 loginBtn을 없애고, logoutBtn, toMypageBtn, welcomeBtn을 보이게 한다.

	if ('${sessionName}' != "") {
		loginBtn.style.display = "none";
		joinBtn.style.display = "none";
		logoutBtn.style.display = "block";
		welcomeBtn.style.display = "block";
		toMypageBtn.style.display = "block";
	}

	/*-------------------------------------------- dropdown ----------------------------------------------------- */

	function toMyPage() {
		document.getElementById("myDropdown").classList.toggle("show");
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

	/*-------------------------------------------- searchBox ----------------------------------------------------- */

	function openSearch() {
		document.getElementById("myOverlay").style.display = "block";
	}

	let overlay = document.getElementById('myOverlay');

	window.onclick = function(event) {
		if (event.target == overlay) {
			overlay.style.display = "none";
		}
		if (!event.target.matches('.dropbtn')) {
			var dropdowns = document.getElementsByClassName("dropdown-content");
			var i;
			for (i = 0; i < dropdowns.length; i++) {
				var openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}

	/*---------------------------------------------------------------------------------------------------------------- */
	/*-------------------------------------------- slideshow ----------------------------------------------------- */

	var slideCount = 1;
	countSlides(slideCount);

	function plusSlides(n) {
		countSlides(slideCount += n);
	}

	function currentSlide(n) {
		countSlides(slideCount = n);
	}

	function countSlides(n) {
		let i;
		let slides = document.getElementsByClassName("slides");
		let dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideCount = 1
		}
		if (n < 1) {
			slideCount = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace("active", "");
		}
		slides[slideCount - 1].style.display = "block";
		dots[slideCount - 1].className += " active";
	}

	var slideIndex = 0;
	showSlides();

	function showSlides() {
		let i;
		let slides = document.getElementsByClassName("slides");
		let dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 5000); // Change image every 2 seconds
	}
</script>
</html>


