<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Recommend User</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
<script src="/resources/js/jquery-3.5.1.js" /></script>

<link rel="stylesheet" type="text/css"
	href="/resources/css/plylstDetail.css">
<style type="text/css">
a:link {
	color: black;
}

/* visited link */
a:visited {
	color: black;
}

/* mouse over link */
a:hover {
	color: black;
}

/* selected link */
a:active {
	color: black;
}

#modal2 {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 30px;
	border: 1px solid #888;
	width: 30%;
}

#plylstInfo {
	height: 100px;
	margin-top: 50px;
}
</style>

</head>

<%@include file="../includes/header.jsp"%>

<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div id="plylstInfo">
			<h1>${user.nick}님을 위한 장르 추천</h1>
		</div>
		<!--plylstInfo-->

		<div id="tracks">
			<h2>Tracks</h2>
		</div>
		<div id="plylstBtn">
			<button class="button" id="playButton-one"
				onclick='setUrlTrack("one")'>듣기</button>
			<button class="button" id="plusPlylstBtn-one">담기</button>
		</div>
		<div id="plylstTable">
			<table>
				<tr>
					<th class="th0"><input type="checkbox" name="checkAll-one"
						onclick='checkAll("one")' class="checkAll-one"></th>
					<th class="th1">번호</th>
					<th class="th5"></th>
					<th class="th2">제목</th>
					<th class="th3">가수</th>
					<th class="th4">듣기</th>
					<th class="th4">좋아요</th>
				</tr>

				<c:forEach items="${genreList}" var="genreList" varStatus="status"
					begin="0" end="19">
					<tr>
						<td><input type="checkbox" name="checkRow-one"
							value="${genreList.TRACK_ID }"></td>
						<td class="num" style="color:grey">${status.index+1}</td>
						<td><div class="artistSmallImg" style="background-image:url(/resources/image/album/<c:out value='${genreList.ALBUM_IMG}'/>);"></div></td>
						<td style="color:black; font-weight:bold;"><a href="/detail/track?trackId=${genreList.TRACK_ID}"><c:out
									value="${genreList.TRACK_TTL}" /></a></td>
						<td><a href="/detail/artist?gropId=${genreList.GROP_ID }" style="color:grey"><c:out
									value="${genreList.NM}" /></a></td>
						<td class="btnParent th4"><img class="playBtn"
							onclick='popupPlayer("/player/track?trackId=${genreList.TRACK_ID}")'
							src="/resources/image/play-button.png"></td>
						<td>
						<div class="heartParent">
                        <img class="defaultHeartImg" name="${genreList.TRACK_ID}" src="/resources/image/heart2.png" onclick="sessionCheck()">
                        <img class="redHeartImg" name="${genreList.TRACK_ID}" src="/resources/image/heart.png">
                        </div>						
						</td>

					</tr>
				</c:forEach>

			</table>
		</div>


		<div id="plylstInfo">
			<h1>${user.nick}님을 위한 테마 추천</h1>
		</div>

		<div id="tracks">
			<h2>Tracks</h2>
		</div>
		<div id="plylstBtn">
			<button class="button" id="playButton-two"
				onclick='setUrlTrack("two")'>듣기</button>
			<button class="button" id="plusPlylstBtn-two">담기</button>
		</div>
		<div id="plylstTable">
			<table>
				<tr>
					<th class="th0"><input type="checkbox" name="checkAll-two"
						onclick='checkAll("two")' class="checkAll-two"></th>
					<th class="th1">번호</th>
					<th class="th5"></th>
					<th class="th2">제목</th>
					<th class="th3">가수</th>
					<th class="th4">듣기</th>
					<th class="th4">좋아요</th>
				</tr>

				<c:forEach items="${typeList}" var="typeList" varStatus="status"
					begin="0" end="19">
					<tr>
						<td><input type="checkbox" name="checkRow-two"
							value="${typeList.TRACK_ID }"></td>
						<td class="num" style="color:grey">${status.index+1}</td>
						<td><div class="artistSmallImg" style="background-image:url(/resources/image/album/<c:out value='${typeList.ALBUM_IMG}'/>);"></div></td>
						<td style="color:black; font-weight:bold;"><a href="/detail/track?trackId=${typeList.TRACK_ID }"><c:out
									value="${typeList.TRACK_TTL}" /></a></td>
						<td><a href="/detail/artist?gropId=${typeList.GROP_ID}" style="color:grey"><c:out
									value="${typeList.NM}" /></a></td>
						<td class="btnParent"><img class="playBtn"
							onclick='popupPlayer("/player/track?trackId=${typeList.TRACK_ID}")'
							src="/resources/image/play-button.png"></td>
						<td>
						<div class="heartParent">
                        <img class="defaultHeartImg" name="${typeist.TRACK_ID}" src="/resources/image/heart2.png" onclick="sessionCheck()">
                        <img class="redHeartImg" name="${typeList.TRACK_ID}" src="/resources/image/heart.png">
                        </div>						
						</td>
					</tr>
				</c:forEach>

			</table>
		</div>







		<!-- 체크된 곡을 위한 모달창 -->
		<div id="modal2">
			<div class="modal-content">
				<h2>${user.nick }님의플레이리스트</h2>

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
									<button value='${Playlists.PLYLST_ID }' class="selectPlaylist2">선택</button>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<div id="modal-buttons">
					<button type="button" id="modalCloseBtn2">취소</button>
				</div>
			</div>
			<div class="modal-layer"></div>
		</div>


		<script>
			console.log("user : " + '${user}');
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
			function checkAll(str) {
				//만약 전체 선택 체크박스가 체크된상태일경우 
				if ($(".checkAll-" + str).prop("checked")) {
					//해당화면에 전체 checkbox들을 체크해준다 
					$("input[name=checkRow-" + str + "]").prop("checked", true);
					// 전체선택 체크박스가 해제된 경우 
				} else {
					//해당화면에 모든 checkbox들의 체크를해제시킨다. 
					$("input[name=checkRow-" + str + "]")
							.prop("checked", false);
				}
			}

			//로그인 안되어있을 때
			//좋아요 버튼, 플레이리스트 담기 버튼 누르면 로그인 페이지로 이동하게 하기--------------------------

			//모달창 --------------------------------------------------------------------------
			let modal = document.getElementById("myModal");
			let btnOne = document.getElementById("plusPlylstBtn-one");
			let btnTwo = document.getElementById("plusPlylstBtn-two");

			countCheckboxLength("one");
			countCheckboxLength("two");
			selectPlaylist2("one");
			selectPlaylist2("two");

			window.onclick = function(event) {
				if (event.target == modal) {
					modal.style.display = "none";
				}
			}

			function countCheckboxLength(str) {
				$("#plusPlylstBtn-" + str)
						.on(
								"click",
								function() {
									console.log(str);
									/* doCheck(str); */

									let checkedTracks = [];
									$("input[name=checkRow-" + str + "]:checked").each(
											function() {
												checkedTracks.push($(this)
														.val());
											});
									console.log(checkedTracks);
									if (checkedTracks.length == 0) {
										alert("체크된 항목이 없습니다.");
									} else {
										$("#modal2").attr("style",
												"display:block");
									}

									$("#modalCloseBtn2").click(
											function() {
												$("#modal2").attr("style",
														"display:none");
											});
								});

			}
			function setUrlTrack(str) {
				if(doCheck(str)){
					let trackArr = [];
					$("input[name=checkRow-" + str + "]:checked").each(function() {
						trackArr.push($(this).val());
					})
					let url = '';
					let trackStr = 'trackId=';
					if (trackArr.length == 1) {
						url = trackStr + trackArr[0];
					} else {
						for (let i = 0; i < trackArr.length;) {
							url += 'trackId=' + trackArr[i];
							if (i != trackArr.length - 1) {
								url += '&'
							}
							i += 1;
						}
					}
					popupPlayer("/player/track?" + url);
				}
				return;
			}

			function doCheck(str) {

				console.log("hi");

				//체크된 체크박스 길이 가져오기
				let checkedLength = $("input[name=checkRow-"+str+"]:checked").length;

				console.log(checkedLength);

				//체크된 체크박스가 하나도 없다면
				if (checkedLength == 0) {

					console.log("선택 안함...");
					//경고창을 띄워준다
					alert("노래를 선택해주세요");
					return false;
				} else {
					//하나 이상이라도 체크박스에 체크가 되어 있다면 아무것도 하지 않는다
					console.log("선택했어!");
					return true;
				}
			}
			
			
			function selectPlaylist2(str) {
				$(".selectPlaylist2").on("click", function() {
					let index = $(".selectPlaylist2").index(this);
					console.log("누른 버튼의 플레이리스트 아이디 : " + $(".selectPlaylist2:eq(" + index + ")").val());

					$("#modal2").attr("style", "display:none");

					// 넣을 플레이리스트ID
					let plylstId = $(".selectPlaylist2:eq(" + index + ")").val();

					// 재생목록에 추가할 체크된 트랙ID들을 담는 배열
					let checkedTracks = [];
					$("input[name=checkRow-" + str + "]:checked").each(function () {
						checkedTracks.push($(this).val());
					});
					
					addToPlaylist(checkedTracks, plylstId);
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
					}, error : function() {

					}
				});
			}
			
			//좋아요 클릭하면 하트 색깔 바뀌게 설정(클릭한 곡의 track_id 값을 설정해놓음)--------------------------------------------------------                    
            $(document).ready(function(){        
            	
            	 // 처음엔 모든 수록곡의 빨간하트를 숨기고 빈하트만 보여준다.
                $(".redHeartImg").hide();
                
                // 좋아요한 노래에 해당하는 노래들은 빈하트를 숨기고 빨간 하트를 보여준다.(track_id 값을 설정해놓음)
                <c:forEach items="${getLikedTrack}" var="getLikedTrack">
                   $("img[name='${getLikedTrack.trackId}'][class=defaultHeartImg]").hide();
                   $("img[name='${getLikedTrack.trackId}'][class=redHeartImg]").show();
                </c:forEach>
                
                //빈 하트 클릭할 때
                $(".defaultHeartImg").on("click", function(){
                	sessionCheck();
                   
                   let index = $(".defaultHeartImg").index(this);   //누른 하트의 인덱스 저장
                   
                   $(".defaultHeartImg:eq(" + index + ")").hide();   //누른 하트를 숨기기
                   $(".redHeartImg:eq(" + index + ")").show();   //누른 곳에 빨간 하트를 표시
                   console.log("좋아요할 노래아이디 : " + $(".defaultHeartImg:eq(" + index + ")").attr("name"));
                });
                
                //빨간 하트 클릭할때
                $(".redHeartImg").on("click", function(){
                   
                   let index = $(".redHeartImg").index(this);      //누른 하트의 인덱스 저장
                   
                   $(".redHeartImg:eq(" + index + ")").hide();   //누른 하트를 숨기기
                   $(".defaultHeartImg:eq(" + index + ")").show();   //누른 곳에 빈 하트를 표시
                   console.log("좋아요 취소할 노래아이디 : " + $(".redHeartImg:eq(" + index + ")").attr("name"));
                });
			})
            
		</script>


	</div>
	<!--bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!--body-->
<%@include file="../includes/footer.jsp"%>