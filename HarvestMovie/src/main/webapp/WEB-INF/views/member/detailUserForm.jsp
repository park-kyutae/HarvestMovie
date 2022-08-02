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
<title>회원 정보</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/member/common/adminpage_header.jsp" />
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<jsp:include
				page="/WEB-INF/views/member/common/adminpage_sidebar.jsp" />
			<div class="col-7">
				<h2 class="ma-3">${member.name}의 회원정보(관리자 전용)</h2>
				<form action="detailUser.do" method="post" id="detail_form">
					<input type="hidden" name="mem_num" value="${member.mem_num}">
					<table class="table" class="col-7">
						<tbody>
							<tr>
								<th scope="row">등급</th>
								<td colspan="1"><c:if test="${member.auth != 9}">
										<input class="form-check-input" type="radio" name="auth"
											value="1" id="auth1"
											<c:if test="${member.auth == 1}">checked</c:if> />정지
									
					<input class="form-check-input" type="radio" name="auth" value="2"
											id="auth2" <c:if test="${member.auth == 2}">checked</c:if> />일반    
					</c:if><c:if test="${member.auth == 9}">
								<input type="radio" name="auth" value="3" id="auth3" checked>관리
					</c:if></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td colspan="1">${user_name}</td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td colspan="1">${user_email}</td>
							</tr>
							<tr>
								<th scope="row">우편번호</th>
								<td colspan="1">${user_zip}</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="1">${user_addr1}${user_addr2}</td>
							</tr>
						</tbody>
					</table>
					<div class="my-2 float-end">
						<input class="btn btn-primary text-white" type="submit" value="수정">
						<input class="btn btn-secondary" type="button" value="목록"
							onclick="location.href='adminpage.do'">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>