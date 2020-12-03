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
				
				<h4>${msg }</h4>
				<form action="/admin/modifyArtistAction" method="post"
					onsubmit="return checkInput();">
					<h5>T_ARTIST</h5>
					<div class="form-group">
					<label>ID</label>
						<input  class="form-control"  placeholder="NAME" type="text" name="gropId"
							value="${artist.gropId }" readonly="readonly">
					</div>
					
					<div class="form-group">
					<label>이름</label>
						<input  class="form-control"  placeholder="NAME" type="text" name="nm"
							value="${artist.nm }">
					</div>
					<div class="form-group">
					<label>성별</label>
						<input  class="form-control" placeholder="GENDER" type="text" name="sex"
							value="${artist.sex }">
					</div>
					<div class="form-group">
					<label>활동유형</label>
						<select  class="form-control"name="type">
							<option value="g">그룹</option>
							<option value="s">솔로</option>
							<option value="sg">그룹,솔로</option>
						</select>

					</div>
					<div class="form-group">
					<label>데뷔일</label>
						<input  class="form-control" placeholder="DEBUT 2020-10-10" type="text" name="debutDt"
							 >

					</div>
					<div class="form-group">
					<label>상태코드</label>
						<input  class="form-control" placeholder="상태코드" type="text" name="statusCode"
							value="${artist.stusCd }">
					</div>
					<div class="form-group">
					<label>이미지</label>
						<input  class="form-control" placeholder="이미지" type="text" name="statusCode"
							value="${artist.gropImg}">
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
	function check(pattern, input, message) {
		if (pattern.test(input.value)) {
			return true;
		}
		alert(message);
		input.value = "";
		input.focus();
	}

	function checkInput() {
		let formControl = document.getElementsByClassName("form-control");
		const datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

		let nmFld = formControl[2];
		let sexFld = formControl[3];
		let typeFld = formControl[4];
		let dateFld = formControl[5];
		let stusFld = formControl[6];
		let imgFld = formControl[7];

		let typevalue = typeFld.value.trim();
		if (nmFld.value.trim() == "") {
			alert("Artist name is empty")
			return false;
		}
		if (nmFld.value.trim().length > 30) {
			alert("name lenght 30 over");
			nmFld.value = "";
			return false;
		}
		if (sexFld.value.trim() == "") {
			alert("가수 성별 is empty");
			return false;
		}
		if (sexFld.value.trim().length > 5) {
			alert("sex  lenght 5 over");
			sexFld.value = "";
			return false;
		}
		if (typeFld.value == "") {
			alert("아티스트의 유형을 입력해주세요");
			return false;
		}

		if (!check(datePattern, dateFld, "날짜는 yyyy-MM-dd형식을 지켜주세요")) {
			return false;
		}
		
		if (stusFld.value.trim() == "") {
			alert("상태코드 가 비었습니다");
			return false;
		}
		if (stusFld.value.trim().length > 3) {
			alert("상태코드의 길이가 3을 초과하였습니다.");
			stusFld.value = "";
			return false;
		}
		
		
		if (imgFld.value.trim() == "") {
			alert("이미지를 추가해주세요");
			return false;
		}
		return true;

	}
</script>

<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


