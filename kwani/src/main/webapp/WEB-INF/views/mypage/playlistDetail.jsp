<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/js/jquery-3.5.1.js" /></script>
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
								<button class="button">Overview</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/playlist" method="post">
								<button class="button">Playlist</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/like" method="post">
								<button class="button">Like</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/library" method="post">
								<button class="button">Library</button>
							</form>
						</div>
					</div>
				</div>

				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-header">
							<h2>
								<a href="#"><c:out value="${playlistDetail[0].NM}" /></a>
							</h2>
							<h3>
								<c:out value="${playlistDetail[0].DESCP}" />
							</h3>
						</div>
						<div class="item-body">
							<div class="item-div">
								<div>플레이리스트 곡 개수 : ${trackCount}</div>
								<br>
									<table style="width: 100%">
										<tr>
											<th class="th1"></th>
											<th class="th4"></th>
											<th class="th5"></th>
											<th class="th5"></th>
											<th class="th6"></th>
											<th class="th1"></th>
											<th class="th1"></th>
										</tr>
									<c:forEach items="${playlistDetail}" var="playlistDetail" varStatus="status">
										<tr>
											<td>${status.count}</td>											
											<td><a href="/detail/album?albumId=${playlistDetail.ALBUM_ID}"><img src="/resources/image/album/${playlistDetail.ALBUM_IMG}" class="myImg"></a></td>
											<td><a href="/detail/track?trackId=${playlistDetail.TRACK_ID}"><c:out value="${playlistDetail.TRACK_TTL}" /></a></td>
											<td><a href="/detail/artist?gropId=${playlistDetail.GROP_ID}"><c:out value="${playlistDetail.ANM}" /></a></td>
											<td><a href="/detail/album?albumId=${playlistDetail.ALBUM_ID}"><c:out value="${playlistDetail.ALBUM_TTL}" /></a></td>
											<td onclick='popupPlayer("/player/track?trackId=${playlistDetail.TRACK_ID}")'><a href="#"><img src="/resources/image/play-button.png" class="play"></a></td>
											<td><a href="#"><img src="/resources/image/heart.png" class="play"></a></td>
										</tr>
									</c:forEach>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--bodyContent-->
	<div id="rightSideBar"></div>
	<script>
	      let popupPlayer = function(url){
	          let moveTop=screen.height-440;
	           let moveLeft=screen.width-537;
	         window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
	      }
	</script>
	<!--body-->
<%@include file="../includes/footer.jsp" %>