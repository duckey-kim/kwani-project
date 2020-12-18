<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>

<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">가수 리스트</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th width="10%">ID</th>
							<th width="15%">이름</th>
							<th width="15%">성별</th>
							<th width="15%">타입</th>
							<th width="15%">데뷔날짜</th>
							<th width="15%">상태코드</th>
							<th width="15%">이미지</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${artistList}" var="artist">
							<tr>
								<td>${artist.gropId}</td>
								<td>
									<div class="dropdown">
										<div class="dropdown-toggle" data-toggle="dropdown">
											${artist.nm}</div>
										<ul class="dropdown-menu">
											<li><a
												href="/admin/modify/artist?gropId=${artist.gropId }">MODIFY</a></li>
											<li><a href="/admin/modify/album/">REMOVE</a></li>
										</ul>
									</div>

								</td>
								<td>${artist.sex}</td>
								<td>${artist.type}</td>
								<td>${artist.debutDt}</td>
								<td>${artist.stusCd}</td>
								<td>${artist.gropImg}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


