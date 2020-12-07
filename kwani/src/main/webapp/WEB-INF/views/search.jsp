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
    <link rel="stylesheet" type = "text/css" href="/resources/css/search.css">
</head>
<body>
    <div id="main">
        <div id="header">
            <div id="header_navbar">
                <div id="musicPlayer">musicPlayer</div>
                <div id="pageLogo">
                    <a href="#">Last.fm</a>
                </div>
                <div id="navbarUtil"> 
                    <button class="subnavbtn" onclick="openSearch()">
                      <i class="fa fa-search"></i></button>
                    <a href="#">Home</a>
                    <a href="#">Recommend</a>
                    <a href="#">Find music</a>
                    <a href="#">Join</a>
                </div>
            </div>
            <div id="myOverlay" class="overlay">
                <div class="overlay-content">
                  <form action="/search" method="get" name="searchForm" onsubmit="return checkTxt();">
                    <input type="text" placeholder="Search.." name="searchTxt" value="">
                    <button type="submit" id="searchBtn"><i class="fa fa-search"></i></button>
                  </form>
                </div>
            </div><!--myOverlay-->
        </div><!--header-->

        
        <div id="body">
            <div id="leftSideBar"></div>
            <div id="bodyContent">
                <div class="searchRst"><p><c:out value="${searchTxt}"/>에 대한 검색 결과</p></div>
                <div class="rstTap"> 
                    <form action="#">
                        <button type="button" class="entireBtn">통합검색</button>
                    </form>
                    <form action="/search/artist" method="get">
                    	<input type="hidden" value="${searchArtist[0].nm}" name="searchTxt">
                        <button type="submit" class="artistBtn">아티스트</button>
                    </form>
                    <form action="#">
                        <button type="button" class="songBtn">곡</button>
                    </form>
                    <form action="#">
                        <button type="button" class="albumBtn">앨범</button>
                    </form>
                    <form action="#">
                        <button type="button" class="lyricsBtn">가사</button>
                    </form>
                </div>
                
                <div class="artistRstTxt"><p class="textInfo">아티스트</p></div>
                <div class="artistRstContainer">
                	<div class="artistTable">
                	  <table>
                            <!-- <tr>
                            <th class="th0"><input type="checkbox" name="checkAll" class="checkAll"></th>
                            <th class="th1">번호</th>
                        	<th class="th2">가수</th>
                        	<th class="th3">제목</th>
                        	<th class="th4">듣기</th>
                        	<th class="th4">좋아요</th>
                            </tr> -->
                            <c:forEach items="${searchArtist}" var="searchArtist" varStatus="status" begin="0" end="4">
                        	<tr>
                        	<td class="td1">
                        		<div class="artistSmallImg">
                        		<img src="/resources/image/artist/<c:out value="${searchArtist.gropImg}" />" 
                				style="max-height:50px"></div>         	
                        	</td>
                        	<td class="td2"><c:out value="${searchArtist.nm}" /></td>
                        	<td class="td3"><c:out value="${searchArtist.type}" /></td>
                        	<td class="td4">
                        	<div class="heartParent">
                        	<img class="defaultHeartImg"src="/resources/image/heart2.png">
                        	<img class="redHeartImg" src="/resources/image/heart.png">
                        	</div>
                        	</td>
                        	</tr>
                        	</c:forEach>
                         </table>
                	</div>
                </div>
                
                <div class="trackHeader"><p class="textInfo">곡</p><hr></div>
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
                            <c:forEach items="${searchRst}" var="searchRst" varStatus="status" begin="0" end="7">
                        	<tr>
                        	<th><input type="checkbox" name="checkRow"></th>
                        	<td>${status.index+1}</td>
                        	<td><c:out value="${searchRst.trackTtl}" /></td>
                        	<td><c:out value="${searchRst.nm}" /></td>
                        	<td class="btnParent"><img class="playBtn" src="/resources/image/play-button.png"></td>
                        	<td>
                        	<div class="heartParent">
                        	<img class="defaultHeartImg"src="/resources/image/heart2.png">
                        	<img class="redHeartImg" src="/resources/image/heart.png">
                        	</div>
                        	</td>
                        	</tr>
                        	</c:forEach>
                         </table>
                    </div> 
                </div>
                
                <div class="albumTxt"><p class="textInfo">앨범</p></div>
                <div class="albumImgContainer">
                	<c:forEach items="${searchRst}" var="searchRst" varStatus="status" begin="0" end="3">
                	<div class="eachAlbum">
                	
                	<div class="albumImg">         	
                		<img src="/resources/image/album/<c:out value="${searchRst.albumImg}" />" 
                		style="max-height:240px">          	
                	</div><!-- albumImg --> 
                	<div class="albumArtist">
                		<p>
                			<c:out value="${searchRst.nm}" />
                		</p>
                	</div><!-- albumArtist -->   
                	<div class="albumTtl">
                		<p>
                			<c:out value="${searchRst.albumTtl}" />
                		</p>
                	</div><!-- albumTtl -->              	
                	</div><!-- eachAlbum --> 
                	</c:forEach>
                </div><!-- alblumImgContainer --> 
          
                
                <div class="lyricsTxt"><p class="textInfo">가사</p></div>
                <div class="lyricsContainer">
                	<c:forEach items="${searchLyrics}" var="searchLyrics" varStatus="status" begin="0" end="2">
                	<div class="eachLyrics">
                	
                	<div class="lyricsTtl">
                		<p>
                			<c:out value="${searchLyrics.trackTtl}" />
                		</p>
                	</div><!-- lyricsTtl -->   
                	<div class="lyricsContent">         	
                		<c:out value="${searchLyrics.trackLyrics}" />
                	</div><!-- lyricsContent --> 
                	<div class="lyricsInfoContainer">
                	<div class="lyricsArtist">
                		<h6>
                			<c:out value="${searchLyrics.nm}" />
                		</h6>
                	</div><!-- lyricsArtist -->  
                	<div class="lyricsAlbum">
                		<h6>
                			<c:out value="${searchLyrics.albumTtl}" />
                		</h6>
                	</div><!-- lyricsAlbum --> 
                	</div><!-- lyricsInfoContainer -->      	
                	</div><!-- eachLyrics --> 
                	<hr class="one">
                	</c:forEach>
                </div><!-- lyricsContainer -->
                
               
             
                    
                <script>
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
                		
                	//체크박스 설정--------------------------------------------------------------------	
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
        <div id="footer"></div>
    </div><!--main-->
</body>
</html>
                
                    
           