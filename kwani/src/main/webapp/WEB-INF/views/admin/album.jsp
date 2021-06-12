<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>


<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">앨범 리스트</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
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
								<td>${album.albumId}</td>

								<td>
									<div class="dropdown">
										<div class="dropdown-toggle" data-toggle="dropdown">
											${album.albumTtl}</div>
										
											<div class="dropdown-menu dropdown-menu-right shadow">
												<a class="dropdown-item" href="/admin/modify/album?albumId=${album.albumId }">
													데이터수정
												</a>
										</div>
									</div>

								</td>
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