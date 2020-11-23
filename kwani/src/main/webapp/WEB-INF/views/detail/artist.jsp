<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>artist</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script defer src="/resources/js/indexNoVideo.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/indexNoVideo.css">
<link rel="stylesheet" type="text/css" href="/resources/css/artist.css">

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
					<h1>가수 정보</h1>
				</div>

				<div class="music-header">

					<div class="album-jacket">
							<img
								src="/resources/image/artist/<c:out value="${getArtistInfo.GROP_IMG }" />"
								style="max-height: 196px">
					</div>

					<div class="header-item">

							<div>
								<h2>
									<c:out value="${getArtistInfo.NM }" />
								</h2>
								<pre>
								</pre>
								<p>데뷔 : <c:out value="${getArtistInfo.DEBUT_DT }"/></p>
							</div>

					</div>
				</div>

				<div class="header-buttons">
					<button type="button">좋아요</button>
					<button type="button">공유</button>
				</div>

				<div class="hr">
					<hr>
				</div>

				<div class="related">
					<div class="subtitle">
						<h2>노래></h2>
					</div>
					<div class="items">
						<table>
							<tr>
								<!-- <th></th> -->
								<th>곡</th>
								<th>앨범</th>
								<th>현재 재생목록에 추가</th>
								<th>재생목록</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${getArtistTrackList }" var="ArtistTrack">
								<tr>
									<%-- <td><img src="/resources/image/album/<c:out value='${ArtistTrack.ALBUM_IMG }' />" style="max-height:25px">
									</td> --%>
									<td><a
										href="/detail/track?trackId=<c:out value='${ArtistTrack.TRACK_ID }' />"><c:out
												value="${ArtistTrack.TRACK_TTL }" /></a></td>
									<td>
									<a href="/detail/album?albumId=<c:out value='${ArtistTrack.ALBUM_ID }'/>"><c:out value="${ArtistTrack.ALBUM_TTL }" /></a>
									</td>
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
				
				
				<div class="hr">
					<hr>
				</div>
				
				<div class="related">
					<div class="subtitle"><h2>앨범></h2></div>
					<div class="items">

						<c:forEach items="${getArtistAlbumList }" var="AlbumList">
							<div class="item">
								<a href="/detail/album?albumId=<c:out value="${AlbumList.ALBUM_ID }"/>"> <img
									src="/resources/image/album/<c:out value="${AlbumList.ALBUM_IMG }" />"
									style="max-height: 200px">
								</a> <a href="/detail/album?albumId=<c:out value="${AlbumList.ALBUM_ID }"/>"><c:out value="${AlbumList.ALBUM_TTL }" /></a>
							</div>
						</c:forEach>
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