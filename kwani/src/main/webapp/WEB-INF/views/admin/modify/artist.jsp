<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel paenl-default">
				<div class="panel-body">

					<h4>${msg }</h4>
					<form action="/admin/modifyArtistAction" method="post"
						enctype="multipart/form-data" onsubmit="return checkInput();">
						<h5>T_ARTIST</h5>
						<div class="form-group">
							<label>ID</label> <input class="form-control" type="text"
								name="gropId" value="${artist.gropId }" readonly="readonly">
						</div>
						<div class="form-group">
							<label>이미지</label> <input class="form-control" type="file"
								name="imgFile" id="imgFile">
						</div>

						<div class="form-group">
							<label>이름</label> <input class="form-control" type="text"
								name="nm" id="nm" value="${artist.nm }">
						</div>
						<div class="form-group">
							<label>성별</label> <input class="form-control" type="text"
								name="sex" id="sex" value="${artist.sex }">
						</div>
						<div class="form-group">
							<label>활동유형</label> <select class="form-control" name="type"
								id="type">
								<option value="g">그룹</option>
								<option value="s">솔로</option>
								<option value="sg">그룹,솔로</option>
							</select>

						</div>
						<div class="form-group">
							<label>데뷔일</label> <input class="form-control" type="date" name="debutDt"
								id="debutDt">

						</div>
						<div class="form-group">
							<label>상태코드</label> <input class="form-control"
								 type="number" name="stusCd" id="stusCd"
								value="${artist.stusCd }">
						</div>

						<input type="hidden" value="${mngrId }" name="upUser">

						<button class="btn btn-sm btn-success">수정</button>
					</form>
				</div>
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

		let nmFld =  document.getElementById("nm");
		let sexFld =  document.getElementById("sex");
		let typeFld =  document.getElementById("type");
		let dateFld =  document.getElementById("debutDt");
		let stusFld =  document.getElementById("stusCd");
		let imgFld =  document.getElementById("imgFile");
		
		let gropImg = imgFld.files.item(0);

		
		const specialPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		const numRegex = /[^0-9]/g;
		
		if (!check(specialPattern, nmFld, "활동명에 특수문자는 안됩니다")) {
			return false;
		}
		
		if (nmFld.value.trim() == "") {
			alert("활동명을 적어주세요")
			return false;
		}
		if (nmFld.value.trim().length > 30) {
			alert("활도명이 30자를 넘습니다");
			nmFld.value = "";
			return false;
		}
		
		
		
		
		if (sexFld.value.trim() == "") {
			alert("성별을 입력해주세요 f,m");
			return false;
		}
		if (sexFld.value.trim().length > 5) {
			alert("성별이 너무 깁니다");
			sexFld.value = "";
			return false;
		}
		if (typeFld.value == "") {
			alert("활동유형을 골라주세요");
			return false;
		}

		

		if (stusCdFld.value == "") {
			alert("상태코드를 입력해주세요");
			return false;
		} else if (stusCdFld.value.length > 2) {
			alert("stusCd 의 길이가 2을 넘습니다");
			stusCdFld.value = "";
			return false
		}
		if (!check(numRegex, stusCdFld, "상태코드는  숫자만 입력해주세요")) {
			return false;
		}
		
		

		if (imgFld.value == "") {
			alert("파일을 선택해주세요");
			return false;
		}
		
		if (!checkExtension(gropImg.name, gropImg.size)) {
			return false;
		}
		
		
		
		
		return true;

	}
</script>

<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


