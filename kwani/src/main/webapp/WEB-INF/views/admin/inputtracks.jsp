<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-6 ">
			<div class="panel paenl-default">
				<div class="panel-body">
					<h4>${msg}</h4>
					<h4>곡 입력</h4>
					<h4>앨범ID 찾기</h4>

					<form id='searchForm' action="/admin/getAlbum" method="post">
						<input class="form-control" type="text" name="albumTtl"
							id="albumTtl">
						<button class="btn btn-sm btn-success">앨범ID찾기</button>
					</form>
					<div>
						<h4>앨범ID : ${album.albumId }</h4>
						<h4>앨범제목 : ${album.albumTtl }</h4>

					</div>
					<form action="/admin/inputtracksAction" method="post"
						onsubmit="return checkInput();">

						<div class="form-group">
							<label>타이틀</label> <input class="form-control"
								placeholder="track title" type="text" name="trackTtl"
								id="trackTtl" value="${track.trackTtl}">
						</div>
						<div class="form-group">
							<label>URL</label> <input class="form-control"
								placeholder="track url" type="text" name="trackUrl"
								id="trackUrl" value="${track.trackUrl}">
						</div>
						<div class="form-group">
							<label>앨범ID</label> <input class="form-control"
								placeholder="albumId" type="text" name="albumId" id="albumId"
								value="${track.albumId}">
						</div>
						<div class="form-group">
							<label>노래순서</label> <input class="form-control"
								placeholder="albumId" type="number" name="trackOrder"
								id="trackOrder" value="${track.trackOrder}">
						</div>


						<div class="form-group">
						<label>타이틀인가요?</label>
							<input class="form-control" placeholder="Y:1,N:0" type="number"
								id="ttlTrack" name="ttlTrack" value="${track.ttlTrack}">
						</div>
						<div class="form-group">
							<label>분위기코드</label> <input class="form-control"
								placeholder="Mood Code" type="number" id="moodCd" name="moodCd"
								value="${track.moodCd}">
						</div>
						<div class="form-group">
							<label>장르코드</label> <input class="form-control"
								placeholder="Genre Code" type="number" name="genreCd"
								id="genreCd" value="${track.genreCd}">
						</div>
						<div class="form-group">
							<label>상태코드</label> <input class="form-control"
								placeholder="Status Code" type="number" name="stusCd"
								id="stusCd" value="${track.stusCd}">
						</div>
						<div class="form-group">
							<label>가사</label>
							<textarea rows="3" style="width: 100%" wrap="soft"
								maxlength="1300" placeholder="가사를 입력해주세요" name="trackLyrics"
								id="trackLyrics">${track.trackLyrics}</textarea>
						</div>

						<div class="form-group">
							<label>상황코드</label> <input class="form-control"
								placeholder="Situation Code" type="number" name="situCD"
								id="situCd" value="${track.situCd}">
						</div>



						<input type="hidden" name="upUser" id="upUser" value="${mngrId} ">
						<button class="btn btn-sm btn-success">등록</button>

					</form>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="panel paenl-default">
				<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th width="50%">코드 네임</th>
							<th width="50%">코드 번호</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${codeList}" var="code">
							<tr>
								<td>
											${code.CODENM}
								</td>

								<td>
											${code.CODENO}

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


	let check = function(pattern, input, message) {
		if (!pattern.test(input.value)) {
			return true;
		}
		alert(message);
		input.value = "";
		input.focus();
	}

	let checkInput = function() {
		let ttlFld = document.getElementById("trackTtl");
		let urlFld = document.getElementById("trackUrl");
		let albumFld = document.getElementById("albumId");
		let orderFld = document.getElementById("trackOrder");

		let isttlFld = document.getElementById("ttlTrack");

		let moodFld = document.getElementById("moodCd");
		let genreFld = document.getElementById("genreCd");
		let stusFld = document.getElementById("stusCd");
		let lyricsFld = document.getElementById("trackLyrics");
		let situFld = document.getElementById("situCd");

		const numRegex = /[^0-9]/g;
		const specialPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		

		if (!check(numRegex, stusFld, "상태코드는  숫자만 입력해주세요")) {
			return false;
		}

		if (!check(numRegex, moodFld, "분위기코드는  숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, genreFld, "장르코드는  숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, situFld, "상황코드는  숫자만 입력해주세요")) {
			return false;
		}

		if (!check(numRegex, albumFld, "앨범ID는 숫자만 입력해주세요")) {
			return false;
		}

		if (!check(numRegex, orderFld, "노래순서는 숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, isttlFld, "타이틀 여부는 0,1는 숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, albumFld, "앨범ID는 숫자만 입력해주세요")) {
			return false;
		}
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
		if (albumFld.value.trim().length > 100) {
			alert("앨범ID의 길이가 100을 넘었습니다");
			albumFld.value = "";
			return false;
		}

		if (orderFld.value.trim() == "") {
			alert("노래순서 을 입력해주세요");
			return false;
		}
		if (orderFld.value.trim().length > 3) {
			alert("노래순서의 크기가 3을 넘었습니다")
			orderFld.value = "";
			return false;
		}

		if (isttlFld.value.trim() == "") {
			alert("타이틀여부를 입력해주세요");
			return false;
		}
		if (isttlFld.value.trim().length > 2) {
			alert("타이틀여부가 크기 2을 넘었습니다")
			isttlFld.value = "";
			return false;
		}

		if (moodFld.value.trim() == "") {
			alert("분위기코드를 입력해주세요");
			return false;
		}
		if (moodFld.value.trim().length > 5) {
			alert("분위기코드가 크기 5을 넘었습니다")
			moodFld.value = "";
			return false;
		}

		if (genreFld.value.trim() == "") {
			alert("장르코드를 입력해주세요");
			return false;
		}
		if (genreFld.value.trim().length > 5) {
			alert("장르코드가 크기 5을 넘었습니다")
			genreFld.value = "";
			return false;
		}

		if (situFld.value.trim() == "") {
			alert("상황코드를 입력해주세요");
			return false;
		}
		if (situFld.value.trim().length > 5) {
			alert("상황코드 크기 5을 넘었습니다")
			situFld.value = "";
			return false;
		}

		if (stusFld.value.trim() == "") {
			alert("상태코드 입력해주세요");
			return false;
		}
		if (stusFld.value.trim().length > 5) {
			alert("상태코드 크기 5을 넘었습니다")
			stusFld.value = "";
			return false;
		}

		if (lyricsFld.value.trim() == "") {
			alert("가사를 입력해주세요");
			return false;
		}
		if (lyricsFld.value.trim().length > 1300) {
			alert("가사가 1300자를 넘었습니다")
			lyricsFld.value = "";
			return false;
		}

		return true;

	}
</script>
<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>