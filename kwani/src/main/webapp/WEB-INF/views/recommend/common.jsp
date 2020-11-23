<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp" %>

                <div class="recmd_text">오늘의 추천곡</div>  
            
                <div class="todayRecmd">     
                  <c:forEach items="${allplist}" var="plist" varStatus="status" begin="0" end="3">               	                                                                                                                                                      
                    <div id="recmd">
                    <div id="rec_img">img</div>
                    <div id="rec_txt">
                    	<c:out value="${plist.rcmdPlylstId}" />  
                    	<form action="/recommend/plylst" method="post">
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
					<button class="button">Login</button></div>
                </div>
                <div class="showMv">
					<iframe width="80%" class="mv" height="340px" src="https://www.youtube.com/embed/eHir_vB1RUI"></iframe>
                </div>
                
<%@include file="../includes/footer.jsp" %>