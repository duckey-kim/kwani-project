window.onscroll = function() {myFunction()};  
let navbar = document.getElementById("header_navbar");
let sticky = navbar.offsetTop;
        
function myFunction(){
    if(window.pageYOffset >= sticky){
        navbar.classList.add("sticky")
    }else{
        navbar.classList.remove("sticky");
    }
}

var result = $("input[name=searchTxt]");
	
function checkTxt(){
	console.log(result[0].value);
	if(result[0].value.length != 0){
		console.log(result+"있어");
		console.log("모달창 필요 없어!");
		return true;
	}
	else{  
		console.log(result+"없어");
		console.log("모달창 나와라!");
		alert("검색어를 입력하세요");
		return false;
	}
}