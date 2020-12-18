<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>home</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.js"
	integrity="sha256-kRbW+SRRXPogeps8ZQcw2PooWEDPIjVQmN1ocWVQHRY="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href='https://fonts.googleapis.com/css?family=Open Sans'
	rel='stylesheet'>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="/resources/css/home.css">

</head>



<%@include file="includes/header.jsp"%>



<div id="body">
	<div id="leftSideBar"></div>
	<div id="bodyContent">
		<div class="sysdate">${year}.${month}.${date}</div>
		<div class="btnDotContainer">
			<div class="contentBtn">오늘의 추천곡</div>
			<div style="text-align: center" class="dotContainer">
				<span class="dot" onclick="currentSlide(1)"></span> <span
					class="dot" onclick="currentSlide(2)"></span> <span class="dot"
					onclick="currentSlide(3)"></span> <span class="dot"
					onclick="currentSlide(4)"></span> <span class="dot"
					onclick="currentSlide(5)"></span> <span class="dot"
					onclick="currentSlide(6)"></span> <span class="dot"
					onclick="currentSlide(7)"></span> <span class="dot"
					onclick="currentSlide(8)"></span>
			</div>
		</div>
		<div class="topContentBox">
			<div class="todayRecmd">
				<div class="recmdContainer_1">
					<c:forEach items="${list}" var="getList" begin="0" end="2">
						<div class="recmdFlip-box">
							<div class="recmdFlip-box-inner">
								<div class="recmdFront">
									<img src="/resources/image/album/${getList.albumImg}"
										class="recmdImage" alt="">
									<div class="recmdArtistName">
										<h2>${getList.name}</h2>
									</div>
								</div>
								<div class="recmdBack">
									<div class="backBlank"></div>
									<div class="backText">
										<h2
											onclick="location.href='/detail/album?albumId=${getList.albumId}'">${getList.albumTtl}</h2>
										<h3
											onclick="location.href='/detail/artist?gropId=${getList.gropId}'">${getList.name}</h3>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="recmdContainer_2">
					<c:forEach items="${list}" var="getList" begin="3" end="5">
						<div class="recmdFlip-box">
							<div class="recmdFlip-box-inner">
								<div class="recmdFront">
									<img src="/resources/image/album/${getList.albumImg}"
										class="recmdImage" alt="">
									<div class="recmdArtistName">
										<h2>${getList.name}</h2>
									</div>
								</div>
								<div class="recmdBack">
									<div class="backBlank"></div>
									<div class="backText">
										<h2
											onclick="location.href='/detail/album?albumId=${getList.albumId}'">${getList.albumTtl}</h2>
										<h3
											onclick="location.href='/detail/artist?gropId=${getList.gropId}'">${getList.name}</h3>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="slideBox">
				<c:forEach items="${slideImg}" var="getSlideImg">
					<div class="slides fade">
						<img src="/resources/image/album/${getSlideImg.albumImg}"
							class="slideBoxImg"
							onclick="location.href='/detail/album?albumId=${getSlideImg.albumId}'"
							alt="">
					</div>
				</c:forEach>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>
			<div class="loginFormBox">
				<a href="/user/login" class="loginBtn" id="loginBtn">Login</a>
				<div id="welcomeBtn" class="welcomeBtn" style="display: none">
					환영합니다!<br> ${userNick} 님
				</div>
			</div>
		</div>
		<!-- topContentBox -->

		<div class="bottomContentBox">

			<div class="bottomLeftBox">
				<div class="genreYearContainer">
					<div class="yearCntBox">
						<p id="yearCnt"></p>
						<form action="/" method="get" name="yearDate">
							<input type="hidden" id="startDate" name="startDate"> <input
								type="hidden" id="finishDate" name="finishDate">
						</form>
					</div>
					<div class="genreYearImg" 
						style="background-image: url(/resources/image/artist/소녀시대.jpg);">
						<div class="circle red">
							<div class="year">
								<div class="yearWrap"></div>
								<div class="content"></div>
							</div>
						</div>
						<div class="circle blue">
							<div class="genre">
								<div class="genreWrap"></div>
								<div class="content"></div>
							</div>
						</div>
					</div>
					<div class="genreCntBox">
						<p id="genreName"></p>
						<input type="hidden" id="inputGenre" name="genreName">
					</div>
				</div>
			</div>

		</div>
		<!-- bottomContentBox-->
	</div>
	<!--bodyContent-->
	<div id="rightSideBar"></div>
