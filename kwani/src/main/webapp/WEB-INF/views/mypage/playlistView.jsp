<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Library</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="/resources/js/jquery-3.5.1.js" /></script>

<link rel="stylesheet" type="text/css"href="/resources/css/indexNoVideomh.css">
<link rel="stylesheet" href="/resources/css/mainmh.css" />

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

		<div id="body" style="height: 200px">
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
				<hr style="border-bottom: 1px solid black">
				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#">Playlist Create</a>
							</h3>
							<h2>playlistId : ${playlistVO.plylstId}</h2>
						</div>
						<div class="item-body">
							<div>
								<form action="/mypage/playlist/delete" method="post">
									<input type="hidden" value="${playlistVO.plylstId}" name="plylstId">
									<input type="hidden" value="${user.email}" name="email">
									<button>삭제하기</button>
								</form>
								<form action="/mypage/playlist/modify" method="post"
									onsubmit="return checkInput()">
									<input type="hidden" value="${playlistVO.plylstId}"
										name="plylstId">
									<button>저장 후 나가기</button>
									<br> <br> <div id="change-img"><img class="myArtistImg"
										src="/resources/image/album/${playlistVO.plylstImg}">
										</div>
										<br>
									<label for="title">Playlist Title :</label><br> <input
										type="text" id="change-title" name="nm"
										placeholder="${playlistVO.nm}"><br> <label
										for="desc">Playlist Description : </label><br>
									<textarea id="change-desc" class="form-control" name="desc"
										placeholder="${playlistVO.desc}"></textarea>
									<br>
								</form>

								<button id="addBtn">Add Track</button>

								<div class="item-body">
									<table id="change-plylstDtl" style="width: 100%">
										<thead>
										<tr>
											<th class="th1"></th>
											<th class="th1"></th>
											<th class="th1"></th>
											<th></th>
											<th></th>
											<th></th>
											<th class="th1"></th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items="${playlistDetail}" var="playlistDetail" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><c:out value="${playlistDetail.PLY_NO}" /></td>
												<td><img class="myImg"
													src="/resources/image/album/${playlistDetail.ALBUM_IMG}" /></td>
												<td><c:out value="${playlistDetail.ANM}" /></td>
												<td><c:out value="${playlistDetail.TRACK_TTL}" /></td>
												<td><c:out value="${playlistDetail.ALBUM_TTL}" /></td>
												<td>
													<input class="trackIdValue" type="hidden" value="${playlistDetail.TRACK_ID}" name="trackIdValue">
													<button class="delBtn">삭제</button>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
				</div>
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

				<!-- 곡 추가 모달창 -->
				<div class="modal" id="addModal">
					<div class="modal-overlay"></div>
					<!-- content -->
					<div class="modal-content">
						<div class="modal-close">&times;</div>
						<div class="modal-header">
							<button class="likeBtn">좋아요한곡</button>
							<button class="libraryBtn">최근들은곡</button>
						</div>
							<!-- 모달 -->
							<div class="modal-bbody">
								<table class="changetr" style="width: 100%">
									<tr>
										<th class='th1'><input type='checkbox' id='checkAll'></th><th></th><th></th><th></th><th></th><th></th>
									</tr>
									<c:forEach items="${likedTrackList}" var="track">
										<tr class="tr-check">
											<td><input class="checkbox" type="checkbox" id="checkbox" name="trackId" value="${track.TRACK_ID}">
											</td>
											<td><a href="#"><img src="/resources/image/album/${track.ALBUM_IMG}" class="myImg"></a></td>
											<td><c:out value="${track.TRACK_TTL}" /></td>
											<td><c:out value="${track.NM}" /></td>
											<td><c:out value="${track.ALBUM_TTL}" /></td>
											<td>
												<button class="addSelectedTrack"> + </button>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="modal-footer">
									<button class="addSelectedTrack">담기</button>
							</div>
					</div>
				</div>
			</div>
		</div>
		<!--bodyContent-->
		<div id="rightSideBar"></div>
	</div>
	<div id="footer"></div>
	<!--main-->
</body>

