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
<script src="/resources/js/jquery-3.5.1.js"/></script>
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
						<div class="item-body">
							<form id="create-playlist" action="/mypage/playlist/create" method="post">
								<input type="hidden" value="제목을 입력하세요" name="nm">
								<input type="hidden" value="내용을 입력하세요" name="desc">
								<input type="hidden" value="noplaylist.png" name="plylstImg">
								<input type="hidden" value="${user.email}" name="email">
								<button id="createBtn" class="button">새로운플레이리스트 만들기</button>
							</form>
						</div>
					</div>
				</div>

				<div class="mypage-body">
					<div class="body-item bg-bl">
						<div class="item-header">
							<h3>
								<a href="#">Playlist</a>
							</h3>
						</div>
						<div class="item-body">
							<div class="item-div">
								<c:forEach items="${playlistVO}" var="plylst">
									<table class="table">
										<tr>
											<th></th><th></th>
										</tr>
										<tr>
											<td class="td8 img-td" colspan="2">
												<div class="img-container">
													<div class="img-div">
														<a class="ddBtn"><img class="moreImg" src="/resources/image/more.png"></a>
															<img class="myArtistImg myPlaylist" src="/resources/image/album/${plylst.plylstImg}">
															<div class="dropdown-playlist">
																	<ul class="dd-plylst-content">
																			<li><button class="mod">수정</button></li>
																			<li><button class="del">삭제</button></li>
																	</ul>
															</div>
													</div>
												</div>
											</td>
										</tr>

										<tr>
											<td>
												<form action="/mypage/playlistDetail" method="post">
													<input class="plylstValue" type="hidden" value="${plylst.plylstId}" name="plylstId">
													<button class="button">
														<c:out value="${plylst.nm}"/>
													</button>
												</form>
											</td>
										</tr>
									</table>
								</c:forEach>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--bodyContent-->
		<div id="rightSideBar"></div>
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

	<script>

	$(document).ready(function() {
	
		let result = '<c:out value="${result}"/>';
		let delResult = '<c:out value="${successDel}"/>';
				
		checkModal(result);
		deleteModal(delResult);
	
	});
	
	// 플레이리스트 개수 제한
	$("#createBtn").click(function(e){
		e.preventDefault();
		
		let countPlaylist = '<c:out value="${playlistCount}"/>';
		
		if(countPlaylist >= 8){
			basicModalContent("플레이리스트를 만들 수 없습니다.(최대 생성 개수 : 8개)");
			setTimeout(hideBasicModal, 1000);
			return;
		}
		
		$("#create-playlist").submit();
	});
	
	// 드롭박스 : 수정,삭제
	$(".ddBtn").click(function() {
		let idx = $(".ddBtn").index(this);
		$(".dd-plylst-content:eq(" + idx + ")").toggle();
	});
	
	// 삭제모달 : 플레이리스트 번호 넘김
	$(".del").click(function() {
		let idx = $(".del").index(this);
		let idxValue = $(".plylstValue:eq(" + idx + ")").val();
		$(".plylstDel").val(idxValue);

		closeModalContent("삭제하시겠습니까?");
	});
	
	// TODO: 수정
	// 수정모달 : 수정페이지
	$(".mod").click(function(){
		let idx = $(".mod").index(this);
		let idxValue = $(".plylstValue:eq(" + idx + ")").val();
		let address = "/mypage/playlist/" + idxValue;
		window.location.href = address;
	});
	
	// 모달 x, 바 누르면 닫힘
	$(document).on("click", ".modal-close, .modal-overlay", hideAllModal);
	
	// 등록모달 : 제목 등록 완료
	function checkModal(result) {
		console.log(result);
		
		if(result === 'FAIL'){
			basicModalContent("플레이리스트 수정에 실패했습니다.");
			setTimeout(hideBasicModal, 1100);
			setTimeout(changeLoc, 1100);
			return;
		}
		
		if (result === '' || history.state) {
			return;
		}

		basicModalContent("플레이리스트 [" + result + "] 등록이 완료되었습니다.");
		
		history.replaceState({}, null, null);
		setTimeout(hideBasicModal, 1100);
	}
	
	//삭제모달 : 플레이리스트 삭제 완료
	function deleteModal(result) {
		if (result === 'FAIL') {
			basicModalContent("플레이리스트 삭제에 실패했습니다.");
			setTimeout(hideBasicModal, 1100);
			setTimeout(changeLoc, 1100);
			return;
		}
		
		if (result === '' || history.state) {
			return;
		}
		
		basicModalContent("플레이리스트 삭제가 완료되었습니다.");
		
		history.replaceState({}, null, null);
		setTimeout(hideBasicModal, 1100);
	}
	
	function hideAllModal(){
		$(".modal").attr("style", "display:none");
	}
	
	function hideBasicModal(){
		$("#myModal").attr("style", "display:none");
	}
	
	function changeLoc(){
		window.location.href = "/mypage/playlist";
	}
	
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
	</script>
<%@include file="../includes/footer.jsp" %>

	