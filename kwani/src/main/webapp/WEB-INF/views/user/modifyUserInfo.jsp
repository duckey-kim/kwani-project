<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Settings</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/modifyUserInfo.css">
</head>
<body>
	<div id="main">
		<div id="header">
			<div id="header_cover">
                <!-- <video id="video" src="/resources/video/AudioWave.mp4" -->
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
					<!-- <form action="/user/uploadFormAction" method="POST" enctype="multipart/form-data"> -->
						<div class="utilBtnContainer">
							<input type="button" class="update" value="개인정보변경"> <input
								type="button" class="delete" value="회원탈퇴">
						</div>
						<div class="userImgContainer">
							<div class="userImgDiv"></div>
							<div class="uploadImg">
								<input type='file' name='uploadFile' class="uploadFile" multiple>
                            </div>
                            <div class="uploadBtnContainer">
                                <button id='uploadBtn' clsss="uploadBtn">Upload</button>
                            </div>
						</div>
						
						<form action="/user/modifyUserInfoAction" method="POST">
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
					<!-- </form> -->
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


$(document).ready(function() {
	
	
	let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	let maxSize = 5242880;	// 5MB
		
	function checkExtension(fileName, fileSize) {
			
		if(fileSize >= maxSize) {
			alert("파일 사이즈 초과");
			return false;
		}
			
		if(regex.test(fileName)) {
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	
	let cloneObj = $(".uploadImg").clone();
	
	$("#uploadBtn").on("click", function(e) {
		let formData = new FormData();
			
		let inputFile = $("input[name='uploadFile']");
			
		let files = inputFile[0].files;
			
		console.log(files);
		
		for(let i = 0; i < files.length; i++) {
				
			if(!checkExtension(files[i].name, files[i].size)) {
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
			
		$.ajax({
			url: '/user/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			type: 'POST',
			dataType: 'json',
			success: function(result) {
				alert(result);
				console.log(result);
				
				showUploadedFile(result);
				
				$(".uploadImg").html(cloneObj.html());
			}
		});	//$.ajax
		
		
		let userImgDiv = $(".userImgDiv");
		
		function showUploadedFile(userImgArr) {
			
			let str = "";
			
			$(userImgArr).each(function(i, obj) {
			
				if(!obj.image) {
					str += "<img src='/resources/image/slideSample1.png'>"
						+ obj.fileName;
				} else {
					
					let fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
					str += "<img src='/user/display?fileName=" + fileCallPath + "'>";
				} 
			});
			
			userImgDiv.append(str);
		}
		
		
		
	});
});













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