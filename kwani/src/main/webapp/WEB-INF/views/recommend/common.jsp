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
    <script defer src="/resources/js/index.js"></script>
    <script
	src="https://cdnjs.cloudflare.com/ajax/libs/animejs/2.2.0/anime.js"
	integrity="sha256-kRbW+SRRXPogeps8ZQcw2PooWEDPIjVQmN1ocWVQHRY="
	crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href='https://fonts.googleapis.com/css?family=Open Sans'
	rel='stylesheet'>
	<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.15.1/css/all.css"
	integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp"
	crossorigin="anonymous">
    <link rel="stylesheet" type = "text/css" href="/resources/css/c_recmd.css">
</head>

	<%@include file="../includes/header.jsp" %>
        <div id="body">
            <div id="leftSideBar"></div>
            <div id="bodyContent">   

                <div class="recmd_text">오늘의 추천 플레이리스트</div>  
            
                <div class="todayRecmd">     
                  <c:forEach items="${allplist}" var="plist" varStatus="status" begin="0" end="3">               	                                                                                                                                                      
                    <div id="recmd">
                    <div id="rec_img">
                    	<a href='/recommend/plylst?plylstId=${plist.rcmdPlylstId}'><img class="plylstImg" src="/resources/image/rcmdplylst/<c:out value="${plist.rcmdPlylstImg}" />"
                    	stlye = "max-height:350px"></a>
                     
                    </div>
                    <div id="rec_txt">
                    	<c:out value="${plist.rcmdPlylstId}" />  
                    	<form action="/recommend/plylst" method="get">
                    		<input type="hidden" value="${plist.rcmdPlylstId}" name="plylstId">
                    		<button type="submit">         	
                    		<c:out value="${plist.rcmdPlylstNm}" />
                    	</button></form>
                    	</div>
                    </div><!-- recmd -->
                  </c:forEach>                
                </div>
                                
                <div class="toLogin">
					<div class="goLogin"><p>더 많은 정보를 원한다면 Login</p>
					<form action="/user/login" method="get">
					<button class="button">Login</button></form></div>
                </div>
                <div class="showMv">
					<iframe width="80%" class="mv" height="340px" src="https://www.youtube.com/embed/eHir_vB1RUI"></iframe>
                </div>
                
                <script>
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
            		
                </script>
                
               
 </div><!--bodyContent-->
            <div id="rightSideBar"></div>
        </div><!--body-->
        <%@include file="../includes/footer.jsp" %>
