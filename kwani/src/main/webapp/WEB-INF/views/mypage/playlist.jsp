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
<link rel="stylesheet" type="text/css"
	href="/resources/css/indexNoVideomh.css">
<link rel="stylesheet" href="/resources/css/mainmh.css" />
</head>

<body>
	<div id="main">
		<div id="header">
			<div id="header_navbar">
				<div id="musicPlayer">musicPlayer</div>
				<div id="pageLogo">
					<a href="#">Last.fm</a>
				</div>
				<div id="navbarUtil">
					<button class="subnavbtn" onclick="openSearch()">
						<i class="fa fa-search"></i>
					</button>
					<a href="#">Home</a> <a href="#">Recommend</a> <a href="#">Find
						music</a> <a href="#">Join</a>
				</div>
			</div>
			<div id="myOverlay" class="overlay">
				<div class="overlay-content">
					<form action="/action_page.php">
						<input type="text" placeholder="Search.." name="search">
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<!--myOverlay-->

		</div>
		<!--header-->

		<div id="body" style="height: 100px">
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
								<input type="hidden" value="${user.email}" name="email">
								<input type="hidden" value="${user.nick}" name="nick">
								<input type="hidden" value="${user.userImg}" name="userImg">	
								<button class="button">Overview</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/playlist" method="post">
								<input type="hidden" value="${user.email}" name="email">
								<input type="hidden" value="${user.nick}" name="nick">
								<input type="hidden" value="${user.userImg}" name="userImg">	
								<button class="button">Playlist</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/like" method="post">
								<input type="hidden" value="${user.email}" name="email">
								<input type="hidden" value="${user.nick}" name="nick">
								<input type="hidden" value="${user.userImg}" name="userImg">	
								<button class="button">Like</button>
							</form>
						</div>
						<div class="nav-item">
							<form action="/mypage/library" method="post">
								<input type="hidden" value="${user.email}" name="email">
								<input type="hidden" value="${user.nick}" name="nick">
								<input type="hidden" value="${user.userImg}" name="userImg">
								<button class="button">Library</button>
							</form>
						</div>
					</div>
				</div>

				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-body">
							<form action="/mypage/playlist/create" method="post">
								<input type="hidden" value="${user.email}" name="email">
								<input type="hidden" value="${user.nick}" name="nick">
								<input type="hidden" value="${user.userImg}" name="userImg">
								<button class="button2">새로운플레이리스트 만들기</button>
							</form>
						</div>
					</div>
				</div>

				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#">Playlist</a>
							</h3>
						</div>
						<div class="item-body">
							<div class="item-div">
								<c:forEach items="${playlist}" var="plylst">
									<table class="table">
										<tr>
											<th class="th"></th>
											<th class="th"></th>
										</tr>
										<tr>
											<td class="td8" colspan="2"><img class="myArtistImg" src="/resources/image/album/${plylst.plylstImg}"></td>
										</tr>

										<tr>
											<td><form action="/mypage/playlistDetail" method="post">
													<input type="hidden" value="${plylst.plylstId}" name="plylstId">
													<input type="hidden" value="${user.email}" name="email">
													<input type="hidden" value="${user.nick}" name="nick">
													<input type="hidden" value="${user.userImg}" name="userImg">
													<button class="button2" style="text-align: left">
														<c:out value="${plylst.nm}" />
													</button>
												</form></td>
											<td><form action="/mypage/playlist/delete" method="post">
													<input type="hidden" value="${plylst.plylstId}" name="plylstId">
													<input type="hidden" value="${user.email}" name="email">
													<input type="hidden" value="${user.nick}" name="nick">
													<input type="hidden" value="${user.userImg}" name="userImg">
													<button class="button2">삭제</button>
												</form></td>
										</tr>
									</table>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			<!--bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!--body-->
		<div id="footer"></div>
		<!--main-->
</body>
</html>