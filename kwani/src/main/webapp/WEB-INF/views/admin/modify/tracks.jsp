<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="login-panel panel paenl-default">
				<div class="panel-body">

					<h5>T_TRACKS</h5>
					<h4>${msg }</h4>
					<form action="/admin/modifyTracksAction" method="post"
						onsubmit="return checkInput();">

						<div class="form-group">

							<label>타이틀</label> <input class="form-control"
								placeholder="track title" type="text" name="trackTtl"
								id="trackTtl" value="${track.trackTtl}">
						</div>
						<div class="form-group">
							<label>URL</label>
							<input class="form-control" placeholder="track url" type="text"
								name="trackUrl" id="trackUrl" value="${track.trackUrl}">
						</div>
						<div class="form-group">
						<label>앨범</label>
							<input class="form-control" placeholder="albumId" type="text"
								name="albumId" id="albumId" value="${track.albumId}">
						</div>
						<div class="form-group">
						<label>타이틀?</label>
							<input class="form-control" placeholder="isTitle?" type="text"
								name="ttlTrack" value="${track.ttlTrack }">
						</div>
						<div class="form-group">
						<label>분위기</label>
							<input class="form-control" placeholder="Mood Code" type="text"
								name="moodCd" value="${track.moodCd }">
						</div>
						<div class="form-group">
						<label>장르</label>
							<input class="form-control" placeholder="Genre Code" type="text"
								name="genreCd" value="${track.genreCd }">
						</div>
						<div class="form-group">
						<label>상태</label>
							<input class="form-control" placeholder="Status Code" type="text"
								name="stusCd" value="${track.stusCd }">
						</div>
						<div class="form-group">
						<label>상황</label>						
						<input class="form-control" placeholder="Situation Code"
							type="text" name="situCD" value="${track.situCd }">
						</div>

						<div class="form-group">
						<label>가사</label>
							<textarea rows="3" style="width: 100%" wrap="soft"
								maxlength="1300" placeholder="가사를 입력해주세요" name="trackLyrics">${track.trackLyrics }</textarea>
						</div>

						<input type="hidden" name="upUser" id="upUser" value="${mngrId} ">
						<button class="btn btn-sm btn-success">수정</button>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/admin.js"></script>

<script type="text/javascript">
	function checkInput() {
		const ttlFld = document.getElementById("trackTtl");
		const urlFld = document.getElementById("trackUrl");
		const albumFld = document.getElementById("albumId")

		const numRegex = /[^0-9]/g;

		if (ttlFld.value.trim() == "") {
			alert("노래title을 입력해주세요");
			return false;
		}
		if (ttlFld.value.trim().length > 30) {
			alert("title의 길이가 30을 넘었습니다");
			ttlFld.value = "";
			return false;
		}
		if (urlFld.value.trim() == "") {
			alert("url 을 입력해주세요");
			return false;
		}
		if (urlFld.value.trim().length > 60) {
			alert("url의 길이가 60을 넘었습니다")
			urlFld.value = "";
			return false;
		}
		if (albumFld.value.trim() == "") {
			alert("앨범ID을 입력해주세요");
			return false;
		}

		if (numRegex.test(albumFld.value.trim())) {
			alert("앨범ID는 숫자만 입력해주세요");
			albumFld.value = "";
			return false;
		}
		if (albumFld.value.trim().length > 100) {
			alert("앨범ID의 길이가 100을 넘었습니다");
			albumFld.value = "";
			return false;
		}

		return true;

	}
</script>


<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


