<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel paenl-default">
				<div class="panel-body">
				
				<h4>${msg }</h4>
				<form action="/admin/inputartistAction" method="post"
					onsubmit="return checkInput();">
					<h5>T_ARTIST</h5>
					<div>
						<input  class="form-control"  placeholder="NAME" type="text" name="nm"
							value="${artist.nm }">
					</div>
					<div>
						<input  class="form-control" placeholder="GENDER" type="text" name="sex"
							value="${artist.sex }">
					</div>
					<div>
						<select  class="form-control"name="type">
							<option value="g">그룹</option>
							<option value="s">솔로</option>
							<option value="sg">그룹,솔로</option>
						</select>

					</div>
					<div>
						<input  class="form-control" placeholder="DEBUT 2020-10-10" type="text" name="debutDt"
							value="${artist.debutDt }">

					</div>
					<button class="btn btn-sm btn-success">등록</button>
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
		let inputArr = document.getElementsByTagName("input");
		const datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

		let nmFld = inputArr[0];
		let sexFld = inputArr[1];
		let typeFld = document.getElementsByTagName("select")[0];
		let dateFld = inputArr[2];

		let typevalue = typeFld.value.trim();
		console.log(nmFld);
		console.log(sexFld);
		console.log(typeFld);
		console.log(dateFld);
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
			alert("가수 성별 is empty")
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

		return true;

	}
</script>
<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>
