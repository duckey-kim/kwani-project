<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>player</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

body {
	overflow-x: hidden;
	overflow-y: hidden;
}

th {
	text-align: left;
}

thead {
	background: yellow;
	margin-bottom: 100vh;
}

tr td {
	font-size: 14px;
}

.list-wrapper {
	width: 80%;
	height: 360px;
	overflow: auto;
	margin: auto;
}

.list-table {
	width: 100%;
	border-collapse: collapse;
}

.list-table thread {
	margin-bottom: 1vh;
	border-bottom: 1px red;
}

.list-table td, .list-table th {
	border: 1px maroon;
	padding: 1vh;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.list-nm {
	width: 380px;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 16px;
	text-align: center;
}
</style>

</head>
<body>

	<div class="list-nm">${listNm }</div>
	${videoMap }
	<div id="player"></div>

	<%-- 	<div class="list-wrapper">
			<h2 style="font-family: fantasy;">${listNm }</h2>
			<table class="list-table">
				<thead>
					<tr class="tb-header">
						<th>제목</th>
						<th>가수</th>
						<th>X</th>
					</tr>

				</thead>
				<c:forEach var="list" items="${list}">
					<tr>
						<td>${list.TRACK_TTL }</td>
						<td>${list.NM }</td>
						<td>X</td>
					</tr>
				</c:forEach>
			</table>
		</div> --%>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script  type="text/javascript" src="/resources/js/player.js"></script>
	<script>
		// 2. This code loads the IFrame Player API code asynchronously.
		let tag = document.createElement('script');

		tag.src = "https://www.youtube.com/iframe_api";
		let firstScriptTag = document.getElementsByTagName('script')[0];
		firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

		// 3. This function creates an <iframe> (and YouTube player)
		//    after the API code downloads.
		var player;

		let videoMap = ${
			videoMap};
		let playList = ${
			playList
		};
		console.log("videoMap :"+videoMap)
		let playListIndex = playList.length - 1;
		console.log(playListIndex);

		function onYouTubeIframeAPIReady() {
			if (player == null) {
				player = new YT.Player('player', {
					height : '285',
					width : '380',
					playerVars : {
						'autoplay' : 1,
						'rel' : 0,
						'disablekb' : 1,
						'modestbranding' : 1,
						'playlist' : playList,
						'loop' : 1
					},
					videoId : playList[0],
					events : {
						'onReady' : onPlayerReady,
						'onStateChange' : onPlayerStateChange
					}
				});

			}
		}

		// 4. The API will call this function when the video player is ready.
		function onPlayerReady(event) {
			event.target.playVideo();
			event.target.loadPlaylist(playList);
		}

		// 5. The API calls this function when the player's state changes.
		//    The function indicates that when playing a video (state=1),
		//    the player should play for six seconds and then stop.
		function onPlayerStateChange(event) {
			console.log("event is :" + event);
			if (event.data == YT.PlayerState.PLAYING) {
				console.log(player.getVideoData().video_id);
				playerService.insertUserCurrent(videoMap[player.getVideoData().video_id], function(
								result) {
							console.log("현재곡 최신곡으로 update");
						});

			}
			if (event.data === YT.PlayerState.ENDED) {
				console.log("Play END :");
			}
		}
		function stopVideo() {
			player.stopVideo();
		}
	</script>
</body>
</html>