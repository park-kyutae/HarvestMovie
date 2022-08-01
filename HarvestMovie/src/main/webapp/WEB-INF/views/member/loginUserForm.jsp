<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<!-- 메인 컨테이너 -->
		<div class="row d-flex justify-content-end">
			<div class="row">
				<div class="col">
					<!-- 첫번쨰 div -->
				</div>
			</div>
			<div class="row d-flex justify-content-center"></div>
			<div class="col-sm-6 ">
				<!-- 두번쨰 div -->
				<div class="text-center mt-5">
				<h1>로그인</h1>
				</div>
				<div class="bg-light border border-secondary p-3 mt-2" style="height: 50px">
			 <form class="navbar-form navbar-left" action="loginUser.do" method="post">
  			
		<label for="exampleFormControlInput1" class="form-label">아이디</label>
 		<input type="text" class="form-control" name="id" id="id" placeholder="아이디">
 		
		<label for="exampleFormControlInput1" class="form-label">패스워드</label>
 		<input type="password" class="form-control" name="pw" id="pw" placeholder="패스워드">
  		<input type="submit" class="form-control bg-primary text-white mt-2" value="로그인">
		</form>
				</div>
			</div>

		</div>
</body>
</html>