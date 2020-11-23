<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css" />
</head>
<body>
	<h4>${msg }</h4>
	<form action="/admin/inputuserAction" method="post"
		onsubmit='return checkInput();'>
		<h5>T_USER</h5>
		<div>
			email<input type="email" name="email" id="email">
		</div>
		<div>
			nick<input type="text" name="nick" id="nick">
		</div>
		<div>
			pwd<input type="text" name="pwd" id="pwd">
		</div>
		<div>
			img <input type="text" name="userImg">
		</div>

		<button>등록</button>



	</form>
	<a href="/admin/home">HOME</a>

	<script type="text/javascript">
		function check(pattern, input, message) {
			if (pattern.test(input.value)) {
				return true;
			}
			alert(message);
			input.value = "";
			input.focus();
		}

		function checkInput() {
			let inputArr = document.getElementsByTagName("input");

			const inputPattern = /^[a-zA-Z0-9]{4,12}$/;
			const emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

			let email = document.getElementById("email");
			let nick = document.getElementById("nick");
			let pwd = document.getElementById("pwd");

			let emailValue = email.value.trim();
			let nickValue = nick.value.trim();
			let pwdValue = pwd.value.trim();

			if (!check(emailPattern, email, "적합하지 않은 이메일 형식")) {
				return false;
			}

			if (!check(inputPattern, nick, "nick은 4~12자의 영문 대소문자와 숫자로 입력")) {
				return false;
			}
			if (!check(inputPattern, pwd, "pwd는 4~12자의 영문 대소문자와 숫자로 입력")) {
				return false;
			}
			if (emailValue == "") {
				alert("Email is empty")
				return false;
			}
			if (nickValue == "") {
				alert("nick is empty")
				return false;
			}
			if (pwdValue == "") {
				alert("Password is empty")
				return false;
			}

			return true;

		}
	</script>
</body>
</html>