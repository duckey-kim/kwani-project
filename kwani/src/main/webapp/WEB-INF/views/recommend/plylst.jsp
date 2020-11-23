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
    <link rel="stylesheet" href="https://icono-49d6.kxcdn.com/icono.min.css">
    <script defer src="/resources/js/index.js"></script>
     <script src="/resources/js/jquery-3.5.1.js"/></script>
   
    <link rel="stylesheet" type = "text/css" href="/resources/css/plylstDetail.css">
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
                  <form action="/recommend/search" method="get" name="searchForm">
                    <input type="text" placeholder="Search.." name="searchTxt" value="">
                    <button type="submit"><i class="fa fa-search"></i></button>
                  </form>
                </div>
            </div><!--myOverlay-->
        </div><!--header-->

        <div id="body">
            <div id="leftSideBar"></div>
            <div id="bodyContent">   
            <div id="plylstInfo"><h1>PlayList</h1><br>
                    <h3>${plistName.rcmdPlylstNm}</h3>
                </div><!--plylstInfo-->
                <div id="tracks"><h2>Tracks</h2></div>
                <div id="plylstBtn">
                    <button class="button">듣기</button>
                    <button class="button">담기</button>
                </div>
                    <div id="plylstTable">
                    <table>
                        <tr>
                        <th class="th0"><input type="checkbox" name="checkAll" class="checkAll"></th>
                        <th class="th1">번호</th>
                        <th class="th2">가수</th>
                        <th class="th3">제목</th>
                        <th class="th4">듣기</th>
                        <th class="th4">좋아요</th>
                        </tr>
                        
                        <c:forEach items="${plistListDtl}" var="plstdtl" varStatus="status" begin="0" end="19">
                        <tr>
                        <th><input type="checkbox" name="checkRow"></th>
                        <td class="num">${status.index+1}</td>
                        <td><c:out value="${plstdtl.nm}" /></td>
                        <td><c:out value="${plstdtl.trackTtl}" /></td>
                        <td>Peter</td>
                        <td class="faHeart"><i class="far fa-heart"></i></td>
                        </tr>
                        </c:forEach>
                        
                        </table>
                    </div>
                    
                <script>
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