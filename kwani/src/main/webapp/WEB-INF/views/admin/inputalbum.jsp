<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css" />
</head>
<body>
	<h4>${msg }</h4>
	<form action="/admin/inputalbumAction" method="post"
		onsubmit="return checkInput();">
		<h5>T_ALBUM</h5>
		<div>
			img <input type="text" name="albumImg">
		</div>
		<div>
			album_title <input type="text" name="albumTtl" id="albumTtl">
		</div>
		<div>
			releaseDate <input type="text" name="rlesDt" id="rlesDt"
				placeholder="2020-10-31">
		</div>



		<button>등록</button>
	</form>
	<a href="/admin/home">HOME</a>



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
			
			
			let albumTtl=album.value.trim();
			let rlesDt=date.value.trim();
			
			
			const specialPattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			const datePattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

			if (specialPattern.test(album.value)) {
				alert("특수문자는 사용이 안됩니다");
				album.value="";
				return false;
			}

			if (!check(datePattern, date, "날짜는 yyyy-MM-dd형식을 지켜주세요")) {
				return false;
			}

			if (albumTtl=="") {
				alert("album_title is empty")
				return false;
			} else if (albumTtl.length > 30) {
				alert("album_title의 길이가 30을 넘습니다")
				album.value="";
				return false
			}
			if (rlesDt== "") {
				alert("releaseDate is empty")
				return false;
			}
			return true;
		}
	</script>
</body>
</html>