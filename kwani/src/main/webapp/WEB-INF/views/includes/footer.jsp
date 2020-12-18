<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div id="footer">
	<div class="footerContainer">
		<div class="information">
			<div class="intro">
				<!-- <a href="#">BAAM 소개</a> -->
			</div>
			<div class="noticeBoard">
				<!-- <a href="#">공지사항</a> -->
			</div>
			<div class="custInfo">
				<!-- <a href="#">고객센터</a> -->
			</div>
			<div class="none"></div>
			<div class="none"></div>
			<div class="none"></div>
		</div>
		<div class="webInfoContainer">
			<div class="leftWebInfo">
				<div class="aboutUs">
					<p>주소 : 서울특별시 종로구 종로 69</p>
					<p>공동대표 : 김덕환, 김수연, 유원호, 노명희, 김예찬</p>
					<p>이메일 : theBAAM@aiaiai.com</p>
					<p>대표 번호 : 02-000-0101</p>
				</div>
			</div>
			<div class="rightWebInfo">본 사이트는 Chrome 및 IE Edge 브라우저에서 사용이
				가능합니다.</div>
		</div>
	</div>
	<!-- footerContainer -->
</div>
<!-- footer -->
</div>
<!-- main -->

</body>

<script type="text/javascript">

//서치바 설정-------------------------------------------------------------------------
var result2 = $("input[name=searchTxt]");

function checkTxt(){
	console.log(result2[0].value);
	//검색어가 제대로 입력되면 아무일도 일어나지 않는다
	if(result2[0].value.length != 0){
		console.log(result2+"있어");
		console.log("경고창 필요 없어!");
		return true;
	}
	//검색어가 입력되지 않으면 경고창을 띄운다
	else{  
		console.log(result2+"없어");
		console.log("경고창 나와라!");
		alert("검색어를 입력하세요");
		return false;
	}
}
</script>
</html>