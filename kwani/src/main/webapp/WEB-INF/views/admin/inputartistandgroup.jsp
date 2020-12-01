<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel paenl-default">
				<div class="panel-body">
					<h4>${msg }</h4>
					<h4>Group and Artist</h4>
					<form id='searchForm' action="/admin/getArtistGroup" method="post">
						<input class="form-control" type="text" name="nm" id="nm"
							placeholder="가수이름입력">
						<button>가수찾기</button>
					</form>
					<h5>GROUP NAME : ${artist.nm }</h5>
					<h5>GROUP ID :${artist.gropId }</h5>

					<form action="/admin/inputartistgroupAction" method="post">
						<div>
							<h5>Input GROUP_ID</h5>
							<input class="form-control" type="text" name="gropId" id="gropId">
							<div>SOLO_ID</div>
							<input class="form-control" type="text" name="soloId" id="soloId">
						</div>



						<button>등록</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<a href="/admin/home">HOME</a>
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
		const soloIdFld = document.getElementById("soloId");
		const gropIdFld = document.getElementById("gropId");

		const numRegex = /[^0-9]/g;

		if (!check(numRegex, soloIdFld, "soloId는 숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, gropIdFld, "gropId는 숫자만 입력해주세요")) {
			return false;
		}

		if (soloIdFld.value.trim() == "") {
			alert("trackId을 입력해주세요");
			return false;
		}
		if (soloIdFld.value.trim().length > 10) {
			alert("trackId의 길이가 10을 넘었습니다");
			soloIdFld.value = "";
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