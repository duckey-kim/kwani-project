<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class=" panel paenl-default">
				<div class="panel-body">
					<h4>${msg }</h4>
					<h4>T_USER</h4>

					<form action="/admin/inputuserAction" method="post"
						enctype="multipart/form-data" onsubmit='return checkInput();'>
						<div class="form-group">
							<label>이메일</label> <input placeholder="E-mail"
								class="form-control" type="email" name="email" id="email"
								value="${user.email}">
						</div>
						<div class="form-group">
							<label>닉네임</label> <input placeholder="NICK" class="form-control"
								type="text" name="nick" id="nick"
								value='<c:out value="${user.nick }"></c:out>'>
						</div>
						<div class="form-group">
							<label>비밀번호</label> <input placeholder="PASSWORD"
								class="form-control" type="text" name="pwd" id="pwd">
						</div>
						<div class="form-group">
							<label>이미지</label> <input placeholder="USERIMAGE"
								class="form-control" type="file" name="imgFile" id="imgFile">
						</div>
						<input type="hidden" name="upUser" id="upUser" value="${mngrId} ">
						<button class="btn btn-sm btn-success">등록</button>



					</form>

				</div>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	let checkExtension = function(fileName, fileSize) {
		const imgRegex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		const maxSize = 5242880;
		if (fileSize >= maxSize) {
			alert("파일사이즈 초과");
			return false;
		}
		if (imgRegex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}

	let check = function(pattern, input, message) {
		if (pattern.test(input.value)) {
			return true;
		}
		alert(message);
		input.value = "";
		input.focus();
	}

	let checkInput = function() {
		let inputArr = document.getElementsByTagName("input");

		const inputPattern = /^[a-zA-Z0-9]{4,12}$/;
		const emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		let email = document.getElementById("email");
		let nick = document.getElementById("nick");
		let pwd = document.getElementById("pwd");

		let imgFld = document.getElementById("imgFile");
		let userImg = imgFld.files.item(0);

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

		if (userImg == null) {
			alert("파일을 선택해주세요");
			return false;
		} else if (!checkExtension(userImg.name, userImg.size)) {
			return false;
		}

		return true;

	}
</script>
<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>
