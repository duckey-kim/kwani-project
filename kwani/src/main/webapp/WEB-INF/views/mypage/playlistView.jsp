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

<script src="/resources/js/jquery-3.5.1.js" /></script>

<link rel="stylesheet" type="text/css"href="/resources/css/indexNoVideomh.css">
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

		<div id="body" style="height: 200px">
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
				<hr style="border-bottom: 1px solid black">
				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#">Playlist Create</a>
							</h3>
							<h2>playlistId : ${playlistVO.plylstId}</h2>
						</div>
						<div class="item-body">
							<div>
								<form action="/mypage/playlist/delete" method="post">
									<input type="hidden" value="${playlistVO.plylstId}" name="plylstId">
									<input type="hidden" value="${user.email}" name="email">
									<button>삭제하기</button>
								</form>
								<form action="/mypage/playlist/modify" method="post"
									onsubmit="return checkInput()">
									<input type="hidden" value="${playlistVO.plylstId}"
										name="plylstId">
									<button>저장 후 나가기</button>
									<br> <br> <div id="change-img"><img class="myArtistImg"
										src="/resources/image/album/${playlistVO.plylstImg}">
										</div>
										<br>
									<label for="title">Playlist Title :</label><br> <input
										type="text" id="change-title" name="nm"
										placeholder="${playlistVO.nm}"><br> <label
										for="desc">Playlist Description : </label><br>
									<textarea id="change-desc" class="form-control" name="desc"
										placeholder="${playlistVO.desc}"></textarea>
									<br>
								</form>

								<button id="addBtn">Add Track</button>

								<div class="item-body">
									<table id="change-plylstDtl" style="width: 100%">
										<thead>
										<tr>
											<th class="th1"></th>
											<th class="th1"></th>
											<th class="th1"></th>
											<th></th>
											<th></th>
											<th></th>
											<th class="th1"></th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items="${playlistDetail}" var="playlistDetail" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><c:out value="${playlistDetail.PLY_NO}" /></td>
												<td><img class="myImg"
													src="/resources/image/album/${playlistDetail.ALBUM_IMG}" /></td>
												<td><c:out value="${playlistDetail.ANM}" /></td>
												<td><c:out value="${playlistDetail.TRACK_TTL}" /></td>
												<td><c:out value="${playlistDetail.ALBUM_TTL}" /></td>
												<td>
													<input class="trackIdValue" type="hidden" value="${playlistDetail.TRACK_ID}" name="trackIdValue">
													<button class="delBtn">삭제</button>
												</td>
											</tr>
										</c:forEach>
										</tbody>
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
	</div>
	<div id="footer"></div>
	<!--main-->
</body>
</html>