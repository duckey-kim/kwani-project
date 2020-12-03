<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>
	<h4>${msg }</h4>
	<div class="container">
		<div class="row">
			<div class="col-md-12 ">
				<div class="login-panel panel paenl-default">
					
					
					<form action="/admin/inputalbumAction" method="post"
						onsubmit="return checkInput();">
						<h5>T_ALBUM</h5>
						<div>
							<input  class="form-control"placeholder="albumIMG" type="text" name="albumImg" id="albumImg" value="${album.albumImg }">
						</div>
						<div>
							<input class="form-control"placeholder="album_title" type="text" name="albumTtl" id="albumTtl"
								value="${album.albumTtl }">
						</div>
						<div>
							<input class="form-control"placeholder="상태코드" type="text" name="stusCd" id="stusCd"
								value="${album.stusCd }">
						</div>
						<div>
							 <input  class="form-control"placeholder="releaseDate" type="text" name="rlesDt" id="rlesDt"
								placeholder="2020-10-31" value="${album.rlesDt }">
						</div>
							
						<input type="hidden" name="upUser" id="upUser" value="${mngrId} ">	
						
						<button class="btn btn-sm btn-success">등록</button>
					</form>
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
			let albumFld = document.getElementById("albumTtl");
			let dateFld = document.getElementById("rlesDt");
			let stusCdFld = document.getElementById("stusCd");
			let albumImgFld = document.getElementById("albumImg");

			let albumTtl = albumFld.value.trim();
			let rlesDt = dateFld.value.trim();
			let stusCd = stusCdFld.value.trim();
			let albumImg=albumImgFld.value.trim();
			
			const specialPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			const datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

			if (specialPattern.test(album.value)) {
				alert("특수문자는 사용이 안됩니다");
				albumFld.value = "";
				return false;
			}

			if (!check(datePattern, dateFld, "날짜는 yyyy-MM-dd형식을 지켜주세요")) {
				return false;
			}

			if (albumTtl == "") {
				alert("album_title is empty")
				return false;
			} else if (albumTtl.length > 30) {
				alert("album_title의 길이가 30을 넘습니다")
				albumFld.value = "";
				return false
			}
			if (rlesDt == "") {
				alert("releaseDate is empty")
				return false;
			}
			
			if (stusCd == "") {
				alert("상태코드 is empty")
				return false;
			} else if (stusCd.length > 2) {
				alert("stusCd 의 길이가 2을 넘습니다")
				stusCdFld.value = "";
				return false
			}
			if (albumImg == "") {
				alert("앨범IMG is empty")
				return false;
			} else if (albumImg.length >100) {
				alert("ALbumImg 의 길이가 100을 넘습니다")
				albumImgFld.value = "";
				return false
			}
			
			
			return true;
			
		}
	</script>
	<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>