</div>
<!--body-->

<!-- ----------------------------- JavaScript------------------------------- -->
<!-- ---------------------------------------------------------------------------------------- -->

<script type="text/javascript">

	//세션값이 잘 넘어왔는지 확인한다.
	console.log('${sessionName}');
	console.log('${userNick}');
	console.log('${list}');
	console.log('${slideImg}');


	let logoutBtn = document.getElementById("logoutBtn");
	let loginBtn = document.getElementById("loginBtn");
	let welcomeBtn = document.getElementById("welcomeBtn");
	let toMypageBtn = document.getElementById("toMypageBtn");
	let joinBtn = document.getElementById("joinBtn");
	

	//세션이 있으면 loginBtn을 없애고, logoutBtn, toMypageBtn, welcomeBtn을 보이게 한다.

	if ('${sessionName}' != "") {
		loginBtn.style.display = "none";
		joinBtn.style.display = "none";
		logoutBtn.style.display = "block";
		welcomeBtn.style.display = "block";
		toMypageBtn.style.display = "block";
	}
	$(".genreYearImg").click(function() {
		location.href = "/detail/artist?gropId=1"
	});
</script>

<script type="text/javascript">
	/*-------------------------------------------- searchBox ----------------------------------------------------- */
	function openSearch() {
		document.getElementById("myOverlay").style.display = "block";
	}

	let overlay = document.getElementById('myOverlay');

	window.onclick = function(event) {
		if (event.target == overlay) {
			overlay.style.display = "none";
		}
		if (!event.target.matches('.dropbtn')) {
			let dropdowns = document.getElementsByClassName("dropdown-content");
			let i;
			for (i = 0; i < dropdowns.length; i++) {
				let openDropdown = dropdowns[i];
				if (openDropdown.classList.contains('show')) {
					openDropdown.classList.remove('show');
				}
			}
		}
	}
</script>


<script type="text/javascript">
	/*---------------------------------------------------------------------------------------------------------------- */
	/*-------------------------------------------- slideshow ----------------------------------------------------- */
	let slideCount = 1;
	countSlides(slideCount);

	function plusSlides(n) {
		countSlides(slideCount += n);
	}

	function currentSlide(n) {
		countSlides(slideCount = n);
	}

	function countSlides(n) {
		let i;
		let slides = document.getElementsByClassName("slides");
		let dots = document.getElementsByClassName("dot");
		if (n > slides.length) {
			slideCount = 1
		}
		if (n < 1) {
			slideCount = slides.length
		}
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace("active", "");
		}
		slides[slideCount - 1].style.display = "block";
		dots[slideCount - 1].className += " active";
	}

	var slideIndex = 0;
	showSlides();

	function showSlides() {
		let i;
		let slides = document.getElementsByClassName("slides");
		let dots = document.getElementsByClassName("dot");
		for (i = 0; i < slides.length; i++) {
			slides[i].style.display = "none";
		}
		slideIndex++;
		if (slideIndex > slides.length) {
			slideIndex = 1
		}
		for (i = 0; i < dots.length; i++) {
			dots[i].className = dots[i].className.replace(" active", "");
		}
		slides[slideIndex - 1].style.display = "block";
		dots[slideIndex - 1].className += " active";
		setTimeout(showSlides, 3000);
	}
</script>


