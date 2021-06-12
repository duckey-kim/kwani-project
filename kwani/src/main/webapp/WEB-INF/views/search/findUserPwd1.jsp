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
	href="/resources/css/findUserPwd1.css">
</head>

<%@include file="../includes/mainHeader.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Settings</h1>
			</div>
			<form action="/search/findUserPwdAction" method="POST">
				<div class="fieldIdemail">
					<input class="inputIdemail" id="email" placeholder="Id (email)"
						type="email" name="IdEmail" />
				</div>
				<div class="fieldEmail">
					<input class="inputEmail" id="email" placeholder="Email"
						type="email" name="email" />
				</div>
				<div class="successBtnContainer">
					<!-- 인증번호를 요청하고, 요청이 성공했으면 다음페이지로 이동하고, 실패하면 여기로 다시온다. -->
					<button class="successBtn" type="submit">인증번호요청</button>
				</div>
			</form>
		</div>
		<!-- loginBox -->
	</div>
	<!-- bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!-- body -->
<script type="text/javascript">
	console.log("${msg}");

	if ("${msg}" != "")
		alert("${msg}")
</script>
<%@include file="../includes/footer.jsp"%>