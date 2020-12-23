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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <script defer src="/resources/js/index.js"></script>
     <script src="/resources/js/jquery-3.5.1.js"/></script>
    <link rel="stylesheet" type = "text/css" href="/resources/css/searchSongTitle.css">
    <style>
.dropbtn2 {
  color: black;
  font-size: 16px;
}

.dropdown2 {
  position: relative;
  display: inline-block;
}

.dropdown-content2 {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content2 a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content2 a:hover {background-color: #f1f1f1}

.dropdown2:hover .dropdown-content2 {
  display: block;
}

.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgba(0,0,0,0.4); 
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 30px;
  border: 1px solid #888;
  width: 30%;
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.modalTitle{
  text-align: center;
  font-weight: bold;
  padding-bottom: 20px;
}
.plylstListWrap{
  display: flex;
  flex-direction: column;
}
.plusNew{
  height: 50px;
  width: 90%;
  justify-content: center;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.plusImg{
  height: 40px;
  width: 20%;
   
}
.plusTxt{
  height: 40px;
  width: 70%;
  display: flex;
  align-items: center;
}
.userPlylst{
  height: 50px;
  width: 100%;
  justify-content: center;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.userPlylstImg{
  height: 40px;
  width: 20%;
}
.userPlylstNm{
  height: 40px;
  width: 60%;
  display: block;
  align-items: center;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.userPlylstTrackCnt{
  height: 40px;
  width: 20%;
  align-items: center;
  text-align: right;
}
</style>
</head>
        
        <%@include file="../includes/header.jsp" %>
        <div id="body">
            <div id="leftSideBar"></div>
            <div id="bodyContent">
                <div class="searchRst"><p><c:out value="${searchTxt}"/>에 대한 검색 결과</p></div>
                <div class="rstTap"> 
                     <a href="/search?searchTxt=${searchTxt}">통합검색</a>	

                    <a href="/search/artist?searchTxt=${searchTxt}">아티스트</a>	
                  
                     	<div class="dropdown2">
  							<span class="dropbtn2">곡</span>
  								<div class="dropdown-content2">
 									<a href="/search/songartist?searchTxt=${searchTxt}">아티스트명으로</a>									 
 									<a href="/search/songtitle?searchTxt=${searchTxt}">곡명으로</a>
 								</div>
						</div>
                               	                    		
                     	<div class="dropdown2">
  							<span class="dropbtn2">앨범</span>
  								<div class="dropdown-content2">
 									<a href="/search/albumartist?searchTxt=${searchTxt}">아티스트명으로</a>									 
 									<a href="/search/albumtitle?searchTxt=${searchTxt}">앨범명으로</a>
 								</div>
						</div>                    	
                  
                    <a href="/search/lyrics?searchTxt=${searchTxt}">가사</a>
                </div>               
     
			
                <!-- 곡명으로 searchTxt를 검색했을 때의 곡 목록  -->                
                <div class="trackHeader"><p class="textInfo">곡명으로 검색</p><button class="plylstBtn" id="plusPlylstBtn">담기</button></div>
                <div class="trackTable">
                    <div id="plylstTable">
                        <table>
                            <tr>
                            <th class="th0"><input type="checkbox" name="checkAll" class="checkAll"></th>
                            <th class="th1">번호</th>
                        	<th class="th3">제목</th>
                        	<th class="th2">가수</th>
                        	<th class="th4">듣기</th>
                        	<th class="th4">좋아요</th>
                            </tr>
                            <c:forEach items="${searchSong2}" var="searchSong2" varStatus="status" begin="0" end="29">
                        	<tr>
                        	<th><input type="checkbox" name="checkRow"></th>
                        	<td>${status.index+1}</td>
                        	<td><a href="/detail/track?trackId=<c:out value='${searchSong2.trackId}'/>">      
                        		<c:out value="${searchSong2.trackTtl}" /></a></td>
                        	<td><a href="/detail/artist?gropId=<c:out value='${searchSong2.gropId}'/>">      
                        		<c:out value="${searchSong2.nm}" /></a></td>
                        	<td class="btnParent"><img class="playBtn" src="/resources/image/play-button.png"
                        		onclick='popupPlayer("/player/track?trackId=${searchSong2.trackId}")'></td>
                        	<td>
                        	<div class="heartParent">
                        	<img class="defaultHeartImg"src="/resources/image/heart2.png">
                        	<img class="redHeartImg" src="/resources/image/heart.png">
                        	</div>
                        	</td>
                        	</tr>
                        	</c:forEach>
                         </table>
                         
                          <div class="pull-right">
                         	<ul class="pagination">
                         		<c:if test="${pageMaker.prev}">
                         		<button class="paginate_button previous">
                         		  <a href="${pageMaker.startPage -1}">Previous</a></button>
                         		</c:if>
                         		
                         		<c:forEach var="num" begin="${pageMaker.startPage}"
                         		end="${pageMaker.endPage}">
                         		<button class="paginate_button ${pageMaker.cri.pageNum == num ? "active" : ""} " >
                         		<a href="${num}">${num}</a></button>
                         		</c:forEach>
                         		
                         		<c:if test="${pageMaker.next}">
                         		<button class="paginate_button next">
                         		  <a href="${pageMaker.endPage +1}">Next</a></button>
                         		 </c:if>
                         	</ul>
                         </div><!-- pull-right -->
                    </div> <!-- plylstTable -->
                </div><!-- trackTable -->
                
                  <form id="actionForm" action="/search/songtitle" method="get">
                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<input type="hidden" name="searchTxt" value="${searchTxt}">
                </form>
                
                    <!-- The Modal -->
                    <div id="myModal" class="modal" style="display:none">                   
                   
                    	<!-- Modal content -->`
                    	<div class="modal-content">
                    		<span class="close">&times;</span>
                    		<p class="modalTitle">내 플레이리스트에 추가</p>
                    		<div class="plylstListWrap">
                    		<div class="plusNew">
                    			<div class="plusImg"><img src="/resources/image/plus.png" style="max-height:36px" /></div>
                    			<div class="plusTxt"><p>새 플레이리스트</p></div>
                    		</div>
                    		<c:forEach items="${getUserPlylst}" var="userPlylst">
                    		<div class="userPlylst">
                    			<div class="userPlylstImg">
                    				<img src="/resources/image/album/<c:out value="${userPlylst.plylstImg}" />" style="max-height:40px">
                    			</div>
                    			<div class="userPlylstNm"><p style="padding-top: 10px"><c:out value="${userPlylst.nm}" /></p></div>         
                    			<div class="userPlylstTrackCnt"><p style="padding-top: 10px"><c:out value="${userPlylst.trackCnt}" />1 곡</p></div>           			
                    		</div>  
                    		</c:forEach>  
                    		</div><!-- plylstListWrap -->      	
                    	</div><!-- modal-content -->
                    </div><!-- myModal -->
              
                    
                <script>
                
                console.log("sessionName : " + '${sessionName}');

                let popupPlayer = function(url){
                    let moveTop=screen.height-440;
                     let moveLeft=screen.width-537;
                   window.open(url, 'player', 'width=380,height=285,directories=no,location=no,toolbar=no,menubar=no,resizable=no,top='+moveTop+',left='+moveLeft);
                }
                
                //로그인 안되어있을 때 
                //좋아요 버튼, 플레이리스트 담기 버튼 누르면 로그인 페이지로 이동하게 하기--------------------------
                function sessionCheck(){
                	
                	console.log("sessionCheck 실행");
                	console.log("sessionName : " + '${sessionName}');
                	
                	if('${sessionName}' == ''){
                		
                		console.log("로그인 안되어있어");
                		moveToLogin();
                		return 
                	
                    }
                	else{
                		return true;
                	}
                }              
                
                function moveToLogin(){
                	console.log("go login")
                	window.location = "/user/login";             	
                }
                
                
                //모달창 --------------------------------------------------------------------------
                let modal = document.getElementById("myModal");
                
                let btn = document.getElementById("plusPlylstBtn");    
                let btn2 = document.getElementById("plusPlylstBtn2"); 
                let btn3 = document.getElementById("plusPlylstBtn3");
                
                let span = document.getElementsByClassName("close")[0];
                
                //'담기' 버튼을 눌렀을 때
                btn.onclick = function(){
                	//doCheck()를 실행해서 
                	//체크박스에 체크가 하나도 안되어 있다면 경고창 나오게 하고
                	//체크박스에 하나 이상 체크가 되어 있다면 모달창을 보여준다
                	if(sessionCheck()){
                		doCheck();           		
                	};              	
                }
                
                span.onclick = function(){
                	modal.style.display = "none";
                }
                
                window.onclick = function(event){
                	if(event.target == modal){
                		modal.style.display = "none";
                	}
                }
                
                
                //좋아요 클릭하면 하트 색깔 바뀌게 설정(클릭한 곡의 track_id 값을 설정해놓음)--------------------------------------------------------                    
                $(document).ready(function(){        
                	
                	 // 처음엔 모든 수록곡의 빨간하트를 숨기고 빈하트만 보여준다.
                    $(".redHeartImg").hide();
                    
                    // 좋아요한 노래에 해당하는 노래들은 빈하트를 숨기고 빨간 하트를 보여준다.(track_id 값을 설정해놓음)
                    <c:forEach items="${getLikedTrack}" var="getLikedTrack">
                       $("img[name='${getLikedTrack.trackId}'][class=defaultHeartImg]").hide();
                       $("img[name='${getLikedTrack.trackId}'][class=redHeartImg]").show();
                    </c:forEach>
                    
                    //빈 하트 클릭할 때
                    $(".defaultHeartImg").on("click", function(){
                    	sessionCheck();
                       
                       let index = $(".defaultHeartImg").index(this);   //누른 하트의 인덱스 저장
                       
                       $(".defaultHeartImg:eq(" + index + ")").hide();   //누른 하트를 숨기기
                       $(".redHeartImg:eq(" + index + ")").show();   //누른 곳에 빨간 하트를 표시
                       console.log("좋아요할 노래아이디 : " + $(".defaultHeartImg:eq(" + index + ")").attr("name"));
                    });
                    
                    //빨간 하트 클릭할때
                    $(".redHeartImg").on("click", function(){
                       
                       let index = $(".redHeartImg").index(this);      //누른 하트의 인덱스 저장
                       
                       $(".redHeartImg:eq(" + index + ")").hide();   //누른 하트를 숨기기
                       $(".defaultHeartImg:eq(" + index + ")").show();   //누른 곳에 빈 하트를 표시
                       console.log("좋아요 취소할 노래아이디 : " + $(".redHeartImg:eq(" + index + ")").attr("name"));
                    });
				})
                
 				//체크박스에 하나도 체크 안되어 있으면 담기 버튼 눌렀을 때 경고창 나오게 하기--------------------------------				
 				function doCheck(){
                	
 					console.log("hi");
 					
 					//체크된 체크박스 길이 가져오기
 	                checkedLength = $("[name=checkRow]:checked").length;
 	                	
 	                console.log(checkedLength);
 	                	
 	                //체크된 체크박스가 하나도 없다면
 	                if(checkedLength == 0){
 	                		
 	                	console.log("선택 안함...");
 	                	//경고창을 띄워준다
 	                	alert("노래를 선택해주세요");
 	                	return;
 	                }else{
 	                	//하나 이상이라도 체크박스에 체크가 되어 있다면 아무것도 하지 않는다
 	                	console.log("선택했어!");
 	                	modal.style.display = "block";
 	                	return;
 	                }	                
 	             }
                
              //페이징 처리------------------------------------------------------------------------
           		let actionForm = $("#actionForm");
           		
           		$(".paginate_button a").on("click", function(e){
           			
           			e.preventDefault();
           			
           			console.log('click');
           			
           			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
           			actionForm.submit();
           		});
                
              //좋아요 클릭하면 하트 색깔 바뀌게 설정--------------------------------------------------------    
                $(document).ready(function(){           		
                		
                		$(".defaultHeartImg").show();
    					$(".redHeartImg").hide();
    					
    					//기본 하트를 누르면
    					$(".defaultHeartImg").click(function(){
    						
    						//누른 하트의 인덱스를 가져와서
    						let index = $(".defaultHeartImg").index(this);
    						
    						//기본 하트는 숨기고 빨간 하트를 보여준다
    						$(".defaultHeartImg:eq(" + index + ")").hide();
    						$(".redHeartImg:eq(" + index + ")").show();
    						console.log("defaultHeartImg clicked!");  						    						
    					});
    					
    					//빨간 하트를 누르면
    					$(".redHeartImg").click(function(){
    						
    						//누른 하트의 인덱스를 가져와서
    						let index = $(".redHeartImg").index(this);
    						
    						//빨간 하트는 숨기고 기본 하트를 보여준다
    						$(".defaultHeartImg:eq(" + index + ")").show();
    						$(".redHeartImg:eq(" + index + ")").hide();
    						console.log("redHeartImg clicked!");
    					});		
               
				})
                
                   
                	//서치바에 입력된 값 없을 때의 설정-------------------------------------------------------
                	
                	var result2 = $("input[name=searchTxt]");
                		
                	function checkTxt(){
                		console.log(result2[0].value);
                		if(result2[0].value.length != 0){
                			console.log(result2+"있어");
                			console.log("모달창 필요 없어!");
                			return true; 
                		}
                		else{  
                			console.log(result2+"없어");
                			console.log("모달창 나와라!");
                			alert("검색어를 입력하세요");
                			return false;
                		}
                	}
                		
                	//체크박스 설정1--------------------------------------------------------------------	
                	function allCheckFunc(obj){
                		//모든 checkRow의 속성이 checked가 되게 한다                		
                		$("[name=checkRow]").prop("checked", $(obj).prop("checked"));
                	}
                	
                	function oneCheckFunc(obj){
                		
                		//checkAll이란 name값을 가진 요소를 allObj에 저장한다
                		let allObj = $("[name=checkAll]");
                		//obj의 name이란 속성(attribute)값을 objName에 저장한다 
                		let objName = $(obj).attr("name");
                		
                		//obj의 속성값이 checked라면
                		if($(obj).prop("checked")){
                			
                			//모든 체크박스의 길이를 변수로 지정
                			checkBoxLength = $("[name=" + objName + "]").length;
                			//체크된 체크박스의 길이를 변수로 지정
                			checkedLength = $("[name=" + objName + "]:checked").length;
                			
                			//전체 체크박스의 개수와 체크된 체크박스의 개수가 일치하면
                			if(checkBoxLength == checkedLength){
                				//checkAll 이름의 체크박스를 체크한다
                				allObj.prop("checked", true);                				
                			}else{
                				//하나라도 체크가 안된 경우에는 checkAll 체크박스를 해제한다
                				allObj.prop("checked", false);
                			}
                		}
                		else{//obj가 checked된 것이 아니라면
                			//checkAll이 체크를 해제한다
                			allObj.prop("checked", false);
                			console.log("선택 해제!!!");
                		}              		
                	}
                	
                	$(function(){
                		
                		$("[name=checkAll]").click(function(){
                			//checkAll 이름의 체크박스를 클릭하면 전체가 선택되게 한다
                			allCheckFunc(this);
                		});
                		$("[name=checkRow]").each(function(){
                			//checkRow라는 이름의 체크박스 하나하나에 oneCheckFunc 메서드를 적용시킨다
                			//checkRow 체크박스 하나하나 모두 체크되면 checkAll 체크박스도 체크된다 
                			$(this).click(function(){
                				oneCheckFunc($(this));
                			});
                		});
                	});                
                	
                	
                </script>
                    </div><!--bodyContent-->
            <div id="rightSideBar"></div>
        </div><!--body-->
   <%@include file="../includes/footer.jsp" %>     