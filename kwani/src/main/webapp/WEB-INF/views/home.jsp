<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%-- <%@include file="../includes/header.jsp"%> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.js" integrity="sha256-kRbW+SRRXPogeps8ZQcw2PooWEDPIjVQmN1ocWVQHRY=" crossorigin="anonymous"></script>
  <link href='https://fonts.googleapis.com/css?family=Open Sans' rel='stylesheet'>
    <link rel="stylesheet" type = "text/css" href="/resources/css/home.css">
</head> 



<body>
    <div id="main">
        <div id="header">
        <div id="header_cover">
                <video id="video"src="/resources/video/AudioWave.mp4" type="video/mp4" autoplay muted loop></video>
            </div>
            <div id="header_navbar">
                <div id="musicPlayer">
                	<div class="albumImg">
                		<img src = "/resources/image/dvd.png" class="cd">
                	</div>
                	<div class="playBtn">
                		<img src = "/resources/image/rewind.png" class="musicBtn">
                		<img src = "/resources/image/play-button4.png" class="musicBtn">
                		<img src = "/resources/image/fast-forward.png" class="musicBtn"> 
                	</div>
                </div>
                <div id="pageLogo">
                    <a href="/">Last.fm</a>
                </div>
                <div id="navbarUtil"> 
                    <button class="subnavbtn" onclick="openSearch()">
                      <i class="fa fa-search"></i></button>
                    <a href="/">Home</a>
                    <a href="/recommend/common">Recommend</a>
                    <a href="#">Find music</a>
                    <a href="/user/register" id="joinBtn">Join</a>
                    <a href="/user/logoutAction" id="logoutBtn" style="display:none">Logout</a>
                    <a href="#" id="toMypageBtn" style="display:none">My page</a>
                </div>
            </div>
            <div id="myOverlay" class="overlay">
                <div class="overlay-content">
                  <form action="#">
                    <input type="text" placeholder="Search.." name="search">
                    <button type="submit"><i class="fa fa-search"></i></button>
                  </form>
                </div>
            </div><!--myOverlay-->
        </div><!--header-->

        

        <div id="body">
            <div id="leftSideBar"></div>
            <div id="bodyContent">
                <div class="sysdate">
                    12월 25일 / 오늘은 뭐 들을까??
                </div>
                <div class="contentBtn">
                    오늘의 추천곡
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
                    <div class="slideBox">추천목록 슬라이드</div>
                    <div class="loginFormBox">
                        <a href="/user/login" class="loginBtn" id="loginBtn">Login</a>
                        <div id="welcomeBtn" class="welcomeBtn" style="display:none">
                        환영합니다!<br>
                        ${userNick} 님
                        </div>
                    </div>
                </div>
                <div class="bottomContentBox">
                    <div class="genreYear"> 
                    
                    <!-- 동그라미 해보기 -->
                    <div class="ring-inputContainer">

    <div class="ring-input">
      <svg onload="makeDraggable(evt)" >
        
        <defs>
          <pattern id="circleImg" x="0%" y="0%" height="1" width="1" >
            <image x="-20" y="-20" height="100%" width="100%" xlink:href="/img/5.png"></image>
          </pattern>
        </defs>

        <g transform="translate(16,20)">
            <circle class="ring" cx="130" cy="130" r="130" stroke="black" stroke-width="6" width="100%" height="100%" fill="url(#circleImg)"></circle>
          <g id="handles" transform="translate(130,130)">
            <circle r="10" fill="blue" class="draggable" transform="rotate(0),translate(130,0)"></circle>
          </g>

          <g id="handles" transform="translate(130,130)">
            <circle r="10" fill="red" class="draggable" transform="rotate(0),translate(-130,0)"></circle>
          </g>

        </g>
      </svg>
    </div><!--ring-input-->

  </div><!--ring-inputContainer-->
                    
                    
                    </div>
                    <div class="akinator">아키네이터</div>
                </div>
            </div><!--bodyContent-->
            <div id="rightSideBar"></div>
        </div><!--body-->
        <div id="footer"></div>
    </div><!--main-->
</body>

<%-- <%@include file="../includes/footer.jsp"%> --%>


<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->

<script type="text/javascript">
var def_val = 0;

function makeDraggable(evt) {
    var svg = evt.target;
    svg.addEventListener('mousedown', startDrag);
    svg.addEventListener('mousemove', drag);
    svg.addEventListener('mouseup', endDrag);
    svg.addEventListener('mouseleave', endDrag);
    var selectedElement = false;

  

    function startDrag(evt) {
        if (evt.target.classList.contains('draggable')) {
            selectedElement = evt.target;
        }
    }

    function drag(evt) {
        if (selectedElement) {
           
            var x = selectedElement.getAttributeNS(null, "cx");
            var y = selectedElement.getAttributeNS(null, "cy");
   
            var x1 = evt.clientX - 130;
            var y1 = evt.clientY - 130;
            var newAngle = Math.atan2(y1, x1) * 57.2957795;
            if (newAngle < 0) {
                newAngle = 360 + newAngle;
            }
            selectedElement.setAttributeNS(null, "transform", "rotate(" + newAngle + "),translate(130,0)");

        }

    }

    function endDrag() {
        selectedElement = null;
    }

    function getMousePosition(evt) {
        var CTM = svg.getScreenCTM();
        return {
            x: (evt.clientX - CTM.e) / CTM.a,
            y: (evt.clientY - CTM.f) / CTM.d
        }
    }
}



// 세션값 잘 넘어왔는지 확인한다.
console.log('${sessionName}');
console.log('${userNick}')

let logoutBtn = document.getElementById("logoutBtn");
let loginBtn = document.getElementById("loginBtn");
let welcomeBtn = document.getElementById("welcomeBtn");
let toMypageBtn = document.getElementById("toMypageBtn");
let joinBtn = document.getElementById("joinBtn");
	
// 세션이 있으면 loginBtn을 없애고, logoutBtn, toMypageBtn, welcomeBtn을 보이게 한다.

if('${sessionName}' != "") {
	loginBtn.style.display = "none";
	joinBtn.style.display = "none";
	logoutBtn.style.display = "block";
	welcomeBtn.style.display = "block";
	toMypageBtn.style.display = "block";
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


