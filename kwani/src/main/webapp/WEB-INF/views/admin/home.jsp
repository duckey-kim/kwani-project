<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>
	<div>
		<h4>${msg }</h4>
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
		<div>TRACKS 앨범이 잇어야함</div>
		<a href="/admin/inputtracks">input tracks</a>
	</div>
	<div>
		<div>ARTIST</div>
		<a href="/admin/inputartist">input artist</a>
	</div>

	<div>
		<div>ARTIST AND TRACKS</div>
		<a href="/admin/inputartistandtrack">input Artist and Tracks</a>
	</div>

	<div>
		<div>ARTIST AND GROUP</div>
		<a href="/admin/inputartistandgroup">input Artist and group</a>
	</div>




	<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>