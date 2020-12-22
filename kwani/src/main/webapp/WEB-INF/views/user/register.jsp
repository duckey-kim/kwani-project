<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>



<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>register</title>

<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<link rel="stylesheet" type="text/css"
	href="/resources/css/register.css">

</head>

<%@include file="../includes/mainHeader.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Sign Up</h1>
			</div>
			<form action="/user/registerAction" method="post">
				<div class="loginForm">
					<div class="emailField">
						<input class="inputEmail" id="email" placeholder="Email"
							type="email" name="email" />
					</div>
					<div class="nickField">
						<input class="inputNick" id="nick"
							placeholder="Nickname (한글만 2~6글자)" name="nick" />
					</div>
					<div class="pwdField">
						<input class="inputPwd" id="password"
							placeholder="Password (영어+특수문자+숫자를 섞어서 (8~16)자리)" type="password"
							name="pwd" />
					</div>
					<div class="pwdReField">
						<input class="inputPwdRe" id="passwordRe"
							placeholder="Confirm Password" type="password" name="pwdRe" /> <input
							class="input" type="hidden" name="targetUrl" value=""> <input
							type="hidden" name="userImg"> <input type="hidden"
							name="moodCd"> <input type="hidden" name="genreCd">
						<input type="hidden" name="situCd"> <input type="hidden"
							name="stusCd" value="1" /> <input type="hidden" name="lastDt">
						<input type="hidden" name="inUser"> <input type="hidden"
							name="inDate"> <input type="hidden" name="upUser">
						<input type="hidden" name="upDate">
						<button class="loginBtn" type="submit"
							onclick="return checkInput()">Sign Up</button>
						<div class="infoUtil">
							<span>Already user our site? <a href="/user/login">Log
									in</a> here
							</span><br> <span>Forgot your Password? <a
								href="/search/findUserPwd">Reset</a> in here
							</span>
						</div>
					</div>
				</div>
			</form>
			<!-- socialLoginBtn -->
		</div>
		<!-- loginBox -->
	</div>
	<!-- bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!-- body -->

<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->


<script type="text/javascript">
	if ('${msg}' != "") {
		alert('${msg}')
	}

	function checkInput() {

		let email = document.getElementById("email").value;
		let nick = document.getElementById("nick").value;
		let pwd = document.getElementById("password").value;
		let pwdRe = document.getElementById("passwordRe").value;

		// 정규식
		// 비밀번호 : 영어+특수문자+숫자를 섞어서 (8~16)자리 
		let pwdPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
		// 이름 : 한글만 2~4글자
		let nickPattern = /^[가-힣]{2,6}$/;

		if (email.length == 0) {
			alert("아이디(이메일)를(을) 입력하세요.");
			return false;
		}

		if (nick.length == 0) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		if (nickPattern.test(nick) == false) {
			alert("닉네임은 한글 2~6글자로만 가능합니다.");
			return false;
		}

		if (pwd.length == 0) {
			alert("비밀번호를 입력하세요.");
			return false;
		}

		if (pwdPattern.test(pwd) == false) {
			alert("비밀번호는 영어+특수문자+숫자를 섞어서 (8~16)자리만 가능합니다.");
			return false;
		}

		if (pwdRe.length == 0) {
			alert("비밀번호를 다시 입력해주세요.");
			return false;
		}

		if (pwd != pwdRe) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			return false;
		}

	}
</script>

<%@include file="../includes/footer.jsp"%>