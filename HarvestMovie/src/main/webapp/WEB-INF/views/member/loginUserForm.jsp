<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<!-- 메인 컨테이너 -->
		<div class="row d-flex justify-content-end">
			<div class="col-6 col-sm-6 mt-4">
				<!-- 첫번쨰 div -->
				<img src="${pageContext.request.contextPath}/upload/main_cat.png"
					style="height: 130%" class="rounded-circle">
			</div>
			<div class="col-6 col-sm-6 my-auto">
				<!-- 두번쨰 div -->
				<div class="text-center mt-5">
					<h1>로그인</h1>
				</div>
				<div class="bg-light border border-secondary p-3 mt-2">
					<form class="my-auto navbar-form navbar-left" action="loginUser.do"
						method="post">
						<div>
						<label for="exampleFormControlInput1" class="form-label">아이디</label>
						<input type="text" class="form-control" name="id" id="id"
							placeholder="아이디"> <label for="exampleFormControlInput1"
							class="form-label">패스워드</label> <input type="password"
							class="form-control" name="pw" id="pw" placeholder="패스워드">
						<input type="submit"
							class="form-control bg-primary text-white mt-2" value="로그인">
						<input type="button"
							class="form-control bg-secondary text-white mt-2" value="회원가입" onclick="location.href='registerUserForm.do'">
						</div>
					</form>
				</div>
			</div>

		</div>
		<div class="row"></div>
	</div>
</body>
</html>