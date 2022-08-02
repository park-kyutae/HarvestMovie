<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>어드민페이지</title>
<script>
console.log(${count})
</script>
<style>
a:link {
	color: black;
}

a:visited {
	color: black;
}

a:hover {
	color: red;
}

a:active {
	color: green
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/member/common/adminpage_header.jsp" />
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<jsp:include
				page="/WEB-INF/views/member/common/adminpage_sidebar.jsp" />
			<div class="col-8 ma-3 pa-3">
				<h2 class="my-2">회원목록(관리자 전용)</h2>
				<c:if test="${count == 0}">
					<div>표시할 내용이 없습니다.</div>
				</c:if>
				<c:if test="${count > 0}">
					<div class="ma-3 pa-3">
						<table class="table ma-3">
							<tr>
								<th>ID</th>
								<th>이름</th>
								<th>이메일</th>
								<th>가입일</th>
								<th>등급</th>
							</tr>
							<c:forEach var="member" items="${list}">
								<tr>
									<td><c:if test="${member.auth > 0}">
											<a href="detailUserForm.do?mem_num=${member.mem_num}"
												style="text-decoration: none">${member.id}</a>
										</c:if> <c:if test="${member.auth == 0}">
					${member.id}
					</c:if></td>
									<td>${member.name}</td>
									<td>${member.email}</td>
									<td>${member.reg_date}</td>
									<td><c:if test="${member.auth == 0}">탈퇴</c:if> <c:if
											test="${member.auth == 1}">정지</c:if> <c:if
											test="${member.auth == 2}">일반</c:if> <c:if
											test="${member.auth == 3}">평론가</c:if> <c:if
											test="${member.auth == 4}">기자</c:if> <c:if
											test="${member.auth == 9}">관리</c:if></td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</c:if>
				<div class="row">
					<div class="col-4">
							<input class="btn btn-primary" type="button" value="목록"
								onclick="location.href='adminpage.do'"> <input
								class="btn btn-secondary" type="button" value="홈으로"
								onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
					</div>
					<div class="col-8">
					<form action="adminpage.do" method="get">
					<div class="row justify-content-end">
								<div class="col-2">
									<select class="form-select" name="keyfield">
										<option value="1">ID</option>
										<option value="2">이름</option>
										<option value="3">email</option>
									</select> 
									</div>
									<div class="col-5">
									<input class="form-control" type="search" size="16"
										name="keyword" value="${param.keyword}"> 
										</div>
										<div class="col-2">
										<input
										type="submit" class="btn btn-primary" value="검색">
										</div>
										</div>
								</form>
								</div>
				</div>
				
				
				<c:if test="${count > 0}">
					<div class="text-center mt-3">${page}</div>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>