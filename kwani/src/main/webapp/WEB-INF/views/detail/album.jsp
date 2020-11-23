<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>album</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script defer src="/resources/js/indexNoVideo.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/indexNoVideo.css">
<link rel="stylesheet" type="text/css" href="/resources/css/album.css">

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



		<div id="body">
			<div id="leftSideBar"></div>
			<div id="bodyContent">
				<div>
					<h1>앨범 정보</h1>
				</div>

				<div class="music-header">

					<div class="album-jacket">
						<c:forEach items="${getAlbumInfoList }" var="AlbumInfo" begin="0"
							end="0">
							<img
								src="/resources/image/album/<c:out value="${AlbumInfo.ALBUM_IMG }" />"
								style="max-height: 196px">
						</c:forEach>
					</div>

					<div class="header-item">

						<c:forEach items="${getAlbumInfoList }" var="AlbumInfo" begin="0"
							end="0">
							<div>
								<h2>
									<c:out value="${AlbumInfo.ALBUM_TTL }" />
								</h2>
							</div>
						</c:forEach>

						<pre>
						</pre>

						<div class="artist-name">

							<c:forEach items="${getAlbumArtistList }" var="ArtistList">
								<div>
									<a href="/detail/artist?gropId=<c:out value="${ArtistList.GROP_ID }" />"><c:out value="${ArtistList.NM }" /> </a>
								</div>
								<pre> </pre>
							</c:forEach>
						</div>

						<pre>
						</pre>

						<div>
							<c:forEach items="${getAlbumInfoList }" var="AlbumInfo" begin="0"
								end="0">
								<pre>장르	: <c:out value="${AlbumInfo.GENRE_CD }" /></pre>
								<pre>발매일	: <c:out value="${AlbumInfo.RLESDT }" /></pre>
							</c:forEach>
						</div>

					</div>
				</div>

				<div class="header-buttons">
					<button type="button">전체듣기</button>
					<button type="button">현재 재생목록에 추가</button>
					<button type="button">내 재생목록 추가</button>
					<button type="button">좋아요</button>
				</div>

				<div class="hr">
					<hr>
				</div>


				<div class="hr">
					<hr>
				</div>

				<div class="related">
					<div class="subtitle">
						<h2>앨범 수록곡></h2>
					</div>
					<div class="items">
						<table>
							<tr>
								<th>순서</th>
								<th>곡</th>
								<th>아티스트</th>
								<th>현재 재생목록에 추가</th>
								<th>재생목록</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${getAlbumInfoList }" var="AlbumInfo">
								<tr>
									<td><c:out value="${AlbumInfo.TRACK_ORDER }" /></td>
									<td><a
										href="/detail/track?trackId=<c:out value='${AlbumInfo.TRACK_ID }' />"><c:out
												value="${AlbumInfo.TRACK_TTL }" /></a></td>
									<td><a href="/detail/artist?gropId=<c:out value="${AlbumInfo.GROP_ID }" />"><c:out value="${AlbumInfo.NM }" /> </a></td>
									<td>
										<button>현재 재생목록에 추가</button>
									</td>
									<td>
										<button>내 재생목록에 추가</button>
									</td>
									<td>
										<button>좋아요</button>
									</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>



			</div>
			<!--bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!--body-->
		<div id="footer"></div>
	</div>
	<!--main-->
</body>
</html>