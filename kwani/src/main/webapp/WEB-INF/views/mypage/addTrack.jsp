<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script defer src="/resources/js/indexNoVideo.js"></script>

<link rel="stylesheet" href="/resources/css/mypage.css" />
</head>
<%@include file="../includes/header.jsp" %>
		<div id="body">
			<div id="leftSideBar"></div>
			<div id="bodyContent">
				<div class="mypage-header">
					<div class="header-item">
						<img class="userImg" src="/resources/image/${user.userImg}" />
					</div>

					<div>
						<div>
							<c:out value="${user.nick}" />
						</div>
					</div>
				</div>
				<div class="mypage-nav">
					<div class='nav-left'>
						<div class="nav-item">
							<form action="/mypage/overview" method="post">
								<input type="hidden" value="${email}" name="email">
								<button class="button">Overview</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/playlist" method="post">
								<input type="hidden" value="${email}" name="email">
								<button class="button">Playlist</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/like" method="post">
								<input type="hidden" value="${email}" name="email">
								<button class="button">Like</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/library" method="post">
								<input type="hidden" value="${email}" name="email">
								<button class="button">Library</button>
							</form>
						</div>
					</div>
				</div>
				<div class="mypage-body">
					<form action="/mypage/playlist/findtrack" method="post"
						onsubmit="return checkInput();">
						<input type="text" placeholder="Search.." name="searchTxt">
						<input type="hidden" value="${user.email}" name="email"> <input
							type="hidden" value="${user.nick}" name="nick"> <input
							type="hidden" value="${user.userImg}" name="userImg">
						<button type="submit">
							<i>Search</i>
						</button>
					</form>

					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#"><c:out value="${findTrackList[0].NM}" /></a>
							</h3>
						</div>
						<div class="item-body">
							<form action="/mypage/">
								<table class="table" style="width: 100%">
									<tr>
										<th class="th4"></th>
										<th class="th4"></th>
										<th class="th4"></th>
									</tr>
									<c:forEach items="${findTrackList}" var="playlistDetail">
										<tr>
											<td><c:out value="${playlistDetail.TRACK_TTL}" /></td>
											<td><c:out value="${playlistDetail.NM}" /></td>
											<td><button id="addBtn">+</button></td>
											<%--
										<td><c:out value="${playlistDetail.ALBUM_TTL}" /></td> --%>
										</tr>
									</c:forEach>
								</table>
							</form>
						</div>
					</div>
				</div>
			</div>
			<!--bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!--body-->
		<script type="text/javascript">
			function checkInput() {
				console.log("여기왔냐?");
				let search = document.getElementsByName("searchTxt");
				console.log(search[0].value);
		
				let searchValue = search[0].value.trim();
		
				if (searchValue.length == 0) {
					alert("Search is empty")
					return false;
				}
				return true;
			}
		</script>
<%@include file="../includes/footer.jsp" %>