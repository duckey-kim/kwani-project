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
						<img class="userImg" src="/resources/image/userUpload/${user.userImg}" />
					</div>

					<div>
						<div class="userNick">
							<c:out value="${user.nick}" />
						</div>
					</div>
				</div>
				<div class="mypage-nav">
					<div class='nav-left'>
						<div class="nav-item">
							<form action="/mypage/overview" method="post">
								<button class="button2">Overview</button>
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
								<div class="head">
									<button class="button">Library</button>
									<button class="more-track"> more track</button>
								</div>
							</form>
						</div>
						<div class="item-body">
							<table class="table">
								<tr>
								<th style="width:10%"></th>
								<th style="width:40%"></th>
								<th style="width:10%"></th>
								<th ></th>
								<th style="width:5%"></th>
								<th style="width:5%"></th>
								</tr>
								<c:forEach items="${libraryList}" var="library" begin="0" end="4">
									<tr>
										<td><a href="/detail/album?albumId=${library.ALBUM_ID}"><img src="/resources/image/album/${library.ALBUM_IMG}" class="myImg"></a></td>
										<td><a class="track-title" href="/detail/track?trackId=${library.TRACK_ID}"><c:out value="${library.TRACK_TTL}" /></a></td>
										<td><a class="artist-name" href="/detail/artist?gropId=${library.GROP_ID}"><c:out value="${library.NM}" /></a></td>
										<td class="play-date"><c:out value="${library.PLAY_DT}" /></td>
										<td onclick='popupPlayer("/player/track?trackId=${library.TRACK_ID}")'><img src="/resources/image/play-button.png" class="play"></td>
										<td><img class="track-heart" name="${library.TRACK_ID}" src="/resources/image/heart.png">
										<img class="track-heart-empty" name="${library.TRACK_ID}" src="/resources/image/heart2.png"></td>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					<div class="body-item bg-bl">
						<div class="item-header">
							<form action="/mypage/like" method="post">
								<div class="head">
									<button class="button">Liked Artists</button>
									<button class="more-track"> more artist </button>
								</div>
							</form>
						</div>
							<div class="item-div">
								<c:forEach items="${likedArtistList}" var="artist" begin="0" end="3">
									<div class="artist-td">
									<div class="img-background">
										<img class="myArtistImg" src="/resources/image/artist/${artist.GROP_IMG}" onclick= 'location.href="/detail/artist?gropId=${artist.GROP_ID}"'>
									</div>
											<div class="middle">
												<a class="text" href="/detail/artist?gropId=${artist.GROP_ID}">${artist.NM}</a><br>
											<img class="artist-heart" name="${artist.GROP_ID}" src="/resources/image/heart.png">
											<img class="artist-heart-empty" name="${artist.GROP_ID}" src="/resources/image/whiteheart.png">												
											</div>
									</div>
								</c:forEach>
							</div>
					</div>

					<div class="body-item bg-bl">
						<div class="item-header">
							<form action="/mypage/like" method="post">
								<div class="head">
									<button class="button">Like Albums</button>
									<button class="more-track"> more album </button>
								</div>
							</form>
						</div>
						<div class="item-div">
							<c:forEach items="${likedAlbumList}" var="album" begin="0" end="3">
								<div class="artist-td">
									<div class="img-background">
									<img class="myArtistImg" src="/resources/image/album/${album.ALBUM_IMG}" onclick='location.href="/detail/album?albumId=${album.ALBUM_ID}"'>
									<img class="play-png" src="/resources/image/play.png" onclick='popupPlayer("/player/album?albumId=${album.ALBUM_ID}")'>
									</div>
										<div class="middle">
											<a class="text" href="/detail/album?albumId=${album.ALBUM_ID}">${album.ALBUM_TTL}</a><br>
											<img class="album-heart" name="${album.ALBUM_ID}" src="/resources/image/heart.png">
											<img class="album-heart-empty" name="${album.ALBUM_ID}" src="/resources/image/whiteheart.png">
										</div>
								</div>
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
						<div class="item-body">
						<table class="table">
							<tr>
								<th style="width:10%"></th>
								<th style="width:40%"></th>
								<th style="width:10%"></th>
								<th></th>
								<th style="width:5%"></th>
								<th style="width:5%"></th>
							</tr>
							<c:forEach items="${likedTrackList}" var="track" begin="0" end="4">
								<tr>
									<td><a href="/detail/album?albumId=${track.ALBUM_ID}"><img src="/resources/image/album/${track.ALBUM_IMG}" class="myImg"></a></td>
									<td><a class="track-title" href="/detail/track?trackId=${track.TRACK_ID}"><c:out value="${track.TRACK_TTL}" /></a></td>
									<td><a class="artist-name" href="/detail/artist?gropId=${track.GROP_ID}"><c:out value="${track.NM}" /></a></td>
									<td><a class="album-title" href="/detail/album?albumId=${track.ALBUM_ID}"><c:out value="${track.ALBUM_TTL}" /></a></td>
									<td onclick='popupPlayer("/player/track?trackId=${track.TRACK_ID}")'>
									<img class="play" src="/resources/image/play-button.png"></td>
									<td>
									<img class="track-heart" name="${track.TRACK_ID}" src="/resources/image/heart.png">
									<img class="track-heart-empty" name="${track.TRACK_ID}" src="/resources/image/heart2.png">
									</td>
								</tr>
							</c:forEach>
						</table>
						</div>
					</div>
				</div>
			</div>

		</div>
		<!--bodyContent-->
		<div id="rightSideBar"></div>
	</div>
	<!--body-->
	
	<!-- 모달창 -->
	<div id="myModal" class="modal">
		<div class="modal-overlay"></div>
		<!-- content -->
		<div class="modal-content">
			<div class="modal-close">&times;</div>
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel"></h4>
			</div>
			<div class="modal-body">기본</div>
			<div class="modal-footer">
			<div>
				<form action="/mypage/playlist/delete" method="post">
					<input class="plylstDel" type="hidden" value="" name="plylstId">
					<input class="email" type="hidden" value="${user.email}" name="email">
					<button class="modalBtn">삭제하기</button>
				</form>
			</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" src="/resources/js/like.js"></script>
	<script>	
		let popupPlayer = function(url){
	        let moveTop=screen.height-440;
	         let moveLeft=screen.width-537;
	       window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
	    }

		$(document).ready(function(){
			showLike();
			likeTrack();
			likeArtist();
			likeAlbum();
		});
				
		// 좋아요 여부에 따라 하트 나타나도록..
		function showLike(){
			$("img[class=track-heart-empty]").show();
			$("img[class=track-heart]").hide();
			
			<c:forEach items="${likedTrackList}" var="track">
				$("img[name='${track.TRACK_ID}'][class=track-heart]").show();
				$("img[name='${track.TRACK_ID}'][class=track-heart-empty]").hide();
			</c:forEach>
			
			$("img[class=artist-heart-empty]").hide();
			$("img[class=artist-heart]").show();

			$("img[class=album-heart-empty]").hide();
			$("img[class=album-heart]").show();
		}
		
		function likeTrack(){
			
			let trackId = "";
			let idx = "";
			
			// 빨간 하트 누르면 좋아요 테이블에 삭제
		 	$(document).on("click", ".track-heart", function(){
		 		idx = $(".track-heart").index(this);
		 		$(".track-heart:eq(" + idx + ")").hide();
				$(".track-heart-empty:eq(" + idx + ")").show();
				trackId = $(".track-heart:eq(" + idx + ")").attr("name");
				likeService.removeLikeTrack(trackId, function(obj){
					if(obj === 'SUCCESS'){
						basicModalContent("좋아요를 취소했습니다");
						return;
					}
					basicModalContent("좋아요 취소를 실패했습니다");
				});
		 	});
			
			// 빈 하트 누르면 좋아요 테이블에 추가
		 	$(document).on("click", ".track-heart-empty", function(){
		 		idx = $(".track-heart-empty").index(this);
		 		$(".track-heart:eq(" + idx + ")").show();
				$(".track-heart-empty:eq(" + idx + ")").hide();
				trackId = $(".track-heart-empty:eq(" + idx + ")").attr("name");
				likeService.addLikeTrack(trackId, function(obj){
					if(obj === 'SUCCESS'){
						basicModalContent("이 노래를 좋아합니다");
						return;
					}
					basicModalContent("좋아요 리스트 추가에 실패했습니다");
				});
		 	});
			
		}
		
		function likeArtist(){
			
			let artistId = "";
			let idx = "";
			
			// 빨간 하트 누르면 좋아요 테이블에 삭제
		 	$(document).on("click", ".artist-heart", function(){
		 		idx = $(".artist-heart").index(this);
		 		$(".artist-heart:eq(" + idx + ")").hide();
				$(".artist-heart-empty:eq(" + idx + ")").show();
				artistId = $(".artist-heart:eq(" + idx + ")").attr("name");
				likeService.removeLikeArtist(artistId, function(obj){
					if(obj === 'SUCCESS'){
						basicModalContent("좋아요를 취소했습니다");
						return;
					}
					basicModalContent("좋아요 취소를 실패했습니다");
				});
		 	});
			
			// 빈 하트 누르면 좋아요 테이블에 추가
		 	$(document).on("click", ".artist-heart-empty", function(){
		 		idx = $(".artist-heart-empty").index(this);
		 		$(".artist-heart:eq(" + idx + ")").show();
				$(".artist-heart-empty:eq(" + idx + ")").hide();
				artistId = $(".artist-heart-empty:eq(" + idx + ")").attr("name");
				likeService.addLikeArtist(artistId, function(obj){
					if(obj === 'SUCCESS'){
						basicModalContent("이 가수를 좋아합니다");
						return;
					}
					basicModalContent("좋아요 리스트 추가에 실패했습니다");
				});
		 	});
			
		}
		
		function likeAlbum(){
			
			let albumId = "";
			let idx = "";
			
			// 빨간 하트 누르면 좋아요 테이블에 삭제
		 	$(document).on("click", ".album-heart", function(){
		 		idx = $(".album-heart").index(this);
		 		$(".album-heart:eq(" + idx + ")").hide();
				$(".album-heart-empty:eq(" + idx + ")").show();
				albumId = $(".album-heart:eq(" + idx + ")").attr("name");
				likeService.removeLikeAlbum(albumId, function(obj){
					if(obj === 'SUCCESS'){
						basicModalContent("좋아요를 취소했습니다");
						return;
					}
					basicModalContent("좋아요 취소를 실패했습니다");
				});
		 	});
			
			// 빈 하트 누르면 좋아요 테이블에 추가
		 	$(document).on("click", ".album-heart-empty", function(){
		 		idx = $(".album-heart-empty").index(this);
		 		$(".album-heart:eq(" + idx + ")").show();
				$(".album-heart-empty:eq(" + idx + ")").hide();
				albumId = $(".album-heart-empty:eq(" + idx + ")").attr("name");
				likeService.addLikeAlbum(albumId, function(obj){
					if(obj === 'SUCCESS'){
						basicModalContent("이 앨범을 좋아합니다");
						return;
					}
					basicModalContent("좋아요 리스트 추가에 실패했습니다");
				});
		 	});
			
		}
		
		// 기본 모달 내용 변경 함수
		function basicModalContent(content){
			$(".modal-body").text(content);
			$(".modalBtn").hide();
			$(".modal-close").hide();
			$("#myModal").attr("style", "display:block");
			setTimeout(function(){$("#myModal").attr("style", "display:none");}, 800);
		}
		
	</script>
	
	<%@include file="../includes/footer.jsp" %>