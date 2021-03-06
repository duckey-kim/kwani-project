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
						<div class="playlist-div-basic">
							<img class="myArtistImg" src="/resources/image/album/${playlistVO.plylstImg}" />
							<div class="title-div">
								<h2><c:out value="${playlistVO.nm}" /></h2>
								<h3><c:out value="${playlistVO.desc}" /></h3>
								<p style="font-size:13px; color:grey;">플레이리스트 곡 개수 : ${trackCount}</p>
								</div>
							</div>
						</div>
					</div>
							<div class="item-div-detail">
									<div class="play-btn-div">
										<button class="button6">듣기</button>
										<button class="button6" onclick='popupPlayer("/player/list?listId=${playlistVO.plylstId}")'>전체 듣기</button>
									</div>
									<table class="table">
										<tr>
											<th style="width:5%"><input type='checkbox' id='checkAll'></th>
											<th style="width:5%"></th>
											<th style="width:5%"></th>
											<th></th>
											<th style="width:10%"></th>
											<th style="width:25%"></th>
											<th style="width:5%"></th>
											<th style="width:5%"></th>
										</tr>
									<c:forEach items="${playlistDetail}" var="playlistDetail" varStatus="status">
										<tr>
											<td><input class="checkbox" type="checkbox" id="checkbox" name="trackId" value="${playlistDetail.TRACK_ID}"></td>										
											<td>${status.count}</td>	
											<td><a href="/detail/album?albumId=${playlistDetail.ALBUM_ID}"><img src="/resources/image/album/${playlistDetail.ALBUM_IMG}" class="myImg"></a></td>
											<td><a class="track-title" href="/detail/track?trackId=${playlistDetail.TRACK_ID}"><c:out value="${playlistDetail.TRACK_TTL}" /></a></td>
											<td><a class="artist-name" href="/detail/artist?gropId=${playlistDetail.GROP_ID}"><c:out value="${playlistDetail.ANM}" /></a></td>
											<td><a class="album-title" href="/detail/album?albumId=${playlistDetail.ALBUM_ID}"><c:out value="${playlistDetail.ALBUM_TTL}" /></a></td>
											<td onclick='popupPlayer("/player/track?trackId=${playlistDetail.TRACK_ID}")'><a href="#"><img src="/resources/image/play-button.png" class="play"></a></td>
											<td>
											<img class="track-heart" name="${playlistDetail.TRACK_ID}" src="/resources/image/heart.png">
											<img class="track-heart-empty" name="${playlistDetail.TRACK_ID}" src="/resources/image/heart2.png">
											</td>
										</tr>
									</c:forEach>
								</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--bodyContent-->
	
	
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
	<div id="rightSideBar"></div>
	<script>
		let popupPlayer = function(url){
			let moveTop=screen.height-440;
			let moveLeft=screen.width-537;
			window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
	    }
		
		$(document).ready(function(){
			showLike();
			likeTrack();
		});
				
		// 좋아요 여부에 따라 하트 나타나도록..
		function showLike(){
			$("img[class=track-heart-empty]").show();
			$("img[class=track-heart]").hide();
			
			<c:forEach items="${likedTrackList}" var="track">
				$("img[name='${track.TRACK_ID}'][class=track-heart]").show();
				$("img[name='${track.TRACK_ID}'][class=track-heart-empty]").hide();
			</c:forEach>
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
		
		// 기본 모달 내용 변경 함수
		function basicModalContent(content){
			$(".modal-body").text(content);
			$(".modalBtn").hide();
			$(".modal-close").hide();
			$("#myModal").attr("style", "display:block");
			setTimeout(function(){$("#myModal").attr("style", "display:none");}, 800);
		}
		
		// 전체 선택 - 모든 체크박스 선택
		// 전체 해제 - 모든 체크박스 해제
		$(document).on("click", "#checkAll", function(){
			if($("#checkAll").prop("checked")){
				$(".checkbox").prop("checked", true);
				return;
			}
			$(".checkbox").prop("checked", false);
		});
				
		// 하나라도 선택이 없을 경우 - 전체선택 해제	
		// 모두 선택되었을 경우 - 전체선택 체크
		$(document).on("click", ".checkbox", function(){
			if($("#checkAll:checked").length == $(".checkbox").length){
				$(".checkbox").prop("checked", true);
				return;
			}
			$("#checkAll").prop("checked", false);
		});
	</script>
	<!--body-->
<%@include file="../includes/footer.jsp" %>