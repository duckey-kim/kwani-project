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
	href="/resources/css/withdrawal.css">
</head>

<%@include file="../includes/header.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Settings</h1>
			</div>
			<form action="/user/withdrawalAction" method="POST">
				<div class="utilBtnContainer">
					<input type="button" class="delete" value="회원탈퇴">
				</div>
				<div class="fieldEmail">
					<input class="inputEmail" id="email" placeholder="Email"
						type="email" name="email" />
				</div>
				<div class="textContainer">
					정말로 탈퇴하시겠습니까? <br>
				</div>
				<div class="btnContainer">
					<button class="successBtn" type="submit"
						onclick="return checkInput()">SUCCESS</button>
					<a href="/" class="cancelBtn">Cancel</a>
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
	function checkInput() {

		let email = document.getElementById("email").value;

		if (email.length == 0) {
			alert('이메일을 입력하세요');
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
</script>


</html>