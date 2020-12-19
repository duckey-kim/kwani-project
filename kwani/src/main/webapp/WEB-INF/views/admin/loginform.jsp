<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/includes/adminheader.jsp"%>

<h4>${msg }</h4>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<div class="paenl-default">
				<h4>관리자 로그인</h4>
				<form action="/admin/loginAction" method="POST"
					onsubmit="return checkInput();">
					<div class="form-group">
						<label for="mngrId"><b>MANAGER ID</b></label> <input type="text"
							placeholder="Enter Username" value="${admin.mngrId }" class="form-control"
							name="mngrId" id="mngrId">
					</div>

					<div class="form-group">
						<label for="password"><b>Password</b></label> <input
							type="password" placeholder="Enter Password" class="form-control"
							value="${admin.pwd }" name="pwd" id="pwd">

					</div>
					<button class="btn btn-sm btn-success">로그인</button>
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
