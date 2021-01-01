console.log("module");

let likeService = (function() {

	function removeLikeTrack(trackId, callback, error) {

		console.log("Remove Like Track");

		$.ajax({
			type : "post",
			url : "/mypage/liketrack/remove",
			contentType : "text/plain; charset=utf-8",
			data : trackId,
			success : function(result) {
				console.log("성공");
			},
			error : function(err) {
				// TODO: 에러처리
				console.log("에러");
			}
		});

	}

	function addLikeTrack(trackId, callback, error) {

		console.log("Add Like Track");

		$.ajax({
			type : "post",
			url : "/mypage/addliketrack",
			contentType : "text/plain; charset=utf-8",
			data : trackId,
			success : function(result) {
				console.log("성공");
			},
			error : function(err) {
				// TODO: 에러처리
				console.log("에러");
			}
		});

	}

	return {
		addLikeTrack : addLikeTrack,
		removeLikeTrack : removeLikeTrack
	};

})();