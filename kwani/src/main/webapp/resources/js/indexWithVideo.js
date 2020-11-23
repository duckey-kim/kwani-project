
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

function openSearch() {
    document.getElementById("myOverlay").style.display = "block";
}

let overlay = document.getElementById('myOverlay');

window.onclick = function(event){
    if(event.target == overlay){
        overlay.style.display = "none";
    }
}