<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Overview</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/mypage.css" />

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
							<form action="/mypage/library" method="post">
								<h3>
									<button class="button">Recent Tracks</button>
								</h3>
							</form>
						</div>
						<div class="item-body">
							<table>
								<tr>
								<th class="th1"></th>
								<th class="th4"></th>
								<th class="th3"></th>
								<th class="th3"></th>
								<th class="th1"></th>
								<th class="th1"></th>
								</tr>
								<c:forEach items="${libraryList}" var="library" begin="0" end="4">
									<tr>
										<td><img src="/resources/image/album/${library.ALBUM_IMG}" class="myImg"
											onclick='href="/detail/album?albumId=${library.ALBUM_ID}"'></td>
										<td><a href="/detail/track?trackId=${library.TRACK_ID}"><c:out value="${library.TRACK_TTL}" /></a></td>
										<td><a href="/detail/artist?gropId=${library.GROP_ID}"><c:out value="${library.NM}" /></a></td>
										<td><c:out value="${library.PLAY_DT}" /></td>
										<td onclick='popupPlayer("/player/track?trackId=${library.TRACK_ID}")'><img src="/resources/image/play-button.png" class="play"></td>
										<td class="heart-td">
										<img name="${library.TRACK_ID}" src="/resources/image/heart.png" class="heart" style="width:20px; height:20px">
										<img name="${library.TRACK_ID}" src="/resources/image/heart2.png" class="heart-empty" style="width:20px; height:20px"></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="body-item bg-bl">
						<div class="item-header">
							<form action="/mypage/like" method="post">
								<h3>
									<button class="button">Liked Artists</button>
								</h3>
							</form>
						</div>
							<div class="item-div">
								<c:forEach items="${likedArtistList}" var="artist" begin="0" end="2">
									<table class="basicTable">
										<tr>
											<th class="th"></th>
											<th class="th"></th>
										</tr>
										<tr>
											<td class="td8" colspan="2"><img class="myArtistImg" src="/resources/image/artist/${artist.GROP_IMG}"
																		onclick= 'location.href="/detail/artist?gropId=${artist.GROP_ID}"'></td>
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
							<form action="/mypage/like" method="post">
								<h3>
									<button class="button">Like Albums</button>
								</h3>
							</form>
						</div>
						<div class="item-div">

							<c:forEach items="${likedAlbumList}" var="album" begin="0" end="2">
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
							<form action="/mypage/like" method="post">
								<h3>
									<button class="button">Like Tracks</button>
								</h3>
							</form>
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
									<td><img src="/resources/image/heart.png" class="play"></td>
								</tr>
							</c:forEach>
						</table>

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

		$(document).ready(function(){
			likedTrack();
		});
		
		function likedTrack(){
			$(".heart").hide();
			
			<c:forEach items="${likedTrackList}" var="track">
				$("img[name='${track.TRACK_ID}'][class=heart]").show();
				$("img[name='${track.TRACK_ID}'][class=heart-empty]").hide();
			</c:forEach>
		}
		
		// 빨간 하트 누르면 좋아요 테이블에 추가
	 	$(document).on("click", ".heart", function(){
	 		let idx = $(".heart").index(this);
	 		$(".heart:eq(" + idx + ")").hide();
			$(".heart-empty:eq(" + idx + ")").show();
	 	});
		
		// 빈 하트 누르면 좋아요 테이블에 삭제
	 	$(document).on("click", ".heart-empty", function(){
	 		let idx = $(".heart-empty").index(this);
	 		$(".heart:eq(" + idx + ")").show();
			$(".heart-empty:eq(" + idx + ")").hide();
	 	});
		
	</script>
	
	<%@include file="../includes/footer.jsp" %>