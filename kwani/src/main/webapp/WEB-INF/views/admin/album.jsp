<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				 <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
					<thead>
					<tr>
						<th width="10%">앨범 ID</th>
						<th width="20%">앨범 TITLE</th>
						<th width="20%">앨범 IMG</th>
						<th width="20%">앨범 발매일</th>
					</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${albumList}" var="album">
						<tr>
							<td>
								<div class="dropdown">
									<button class="btn btn-primary dropdown-toggle" type="button"
										data-toggle="dropdown">
										${album.albumId}<span class="caret"></span>
									</button>
									<ul class="dropdown-menu">
										<li><a href="/admin/modify/album?albumId=${album.albumId }">MODIFY</a></li>
										<li><a href="/admin/modify/album/">REMOVE</a></li>
									</ul>
								</div>
							</td>
							<td>${album.albumTtl}</td>
							<td>${album.albumImg}</td>
							<td>${album.rlesDt}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>



<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>