<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a{
text-decoration: none;
}
div{
margin-top: 10px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/admin.css" />
</head>
<body>
<div>
<h4>${msg }</h4>
<a href="/admin/logout">LOG OUT</a> 
</div>
<div>
<div>USER</div>
<a href="/admin/inputuser">input user</a>
</div>
<div>
<div>ALBUM</div>
<a href="/admin/inputalbum">input album</a>
</div>
<div>
<div>TRACKS 
앨범이 잇어야함</div>
<a href="/admin/inputtracks">input tracks</a>
</div>
<div>
<div>
ARTIST</div>
<a href="/admin/inputartist">input artist</a>
</div>

<div>
<div>
ARTIST AND TRACKS
</div>
<a href="/admin/inputartistandtrack">input Artist and Tracks</a>
</div>

<div>
<div>
ARTIST AND GROUP
</div>
<a href="/admin/inputartistandgroup">input Artist and group</a>
</div>


</body>
</html>