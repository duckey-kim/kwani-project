<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>track</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/js/jquery-3.5.1.js" /></script>
<script defer src="/resources/js/indexNoVideo.js"></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/indexNoVideoYC.css">
<link rel="stylesheet" type="text/css" href="/resources/css/track.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/noVideoHeader.css">
</head>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="emptybox"></div>
		<div>
			<h2>곡 정보</h2>
		</div>

		<div class="music-header">

			<div class="album-jacket">
				<c:forEach items="${getTrackList }" var="TrackList" begin="0"
					end="0">
					<img
						src="/resources/image/album/<c:out value="${TrackList.ALBUM_IMG }" />"
						style="max-height: 196px">
				</c:forEach>
			</div>

			<div class="header-item">

				<c:forEach items="${getTrackList }" var="TrackList" begin="0"
					end="0">
					<div>
						<h3>
							<c:out value="${TrackList.TRACK_TTL }" />
						</h3>
					</div>

					<pre>
							</pre>

					<div>
						<h4>
							<a style="color: gray"
								href="/detail/album?albumId=<c:out value="${TrackList.ALBUM_ID }"/>"><c:out
									value="${TrackList.ALBUM_TTL }" /></a>
						</h4>
					</div>
				</c:forEach>

				<pre>
						</pre>

				<div class="artist-name">

					<c:forEach items="${getTrackList }" var="TrackList">
						<div>
							<a style="color: gray"
								href="/detail/artist?gropId=<c:out value="${TrackList.GROP_ID }" />"><c:out
									value="${TrackList.NM }" /> </a>
						</div>
						<pre> </pre>
					</c:forEach>
				</div>

				<div class="emptybox2"></div>

				<div class="header-buttons">
					<button type="button" id="playNow"
						onclick='popupPlayer("/player/track?trackId=${trackId}")'>
						⯈ 듣기</button>
					<button type="button" id="addPlayer" style="display: none">
						플레이어에 추가</button>
					<button type="button" id="addMyPlaylist">내 재생목록 추가</button>
					<input type="button" value="공유하기" onclick="copyURL()">
					<textarea id="address" style="display: none"></textarea>
					<img class="emptyHeart" id="likeTrack"
						src="/resources/image/heart2.png"> <img class="redHeart"
						id="likeTrack" src="/resources/image/heart.png">
				</div>

			</div>
		</div>



		<div class="emptybox2"></div>

		<div class="music-play">
			<div class="youtube-link">
				<!-- <div>유튜브 영상</div> -->
				<c:forEach items="${getTrackList }" var="TrackList" begin="0"
					end="0">
					<iframe width="100%" height="100%"
						src="https://www.youtube.com/embed/<c:out value="${TrackList.TRACK_URL }" />"
						frameborder="0" allowfullscreen></iframe>
				</c:forEach>
			</div>
			<div class="lyrics">
				<c:forEach items="${getTrackList }" var="TrackList" begin="0"
					end="0">
					<div style="overflow-x: hidden; overflow-y: auto">
						<pre><c:out value="${TrackList.TRACK_LYRICS }" /></pre>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="emptybox"></div>

		<div class="subtitle">
			<h2>관련 아티스트 앨범></h2>
		</div>
		<div class="related">
			<div class="items">

				<c:forEach items="${getAlbumList }" var="AlbumList">
					<div class="item">
						<a
							href="/detail/album?albumId=<c:out value="${AlbumList.ALBUM_ID }"/>">
							<img
							src="/resources/image/album/<c:out value="${AlbumList.ALBUM_IMG }" />"
							style="max-height: 200px">
						</a> <a style="color: black"
							href="/detail/album?albumId=<c:out value="${AlbumList.ALBUM_ID }"/>"><c:out
								value="${AlbumList.ALBUM_TTL }" /></a>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="emptybox"></div>

		<div class="related">
			<div class="subtitle">
				<h2>관련 플레이리스트></h2>
			</div>
			<div class="items">
				<div class="item">
					<a href="#"> <img src="/resources/image/1.jpg"
						style="max-height: 200px">
					</a> <a href="#" style="color: black">플레이리스트 제목</a>
				</div>
				<div class="item">
					<a href="#"> <img src="/resources/image/2.jpg"
						style="max-height: 200px">
					</a> <a href="#" style="color: black">플레이리스트 제목</a>
				</div>
				<div class="item">
					<a href="#"> <img src="/resources/image/3.jpg"
						style="max-height: 200px">
					</a> <a href="#" style="color: black">플레이리스트 제목</a>
				</div>
			</div>
		</div>

		<div class="emptybox"></div>

	</div>
	<!--bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!--body-->

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
<!-- <div id="footer"></div> -->
</div>
<!--main-->

<!-- 모달창 -->
<div id="modal">
	<div class="modal-content">
		<h2>${userNick }님의플레이리스트</h2>

		<div id="playlists">
			<table>
				<c:forEach items="${getPlaylists }" var="Playlists">
					<tr>
						<td><img style="width: 50px" class="playlistImage"
							src="/resources/image/album/<c:out value="${Playlists.PLYLST_IMG }" />" />
						</td>
						<td><c:out value='${Playlists.NM }' /></td>
						<td><c:out value='${Playlists.TRACK_CNT }' />곡</td>
						<td>
							<button value='${Playlists.PLYLST_ID }' class="selectPlaylist">선택</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div id="modal-buttons">
			<button type="button" id="modalCloseBtn">취소</button>
		</div>
	</div>
	<div class="modal-layer"></div>
</div>
<!-- 모달창 끝 -->

