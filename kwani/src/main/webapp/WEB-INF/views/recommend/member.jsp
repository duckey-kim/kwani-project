<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home</title>
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
.modal {
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

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

.modalTitle {
	text-align: center;
	font-weight: bold;
	padding-bottom: 20px;
}

.plylstListWrap {
	display: flex;
	flex-direction: column;
}

.plusNew {
	height: 50px;
	width: 90%;
	justify-content: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.plusImg {
	height: 40px;
	width: 20%;
}

.plusTxt {
	height: 40px;
	width: 70%;
	display: flex;
	align-items: center;
}

.userPlylst {
	height: 50px;
	width: 100%;
	justify-content: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.userPlylstImg {
	height: 40px;
	width: 20%;
}

.userPlylstNm {
	height: 40px;
	width: 60%;
	/* display: flex; */
	display: block;
	align-items: center;
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.userPlylstTrackCnt {
	height: 40px;
	width: 20%;
	align-items: center;
	text-align: right;
}
#plylstInfo{
   
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
			<h1>${user.nick}님이많이들은 장르 곡 추천</h1>
		</div>
		<!--plylstInfo-->

		<div id="tracks">
			<h2>Tracks</h2>
		</div>
		<div id="plylstBtn">
			<button class="button"
				onclick='popupPlayer("/player/track?trackId=${plistListDtl[0].trackId}")'>듣기</button>
			<button class="button" id="plusPlylstBtn">담기</button>
		</div>
		<div id="plylstTable">
			<table>
				<tr>
					<th class="th0"><input type="checkbox" name="checkAll"
						class="checkAll"></th>
					<th class="th1">번호</th>
					<th class="th2">가수</th>
					<th class="th3">제목</th>
					<th class="th4">듣기</th>
					<th class="th4">좋아요</th>
				</tr>

				<c:forEach items="${genreList}" var="genreList" varStatus="status"
					begin="0" end="19">
					<tr>
						<th><input type="checkbox" name="checkRow"></th>
						<td class="num">${status.index+1}</td>
						<td><c:out value="${genreList.NM}" /></td>
						<td><c:out value="${genreList.TRACK_TTL}" /></td>
						<td class="btnParent"><img class="playBtn"
							src="/resources/image/play-button.png"></td>
						<td>
							<div class="heartParent">
								<img class="defaultHeartImg" name="${genreList.TRACK_ID}"
									src="/resources/image/heart2.png" onclick="sessionCheck()">
								<img class="redHeartImg" name="${genreList.TRACK_ID}"
									src="/resources/image/heart.png">
							</div>
						</td>

					</tr>
				</c:forEach>

			</table>
		</div>


		<div id="plylstInfo">
			<h1>${user.nick}님이많이 들은 테마장르 추천</h1>
		</div>

		<div id="tracks">
			<h2>Tracks</h2>
		</div>
		<div id="plylstBtn">
			<button class="button"
				onclick='popupPlayer("/player/track?trackId=${plistListDtl[0].trackId}")'>듣기</button>
			<button class="button" id="plusPlylstBtn">담기</button>
		</div>
		<div id="plylstTable">
			<table>
				<tr>
					<th class="th0"><input type="checkbox" name="checkAll"
						class="checkAll"></th>
					<th class="th1">번호</th>
					<th class="th2">가수</th>
					<th class="th3">제목</th>
					<th class="th4">듣기</th>
					<th class="th4">좋아요</th>
				</tr>

				<c:forEach items="${typeList}" var="typeList" varStatus="status"
					begin="0" end="19">
					<tr>
						<th><input type="checkbox" name="checkRow"></th>
						<td class="num">${status.index+1}</td>
						<td><c:out value="${typeList.NM}" /></td>
						<td><c:out value="${typeList.TRACK_TTL}" /></td>
						<td class="btnParent"><img class="playBtn"
							src="/resources/image/play-button.png"></td>
						<td>
							<div class="heartParent">
								<img class="defaultHeartImg" name="${typeList.TRACK_ID}"
									src="/resources/image/heart2.png" onclick="sessionCheck()">
								<img class="redHeartImg" name="${typeList.TRACK_ID}"
									src="/resources/image/heart.png">
							</div>
						</td>

					</tr>
				</c:forEach>

			</table>
		</div>







		<!-- The Modal -->
		<div id="myModal" class="modal" style="display: none">

			<!-- Modal content -->
			`
			<div class="modal-content">
				<span class="close">&times;</span>
				<p class="modalTitle">내 플레이리스트에 추가</p>
				<div class="plylstListWrap">
					<div class="plusNew">
						<div class="plusImg">
							<img src="/resources/image/plus.png" style="max-height: 36px" />
						</div>
						<div class="plusTxt">
							<p>새 플레이리스트</p>
						</div>
					</div>
					<c:forEach items="${getUserPlylst}" var="userPlylst">
						<div class="userPlylst">
							<div class="userPlylstImg">
								<img
									src="/resources/image/album/<c:out value="${userPlylst.plylstImg}" />"
									style="max-height: 40px">
							</div>
							<div class="userPlylstNm">
								<p style="padding-top: 10px">
									<c:out value="${userPlylst.nm}" />
								</p>
							</div>
							<div class="userPlylstTrackCnt">
								<p style="padding-top: 10px">
									<c:out value="${userPlylst.trackCnt}" />
									1 곡
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
				<!-- plylstListWrap -->
			</div>
			<!-- modal-content -->
		</div>
		<!-- myModal -->


		<script>
                console.log("sessionName : " + '${sessionName}');

                let popupPlayer = function(url){
                    let moveTop=screen.height-440;
                     let moveLeft=screen.width-537;
                   window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
                }

                //로그인 안되어있을 때
                //좋아요 버튼, 플레이리스트 담기 버튼 누르면 로그인 페이지로 이동하게 하기--------------------------
                function sessionCheck(){

                	console.log("sessionCheck 실행");
                	console.log("sessionName : " + '${sessionName}');

                	if('${sessionName}' == ''){

                		console.log("로그인 안되어있어");
                		moveToLogin();
                		return

                    }
                	else{
                		return true;
                	}
                }

                function moveToLogin(){
                	console.log("go login")
                	window.location = "/user/login";
                }


                //모달창 --------------------------------------------------------------------------
                let modal = document.getElementById("myModal");

                let btn = document.getElementById("plusPlylstBtn");

                let span = document.getElementsByClassName("close")[0];

                //'담기' 버튼을 눌렀을 때
                btn.onclick = function(){
                	//doCheck()를 실행해서
                	//체크박스에 체크가 하나도 안되어 있다면 경고창 나오게 하고
                	//체크박스에 하나 이상 체크가 되어 있다면 모달창을 보여준다
                	if(sessionCheck()){
                		doCheck();
                	};
                }

                span.onclick = function(){
                	modal.style.display = "none";
                }

                window.onclick = function(event){
                	if(event.target == modal){
                		modal.style.display = "none";
                	}
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

 				//체크박스에 하나도 체크 안되어 있으면 담기 버튼 눌렀을 때 경고창 나오게 하기--------------------------------
 				function doCheck(){

 					console.log("hi");

 					//체크된 체크박스 길이 가져오기
 	                checkedLength = $("[name=checkRow]:checked").length;

 	                console.log(checkedLength);

 	                //체크된 체크박스가 하나도 없다면
 	                if(checkedLength == 0){

 	                	console.log("선택 안함...");
 	                	//경고창을 띄워준다
 	                	alert("노래를 선택해주세요");
 	                	return;
 	                }else{
 	                	//하나 이상이라도 체크박스에 체크가 되어 있다면 아무것도 하지 않는다
 	                	console.log("선택했어!");
 	                	modal.style.display = "block";
 	                	return;
 	                }
 	             }




                //체크박스 설정-------------------------------------------------------------------------
                	function allCheckFunc(obj){
                		//모든 checkRow의 속성이 checked가 되게 한다
                		$("[name=checkRow]").prop("checked", $(obj).prop("checked"));
                	}

                	function oneCheckFunc(obj){

                		//checkAll이란 name값을 가진 요소를 allObj에 저장한다
                		let allObj = $("[name=checkAll]");
                		//obj의 name이란 속성(attribute)값을 objName에 저장한다
                		let objName = $(obj).attr("name");

                		//obj의 속성값이 checked라면
                		if($(obj).prop("checked")){

                			//모든 체크박스의 길이를 변수로 지정
                			checkBoxLength = $("[name=" + objName + "]").length;
                			//체크된 체크박스의 길이를 변수로 지정
                			checkedLength = $("[name=" + objName + "]:checked").length;

                			//전체 체크박스의 개수와 체크된 체크박스의 개수가 일치하면
                			if(checkBoxLength == checkedLength){
                				//checkAll 이름의 체크박스를 체크한다
                				allObj.prop("checked", true);
                			}else{
                				//하나라도 체크가 안된 경우에는 checkAll 체크박스를 해제한다
                				allObj.prop("checked", false);
                			}
                		}
                		else{//obj가 checked된 것이 아니라면
                			//checkAll이 체크를 해제한다
                			allObj.prop("checked", false);
                			console.log("선택 해제!!!");
                		}
                	}

                	$(function(){

                		$("[name=checkAll]").click(function(){
                			//checkAll 이름의 체크박스를 클릭하면 전체가 선택되게 한다
                			allCheckFunc(this);
                		});
                		$("[name=checkRow]").each(function(){
                			//checkRow라는 이름의 체크박스 하나하나에 oneCheckFunc 메서드를 적용시킨다
                			//checkRow 체크박스 하나하나 모두 체크되면 checkAll 체크박스도 체크된다
                			$(this).click(function(){
                				oneCheckFunc($(this));
                			});
                		});
                	});

                </script>


	</div>
	<!--bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!--body-->
<%@include file="../includes/footer.jsp"%>