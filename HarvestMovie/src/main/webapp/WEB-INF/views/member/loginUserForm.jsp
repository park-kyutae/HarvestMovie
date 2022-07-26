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
<!-- 로그인 창 -->
        <div class="col-xs-12"><!-- 두번쨰 div -->
        <form class="navbar-form navbar-left" action="loginUser.do" method="post">
  			
		<label for="exampleFormControlInput1" class="form-label">아이디</label>
 		<input type="text" class="form-control" name="id" id="id" placeholder="아이디">
 		
		<label for="exampleFormControlInput1" class="form-label">패스워드</label>
 		<input type="password" class="form-control" name="pw" id="pw" placeholder="패스워드">
  		<input type="submit" class="form-control" value="등록">
		</form>
		</div>
</body>
</html>