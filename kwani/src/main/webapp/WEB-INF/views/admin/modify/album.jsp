<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-12 ">
			<div class="login-panel panel paenl-default">
				<form action="/admin/modifyAlbumAction" method="post"
					onsubmit="return checkInput();">
					<h5>T_ALBUM</h5>
					<div class="form-group">
					<label>ID</label>
						<input class="form-control" type="text" readonly="readonly"
							name="albumId" value="${album.albumId }">
					</div>


					<div class="form-group">
					<label>이미지</label>
						<input class="form-control" placeholder="albumIMG" type="text"
							name="albumImg" value="${album.albumImg }">
					</div>
					<div class="form-group">
					<label>제목</label>
						<input class="form-control" placeholder="album_title" type="text"
							name="albumTtl" id="albumTtl" value="${album.albumTtl }">
					</div>
					<div class="form-group">
					<label>발매일</label>
						<input class="form-control" placeholder="releaseDate" type="text"
							name="rlesDt" id="rlesDt" placeholder="2020-10-31"
							>
					</div>
					<div class="form-group">
					<label>상태코드</label>
						<input class="form-control" type="text" name="stusCd" id="stusCd"
							value="${album.stusCd }">
					</div>


					<input type="hidden" value="${mngrId }" name="upUser">
					<button type="submit" id="btnModify" class="btn btn-sm btn-success">수정</button>
				</form>
				<!--ㅡMODAL  -->

			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
	function check(pattern, input, message) {
		if (pattern.test(input.value)) {
			return true;
		}
		alert(message);
		input.value = "";
		input.focus();
	}

	function checkInput() {
		let album = document.getElementById("albumTtl");
		let date = document.getElementById("rlesDt");

		let albumTtl = album.value.trim();
		let rlesDt = date.value.trim();

		const specialPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		const datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

		if (specialPattern.test(album.value)) {
			alert("특수문자는 사용이 안됩니다");
			album.value = "";
			return false;
		}

		if (!check(datePattern, date, "날짜는 yyyy-MM-dd형식을 지켜주세요")) {
			return false;
		}

		if (albumTtl == "") {
			alert("album_title is empty")
			return false;
		} else if (albumTtl.length > 30) {
			alert("album_title의 길이가 30을 넘습니다")
			album.value = "";
			return false
		}
		if (rlesDt == "") {
			alert("releaseDate is empty")
			return false;
		}
		return true;
	}
</script>



<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>