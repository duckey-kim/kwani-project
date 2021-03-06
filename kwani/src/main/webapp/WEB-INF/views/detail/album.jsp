<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>album</title>
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="/resources/js/jquery-3.5.1.js" /></script>
<link rel="stylesheet" type="text/css"
	href="/resources/css/indexNoVideoYC.css">
<link rel="stylesheet" type="text/css" href="/resources/css/album.css">
<link rel="stylesheet" type="text/css" href="/resources/css/footer.css">
<link rel="stylesheet" type="text/css" href="/resources/css/noVideoHeader.css">

</head>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>

		<div id="body">
			<div id="leftSideBar"></div>
			<div id="bodyContent">
				<div class="emptybox"></div>
				<div>
					<h2>앨범 정보</h2>
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
								<h3>
									<c:out value="${AlbumInfo.ALBUM_TTL }" />
								</h3>
							</div>
						</c:forEach>

						<pre>
						</pre>

						<div class="artist-name">

							<c:forEach items="${getAlbumArtistList }" var="ArtistList">
								<div>
									<a style="color: grey"
										href="/detail/artist?gropId=<c:out value="${ArtistList.GROP_ID }" />"><c:out
											value="${ArtistList.NM }" /> </a>
								</div>
								<pre> </pre>
							</c:forEach>
						</div>

						<pre>
						</pre>

						<div>
							<c:forEach items="${getAlbumInfoList }" var="AlbumInfo" begin="0"
								end="0">
								<pre style="display:none">장르	: <c:out value="${AlbumInfo.GENRE_CD }" />
								</pre>
								<pre>발매일	: <c:out value="${AlbumInfo.RLESDT }" />
								</pre>
							</c:forEach>
						</div>
						
						<div class="emptybox2"></div>

						<div class="header-buttons">
							<button type="button" id="playNow" class="btn"
								onclick='popupPlayer("/player/album?albumId=${albumId}")'>⯈앨범듣기</button>
							<button type="button" id="addPlayer" style="display: none">플레이어에 추가</button>
							<button class="btn" type="button" id="addAlbumMyPlaylist">내 재생목록에 담기</button>
							<input class="btn" type="button" value="공유하기" onclick="copyURL()">
							<textarea id="address" style="display: none"></textarea>
							<img class="emptyHeart1" id="likeAlbum" src="/resources/image/heart2.png"> 
							<img class="redHeart1" id="likeAlbum" src="/resources/image/heart.png">
						</div>

					</div>
				</div>



				<div class="emptybox"></div>
				<div class="related">
					<div class="subtitle">
						<h2>앨범 수록곡</h2>
					</div>
					<div class="subtitle" style="text-align:right">
						<button class="btn" onclick="addPlayer()"> 듣기 </button>
						<button class="btn" id="addCheckedTrackMyPlaylist"> 내 재생목록에 담기 </button>
					</div>
					<div class="items">
						<table>
							<tr style="background-color: #f5f5f5">
								<th><input type="checkbox" class="checkAll" onclick="checkAll()"></th>
								<th>순서</th>
								<th>곡</th>
								<th>아티스트</th>
								<th>재생목록</th>
								<th>듣기</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${getAlbumInfoList }" var="AlbumInfo">
								<tr>
									<td><input type="checkbox" id="checkRow" value="${AlbumInfo.TRACK_ID }"></td>
									<td><c:out value="${AlbumInfo.TRACK_ORDER }" /></td>
									<td><a style="color: black"
										href="/detail/track?trackId=<c:out value='${AlbumInfo.TRACK_ID }' />"><b><c:out
												value="${AlbumInfo.TRACK_TTL }" /></b></a></td>
									<td><a style="color: grey"
										href="/detail/artist?gropId=<c:out value="${AlbumInfo.GROP_ID }" />"><c:out
												value="${AlbumInfo.NM }" /> </a></td>
									<td>
										<button class="btn" value='${AlbumInfo.TRACK_ID }'
											name="addTrackMyPlaylist">내 재생목록에 담기</button>
									</td>
									<td>
										<img src="/resources/image/play-button.png"
										class="playbuttonImg"
										onclick='popupPlayer("/player/track?trackId=${AlbumInfo.TRACK_ID}")'>
									</td>
									<td><img title="${AlbumInfo.TRACK_ID }"
										class="emptyHeart2" name="likeTrack"
										src="/resources/image/heart2.png"> <img
										title="${AlbumInfo.TRACK_ID }" class="redHeart2"
										name="likeTrack" src="/resources/image/heart.png"></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>

				<div class="emptybox"></div>

			</div>
			<!--bodyContent-->
			<div id="rightSideBar"></div>
		</div>
		<!--body-->
		<%@ include file="/WEB-INF/views/includes/footer.jsp"%>
	<!--main-->

	<!-- 앨범전체를 위한 모달창 -->
	<div id="modal">
		<div class="modal-content">
			<h2>${user.nick }님의 플레이리스트 ></h2>

			<div id="playlists">
				<table>
					<tr style="background-color: #f5f5f5">
						<th></th>
						<th>플레이리스트 이름</th>
						<th></th>
					</tr>
					<c:forEach items="${getPlaylists }" var="Playlists">
						<tr>
							<td><img style="width: 50px" class="playlistImage"
								src="/resources/image/album/<c:out value="${Playlists.PLYLST_IMG }" />" />
							</td>
							<td><c:out value='${Playlists.NM }' /></td>
							<%-- <td><c:out value='${Playlists.TRACK_CNT }' />곡</td> --%>
							<td>
								<button value='${Playlists.PLYLST_ID }' class="selectPlaylist btn">선택</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="modal-buttons">
				<button type="button" id="modalCloseBtn" class="btn">닫기</button>
			</div>
		</div>
		<div class="modal-layer"></div>
	</div>
	<!-- 앨범전체를 위한 모달창 끝 -->

	<!-- 앨범 내 수록곡을 위한 모달창 -->
	<div id="modal1">
		<div class="modal-content">
			<h2>${user.nick }님의 플레이리스트 ></h2>

			<div id="playlists">
				<table>
					<tr style="background-color: #f5f5f5">
						<th></th>
						<th>플레이리스트 이름</th>
						<th></th>
					</tr>
					<c:forEach items="${getPlaylists }" var="Playlists">
						<tr>
							<td><img style="width: 50px" class="playlistImage"
								src="/resources/image/album/<c:out value="${Playlists.PLYLST_IMG }" />" />
							</td>
							<td><c:out value='${Playlists.NM }' /></td>
							<%-- <td><c:out value='${Playlists.TRACK_CNT }' />곡</td> --%>
							<td>
								<button value='${Playlists.PLYLST_ID }' class="selectPlaylist1 btn">선택</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="modal-buttons">
				<button type="button" id="modalCloseBtn1" class="btn">취소</button>
			</div>
		</div>
		<div class="modal-layer"></div>
	</div>
	<!-- 앨범 내 수록곡을 위한 모달창 끝 -->
	
	<!-- 체크된 곡을 위한 모달창 -->
	<div id="modal2">
		<div class="modal-content">
			<h2>${user.nick }님의 플레이리스트 ></h2>

			<div id="playlists">
				<table>
					<tr style="background-color: #f5f5f5">
						<th></th>
						<th>플레이리스트 이름</th>
						<th></th>
					</tr>
					<c:forEach items="${getPlaylists }" var="Playlists">
						<tr>
							<td><img style="width: 50px" class="playlistImage"
								src="/resources/image/album/<c:out value="${Playlists.PLYLST_IMG }" />" />
							</td>
							<td><c:out value='${Playlists.NM }' /></td>
							<%-- <td><c:out value='${Playlists.TRACK_CNT }' />곡</td> --%>
							<td>
								<button value='${Playlists.PLYLST_ID }' class="selectPlaylist2 btn">선택</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="modal-buttons">
				<button type="button" id="modalCloseBtn2" class="btn">취소</button>
			</div>
		</div>
		<div class="modal-layer"></div>
	</div>
	<!-- 체크된 곡을 위한 모달창 끝 -->
	
	
	<!-- 알림용 모달창 -->
	<div id="noticeModal">
		<div class="modal-content">
			<div id="notice" style="text-align:center"></div>
		</div>
		<div class="modal-layer"></div>
	</div>
	<!-- 알림용 모달창 끝 -->

	<script>
		let tmpTrackId;

		if ('${user.email}' == "") { // 세션이 없을경우 로그인이 필요한 기능들은 로그인 페이지로 이동시킨다.
			// 빨간 하트를 숨긴다.
			$(".redHeart1, .redHeart2").hide();

			// 앨범전체 내 재생목록에 추가 기능
			document.getElementById("addAlbumMyPlaylist").addEventListener(
					"click", goLogin);

			// 앨범 좋아요 기능
			document.getElementById("likeAlbum").addEventListener("click",
					goLogin);

			// 개별 곡 내 재생목록에 추가 기능
			var amp = document.getElementsByName("addTrackMyPlaylist");
			for (var i = 0; i < amp.length; i++) {
				amp[i].addEventListener("click", goLogin);
			}
			
			// 선택된 곡 내 플레이리스트에 추가 기능
			$("#addCheckedTrackMyPlaylist").on("click", goLogin);

			// 개별 곡 좋아요 기능
			var lt = document.getElementsByName("likeTrack");
			for (var i = 0; i < lt.length; i++) {
				lt[i].addEventListener("click", goLogin);
			}

		} else {

			addAlbumMyPlaylist();
			addTrackMyPlaylist();
			countCheckboxLength();
			likeAlbum();
			likeTrack();
			selectPlaylist();
			selectPlaylist1();
			selectPlaylist2();

		}

		function addPlayer() {
			
			let checkedTracks = [];
			$('input:checkbox[id=checkRow]:checked').each(function () {
				checkedTracks.push($(this).val());
			});
			
			if(checkedTracks.length == 0){
				noticeModal("체크된 항목이 없습니다.");
			}else if(checkedTracks.length == 1){
				let trackId = checkedTracks[0];
				popupPlayer("/player/track?trackId="+trackId);
			}else{
				let url = "/player/track?trackId=" ;
				for (let i in checkedTracks){
					if(i != checkedTracks.length-1){
						url += checkedTracks[i] + "&trackId=";
					}else{
						url += checkedTracks[i];
					}
				}
				popupPlayer(url);
			}
		}

		// 앨범 좋아요
		function likeAlbum() {
			let albumId = ${albumId};

			if ('${checkLikeAlbum}' != "") { // 해당 노래를 좋아요 여부에 따라 페이지 로딩에 보여주는 하트를 다르게한다.
				$(".emptyHeart1").hide(); // 좋아요 했다면 빈 하트를 숨기고 빨간 하트를 보여준다.
			} else {
				$(".redHeart1").hide(); // 좋아요 하지 않았다면 빨간 하트를 숨기고 빈 하트를 보여준다. 
			}

			//빈 하트 클릭할 때
			$(".emptyHeart1").on("click", function() {

				$(".emptyHeart1").hide(); //누른 하트를 숨기기
				$(".redHeart1").show(); //누른 곳에 빨간 하트를 표시
				console.log("좋아요할 앨범아이디 : " + '${albumId}');

				addLikeAlbum(albumId);
			});

			//빨간 하트 클릭할때
			$(".redHeart1").on("click", function() {

				$(".redHeart1").hide(); //누른 하트를 숨기기
				$(".emptyHeart1").show(); //누른 곳에 빈 하트를 표시
				console.log("좋아요 취소할 앨범아이디 : " + '${albumId}');

				removeLikeAlbum(albumId);
			});
		}

		function likeTrack() {
			// 처음엔 모든 수록곡의 빨간하트를 숨기고 빈하트만 보여준다.
			$(".redHeart2").hide();

			// 좋아요한 노래에 해당하는 노래들은 빈하트를 숨기고 빨간 하트를 보여준다.
			<c:forEach items="${getLikeTracksInAlbum}" var="getLikeTracksInAlbum">
			$("img[title='${getLikeTracksInAlbum.TRACK_ID}'][class=emptyHeart2]").hide();
			$("img[title='${getLikeTracksInAlbum.TRACK_ID}'][class=redHeart2]").show();
			</c:forEach>

			//빈 하트 클릭할 때
			$(".emptyHeart2").on("click", function() {

				let index = $(".emptyHeart2").index(this); //누른 하트의 인덱스 저장

				$(".emptyHeart2:eq(" + index + ")").hide(); //누른 하트를 숨기기
				$(".redHeart2:eq(" + index + ")").show(); //누른 곳에 빨간 하트를 표시
				console.log("좋아요할 노래아이디 : " + $(".emptyHeart2:eq(" + index + ")").attr("title"));

				let trackId = $(".emptyHeart2:eq(" + index + ")").attr("title");
				addLikeTrack(trackId);
			});

			//빨간 하트 클릭할때
			$(".redHeart2").on("click", function() {

				let index = $(".redHeart2").index(this); //누른 하트의 인덱스 저장

				$(".redHeart2:eq(" + index + ")").hide(); //누른 하트를 숨기기
				$(".emptyHeart2:eq(" + index + ")").show(); //누른 곳에 빈 하트를 표시
				console.log("좋아요 취소할 노래아이디 : " + $(".redHeart2:eq(" + index + ")").attr("title"));

				let trackId = $(".redHeart2:eq(" + index + ")").attr("title");
				removeLikeTrack(trackId);
			});

		}

		// 앨범전체 내 재생목록에 추가 버튼 (모달창)
		function addAlbumMyPlaylist() {
			$("#addAlbumMyPlaylist").click(function() {
				$("#modal").attr("style", "display:block");
			});

			$("#modalCloseBtn").click(function() {
				$("#modal").attr("style", "display:none");
			});
		}

		// 개별곡 내 재생목록에 추가 버튼 (모달창)
		function addTrackMyPlaylist() {
			$("button[name=addTrackMyPlaylist]").click(function() {
				$("#modal1").attr("style", "display:block");
				let index = $("button[name=addTrackMyPlaylist]").index(this);
				tmpTrackId = $("button[name=addTrackMyPlaylist]:eq(" + index + ")").val();
			});

			$("#modalCloseBtn1").click(function() {
				$("#modal1").attr("style", "display:none");
			});
		}
		
		// 체크된 노래 재생목록에 담는 버튼 누르면 체크된 노래 갯수 카운트하고 체크된 노래가 있을 경우 내 재생목록을 보여주는 모달창을 띄우기
		function countCheckboxLength(){
			$("#addCheckedTrackMyPlaylist").on("click", function() {
				
				let checkedTracks = [];
				$('input:checkbox[id=checkRow]:checked').each(function () {
					checkedTracks.push($(this).val());
				});
				console.log(checkedTracks);
				if(checkedTracks.length == 0){
					noticeModal("체크된 항목이 없습니다.");
				}else{
					$("#modal2").attr("style", "display:block");
				}
				
				$("#modalCloseBtn2").click(function() {
					$("#modal2").attr("style", "display:none");
				});
			});
			
		}

		// 앨범전체 모달창 내 플레이리스트 선택 버튼
		function selectPlaylist() {
			$(".selectPlaylist").on("click", function() {
				let index = $(".selectPlaylist").index(this);
				console.log("누른 버튼의 플레이리스트 아이디 : " + $(".selectPlaylist:eq(" + index + ")").val());
				console.log("플레이리스트에 넣을 앨범아이디 : " + '${albumId}');

				$("#modal").attr("style", "display:none");

				// 넣을 플레이리스트ID
				let plylstId = $(".selectPlaylist:eq(" + index + ")").val();

				// 재생목록에 추가할 트랙ID들을 담는 배열
				let trackIdArr = new Array();
				<c:forEach items="${getAlbumInfoList }" var="AlbumInfo">
				trackIdArr.push('${AlbumInfo.TRACK_ID }');
				</c:forEach>

				addToPlaylist(trackIdArr, plylstId);
			});
		}

		// 개별곡 모달창 내 플레이리스트 선택 버튼
		function selectPlaylist1() {
			$(".selectPlaylist1").on("click", function() {
				let index = $(".selectPlaylist1").index(this);
				console.log("누른 버튼의 플레이리스트 아이디 : " + $(".selectPlaylist1:eq(" + index + ")").val());
				console.log("플레이리스트에 넣을 노래아이디 : " + tmpTrackId);

				$("#modal1").attr("style", "display:none");

				// 넣을 플레이리스트ID
				let plylstId = $(".selectPlaylist1:eq(" + index + ")").val();

				// 재생목록에 추가할 트랙ID들을 담는 배열
				let trackIdArr = new Array();
				trackIdArr.push(tmpTrackId);

				addToPlaylist(trackIdArr, plylstId);
			});
		}
		
		// 체크된 곡 모달창 내 플레이리스트 선택 버튼
		function selectPlaylist2() {
			$(".selectPlaylist2").on("click", function() {
				let index = $(".selectPlaylist2").index(this);
				console.log("누른 버튼의 플레이리스트 아이디 : " + $(".selectPlaylist2:eq(" + index + ")").val());

				$("#modal2").attr("style", "display:none");

				// 넣을 플레이리스트ID
				let plylstId = $(".selectPlaylist2:eq(" + index + ")").val();

				// 재생목록에 추가할 체크된 트랙ID들을 담는 배열
				let checkedTracks = [];
				$('input:checkbox[id=checkRow]:checked').each(function () {
					checkedTracks.push($(this).val());
				});
				
				addToPlaylist(checkedTracks, plylstId);
			});
		}

		function goLogin() { // 로그아웃 상태에서 로그인이 필요한 기능을 사용하려고 할때 로그인 페이지로 이동
			location.href = "/user/login?prevPath=/detail/album?albumId=" + ${albumId};
		}

		function copyURL() {
			var address = document.getElementById("address");
			address.innerHTML = location.href; //textarea 안에 주소를 집어 넣는다.
			address.style.display = 'block'; //textarea의 display를 block으로 변경
			address.select(); //textarea의 내용 전체 선택
			document.execCommand("copy"); //복사
			address.style.display = 'none'; //textarea의 display를 none으로 변경
			//obj.setSelectionRange(0, 0); //커서 위치 초기화
			//alert("주소가 복사되었습니다.")
			
			noticeModal("주소가 복사되었습니다.");
			
		}
		
		function noticeModal(notice){
			$("#notice").html(notice);
			$("#noticeModal").attr('style', 'display:block');
			setTimeout(function(){$("#noticeModal").attr('style', 'display:none')}, 800);
		}

		function addLikeAlbum(albumId) {
			$.ajax({
				type : 'post',
				url : '/detail/addLikeAlbum',
				data : JSON.stringify(albumId),
				contentType : 'text/plain; charset=utf-8;', // 서버로 보내는 데이터 타입

				success : function(data) {
					console.log("data : " + data);
					if (data == 1) {
						noticeModal("이 앨범을 좋아합니다.");
					} else {
						noticeModal("좋아요 리스트 추가에 실패했습니다.");
					}
				}, error : function() {
				}
			});
		}

		function removeLikeAlbum(albumId) {
			$.ajax({
				type : 'post',
				url : '/detail/removeLikeAlbum',
				data : JSON.stringify(albumId),
				contentType : 'text/plain; charset=utf-8;', // 서버로 보내는 데이터 타입

				success : function(data) {
					console.log("data : " + data);
					if (data == 1) {
						noticeModal("좋아요를 취소하셨습니다.");
					} else {
						noticeModal("좋아요 취소를 실패했습니다.")
					}
				},error : function() {
				}
			});
		}

		function addLikeTrack(trackId) {
			$.ajax({
				type : 'post',
				url : '/detail/addLikeTrack',
				data : trackId,
				contentType : 'text/plain; charset=utf-8;', // 서버로 보내는 데이터 타입

				success : function(data) {
					console.log("data : " + data);
					if (data == 1) {
						noticeModal("이 노래를 좋아합니다.");
					} else {
						noticeModal("좋아요 리스트 추가에 실패했습니다.")
					}
				},error : function() {
				}
			});
		}

		function removeLikeTrack(trackId) {
			$.ajax({
				type : 'post',
				url : '/detail/removeLikeTrack',
				data : trackId,
				contentType : 'text/plain; charset=utf-8;', // 서버로 보내는 데이터 타입

				success : function(data) {
					console.log("data : " + data);
					if (data == 1) {
						noticeModal("좋아요를 취소하셨습니다.");
					} else {
						noticeModal("좋아요 취소를 실패했습니다.")
					}
				},error : function() {
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
						noticeModal("중복곡을 제외하고 플레이리스트에 추가했습니다.");
					} else {
						noticeModal("존재하지 않는 플레이리스트 입니다. 새로고침 후 다시 시도해주세요.")
					}
				}, error : function() {

				}
			});
		}

		let popupPlayer = function(url) {
			let moveTop = screen.height - 440;
			let moveLeft = screen.width - 537;
			window.open(
				url,
				'player',
				'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top=' + moveTop + ',left=' + moveLeft);
		}
		
		// 전체 체크박스 이벤트
		function checkAll(){
			//만약 전체 선택 체크박스가 체크된상태일경우 
			if($(".checkAll").prop("checked")) { 
				//해당화면에 전체 checkbox들을 체크해준다 
				$("input[type=checkbox]").prop("checked",true); 
				// 전체선택 체크박스가 해제된 경우 
			} else { 
				//해당화면에 모든 checkbox들의 체크를해제시킨다. 
				$("input[type=checkbox]").prop("checked",false); 
				}
		}
	</script>

</body>
</html>