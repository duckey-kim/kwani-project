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
	href="/resources/css/findUserPwd.css">
</head>

<%@include file="../includes/mainHeader.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="loginBox">
			<div class="h1">
				<h1>Settings</h1>
			</div>
			<div class="utilBtnContainer">
				<a href="/search/findUserPwd1" class="nextBtn">이메일로 찾기</a>
			</div>
			<div class="btnContainer">
				<a href="/home" class="cancelBtn">Cancel</a>
			</div>
		</div>
		<!-- loginBox -->
	</div>
	<!-- bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!-- body -->

<%@include file="../includes/footer.jsp"%>