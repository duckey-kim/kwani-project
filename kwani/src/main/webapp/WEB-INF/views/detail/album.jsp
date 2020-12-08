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
<script src="/resources/js/jquery-3.5.1.js"/></script>
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
									<a
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
								<pre>장르	: <c:out value="${AlbumInfo.GENRE_CD }" />
								</pre>
								<pre>발매일	: <c:out value="${AlbumInfo.RLESDT }" />
								</pre>
							</c:forEach>
						</div>

					</div>
				</div>

				<div class="header-buttons">
					<button type="button" id="playNow">바로재생</button>
					<button type="button" id="addPlayer">플레이어에 추가</button>
					<button type="button" id="addMyPlaylist">내 재생목록 추가</button>
					<input type="button" value="공유하기" onclick="copyURL()">
					<textarea id="address" style="display: none"></textarea>
					<img class="emptyHeart" id="likeAlbum" src="/resources/image/heart2.png">
					<img class="redHeart" id="likeAlbum" src="/resources/image/heart.png">
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
								<th>플레이어에 추가</th>
								<th>재생목록</th>
								<th>좋아요</th>
							</tr>
							<c:forEach items="${getAlbumInfoList }" var="AlbumInfo">
								<tr>
									<td><c:out value="${AlbumInfo.TRACK_ORDER }" /></td>
									<td><a
										href="/detail/track?trackId=<c:out value='${AlbumInfo.TRACK_ID }' />"><c:out
												value="${AlbumInfo.TRACK_TTL }" /></a></td>
									<td><a
										href="/detail/artist?gropId=<c:out value="${AlbumInfo.GROP_ID }" />"><c:out
												value="${AlbumInfo.NM }" /> </a></td>
									<td>
										<button name="addPlayer">플레이어에 추가</button>
									</td>
									<td>
										<button name="addMyPlaylist">내 재생목록에 추가</button>
									</td>
									<td>
										<img class="emptyHeart" name="likeTrack" src="/resources/image/heart2.png">
										<img class="redHeart" name="likeTrack" src="/resources/image/heart.png">
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

	<script>
	
		if ('${sessionName}' == "") { // 세션이 없을경우 로그인이 필요한 기능들은 로그인 페이지로 이동시킨다.
			// 빨간 하트를 숨긴다.
			$(".redHeart").hide();
			
			// 내 재생목록에 추가 기능
			document.getElementById("addMyPlaylist").addEventListener("click",	goLogin);
		
			// 앨범 좋아요 기능
			document.getElementById("likeAlbum").addEventListener("click",	goLogin);

			// 내 플레이리스트 추가 기능
			var amp = document.getElementsByName("addMyPlaylist");
			for (var i = 0; i < amp.length; i++) {
				amp[i].addEventListener("click", goLogin);
			}

			// 개별 곡 좋아요 기능
			var lt = document.getElementsByName("likeTrack");
			for (var i = 0; i < lt.length; i++) {
				lt[i].addEventListener("click", goLogin);
			}

		}else{
			// 유저가 좋아요한 곡은 빨간하트, 좋아요하지 않은건 빈하트로 보여줘야함
			// 앨범좋아요 JQuery 부분을 공유하고 if문을 쓸건지 따로 메서드를 팔지
			
			likeTrack();
			
		}

		function addPlayer() {

		}

		function addMyPlaylist() {

		}
		
		function likeTrack(){
			
			//빈 하트 클릭할 때
			$(".emptyHeart").on("click", function(){
				
				let index = $(".emptyHeart").index(this);	//누른 하트의 인덱스 저장
				
				$(".emptyHeart:eq(" + index + ")").hide();	//누른 하트를 숨기기
				$(".redHeart:eq(" + index + ")").show();	//누른 곳에 빨간 하트를 표시
				console.log("빈 사랑 클릭했어")
			});
			
			//빨간 하트 클릭할때
			$(".redHeart").on("click", function(){
				
				let index = $(".redHeart").index(this);		//누른 하트의 인덱스 저장
				
				$(".redHeart:eq(" + index + ")").hide();	//누른 하트를 숨기기
				$(".emptyHeart:eq(" + index + ")").show();	//누른 곳에 빈 하트를 표시
				console.log("꽉 찬 사랑 클릭했어")
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
	</script>

</body>
</html>