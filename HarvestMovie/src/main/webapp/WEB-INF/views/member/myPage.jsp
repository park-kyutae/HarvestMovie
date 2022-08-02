<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="${pageContext.request.contextPath}/css/sidebar.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>마이페이지</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/member.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/member.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/member/common/mypage_header.jsp" />
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<jsp:include page="/WEB-INF/views/member/common/mypage_sidebar.jsp" />
			<!-- 메인 div -->
			<div class="col-9 bd-content">
				<br>
				<h2>내 정보</h2>
				<div class="col-9">
				<input type="hidden" name="mem_num" value="${member.mem_num}">
					<table class="table" class="col-7">
						<tbody>
							<tr>
								<th scope="row">사진</th>
								<td colspan="2"><c:if
										test="${!empty user_num && !empty user_photo}">
										<img
											src="${pageContext.request.contextPath}/upload/${member.photo}"
											width="100" height="100" class="my-photo rounded-circle">
										<br>
									</c:if> <c:if test="${!empty user_num && empty user_photo}">
										<img src="${pageContext.request.contextPath}/images/face.png"
											width="100" height="100" class="my-photo rounded-circle">
										<br>
									</c:if>
									<div class="row">
										<div class="col-6 pr-0">
											<input class="form-control mt-2 mb-2" type="file" id="photo"
												accept="image/gif,image/png,image/jpeg">
										</div>
										<div class="col-3 pt-2">
											<button type="button" id="photo_submit"
												class="btn btn-primary">등록</button>
										</div>
									</div></td>
							</tr>
							<tr>
								<th scope="row">이름</th>
								<td colspan="2">${member.name}</td>
							</tr>
							<tr>
								<th scope="row">비밀번호</th>
								<td>●●●●●●</td>
								<td><a
									href="${pageContext.request.contextPath}/member/modifyPasswordForm.do">
										<button type="button" id="pw_update" class="btn btn-primary">비밀번호
											수정</button>
								</a></td>
							</tr>
							<tr>
								<th scope="row">이메일</th>
								<td colspan="2">${member.email}</td>
							</tr>
							<tr>
								<th scope="row">주소</th>
								<td colspan="2">(${member.zipcode})${member.addr1} ${member.addr2}</td>
							</tr>
						</tbody>
					</table>
				</div>

				<div class="mt-3">
					<h2 class="ma-3">내가 남긴 리뷰</h2>
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
								<c:forEach var="reviewVO" items="${list}">
									<tr>
										<td><c:if test="${reviewVO.auth > 0}">
												<a href="detailUserForm.do?mem_num=${member.mem_num}"
													style="text-decoration: none">${member.id}</a>
											</c:if> <c:if test="${member.auth == 0}">${member.id}</c:if>
											</td>
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
					<div class="col-12 d-flex justify-content-center">${page}</div>
					<form id="search_form" action="adminpage.do" method="get">
						<ul>
							<li>
								<div class="col-2">
									<select class="form-select" name="keyfield">
										<option value="1">ID</option>
										<option value="2">이름</option>
										<option value="3">email</option>
									</select>
								</div>
							</li>
							<li>
								<div class="col-3">
									<input class="form-control" type="search" size="16"
										name="keyword" id="keyword" value="${param.keyword}">
								</div>
							</li>
							<li>
								<div class="col-1">
									<input class="btn btn-primary" type="submit" value="찾기">
								</div>
							</li>
						</ul>
					</form>
					<div class="list-space align-right">
						<input class="btn btn-primary" type="button" value="목록"
							onclick="location.href='adminpage.do'"> <input
							class="btn btn-secondary" type="button" value="홈으로"
							onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>