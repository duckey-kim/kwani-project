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
    <script defer src="/resources/js/index.js"></script>
    <link rel="stylesheet" type = "text/css" href="/resources/css/userRecmd.css">
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
                <div id="bodyContentIn">
                    <div class="userInfo"></div>
                    <div class="contentBox1">
                        <div class="contentText1">멍이나물님이 좋아하는 하드록</div>
                        <div class="recmdBox1">
                            <div class="recmd1_1">
                                <div class="rec_img">이미지</div>
                                <div class="rec_txt"></div>
                            </div>
                            <div class="recmd1_2">
                                <div class="rec_img">이미지</div>
                                <div class="rec_txt"></div>
                            </div>
                            <div class="recmd1_3">
                                <div class="rec_img">이미지</div>
                                <div class="rec_txt"></div>
                            </div>
                            <div class="recmd1_4">
                                <div class="rec_img">이미지</div>
                                <div class="rec_txt"></div>
                            </div>
                            <div class="recmd1_5">
                                <div class="rec_img">이미지</div>
                                <div class="rec_txt"></div>
                            </div>
                        </div>
                    </div>
                    <div class="contentBox2">
                        <div class="contentText2">멍이나물님이 즐겨듣는 오마이걸 노래와 비슷한 노래</div>
                        <div class="recmdBox2">
                            <div class="recmd2_1"></div>
                            <div class="recmd2_2"></div>
                            <div class="recmd2_3"></div>
                            <div class="recmd2_4"></div>
                            <div class="recmd2_5"></div>
                        </div>
                    </div>
                    <div class="contentBox3">
                        <div class="contentText3">Artist For U</div>
                        <div class="recmdBox3">
                            <div class="recmd3_1"></div>
                            <div class="recmd3_2"></div>
                            <div class="recmd3_3"></div>
                            <div class="recmd3_4"></div>
                            <div class="recmd3_5"></div>
                        </div>
                    </div>
                    <div class="contentBox4">
                        <div class="contentText4">쌀쌀한 날씨에 멍이나물님을 위한 따스한 선곡</div>
                        <div class="recmdBox4">
                            <div class="recmd4_1"></div>
                            <div class="recmd4_2"></div>
                            <div class="recmd4_3"></div>
                            <div class="recmd4_4"></div>
                            <div class="recmd4_5"></div>
                        </div>
                    </div>
                </div><!--bodyContentIn-->             
                    
            <%@include file="../includes/footer.jsp" %>