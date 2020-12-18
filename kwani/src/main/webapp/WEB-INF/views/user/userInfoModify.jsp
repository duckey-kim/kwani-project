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
	href="/resources/css/userInfoModify.css">
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
					<a href="/user/home">Last.fm</a>
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
					<form action="/user/userInfoModifyAction" method="POST">
						<div class="utilBtnContainer">
							<input type="button" class="update" value="개인정보변경"> <input
								type="button" class="delete" value="회원탈퇴">
						</div>
						<div class="userImgContainer">
							<div class="userImg">사용자의 사진</div>
							<div class="uploadImg">
								<!-- <input type="file" name="imgFiles" id=""> -->
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
								type="password" name="pwd" required /> <input class="input"
								type="hidden" name="targetUrl" value="">

						</div>
						<div class="successBtnContainer">
							<button class="successBtn" type="submit">SUCCESS</button>
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


window.onscroll = function() {myFunction()};  
let navbar = document.getElementById("header_navbar");
let sticky = navbar.offsetTop;
        
function myFunction(){
    if(window.pageYOffset >= sticky){
        navbar.classList.add("sticky")
    }else{
        navbar.classList.remove("sticky");
    }
}
 
function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
}

let overlay = document.getElementById('myOverlay');

window.onclick = function(event){
    if(event.target == overlay){
        overlay.style.display = "none";
    }
}


</script>


</html>