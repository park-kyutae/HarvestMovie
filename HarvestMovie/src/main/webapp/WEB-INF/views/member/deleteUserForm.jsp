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
	<div class="container-fluid">
		<div class="row flex-nowrap">
			<jsp:include page="/WEB-INF/views/member/common/mypage_sidebar.jsp" />
			<div class="row">
				<div class="col-12">
					<h2>회원 탈퇴</h2>
					<form action="deleteUser.do" method="post" id="delete_form">
						<ul>
							<li><label for="id">아이디</label> 
							<input type="text" name="id" id="id" maxlength="12"></li>
							<li><label for="email">이메일</label> 
							<input type="email" name="email" id="email" maxlength="50"></li>
							<li><label for="passwd">비밀번호</label> 
							<input type="password" name="pw" id="pw" maxlength="12"></li>
							<li><label for="cpasswd">비밀번호 확인</label> 
							<input type="password" name="cpasswd" id="cpasswd" maxlength="12">
								<span id="message_id"></span>
								</li>
						</ul>
						<div class="align-center">
							<input type="submit" value="회원탈퇴"> <input type="button"
								value="My페이지" onclick="location.href='myPage.do'">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>