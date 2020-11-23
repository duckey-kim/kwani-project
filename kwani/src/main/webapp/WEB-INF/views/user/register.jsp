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
<title>register</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/register.css">


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
					<a href="#">Last.fm</a>
				</div>
				<div id="navbarUtil">
					<button class="subnavbtn" onclick="openSearch()">
						<i class="fa fa-search"></i>
					</button>
					<a href="/">Home</a> <a href="#">Recommend</a> <a href="#">Find
						music</a> <a href="/user/register">Join</a>
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
						<h1>Sign Up</h1>
					</div>
					<form action="/user/registerAction" method="post">
						<div class="loginForm">
							<div class="fieldEmail">
								<input class="inputEmail" id="email" placeholder="Email"
									type="email" name="email" value="" />
							</div>
							<button type="button" class="doubleBtn" onclick="checkDupl()">중복확인</button>
							<br>
							<div class="fieldNick">
								<input class="inputNick" id="nick" placeholder="Nickname"
									name="nick" />
							</div>
							<div class="fieldPwd">
								<input class="inputPwd" id="password" placeholder="Password"
									type="password" name="pwd" /> <input class="input"
									type="hidden" name="targetUrl" value=""> <input
									type="hidden" name="userImg"> <input type="hidden"
									name="moodCd"> <input type="hidden" name="genreCd">
								<input type="hidden" name="situCd"> <input type="hidden"
									name="stusCd"> <input type="hidden" name="lastDt">
								<input type="hidden" name="inUser"> <input type="hidden"
									name="inDate"> <input type="hidden" name="upUser">
								<input type="hidden" name="upDate">
							</div>
							<button class="loginBtn" type="submit"
								onclick="return checkInput()">Sign Up</button>
						</div>
					</form>
					<div class="socialLoginBtn">
						<a href="#" class="googleBtn">Google</a> <a href="#"
							class="kakaoBtn">KaKao</a> <a href="#" class="naverBtn">Naver</a>
						<div class="infoUtil">
							<span>Already user our site? <a href="/user/login">Log
									in</a> here
							</span><br> <span>Forgot your Password? <a href="#">Reset</a>
								in here
							</span>
						</div>
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

<%-- <%@include file="../includes/header.jsp"%> --%>


<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->


<script type="text/javascript">

	if('${msg}' != "") {
		alert('${msg}')
	}


function checkInput(){
	
	let email = document.getElementById("email").value;
	let nick = document.getElementById("nick").value;
	let pwd = document.getElementById("password").value;
	
	if(email.length == 0){
		alert("이메일을 입력하세요");
		return false;
	}
	
	if(nick.length == 0){
		alert("닉네임을 입력하세요");
		return false;
	}
	
	if(pwd.length == 0){
		alert("비밀번호를 입력하세요");
		return false;
	}
	
	return true;
}



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