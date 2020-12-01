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
    <link rel="stylesheet" type = "text/css" href="/resources/css/searchSinger.css">
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
                  <form action="/recommend/search" method="get" name="searchForm" onsubmit="return checkTxt();">
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
                        <button type="button" class="albumBtn">통합검색</button>
                    </form>
                    <form action="#">
                        <button type="button" class="trackBtn">앨범</button>
                    </form>
                    <form action="#">
                        <button type="button" class="artistBtn">곡</button>
                    </form>
                    <form action="#">
                        <button type="button" class="lyricBtn">아티스트</button>
                    </form>
                </div>
                <c:if test="${searchTxt == searchRst[0].nm }">
                <div class="rstInfo">
                    <div class="rstImg">
                    	<img class="artistImg" src="/resources/image/artist/${searchRst[0].gropImg }" />
                    </div>
                    <div class="rstText"><p><c:out value="${searchTxt}"/></p><br><p>데뷔일 0000년 00월 00일</p>
                    <br>솔로, 그룹</div>
                </div>
                </c:if>
                <div class="trackHeader"><p class="textInfo">곡</p><hr></div>
                <div class="trackTable">
                    <div id="plylstTable">
                        <table>
                            <tr>
                            <th class="th0"><input type="checkbox" name="checkAll" class="checkAll"></th>
                            <th class="th1">번호</th>
                            <th class="th2">제목</th>
                            <th class="th3">가수</th>
                            <th class="th1">듣기</th>
                            <th class="th1">좋아요</th>
                            </tr>
                            <c:forEach items="${searchRst}" var="searchRst" varStatus="status" begin="0" end="7">
                        	<tr>
                        	<th><input type="checkbox" name="checkRow"></th>
                        	<td>${status.index+1}</td>
                        	<td><c:out value="${searchRst.trackTtl}" /></td>
                        	<td><c:out value="${searchRst.nm}" /></td>
                        	<td><img class="playBtn" src="/resources/image/play-button.png"></td>
                        	<td><i class="far fa-heart"></i></td>
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
                <div class="artistAllTxt"><p class="textInfo">아티스트</p></div>
                
                <div class="artistAllImg">
                	
                </div>
                
                <div class="lyricsTxt"><p class="textInfo">가사</p></div>
                <div class="lyricsImg"></div>
                
               
             
                    
                <script>
                
                   
                	//체크박스 설정--------------------------------------------------------------------
                	
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
                
                
                    
            <%@include file="../includes/footer.jsp" %>