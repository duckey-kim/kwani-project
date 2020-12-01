<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-5 col-md-offset-2 ">
			<h4>${msg }</h4>
			<h4>INPUT ARTIST</h4>
			<h4>Search Artist</h4>
			<form id='searchForm' action="/admin/getArtist" method="post">
				<input class="form-control" type="text" name="nm" id="nm"
					placeholder="가수이름입력">
				<button>가수찾기</button>
			</form>
			<h5>GROUP NAME : ${artist.nm }</h5>
			<h5>GROUP ID :${artist.gropId }</h5>
			<form action="/admin/inputartisttracksAction" method="post"
				onsubmit="return checkInput();">
				<h5>Input GROUP_ID</h5>
				<input class="form-control" type="text" name="gropId" id="gropId">
				<div>TRACKID</div>
				<input class="form-control" type="text" name="trackId" id="trackId">
				<button class="btn btn-sm btn-success">등록</button>
			</form>
		</div>
		<div class="col-md-5">
			<h4>가수와 연결되지 않은 노래</h4>
			<table>
				<tr>
					<td>트랙번호</td>
					<td>트랙명</td>
				</tr>
				<c:forEach items="${trackList}" var="track">
					<tr>
						<td>${track.trackId}</td>
						<td>${track.trackTtl}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>


<script type="text/javascript">
	$(document).ready(function() {

		let searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (searchForm.find("input").val().trim() == "") {
				alert("가수이름을 입력해주세요")
				return false;
			}
			e.preventDefault();
			searchForm.submit();

		})
	});
</script>
<script type="text/javascript">
	function check(pattern, input, message) {
		if (!pattern.test(input.value)) {
			return true;
		}
		alert(message);
		input.value = "";
		input.focus();
	}

	function checkInput() {
		const trackIdFld = document.getElementById("trackId");
		const gropIdFld = document.getElementById("gropId");

		const numRegex = /[^0-9]/g;

		if (!check(numRegex, trackIdFld, "trackId는 숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, gropIdFld, "gropId는 숫자만 입력해주세요")) {
			return false;
		}

		if (trackIdFld.value.trim() == "") {
			alert("trackId을 입력해주세요");
			return false;
		}
		if (trackIdFld.value.trim().length > 10) {
			alert("trackId의 길이가 10을 넘었습니다");
			trackIdFld.value = "";
			return false;
		}
		if (gropIdFld.value.trim() == "") {
			alert("gropId 을 입력해주세요");
			return false;
		}
		if (gropIdFld.value.trim().length > 10) {
			alert("gropId의 길이가 10을 넘었습니다")
			gropIdFld.value = "";
			return false;
		}

		return true;

	}
</script>

<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>