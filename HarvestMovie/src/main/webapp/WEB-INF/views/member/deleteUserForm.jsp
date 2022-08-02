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
			<div class="col-6 border border-secondary mx-auto my-3 pa-5">
				<h2 class="my-3">회원 탈퇴</h2>
				<form class="form-floating" action=deleteUser.do method="post" id="delete_form">
				 
				 <div class="row">
				 	
				 	<div class="col-12">
				 	<div class="form-floating mb-3">
						<input class="form-control mt-2" type="text" name="id" id="id" placeholder="아이디" maxlength="30">
						<label for="id">아이디</label>
					</div>
					</div>
				 </div>
				 
					<div class="form-floating mb-3">
					<input class="form-control mt-2" type="email"
							name="email" id="email"  placeholder="이메일" maxlength="50">
					<label for="passwd">이메일</label>
					</div>
					
					<div class="form-floating mb-3">
					<input class="form-control mt-2" type="password" name="pw" id="pw" 
							 placeholder="비밀번호" maxlength="18">
					<label for="origin_passwd">비밀번호</label> 
					</div>
					
					<div class="form-floating mb-3">
					<input class="form-control mt-2"
							type="password" name="cpasswd" id="cpasswd"  placeholder="새비밀번호 확인" maxlength="12">
					<label for="cpasswd">비밀번호 확인</label> 
					
							<span id="message_cpasswd"></span>
					</div>
					<div class="my-2 float-end">
						<input class="btn btn-primary" type="submit" value="회원탈퇴"> 
						<input class="btn btn-secondary" type="button"
							value="취소" onclick="location.href='myPage.do'">
							</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>