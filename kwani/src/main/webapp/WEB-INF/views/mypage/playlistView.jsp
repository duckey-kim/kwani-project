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
							<h3>Playlist
							</h3>
						</div>
						<div class="item-body">
							<div>
								<div class="playlist-div">
								<form action="/mypage/playlist/delete" method="post">
									<input type="hidden" value="${playlistVO.plylstId}" name="plylstId">
									<button class="plylst-del button6"><b>PLAYLIST DELETE</b></button>
									<div id="change-img"><img class="myArtistImg" src="/resources/image/album/${playlistVO.plylstImg}">
									</div>
								</form>
								<form class="plylst-form" action="/mypage/playlist/modify" method="post" onsubmit="return checkInput()">
								
									<input type="hidden" value="${playlistVO.plylstId}"
										name="plylstId">
									<button id="plylst-save" class="button6"><b>SAVE AND EXIST</b></button>
									<div class="playlist-title">
									<label for="title"><b>Playlist Title</b></label><br> <input
										type="text" id="change-title" name="nm"
										value="${playlistVO.nm}"><br><label
										for="desc"><b>Playlist Description</b></label><br>
									<textarea id="change-desc" class="form-control" name="desc">${playlistVO.desc}</textarea>
									</div>
									<br>
								</form>
								</div>

								<button id="addBtn" class="button5"><b>ADD TRACK</b></button>

								<div class="item-body">
									<table id="change-plylstDtl" class="table">
										<thead>
										<tr>
											<th style="width:5%"></th>
											<th style="width:5%"></th>
											<th style="width:40%"></th>
											<th style="width:10%"></th>
											<th></th>
											<th style="width:10%"></th>
										</tr>
										</thead>
										<tbody>
										<c:forEach items="${playlistDetail}" var="playlistDetail" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td><a href="/detail/album?albumId=${playlistDetail.ALBUM_ID}"><img class="myImg" src="/resources/image/album/${playlistDetail.ALBUM_IMG}" /></a></td>
												<td class="track-title"><a href="/detail/track?trackId=${playlistDetail.TRACK_ID}"><c:out value="${playlistDetail.TRACK_TTL}" /></a></td>
												<td class="artist-name"><a href="/detail/artist?gropId=${playlistDetail.GROP_ID}"><c:out value="${playlistDetail.ANM}" /></a></td>
												<td class="album-title"><a href="/detail/album?albumId=${playlistDetail.ALBUM_ID}"><c:out value="${playlistDetail.ALBUM_TTL}" /></a></td>
												<td>
													<input class="trackIdValue" type="hidden" value="${playlistDetail.TRACK_ID}" name="trackIdValue">
													<button class="delBtn button7">Delete</button>
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
							<button class="likeBtn button6">LikedTrack</button>
							<button class="libraryBtn button6">Library</button>
						</div>
							<!-- 모달 -->
							<div class="modal-bbody">
								<table class="changetr table" style="width: 100%">
									<tr>
										<th><input type='checkbox' id='checkAll'></th>
										<th style="width:10%"></th><th style="width:40%"></th><th style="width:10%"></th><th></th><th style="width:5%"></th>
									</tr>
									<c:forEach items="${likedTrackList}" var="track">
										<tr class="tr-check">
											<td><input class="checkbox" type="checkbox" id="checkbox" name="trackId" value="${track.TRACK_ID}">
											</td>
											<td><a href="/detail/album?albumId=${track.ALBUM_ID}"><img src="/resources/image/album/${track.ALBUM_IMG}" class="myImg"></a></td>
											<td><a class="track-title" href="/detail/track?trackId=${track.TRACK_ID}"><c:out value="${track.TRACK_TTL}" /></a></td>
											<td><a class="artist-name" href="/detail/artist?gropId=${track.GROP_ID}"><c:out value="${track.NM}" /></a></td>
											<td><a class="album-title" href="/detail/album?albumId=${track.ALBUM_ID}"><c:out value="${track.ALBUM_TTL}" /></a></td>
											<td>
												<button class="addSelectedOneTrack button7"> + </button>
											</td>
										</tr>
									</c:forEach>
								</table>
							</div>
							<div class="modal-footer">
									<button class="addSelectedTrack button6">담기</button>
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
		<!--bodyContent-->
		<div id="rightSideBar"></div>
	
