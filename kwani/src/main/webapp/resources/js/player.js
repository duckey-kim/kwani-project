/**
 * 
 */
console.log("Player Module....");
let playerService = (function() {

	function insertUserCurrent(trackId,callback) {
		console.log("url + trackId");

		$.ajax({
			type : 'post',
			url : '/user/track',
			data :trackId,
			contentType:'text/plain; charset=utf-8',
			success : function(result) {
				if (callback) {
					console.log(result);
				}
			}
		})

	}
	return{insertUserCurrent:insertUserCurrent}
	
})();