<script type="text/javascript">
	/*---------------------------------------------------------------------------------------------------------------- */

	$("#yearCnt").text("1970s");

	let startDate = "1970"
	let finishDate = "1979";
	let genreName = "힙합";

	$(".year").on(
			'click',
			function() {
				$(".year").mousemove(function(event) {

					$(".year").text("");

					let yearCnt = $(".year").css('top');
					let yearCntPx = parseInt(yearCnt, 10);

					if (yearCntPx >= 0 && yearCntPx <= 40) {
						$("#yearCnt").text("2020s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 40 && yearCntPx <= 80) {
						$("#yearCnt").text("2010s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 80 && yearCntPx <= 120) {
						$("#yearCnt").text("2000s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 120 && yearCntPx <= 160) {
						$("#yearCnt").text("1990s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 160 && yearCntPx <= 200) {
						$("#yearCnt").text("1980s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 200 && yearCntPx <= 240) {
						$("#yearCnt").text("1970s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 240 && yearCntPx <= 280) {
						$("#yearCnt").text("1960s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 280 && yearCntPx <= 320) {
						$("#yearCnt").text("1950s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 320 && yearCntPx <= 360) {
						$("#yearCnt").text("1940s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 360 && yearCntPx <= 390) {
						$("#yearCnt").text("1930s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 390 && yearCntPx <= 440) {
						$("#yearCnt").text("1920s");
						$("#yearCnt").css("display", "show");
					}

				});

				console.log(startDate + "-" + finishDate + "-" + genreName)
				$.ajax({
					type : "GET",
					url : "/homeAjax/" + startDate + "/" + finishDate + "/"
							+ genreName + ".json",
					data : {
						startDate : startDate,
						finishDate : finishDate,
						genreName : genreName
					},
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						console.log(data);

						$(".genreYearImg").css(
								"background-image",
								"url(/resources/image/artist/"
										+ data[0].gropImg + ")");
						$(".genreYearImg").click(function() {
							location.href = "/detail/artist?gropId=" + data[0].gropId
						});

					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
						$(".genreYearImg").css("background-image",
								"url(/resources/image/nodata.jpg)");
					}
				});

				startDate = $('#yearCnt').text().split("s")[0];
				finishDate = $('#yearCnt').text().substring(0, 3) + 9;
				startDate = $("#startDate").val(startDate);
				finishDate = $("#finishDate").val(finishDate);
				year();
			});

	function year() {
		startDate = startDate.val();
		finishDate = finishDate.val();
	}

	/* ------------------------------------------------------------ */

	$("#genreName").text("힙합");

	$(".genre").on(
			'click',
			function() {
				$(".genre").mousemove(function(event) {

					$(".genre").text("");

					let genreCnt = $(".genre").css('top');
					let genreCntPx = parseInt(genreCnt, 10);
					genreName = $("#genreName").text();

					if (genreCntPx >= 0 && genreCntPx <= 40) {
						$("#genreName").text("락");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 40 && genreCntPx <= 80) {
						$("#genreName").text("메탈");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 80 && genreCntPx <= 120) {
						$("#genreName").text("발라드");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 120 && genreCntPx <= 160) {
						$("#genreName").text("랩");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 160 && genreCntPx <= 200) {
						$("#genreName").text("힙합");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 200 && genreCntPx <= 240) {
						$("#genreName").text("댄스");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 240 && genreCntPx <= 280) {
						$("#genreName").text("인디");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 280 && genreCntPx <= 320) {
						$("#genreName").text("트로트");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 320 && genreCntPx <= 360) {
						$("#genreName").text("R&B");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 360 && genreCntPx <= 400) {
						$("#genreName").text("포크");
						$("#genreName").css("display", "show");
						// OST, classic, jazz, blues, soul
					}
				});
				console.log(startDate + "-" + finishDate + "-" + genreName)

				$.ajax({
					type : "GET",
					url : "/homeAjax/" + startDate + "/" + finishDate + "/"
							+ genreName + ".json",
					data : {
						startDate : startDate,
						finishDate : finishDate,
						genreName : genreName
					},
					dataType : "json",
					contentType : "application/json; charset=UTF-8",
					success : function(data) {
						console.log(data);

						if (data[0].gropImg != undefined) {
							/* 아이유 사진을 내가 가져온 사진으로 변경할거다 */
							$(".genreYearImg").css(
									"background-image",
									"url(/resources/image/artist/"
											+ data[0].gropImg + ")");
							
							$(".genreYearImg").click(function() {
								location.href = "/detail/artist?gropId=" + data[0].gropId
							});
						}
					},
					error : function(XMLHttpRequest, textStatus, errorThrown) {
					}
				});

				genreName = $('#genreName').text();
				genreName = $("#inputGenre").val(genreName);
				genre();
			});

	function genre() {
		genreName = genreName.val();
	}
</script>

<script type="text/javascript">
	$(function() {
		$(".year").draggable({
			yearWrap : ".yearWrap",
			cursor : "grab",
			containment : ".red",
			axis : "y",
			revert : false,
		});
	});

	$(function() {
		$(".genre").draggable({
			genreWrap : ".genreWrap",
			cursor : "grab",
			containment : ".blue",
			axis : "y",
			revert : false,
		});
	});
</script>

<%@include file="includes/footer.jsp"%>