<script>
	if ('${sessionName}' == "") { // 세션이 없을경우 로그인이 필요한 기능들은 로그인 페이지로 이동시킨다.
		// 빨간 하트를 숨긴다.
		$(".redHeart").hide();

		// 내 재생목록에 추가 기능
		document.getElementById("addMyPlaylist").addEventListener("click",
				goLogin);

		// 앨범 좋아요 기능
		document.getElementById("likeTrack").addEventListener("click", goLogin);

	} else { // 세션이 있을 경우 실행할 메서드들

		likeTrack();
		addMyPlaylist();
		selectPlaylist();
	}

	function addPlayer() {

	}

	function likeTrack() {
		let trackId = $
		{
			trackId
		}
		;

		if ('${checkLikeTrack}' != "") { // 해당 노래를 좋아요 여부에 따라 페이지 로딩에 보여주는 하트를 다르게한다.
			$(".emptyHeart").hide(); // 좋아요 했다면 빈 하트를 숨기고 빨간 하트를 보여준다.
		} else {
			$(".redHeart").hide(); // 좋아요 하지 않았다면 빨간 하트를 숨기고 빈 하트를 보여준다. 
		}

		//빈 하트 클릭할 때
		$(".emptyHeart").on("click", function() {

			$(".emptyHeart").hide(); //누른 하트를 숨기기
			$(".redHeart").show(); //누른 곳에 빨간 하트를 표시
			console.log("좋아요할 노래 아이디 : " + '${trackId}');

			addLikeTrack(trackId);
		});

		//빨간 하트 클릭할때
		$(".redHeart").on("click", function() {

			$(".redHeart").hide(); //누른 하트를 숨기기
			$(".emptyHeart").show(); //누른 곳에 빈 하트를 표시
			console.log("좋아요 취소할 노래 아이디 : " + '${trackId}');

			removeLikeTrack(trackId);
		});
	}

	// 내 재생목록에 추가 버튼 (모달창)
	function addMyPlaylist() {
		$("#addMyPlaylist").click(function() {
			$("#modal").attr("style", "display:block");
		});

		$("#modalCloseBtn").click(function() {
			$("#modal").attr("style", "display:none");
		});
	}

	// 모달창 내 플레이리스트 선택 버튼
	function selectPlaylist() {
		$(".selectPlaylist")
				.on(
						"click",
						function() {
							let index = $(".selectPlaylist").index(this);
							console.log("누른 버튼의 플레이리스트 아이디 : "
									+ $(".selectPlaylist:eq(" + index + ")")
											.val());
							console.log("넣을 노래아이디 : " + '${trackId}');

							$("#modal").attr("style", "display:none");

							// 넣을 플레이리스트ID
							let plylstId = $(
									".selectPlaylist:eq(" + index + ")").val();

							// 재생목록에 추가할 트랙ID들을 담는 배열
							let trackIdArr = new Array();
							let tmpTrackId = '${trackId}';
							trackIdArr.push(tmpTrackId);

							addToPlaylist(trackIdArr, plylstId);
						});
	}

	function goLogin() { // 로그아웃 상태에서 로그인이 필요한 기능을 사용하려고 할때 로그인 페이지로 이동

		location.href = "/user/login";

	}

	function copyURL() {
		var address = document.getElementById("address");
		address.innerHTML = location.href; //textarea 안에 주소를 집어 넣는다.
		address.style.display = 'block'; //textarea의 display를 block으로 변경
		address.select(); //textarea의 내용 전체 선택
		document.execCommand("copy"); //복사
		address.style.display = 'none'; //textarea의 display를 none으로 변경
		//obj.setSelectionRange(0, 0); //커서 위치 초기화
		alert("주소가 복사되었습니다.")
	}

	function addLikeTrack(trackId) {
		$.ajax({
			type : 'post',
			url : '/detail/addLikeTrack',
			data : JSON.stringify(trackId),
			contentType : 'text/plain; charset=utf-8;', // 서버로 보내는 데이터 타입

			success : function(data) {
				console.log("data : " + data);
				if (data == 1) {
					alert("이 노래를 좋아합니다.");
				} else {
					alert("좋아요 리스트 추가에 실패했습니다.")
				}
			},
			error : function() {

			}
		});
	}

	function removeLikeTrack(trackId) {
		$.ajax({
			type : 'post',
			url : '/detail/removeLikeTrack',
			data : JSON.stringify(trackId),
			contentType : 'text/plain; charset=utf-8;', // 서버로 보내는 데이터 타입

			success : function(data) {
				console.log("data : " + data);
				if (data == 1) {
					alert("좋아요를 취소하셨습니다.");
				} else {
					alert("좋아요 취소를 실패했습니다.")
				}
			},
			error : function() {

			}
		});
	}

	function addToPlaylist(trackIdArr, plylstId) {
		console.log("플레이리스트ID : " + plylstId);

		var objParams = {
			"plylstId" : plylstId,
			"trackIdArr" : trackIdArr
		};

		$.ajax({
			type : 'post',
			url : '/detail/addTracksInPlaylist',
			data : objParams,
			contentType : 'application/x-www-form-urlencoded; charset=utf-8;', // 서버로 보내는 데이터 타입
			dataType : 'json', // 서버로부터 받는 데이터 타입

			success : function(data) {
				console.log("data : " + data);
				if (data == 1) {
					alert("중복곡을 제외하고 플레이리스트에 추가했습니다.");
				} else {
					alert("존재하지 않는 플레이리스트 입니다. 새로고침 후 다시 시도해주세요.")
				}
			},
			error : function() {

			}
		});
	}

	let popupPlayer = function(url) {
		let moveTop = screen.height - 440;
		let moveLeft = screen.width - 537;
		window
				.open(
						url,
						'player',
						'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='
								+ moveTop + ',left=' + moveLeft);
	}
</script>

</body>
</html>