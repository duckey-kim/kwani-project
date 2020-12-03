<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>
<div>
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">DataTables Advanced Tables</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th width="5%">ID</th>
							<th >제목</th>
							<th width="9%">타이틀</th>
							<th >URL</th>
							<th width="7%">앨범</th>
							<th width="7%">분위기</th>
							<th width="7%">장르</th>
							<th width="7%">상황</th>
							<th width="7%">상태</th>
							<th width="7%">순서</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${trackList}" var="track">
							<tr>
								<td>
											${track.trackId}
								</td>

								<td>
									<div class="dropdown">
										<div class="dropdown-toggle" data-toggle="dropdown">
											${track.trackTtl}</div>
										<ul class="dropdown-menu">
											<li><a
												href="/admin/modify/tracks?trackId=${track.trackId }">MODIFY</a></li>
											<li><a href="/admin/modify/album/">REMOVE</a></li>
										</ul>
									</div>

								</td>
								<td>${track.ttlTrack}</td>
								<td>${track.trackUrl}</td>
								<td>${track.albumId}</td>
								<td>${track.moodCd}</td>
								<td>${track.genreCd}</td>
								<td>${track.situCd}</td>
								<td>${track.stusCd}</td>
								<td>${track.trackOrder}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