<script type="text/javascript" src="/resources/js/mypage.js"></script>
<script type="text/javascript">

	// TODO : 코드 정리
	// 한 곡 등록
	$(".addSelectedOneTrack").click(function(){
		let idx = $(".addSelectedOneTrack").index(this);
		
		let trackList = [];
		let plylstId = ${playlistVO.plylstId};
		trackList.push($(".checkbox:eq("+ idx +")").val());
		
		// 체크된 곡, 플레이리스트 번호 넘겨서 플레이리스트에 등록하기
		mypageService.addTrackList(
			trackList, plylstId,
			function(obj){
				
				if(obj === "FAILED"){
					basicModalContent("플레이리스트가 존재하지 않습니다.");
					setTimeout(changeLoc, 800);
					return;
				}
				
				showPlaylistTrack(obj);
				
				basicModalContent("중복을 제외한 곡 추가를 완료했습니다.");
				checkReset();
				
		})
	})

	// 플레이리스트 추가
	// 담기 버튼이 눌리면 addTrackList 함수 실행
	$(document).on("click", ".addSelectedTrack", function(){
		
		let trackList = [];
		let plylstId = ${playlistVO.plylstId};
		
		// 아무 곡도 체크되어있지 않은 경우 모달창
		if($(".checkbox:checked").length == 0){
			basicModalContent("담을 곡을 선택하세요.");
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
					return;
				}
				
				showPlaylistTrack(obj);
				
				basicModalContent("중복을 제외한 곡 추가를 완료했습니다.");
				checkReset();				
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
						return;
					}
					
					if(obj === "FAIL"){
						basicModalContent("플레이리스트에 해당 곡이 존재하지 않습니다.");
						setTimeout(changeLoc, 800);
						return;
					}
										
					showPlaylistTrack(obj);
					
					basicModalContent("곡 삭제를 완료했습니다.");
					checkReset();
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
			return false;
		}
		if (descValue.length == 0) {
			basicModalContent("플레이리스트 설명을 입력하세요.");
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
	$(document).on("click", "#addBtn", function(){$("#addModal").attr("style", "display:block");});
	
	// 모달 x, 바 누르면 닫힘
	$(document).on("click", ".modal-close, .modal-overlay", function(){$(".modal").attr("style", "display:none");});
			
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
		setTimeout(function(){$("#myModal").attr("style", "display:none");}, 800);
	}
	
	// 닫기 모달 내용 변경 함수
	function closeModalContent(content){
		$(".modal-body").text(content);
		$(".modalBtn").show();
		$(".modal-close").show();
		$("#myModal").attr("style", "display:block");
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
		str = "<tr><th style='width:5%'></th><th style='width:5%'></th><th style='width:40%'></th><th></th><th></th><th style='width:10%'></th></tr>";
		$("#change-plylstDtl").append(str);
		
		str = "";
		
		$.each(obj,function(i) {
			str += "<tr>";
			str += "<td>" + (i+1) + "</td>";
			str += "<td><img class='myImg' src='/resources/image/album/" + obj[i].ALBUM_IMG + "'></td>";
			str += '<td class="track-title"><a href="/detail/track?trackId=' + obj[i].TRACK_ID + '">' + obj[i].TRACK_TTL+ '</a></td>';
			str += '<td class="artist-name"><a href="/detail/artist?gropId=' + obj[i].GROP_ID + '">' + obj[i].ANM + '</a></td>';
			str += '<td class="album-title"><a href="/detail/album?albumId=' + obj[i].ALBUM_ID + '">' + obj[i].ALBUM_TTL+ '</a></td>';
			str += '<td><input class="trackIdValue" type="hidden" value="' + obj[i].TRACK_ID + '" name="trackIdValue">';
			str += "<td style='width:10%'><button class='delBtn button7'>Delete</button></td>";
			str += "</tr>";
		})
		$("#change-plylstDtl").append(str);
		$("#addModal").attr("style", "display:none");
	}
	
	// 모달 창에 곡 리스트 보여주는 함수
	function showTrack(obj) {
		$(".changetr").empty();
		let str = "<tr><th><input type='checkbox' id='checkAll'></th><th style='width:10%'></th><th style='width:40%'></th><th style='width:10%'></th><th></th><th style='width:5%'></tr>";
		$(".changetr").append(str);
		str = "";

		$.each(obj, function(i) {
			str += "<tr>";
			str += "<td><input class='checkbox' type='checkbox' id='checkbox' value='" + obj[i].TRACK_ID + "'></td>";
			str += "<td><a href='#'><img src='/resources/image/album/" + obj[i].ALBUM_IMG + "' class=myImg></a></td>";
			str += '<td>'+ obj[i].TRACK_TTL+ '</td>';
			str += '<td>'+ obj[i].NM+ '</td>';
			str += '<td>'+ obj[i].ALBUM_TTL+ '</td>';
			str += "<td><button class='addSelectedOneTrack button7'>+</button></td>";
			str += "</tr>";
		})
		$(".changetr").append(str);	
	}

</script>

<%@include file="../includes/footer.jsp" %>