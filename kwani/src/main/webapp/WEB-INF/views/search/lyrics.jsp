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
    <link rel="shortcut icon" href="data:image/x-icon;," type="image/x-icon">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
    <script defer src="/resources/js/index.js"></script>
     <script src="/resources/js/jquery-3.5.1.js"/></script>
    <link rel="stylesheet" type = "text/css" href="/resources/css/searchLyrics.css">
    
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

</style>      
    
</head>

        <%@include file="../includes/header.jsp" %>
        <div id="body">
            <div id="leftSideBar"></div>
            <div id="bodyContent">
                <div class="searchRst"><p>"<c:out value="${searchTxt}"/>" 에 대한 검색 결과</p></div>
                <div class="rstTap"> 
                    <a class="btnBasic" href="/search?searchTxt=${searchTxt}">통합검색</a>	

                    <a class="btnBasic" href="/search/artist?searchTxt=${searchTxt}">아티스트</a>	
                  
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
                  
                    <a class="btnEffect" href="/search/lyrics?searchTxt=${searchTxt}">가사</a>
                </div>

              
                <div class="lyricsTxt">
                	<p class="textInfo">가사</p>
                </div>
                <div class="lyricsContainer">
                	<c:forEach items="${searchLyrics}" var="searchLyrics" >
                	<div class="eachLyrics">
                	
                	<div class="lyricsTtl">
                		<p>
                			<a class="title1" href="/detail/track?trackId=<c:out value='${searchLyrics.trackId}'/>">
                			<c:out value="${searchLyrics.trackTtl}" /></a>
                		</p>
                	</div><!-- lyricsTtl -->   
                	<div class="lyricsContent">    
                		<a href="/detail/track?trackId=<c:out value='${searchLyrics.trackId}'/>">     	
                		<c:out value="${searchLyrics.trackLyrics}" /></a>
                	</div><!-- lyricsContent --> 
                	<div class="lyricsInfoContainer">
                	<div class="lyricsArtist">
                		<div class="artist1">
                			<a style="color:grey" href="/detail/artist?gropId=<c:out value='${searchLyrics.gropId}'/>">
                			<c:out value="${searchLyrics.nm}" /></a>
                		</div>
                	</div><!-- lyricsArtist -->  
                	<div class="lyricsAlbum">
                		<div class="album1">
                			<a style="color:grey" href="/detail/album?albumId=<c:out value='${searchLyrics.albumId}'/>">
                			<c:out value="${searchLyrics.albumTtl}" /></a>
                		</div>
                	</div><!-- lyricsAlbum --> 
                	</div><!-- lyricsInfoContainer -->      	
                	</div><!-- eachLyrics --> 
                	<hr class="one">
                	</c:forEach>
                	
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
                </div><!-- lyricsContainer -->
                
                <form id="actionForm" action="/search/lyrics" method="get">
                	<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
                	<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                	<input type="hidden" name="searchTxt" value="${searchTxt}">
                </form>
             
                    
                <script>
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
                		
                	//체크박스 설정 1--------------------------------------------------------------------	
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
                	
                	//체크박스 설정 2--------------------------------------------------------------------	
                	function allCheckFunc2(obj){
                		//모든 checkRow의 속성이 checked가 되게 한다                		
                		$("[name=checkRow2]").prop("checked", $(obj).prop("checked"));
                	}
                	
                	function oneCheckFunc2(obj){
                		
                		//checkAll이란 name값을 가진 요소를 allObj에 저장한다
                		let allObj = $("[name=checkAll2]");
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
                		
                		$("[name=checkAll2]").click(function(){
                			//checkAll 이름의 체크박스를 클릭하면 전체가 선택되게 한다
                			allCheckFunc2(this);
                		});
                		$("[name=checkRow2]").each(function(){
                			//checkRow라는 이름의 체크박스 하나하나에 oneCheckFunc 메서드를 적용시킨다
                			//checkRow 체크박스 하나하나 모두 체크되면 checkAll 체크박스도 체크된다 
                			$(this).click(function(){
                				oneCheckFunc2($(this));
                			});
                		});
                	});
                	
                	//체크박스 설정 3--------------------------------------------------------------------	
                	function allCheckFunc3(obj){
                		//모든 checkRow의 속성이 checked가 되게 한다                		
                		$("[name=checkRow3]").prop("checked", $(obj).prop("checked"));
                	}
                	
                	function oneCheckFunc3(obj){
                		
                		//checkAll이란 name값을 가진 요소를 allObj에 저장한다
                		let allObj = $("[name=checkAll3]");
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
                		
                		$("[name=checkAll3]").click(function(){
                			//checkAll 이름의 체크박스를 클릭하면 전체가 선택되게 한다
                			allCheckFunc3(this);
                		});
                		$("[name=checkRow3]").each(function(){
                			//checkRow라는 이름의 체크박스 하나하나에 oneCheckFunc 메서드를 적용시킨다
                			//checkRow 체크박스 하나하나 모두 체크되면 checkAll 체크박스도 체크된다 
                			$(this).click(function(){
                				oneCheckFunc3($(this));
                			});
                		});
                	});
                
                </script>
                    </div><!--bodyContent-->
            <div id="rightSideBar"></div>
        </div><!--body-->
      <%@include file="../includes/footer.jsp" %>