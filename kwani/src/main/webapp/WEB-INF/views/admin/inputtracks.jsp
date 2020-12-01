<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel paenl-default">
				<div class="panel-body">



					<h4>${msg}</h4>
					<h3>T_TRACKS</h3>
					<h4>Search albumId</h4>

					<form id='searchForm' action="/admin/getAlbum" method="post">
						<input  class="form-control" type="text" name="albumTtl" id="albumTtl">
						<button class="btn btn-sm btn-success">앨범ID찾기</button>
					</form>
					<div>
						<h4>albumId : ${album.albumId }</h4>
						<h4>albumTtl : ${album.albumTtl }</h4>

					</div>
					<form action="/admin/inputtracksAction" method="post"
						onsubmit="return checkInput();">

						<div style="margin-top: 10px">
							<input class="form-control"placeholder="track title" type="text" name="trackTtl"
								id="trackTtl" value="${track.trackTtl}">
						</div>
						<div>
							<input class="form-control"placeholder="track url" type="text" name="trackUrl"
								id="trackUrl" value="${track.trackUrl}">
						</div>
						<div>
							<input class="form-control"placeholder="albumId" type="text" name="albumId"
								id="albumId" value="${track.albumId}">
						</div>


						<div>
							<input class="form-control"placeholder="isTitle?" type="text" name="ttlTrack">
						</div>
						<div>
							<input class="form-control" placeholder="Mood Code" type="text" name="tMoodCode">
						</div>
						<div>
							<input class="form-control"placeholder="Genre Code" type="text" name="tGenreCode">
						</div>
						<div>
							<input class="form-control"placeholder="Status Code" type="text" name="tStusCode">
						</div>
						<input class="form-control"placeholder="Situation Code" type="text" name="tSituCode">

						<button class="btn btn-sm btn-success">등록</button>

					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<script type="text/javascript" src="/resources/js/admin.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		let searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (searchForm.find("input").val().trim() == "") {
				alert("앨범title을 입력해주세요")
				return false;
			}
			e.preventDefault();
			searchForm.submit();

		})
	});
</script>
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