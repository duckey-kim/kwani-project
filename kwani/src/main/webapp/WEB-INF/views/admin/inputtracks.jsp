<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="/resources/css/admin.css" />
</head>
<body>
	<h4>${msg}</h4>
	<h3>T_TRACKS</h3>
	<h4>Search albumId</h4>
	<form id='searchForm' action="/admin/getAlbum" method="post">
		<input type="text" name="albumTtl" id="albumTtl">
		<button>앨범ID찾기</button>
	</form>
	<div>
		<h4>albumId : ${album.albumId }</h4>
		<h4>albumTtl : ${album.albumTtl }</h4>

	</div>
	<form action="/admin/inputtracksAction" method="post"
		onsubmit="return checkInput();">

		<div style="margin-top: 10px">
			track_ttl <input type="text" name="trackTtl" id="trackTtl">
		</div>
		<div>
			track_url <input type="text" name="trackUrl" id="trackUrl">
		</div>
		<div>
			album_id <input type="text" name="albumId" id="albumId">
		</div>


		<div>
			타이틀여부 <input type="text" name="ttlTrack">
		</div>
		<div>
			mood_code <input type="text" name="tMoodCode">
		</div>
		<div>
			genre_cdd <input type="text" name="tGenreCode">
		</div>
		<div>
			stus_cd <input type="text" name="tStusCode">
		</div>
		situ_cd <input type="text" name="tSituCode">

		<button>등록</button>

	</form>
	<a href="/admin/home">HOME</a>

	<script type="text/javascript" src="/resources/js/admin.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

			let searchForm = $("#searchForm");
			$("#searchForm button").on("click", function(e) {
				if (searchForm.find("input").val().trim() == "") {
					alert("앨범title을 입력해주세요")
					return false;
				}
				e.preventDefault();
				searchForm.submit();

			})
		});
	</script>
	<script type="text/javascript">
		function checkInput() {
			const ttlFld =document.getElementById("trackTtl");
			const urlFld =document.getElementById("trackUrl");
			const albumFld = document.getElementById("albumId")
			
			const numRegex= /[^0-9]/g;

			if (ttlFld.value.trim() == "") {
				alert("노래title을 입력해주세요");
				return false;
			}
			if(ttlFld.value.trim().length>30){
				alert("title의 길이가 30을 넘었습니다");
				ttlFld.value="";
				return false;
			}
			if (urlFld.value.trim() == "") {
				alert("url 을 입력해주세요");
				return false;
			}
			if(urlFld.value.trim().length>60){
				alert("url의 길이가 60을 넘었습니다")
				urlFld.value="";
				return false;
			}
			if (albumFld.value.trim() == "") {
				alert("앨범ID을 입력해주세요");
				return false;
			}
			
			
			if(numRegex.test(albumFld.value.trim())){
				alert("앨범ID는 숫자만 입력해주세요");
				albumFld.value="";
				return false;
			}
			if(albumFld.value.trim().length>100){
				alert("앨범ID의 길이가 100을 넘었습니다");
				albumFld.value="";
				return false;
			}
			

			return true;

		}
	</script>

</body>
</html>