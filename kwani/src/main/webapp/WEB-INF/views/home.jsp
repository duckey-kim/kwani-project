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
<link rel="stylesheet" type="text/css" href="/resources/css/home.css">
</head>

<%@include file="includes/mainHeader.jsp"%>

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
					onclick="currentSlide(6)"></span> 
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
				<c:forEach items="${allPlist}" var="getAllList">
					<div class="slides fade">
						<img src="/resources/image/rcmdplylst/${getAllList.rcmdPlylstImg}"
							class="slideBoxImg"
							onclick="location.href='/recommend/plylst?plylstId=${getAllList.rcmdPlylstId}'"
							alt="">
						<p class="slidesTxt">${getAllList.rcmdPlylstNm}</p>
					</div>
				</c:forEach>
				<a class="prev" onclick="plusSlides(-1)">&#10094;</a> <a
					class="next" onclick="plusSlides(1)">&#10095;</a>
			</div>


			<div class="loginFormBox">
				<div class="loginBtnWrap">
					<button class="loginBtn" id="loginBtn" onclick="location.href='/user/login'">Login</button>
				</div>
				<div id="welcomeBtn" class="loginBtn" style="display: none">
					<p>환영합니다!</p>
					<p>${userNick}님</p>
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
					<div style="width:10px;"></div>
					
					<div class="genreYearImg"
						style="background-image: url(/resources/image/artist/아이유.jpg);">
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
					<div style="width:10px"></div>
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
	/*-------------------------------------------- searchBox ----------------------------------------------------- */

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

	$("#yearCnt").text("2010s");

	let startDate = "2010"
	let finishDate = "2019";
	let genreName = "댄스";
	let gropId = "12";
	
	$(".genreYearImg").click(function() {
			location.href = "/detail/artist?gropId=" +gropId
	});
	
	$(".year").on(
			'click',
			function() {
				$(".year").mousemove(function(event) {

					$(".year").text("");

					let yearCnt = $(".year").css('top');
					let yearCntPx = parseInt(yearCnt, 10);

					if (yearCntPx >= 0 && yearCntPx <= 140) {
						$("#yearCnt").text("2020s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 140 && yearCntPx <= 300) {
						$("#yearCnt").text("2010s");
						$("#yearCnt").css("display", "show");
					} else if (yearCntPx > 300 && yearCntPx <= 440) {
						$("#yearCnt").text("2000s");
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
						gropId = data[0].gropId;
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

	$("#genreName").text("댄스");

	$(".genre").on(
			'click',
			function() {
				$(".genre").mousemove(function(event) {

					$(".genre").text("");

					let genreCnt = $(".genre").css('top');
					let genreCntPx = parseInt(genreCnt, 10);
					genreName = $("#genreName").text();

					if (genreCntPx >= 0 && genreCntPx <= 60) {
						$("#genreName").text("락");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 60 && genreCntPx <= 130) {
						$("#genreName").text("발라드");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 130 && genreCntPx <= 190) {
						$("#genreName").text("힙합");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 190 && genreCntPx <= 250) {
						$("#genreName").text("댄스");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 250 && genreCntPx <= 310) {
						$("#genreName").text("트로트");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 310 && genreCntPx <= 370) {
						$("#genreName").text("R&B");
						$("#genreName").css("display", "show");
					} else if (genreCntPx > 370 && genreCntPx <= 440) {
						$("#genreName").text("OST");
						$("#genreName").css("display", "show");
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
							$(".genreYearImg").css(
									"background-image",
									"url(/resources/image/artist/"
											+ data[0].gropImg + ")");
							
							gropId = data[0].gropId
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

<%@include file="includes/mainFooter.jsp"%>