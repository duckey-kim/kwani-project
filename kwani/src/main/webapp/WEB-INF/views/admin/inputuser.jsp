<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<h4>${msg }</h4>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel paenl-default">
				<div class="panel-body">

					<form action="/admin/inputuserAction" method="post"
						onsubmit='return checkInput();'>
						<h5>T_USER</h5>
						<div>
							<input placeholder="E-mail" class="form-control" type="email"
								name="email" id="email" value="${user.email}">
						</div>
						<div>
							<input placeholder="NICK" class="form-control" type="text"
								name="nick" id="nick"
								value='<c:out value="${user.nick }"></c:out>'>
						</div>
						<div>
							<input placeholder="PASSWORD" class="form-control" type="text"
								name="pwd" id="pwd">
						</div>
						<div>
							<input placeholder="USERIMAGE" class="form-control" type="text"
								name="userImg" value="${user.userImg }">
						</div>

						<button class="btn btn-sm btn-success">등록</button>



					</form>

				</div>
			</div>
		</div>
	</div>
</div>

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
<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>
