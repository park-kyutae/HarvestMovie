<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/common/mypage_header.jsp"/>
<div class="container-fluid">
  <div class="row flex-nowrap">
  <jsp:include page="/WEB-INF/views/member/common/mypage_sidebar.jsp"/>
  		<div class="col-9">	
  		<br>
  		<h2>내 정보 수정</h2>
  		<form class="navbar-form navbar-left" action="modifyUser.do" method="post">
					<label for="exampleFormControlInput1" class="form-label">아이디</label>
					<input type="text" class="form-control" name="id" id="id" value="${user_id}" placeholder="아이디"> 

					<label for="exampleFormControlInput1" class="form-label">이름</label> 
					<input type="text" class="form-control" name="name" id="name" value="${user_name}" placeholder="이름"> 

					<label for="exampleFormControlInput1" class="form-label">이메일</label> 
					<input type="email" class="form-control" name="email" id="email" value="${user_email}" placeholder="이메일">

					<label for="exampleFormControlInput1" class="form-label">주소</label>
					<input type="text" class="form-control" name="addr1" id="addr1" value="${user_addr1}" onclick="sample2_execDaumPostcode()" placeholder="주소">					
					
					<label for="exampleFormControlInput1" class="form-label">상세주소</label>
					<input type="text" class="form-control" name="addr2" id="addr2"	value="${user_addr2}" placeholder="상세주소">
					
					<div class="col-md-6">
					<label for="exampleFormControlInput1" class="form-label">우편번호</label>
						<input type="text" class="form-control" name="zipcode" id="zipcode" value="${user_zip}" placeholder="우편번호">
					</div>
					<input type="cancle" class="form-control mt-2" value="취소">
					<input type="submit" class="form-control bg-primary text-white mt-2" value="수정">
				</form>
  		</div>

  	</div>
  </div>

</body>
</html>