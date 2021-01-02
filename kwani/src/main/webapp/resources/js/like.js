console.log("module");

let likeService = (function(){
	
	function removeLikeArtist(artistId, callback, error) {

		console.log("Remove Like Artist");

		$.ajax({
			type : "post",
			url : "/mypage/likeartist/remove",
			contentType : "text/plain; charset=utf-8",
			data : artistId,
			success : function(result) {
				if(callback){
					callback(result);
				}
			},
			error : function(err) {
				// TODO: 에러처리
				alert("에러");
			}
		});

	}
	
	function addLikeArtist(artistId, callback, error) {

		console.log("Add Like Track");

		$.ajax({
			type : "post",
			url : "/mypage/likeartist/add",
			contentType : "text/plain; charset=utf-8",
			data : artistId,
			success : function(result) {
				if(callback){
					callback(result);
				}
			},
			error : function(err) {
				// TODO: 에러처리
				alert("에러");
			}
		});

	}
	
	function removeLikeAlbum(albumId, callback, error) {

		console.log("Remove Like Album");

		$.ajax({
			type : "post",
			url : "/mypage/likealbum/remove",
			contentType : "text/plain; charset=utf-8",
			data : albumId,
			success : function(result) {
				if(callback){
					callback(result);
				}
			},
			error : function(err) {
				// TODO: 에러처리
				alert("에러");
			}
		});

	}
	
	function addLikeAlbum(albumId, callback, error) {

		console.log("Add Like Album");

		$.ajax({
			type : "post",
			url : "/mypage/likealbum/add",
			contentType : "text/plain; charset=utf-8",
			data : albumId,
			success : function(result) {
				if(callback){
					callback(result);
				}
			},
			error : function(err) {
				// TODO: 에러처리
				alert("에러");
			}
		});

	}
	
	function removeLikeTrack(trackId, callback, error) {

		console.log("Remove Like Track");

		$.ajax({
			type : "post",
			url : "/mypage/liketrack/remove",
			contentType : "text/plain; charset=utf-8",
			data : trackId,
			success : function(result) {
				if(callback){
					callback(result);
				}
			},
			error : function(err) {
				// TODO: 에러처리
				alert("에러");
			}
		});

	}
	
	function addLikeTrack(trackId, callback, error) {

		console.log("Add Like Track");

		$.ajax({
			type : "post",
			url : "/mypage/liketrack/add",
			contentType : "text/plain; charset=utf-8",
			data : trackId,
			success : function(result) {
				if(callback){
					callback(result);
				}
			},
			error : function(err) {
				// TODO: 에러처리
				alert("에러");
			}
		});

	}

	return{
		addLikeTrack : addLikeTrack,
		removeLikeTrack : removeLikeTrack,
		addLikeArtist : addLikeArtist,
		removeLikeArtist : removeLikeArtist,
		addLikeAlbum : addLikeAlbum,
		removeLikeAlbum : removeLikeAlbum
	};
	
})();