<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 모바일에서 화면 축소/확대 방지 좀더 네이티브앱 처럼 느껴짐) -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- Bootstrap -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<title>회원가입</title>
</head>

<body>
<div class="container"><!-- 메인 컨테이너 -->
    <div class="row">
        <div class="col-xs-12"><!-- 첫번쨰 div -->
        <h1>회원가입</h1>
        </div>
        <div class="col-xs-12"><!-- 두번쨰 div -->
        <form class="navbar-form navbar-left" action="registerUser.do" method="post">
  			
		<label for="exampleFormControlInput1" class="form-label">아이디</label>
 		<input type="text" class="form-control" name="id" id="id" placeholder="아이디">
 		
		<label for="exampleFormControlInput1" class="form-label">패스워드</label>
 		<input type="password" class="form-control" name="pw" id="pw" placeholder="패스워드">
 		
		<label for="exampleFormControlInput1" class="form-label">패스워드 확인</label>
 		<input type="password" class="form-control" id="exampleFormControlInput1" placeholder="패스워드 확인">
 		
		<label for="exampleFormControlInput1" class="form-label">이름</label>
 		<input type="text" class="form-control" name="name" id="name" placeholder="이름">
 		
		<label for="exampleFormControlInput1" class="form-label">이메일</label>
 		<input type="email" class="form-control" name="email" id="email" placeholder="이메일">
 		
		<label for="exampleFormControlInput1" class="form-label">주소</label>
 		<input type="text" class="form-control" name="addr1" id="addr1" placeholder="주소">
 		<div class="col-md-6">
 		<input type="text" class="form-control" name="zipcode" id="zipcode" placeholder="우편번호">
 		</div>
 		<div class="col-md-6">
 		<input type="text" class="form-control" name="addr2" id="addr2" placeholder="상세주소">
		</div>
  			<input type="submit" class="form-control" value="등록">
		</form>
		</div>
        
    </div>
    <div class="row"></div>
</div>
</body>
</html>