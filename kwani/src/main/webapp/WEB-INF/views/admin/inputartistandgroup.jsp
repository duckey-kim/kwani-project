<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel paenl-default">
				<div class="panel-body">
					<h4>${msg }</h4>
					<h4>Group and Artist</h4>
					<form id='searchForm' action="/admin/getArtistGroup" method="post">
						
						<div class="form-group">
						<label>가수</label>						
						<input class="form-control" type="text" name="nm" id="nm"
							placeholder="가수이름입력">
						</div>
						
						<button class="btn btn-sm btn-success">가수찾기</button>
					</form>
					<h5>GROUP NAME : ${artist.nm }</h5>
					<h5>GROUP ID :${artist.gropId }</h5>

					<form action="/admin/inputartistgroupAction" method="post"
						onsubmit="return checkInput();">
						<div class="form-group">
							<div class="form-group">
							<label>그룹아이디</label>							
							<input class="form-control" type="text" name="gropId" id="gropId">
							</div>
							
							<div class="form-group">
							<label>솔로아이디</label>							
							<input class="form-control" type="text" name="soloId" id="soloId">
							</div>
						</div>


						<input type="hidden" name="upUser" id="upUser" value="${mngrId} ">
						<button class="btn btn-sm btn-success">등록</button>
					</form>
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
				alert("가수이름을 입력해주세요")
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
		const soloIdFld = document.getElementById("soloId");
		const gropIdFld = document.getElementById("gropId");

		const numRegex = /[^0-9]/g;

		if (!check(numRegex, gropIdFld, "gropId는 숫자만 입력해주세요")) {
			return false;
		}
		if (!check(numRegex, soloIdFld, "soloId는 숫자만 입력해주세요")) {
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