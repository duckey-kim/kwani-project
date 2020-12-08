<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<h4>${msg }</h4>

<div class="container">
	<div class="row">
		<div class="col-md-4">
			<div class="login-panel panel paenl-default">
				<form action="/admin/loginAction" method="POST"
					onsubmit="return checkInput();">
					<div>
						<label for="mngrId"><b>MANAGER ID</b></label> <input type="text"
							placeholder="Enter Username"
							value="${admin.mngrId }" name="mngrId" id="mngrId">
					</div>

					<div>
						<label for="password"><b>Password</b></label> <input
							type="password" placeholder="Enter Password"
							value="${admin.pwd }" name="pwd" id="pwd">

					</div>



					<button type="submit">Login</button>
				</form>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	function checkInput() {
		
		const idFld = document.getElementById("mngrId");
		const pwdFld = document.getElementById("pwd");
		if (idFld.value == "") {
			alert("아이디를 입력하세요");
			return false;
		}
		if (pwdFld.value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
		return true;
	}
</script>
<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>
