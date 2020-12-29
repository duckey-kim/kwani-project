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
								<button class="button2">Library</button>
							</form>
						</div>
					</div>
				</div>
				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<button class="button">Recent Tracks</button>
							</h3>
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
								<c:forEach items="${libraryList}" var="library" begin="0"
									end="4">
									<tr>
										<td><a href="/detail/album?albumId=${library.ALBUM_ID}"><img src="/resources/image/album/${library.ALBUM_IMG}" class="myImg"></a></td>
										<td><a href="/detail/track?trackId=${library.TRACK_ID}"><c:out value="${library.TRACK_TTL}" /></a></td>
										<td><a href="/detail/artist?gropId=${library.GROP_ID}"><c:out value="${library.NM}" /></a></td>
										<td><c:out value="${library.PLAY_DT}" /></td>
										<td onclick='popupPlayer("/player/track?trackId=${library.TRACK_ID}")'><img src="/resources/image/play-button.png" class="play"></td>
										<td><img class="heart" name="${library.TRACK_ID}" src="/resources/image/heart.png">
										<img class="heart-empty" name="${library.TRACK_ID}" src="/resources/image/heart2.png"></td>
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
		<script type="text/javascript" src="/resources/js/like.js"></script>
		<script>
		      let popupPlayer = function(url){
		          let moveTop=screen.height-440;
		           let moveLeft=screen.width-537;
		         window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
		      }
		</script>
		
		<script>
			$(document).ready(function(){
				likedTrack();
				likeTrack();
			});
			
			function likedTrack(){
				$(".heart").hide();			
				<c:forEach items="${likedTrackList}" var="track">
					$("img[name='${track.TRACK_ID}'][class=heart]").show();
					$("img[name='${track.TRACK_ID}'][class=heart-empty]").hide();
				</c:forEach>
			}
			
			function likeTrack(){
				
				let trackId = "";
				let idx = "";
				
				// 빨간 하트 누르면 좋아요 테이블에 삭제
			 	$(document).on("click", ".heart", function(){
			 		idx = $(".heart").index(this);
			 		$(".heart:eq(" + idx + ")").hide();
					$(".heart-empty:eq(" + idx + ")").show();
					trackId = $(".heart:eq(" + idx + ")").attr("name");
					likeService.removeLikeTrack(trackId, function(obj){
						alert(obj);
					});
			 	});
				
				// 빈 하트 누르면 좋아요 테이블에 추가
			 	$(document).on("click", ".heart-empty", function(){
			 		idx = $(".heart-empty").index(this);
			 		$(".heart:eq(" + idx + ")").show();
					$(".heart-empty:eq(" + idx + ")").hide();
					trackId = $(".heart-empty:eq(" + idx + ")").attr("name");
					likeService.addLikeTrack(trackId, function(obj){
						alert(obj);
					});
			 	});
				
			}
		</script>
		<!--body-->
<%@include file="../includes/footer.jsp" %>