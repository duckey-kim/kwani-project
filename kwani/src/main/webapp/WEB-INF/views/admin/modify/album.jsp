<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-12 ">
			<div class="panel paenl-default">
				<form action="/admin/modifyAlbumAction" method="post"
					enctype="multipart/form-data" onsubmit="return checkInput();">
					<h5>T_ALBUM</h5>
					<div class="form-group">
						<label>ID</label> <input class="form-control" type="text"
							readonly="readonly" name="albumId" value="${album.albumId }"
							id="albumId">
					</div>


					<div class="form-group">
						<label>이미지</label> <input class="form-control" type="file"
							name="imgFile" id="imgFile">
					</div>
					<div class="form-group">
						<label>제목</label> <input class="form-control"
							placeholder="album_title" type="text" name="albumTtl"
							id="albumTtl" value="${album.albumTtl }">
					</div>
					<div class="form-group">
						<label>발매일</label> <input class="form-control"
							placeholder="releaseDate" type="text" name="rlesDt" id="rlesDt"
							placeholder="2020-10-31">
					</div>
					<div class="form-group">
						<label>상태코드</label> <input class="form-control" type="text"
							name="stusCd" id="stusCd" value="${album.stusCd }">
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
	let checkExtension = function(fileName, fileSize) {
		const imgRegex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		const maxSize = 5242880;
		if (fileSize >= maxSize) {
			alert("파일사이즈 초과");
			return false;
		}
		if (imgRegex.test(fileName)) {
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}

	let check = function(pattern, input, message) {
		if (!pattern.test(input.value)) {
			return true;
		}
		alert(message);
		input.value = "";
		input.focus();
	}

	let checkInput = function() {

		let titleFld = document.getElementById("albumTtl");
		let dateFld = document.getElementById("rlesDt");
		let stusCdFld = document.getElementById("stusCd");
		let imgFld = document.getElementById("imgFile");

		let albumImg = imgFld.files.item(0);
		let albumTtl = titleFld.value.trim();
		let rlesDt = dateFld.value.trim();
		let stusCd = stusCdFld.value.trim();

		const specialPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		const datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

		if (specialPattern.test(titleFld.value)) {
			alert("특수문자는 사용이 안됩니다");
			titleFld.value = "";
			return false;
		}

		if (!check(datePattern, dateFld, "날짜는 yy-MM-dd형식을 지켜주세요")) {
			return false;
		}

		if (albumTtl == "") {
			alert("제목이 비었습니다");
			return false;
		} else if (albumTtl.length > 30) {
			alert("album_title의 길이가 30을 넘습니다");
			titleFld.value = "";
			return false;
		}
		if (rlesDt == "") {
			alert("발매일을 입력해주세요");
			return false;
		}
		if (stusCd == "") {
			alert("상태코드를 입력해주세요");
			return false;
		} else if (stusCd.length > 2) {
			alert("stusCd 의 길이가 2을 넘습니다");
			stusCdFld.value = "";
			return false
		}

		if (albumImg == null) {
			alert("파일을 선택해주세요");
			return false;
		} else if (!checkExtension(albumImg.name, albumImg.size)) {
			return false;
		}

		return true;
	}
</script>



<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>