console.log("module");

let mypageService = (function(){
	
	function deleteTrackList(trackList, plylstId, callback, error){
		
		console.log("delete TrackList");
		
		let dataAll = {
			"trackList" : trackList,
			"plylstId" : plylstId
		}
		
		$.ajax({
			type : "post",
			url : "/mypage/playlist/deletetrack",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : dataAll,
			dataType : 'json',
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				// TODO: 에러처리
				alert("에러");
			}
		});
	}
	
	function addTrackList(trackList, plylstId, callback, error) {

		console.log("add TrackList");

		let dataAll = {
			"trackList" : trackList,
			"plylstId" : plylstId
		}

		$.ajax({
			type : "post",
			url : "/mypage/playlist/inserttrack",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data : dataAll,
			dataType : 'json',
			success : function(result, status, xhr) {
				if(callback){
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				// TODO: 에러처리
				console.log("xhr : " + xhr + " status : " + status + " err : "
						+ err);
			}
		});

	}
	
	function getLikedList(callback, error) {

		$.ajax({
			type : 'get', // HTTP 요청 방식
			url : '/mypage/likeList.json', // 요청을 보낼 서버의 URL 주소
			// data: HTTP 요청과 함께 보낼 데이터
			dataType : 'text', // 서버에서 보내줄 데이터 타입
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				// TODO: 에러처리
				console.log("에러");
			}
		});
	}
	
	function getLibraryList(callback, error) {

		$.ajax({
			type : 'get', // HTTP 요청 방식
			url : '/mypage/libraryList.json', // 요청을 보낼 서버의 URL 주소
			// data: HTTP 요청과 함께 보낼 데이터
			dataType : 'text', // 서버에서 보내줄 데이터 타입
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, err) {
				// TODO: 에러처리
				console.log("에러");
			}
		});
	}
	
	return{
		deleteTrackList : deleteTrackList,
		addTrackList : addTrackList,
		getLikedList : getLikedList,
		getLibraryList : getLibraryList
	};
	
})();