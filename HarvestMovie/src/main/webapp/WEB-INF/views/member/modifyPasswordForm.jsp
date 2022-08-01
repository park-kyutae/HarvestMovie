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
<title></title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/member/common/mypage_header.jsp" />
	<div class="container">
		<div class="row">

			<div class="col-4 border border-secondary mx-auto my-3 pa-5">
				<h2 class="d-inline mx-auto p-2">비밀번호 수정</h2>
				<form action="modifyPassword.do" method="post" id="password_form">
					<ul>
						<li><label for="id">아이디</label> <input type="text" name="id"
							id="id" maxlength="12">
						</li>
						<li><label for="origin_passwd">현재 비밀번호</label> <input
							type="password" name="origin_passwd" id="origin_passwd"
							maxlength="12">
						</li>
						<li><label for="passwd">새비밀번호</label> <input type="password"
							name="pw" id="pw" maxlength="12">
						</li>
						<li><label for="cpasswd">새비밀번호 확인</label> <input
							type="password" name="cpasswd" id="cpasswd" maxlength="12">
							<span id="message_cpasswd"></span>
						</li>
					</ul>
					<div class="align-center">
						<input type="submit" value="비밀번호수정"> <input type="button"
							value="My페이지" onclick="location.href='myPage.do'">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>