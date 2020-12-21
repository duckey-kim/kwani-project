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

<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/checkUserInfo.css">
</head>

<%@include file="../includes/header.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Settings</h1>
			</div>
			<form action="/user/checkUserInfoAction" method="POST">
				<div class="utilBtnContainer">
					<input type="button" class="update" value="개인정보변경"> <input
						type="button" class="delete" value="회원탈퇴"> <input
						type="hidden" class="hiddenValue" name="btnValue">
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


<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->

<script type="text/javascript">
	// 서버에서 해당 정보를 가져온다.
	let email = document.getElementById("email").value;
	let pwd = document.getElementById("password").value;

	/* 서버에 입력한 정보가 없을 때, null일 때 */
	console.log('${pwdMsg}');
	console.log('${sessionMsg}')
	console.log('${redirectMsg}')
	
	if ("${pwdMsg}" != "") {
		alert("${pwdMsg}");
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

	function openSearch() {
		document.getElementById("myOverlay").style.display = "block";
	}

	let overlay = document.getElementById('myOverlay');

	window.onclick = function(event) {
		if (event.target == overlay) {
			overlay.style.display = "none";
		}
	}

	let checkUtilBtn = document.getElementById("update");

	$(document).ready(function() {
		$(".update").click(function() {
			$(this).css("background-color", "rgb(211, 2, 2)");
			$(this).css("color", "whitesmoke");
			if ($(this).css("color", "whitesmoke")) {
				checkUtilBtn = "updateBtn";
				console.log("checkUtilBtn : " + checkUtilBtn);
				$(".hiddenValue").val(checkUtilBtn);
				console.log("hiddenValue : " + $(".hiddenValue").val());
			}

			$(".delete").css("background-color", "transparent");
			$(".delete").css("color", "black");
		});
		$(".delete").click(function() {
			$(this).css("background-color", "rgb(211, 2, 2)");
			$(this).css("color", "whitesmoke");
			if ($(this).css("color", "whitesmoke")) {
				checkUtilBtn = "withdrawalBtn";
				console.log("checkUtilBtn : " + checkUtilBtn);
				$(".hiddenValue").val(checkUtilBtn);
				console.log("hiddenValue : " + $(".hiddenValue").val());
			}
			$(".update").css("background-color", "transparent");
			$(".update").css("color", "black");
		});
	});
</script>


</html>