<script type="text/javascript" src="/resources/js/mypage.js"></script>
<script type="text/javascript">

	// 플레이리스트 추가
	// 담기 버튼이 눌리면 addTrackList 함수 실행
	$(document).on("click", ".addSelectedTrack", function(){
		
		let trackList = [];
		let plylstId = ${playlistVO.plylstId};
		
		// 아무 곡도 체크되어있지 않은 경우 모달창
		if($(".checkbox:checked").length == 0){
			basicModalContent("담을 곡을 선택하세요.");
			setTimeout(hideBasicModal, 1000);
			return;
		}
		
		// 체크되어있는 곡 번호 trackId 배열에 담기
		$(".checkbox").each(function(index, item){
			if($(".checkbox:eq("+ index + ")").prop("checked")){
				trackList.push($(".checkbox:eq("+ index+")").val());
			}
		});
	
		// 체크된 곡, 플레이리스트 번호 넘겨서 플레이리스트에 등록하기
		mypageService.addTrackList(
			trackList, plylstId,
			function(obj){
				
				if(obj === "FAILED"){
					basicModalContent("플레이리스트가 존재하지 않습니다.");
					setTimeout(changeLoc, 1100);
					return;
				}
				
				showPlaylistTrack(obj);
				
				basicModalContent("중복을 제외한 곡 추가를 완료했습니다.");
				checkReset();
				setTimeout(hideBasicModal, 1000);
				
			})
	
	});
	
	//플레이리스트 삭제
	$(document).on("click", ".delBtn", function(){
	
		let trackList = [];
		let trackIdx = $(".delBtn").index(this);
		let trackIdValue = $(".trackIdValue:eq(" + trackIdx + ")").val();
	
		trackList.push(trackIdValue);
		plylstId = ${playlistVO.plylstId};
		
		mypageService.deleteTrackList(
				trackList, plylstId,
				function(obj){
					
					if(obj === "EMPTY"){
						$("#change-img").empty();
						let str = "<img class='myArtistImg' src='/resources/image/album/noplaylist.png'>"
						$("#change-img").append(str);
						$("#change-plylstDtl").empty();
						basicModalContent("곡 삭제를 완료했습니다.");
						setTimeout(hideBasicModal, 1000);
						return;
					}
					
					if(obj === "FAIL"){
						basicModalContent("플레이리스트에 해당 곡이 존재하지 않습니다.");
						setTimeout(changeLoc, 1100);
						return;
					}
										
					showPlaylistTrack(obj);
					
					basicModalContent("곡 삭제를 완료했습니다.");
					checkReset();
					setTimeout(hideBasicModal, 1000);
				})
		
	});
	
	// 플레이리스트 제목,설명 유효성 체크
	function checkInput() {
		let nm = document.getElementsByName("nm");
		let desc = document.getElementsByName("desc");
	
		let nmValue = nm[0].value.trim();
		let descValue = desc[0].value.trim();
	
		if (nmValue.length == 0) {
			basicModalContent("플레이리스트 제목을 입력하세요.");
			setTimeout(hideBasicModal, 1100);
			return false;
		}
		if (descValue.length == 0) {
			basicModalContent("플레이리스트 설명을 입력하세요.");
			setTimeout(hideBasicModal, 1100);
			return false;
		}
		return true;
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
	
	// 체크박스 전체 해제
	function checkReset(){
		$("#checkAll").prop("checked", false);
		$(".checkbox").prop("checked", false);
	}
	
	// 담기 버튼을 누르면 곡 추가 모달 나옴
	$(document).on("click", "#addBtn", showAddModal);
	
	// 모달 x, 바 누르면 닫힘
	$(document).on("click", ".modal-close, .modal-overlay", hideAllModal);
			
	// 최근들은곡 ajax
	$(document).on("click", ".libraryBtn", function() {
		mypageService.getLibraryList(function(data) {
			let obj = JSON.parse(data);
			showTrack(obj);
		})
	});
	
	// 좋아요곡 ajax	
	$(document).on("click",".likeBtn", function() {
			mypageService.getLikedList(function(data) {
				let obj = JSON.parse(data);
				showTrack(obj);
			})
	});
	
	// 기본 모달 내용 변경 함수
	function basicModalContent(content){
		$(".modal-body").text(content);
		$(".modalBtn").hide();
		$(".modal-close").hide();
		$("#myModal").attr("style", "display:block");
	}
	
	// 닫기 모달 내용 변경 함수
	function closeModalContent(content){
		$(".modal-body").text(content);
		$(".modalBtn").show();
		$(".modal-close").show();
		$("#myModal").attr("style", "display:block");
	}
	
	function hideAllModal(){
		$(".modal").attr("style", "display:none");
	}
	
	function showAddModal(){
		$("#addModal").attr("style", "display:block");
	}
	
	function hideBasicModal(){
		$("#myModal").attr("style", "display:none");
	}
	
	function changeLoc(){
		window.location.href = "/mypage/playlist";
	}
	
	// 플레이리스트 곡 목록 보여주는 함수
	function showPlaylistTrack(obj){
		
		$("#change-img").empty();
		let str = "<img class='myArtistImg' src='/resources/image/album/" + obj[0].ALBUM_IMG + "'>"
		$("#change-img").append(str);
		
		$("#change-plylstDtl").empty();
		str = "<tr><th class='th1'></th><th class='th1'></th><th class='th1'></th><th></th><th></th><th></th><th></th><th class='th1'></th></tr>";
		$("#change-plylstDtl").append(str);
		
		str = "";
		
		$.each(obj,function(i) {
			str += "<tr>";
			str += "<td>" + (i+1) + "</td>";
			str += "<td>" + obj[i].TRACK_ID + "</td>";
			str += "<td><img class='myImg' src='/resources/image/album/" + obj[i].ALBUM_IMG + "'></td>";
			str += '<td>' + obj[i].ANM + '</td>';
			str += '<td>' + obj[i].TRACK_TTL+ '</td>';
			str += '<td>' + obj[i].ALBUM_TTL+ '</td>';
			str += '<td><input class="trackIdValue" type="hidden" value="' + obj[i].TRACK_ID + '" name="trackIdValue">';
			str += "<td><button class='delBtn'>삭제</button></td>";
			str += "</tr>";
		})
		$("#change-plylstDtl").append(str);
		$("#addModal").attr("style", "display:none");
	}
	
	// 모달 창에 곡 리스트 보여주는 함수
	function showTrack(obj) {
		$(".changetr").empty();
		let str = "<tr><th class='th1'><input type='checkbox' id='checkAll'></th><th></th><th></th><th></th><th></th><th></th></tr>";
		$(".changetr").append(str);
		str = "";

		$.each(obj, function(i) {
			str += "<tr>";
			str += "<td><input class='checkbox' type='checkbox' id='checkbox' value='" + obj[i].TRACK_ID + "'></td>";
			str += "<td><a href='#'><img src='/resources/image/album/" + obj[i].ALBUM_IMG + "' class=myImg></a></td>";
			str += '<td>'+ obj[i].TRACK_TTL+ '</td>';
			str += '<td>'+ obj[i].NM+ '</td>';
			str += '<td>'+ obj[i].ALBUM_TTL+ '</td>';
			str += "<td><button class='addSelectedTrack'>+</button></td>";
			str += "</tr>";
		})
		$(".changetr").append(str);	
	}

</script>

</html>