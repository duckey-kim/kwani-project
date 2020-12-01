<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>
<div>
		<h4>${msg }</h4>
	</div>

	<div>
		<div>USER</div>
		<a href="/admin/modify/user">MODIFY user</a>
	</div>
	<div>
		<div>ALBUM</div>
		<a href="/admin/modify/album">MODIFY album</a>
	</div>
	<div>
		<div>TRACKS</div>
		<a href="/admin/modify/tracks">MODIFY tracks</a>
	</div>
	<div>
		<div>ARTIST</div>
		<a href="/admin/modify/artist">MODIFY artist</a>
	</div>

	<div>
		<div>ARTIST AND TRACKS</div>
		<a href="/admin/modify/artistandtrack">MODIFY Artist and Tracks</a>
	</div>

	<div>
		<div>ARTIST AND GROUP</div>
		<a href="/admin/modify/artistandgroup">MODIFY Artist and group</a>
	</div>





<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


