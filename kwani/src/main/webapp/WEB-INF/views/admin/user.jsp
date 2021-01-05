<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="/WEB-INF/views/includes/adminheader.jsp"%>



<div class="row">
	<div class="col-md-12">
		<div class="panel panel-default">
			<div class="panel-heading">유저 LIST</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table width="100%"
					class="table table-striped table-bordered table-hover"
					id="dataTables-example">
					<thead>
						<tr>
							<th width="10%">이메일</th>
							<th width="20%">닉네임</th>
							<th width="20%">비밀번호</th>
							<th width="20%">접속일</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${userList}" var="user">
							<tr>
								<td>
											${user.email}
								</td>

								<td>
									<div class="dropdown">
										<div class="dropdown-toggle" data-toggle="dropdown">
											${user.nick}</div>

										<div class="dropdown-menu dropdown-menu-right shadow">
											<a class="dropdown-item"
												href="/admin/modify/user?email=${user.email }">
												데이터수정 </a>
										</div>
									</div>
								

								</td>
								<td>${user.pwd}</td>
								<td>${user.lastDt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>


<%@include file="/WEB-INF/views/includes/adminfooter.jsp"%>


