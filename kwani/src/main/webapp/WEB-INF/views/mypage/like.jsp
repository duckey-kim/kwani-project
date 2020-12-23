<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Like</title>
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
							<h3>
								<a href="#">Liked Artists</a>
							</h3>
						</div>
						<div class="item-div">
								<c:forEach items="${likedArtistList}" var="artist" begin="0" end="2">
									<table class="basicTable">
										<tr>
											<th class="th"></th>
											<th class="th"></th>
										</tr>
										<tr>
											<td class="td8" colspan="2"><a href="/detail/artist?gropId=${artist.GROP_ID}"><img class="myArtistImg" src="/resources/image/artist/${artist.GROP_IMG}"></a></td>
										</tr>
										
										<tr>
											<td><img src="/resources/image/heart.png" class="play"></td>
											<td style="text-align:left"><a href="/detail/artist?gropId=${artist.GROP_ID}"><c:out value="${artist.NM}" /></a></td>
										</tr>
									</table>
								</c:forEach>
							</div>
					</div>

					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#">Liked Album</a>
							</h3>
						</div>
						<div class="item-div">

							<c:forEach items="${likedAlbumList}" var="album" begin="0"
								end="2">
								<table class="table">
									<tr>
										<th></th>
										<th class="th"></th>
										<th class="th"></th>
										<th class="th"></th>
									</tr>

									<tr>
										<td class="td7" rowspan="4"><a href="/detail/album?albumId=${album.ALBUM_ID}"><img class="myAlbumImg" src="/resources/image/album/${album.ALBUM_IMG}"></a></td>
										<td colspan="3"><a href="/detail/album?albumId=${album.ALBUM_ID}"><c:out value="${album.ALBUM_TTL}" /></a></td>
									</tr>
									<tr>
										<td colspan="3"><a href="/detail/artist?gropId=${album.GROP_ID}"><c:out value="${album.NM}" /></a></td>
									</tr>
									<tr>
										<td colspan="3">10</td>
									</tr>
									<tr>
										<td><img src="/resources/image/list.png" class="play"></td>
										<td><img src="/resources/image/folder.png" class="play"></td>
										<td><img src="/resources/image/heart.png" class="play"></td>
									</tr>
								</table>
							</c:forEach>
						</div>
					</div>

					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#">Liked Track</a>
							</h3>
						</div>
						<table style="width: 100%">
							<tr>
								<th class="th1"></th>
								<th class="th4"></th>
								<th class="th3"></th>
								<th class="th3"></th>
								<th class="th1"></th>
								<th class="th1"></th>
							</tr>
							<c:forEach items="${likedTrackList}" var="track" begin="0" end="4">
								<tr>
									<td><a href="/detail/album?albumId=${track.ALBUM_ID}"><img src="/resources/image/album/${track.ALBUM_IMG}" class="myImg"></a></td>
									<td><a href="/detail/track?trackId=${track.TRACK_ID}"><c:out value="${track.TRACK_TTL}" /></a></td>
									<td><a href="/detail/artist?gropId=${track.GROP_ID}"><c:out value="${track.NM}" /></a></td>
									<td><a href="/detail/album?albumId=${track.ALBUM_ID}"><c:out value="${track.ALBUM_TTL}" /></a></td>
									<td onclick='popupPlayer("/player/track?trackId=${track.TRACK_ID}")'><a href="#"><img src="/resources/image/play-button.png" class="play"></a></td>
									<td><a href="#"><img src="/resources/image/heart.png" class="play"></a></td>
								</tr>
							</c:forEach>
						</table>
						
						<!-- 페이징처리 -->
<%-- 						<div class='pull-right'>
							<ul class="pagination">
								<c:if test="${pageMaker.prev}">
									<li class="paginate_button">
										<a href="#">이전</a>
									</li>
								</c:if>
										
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
											<li class="paginate_button">
												<a href="#">${num}</a>
											</li>
										</c:forEach>
										
										<c:if test="${pageMaker.next}">
											<li class="paginate_button next">
												<a href="#">이전</a>
											</li>
										</c:if>
									</ul>
								</div> --%>
								<!-- 페이징 처리 끝 -->
						
					</div>

				</div>

			</div>
		</div>
			<!--bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!--body-->
		<script>
		      let popupPlayer = function(url){
		          let moveTop=screen.height-440;
		           let moveLeft=screen.width-537;
		         window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
		      }
		</script>
<%@include file="../includes/footer.jsp" %>