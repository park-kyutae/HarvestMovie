<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title>회원 정보</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/common/adminpage_header.jsp"/>
<div class="container-fluid">
  <div class="row flex-nowrap">
  <jsp:include page="/WEB-INF/views/member/common/adminpage_sidebar.jsp"/>
  	<div class="row">
  	<div class="col-5">
		<h2>${member.id}의 회원정보 (관리자 전용)</h2>
		<form action="detailUser.do" method="post"
		      id="detail_form">
			<input type="hidden" name="mem_num" value="${member.mem_num}">
			<ul class="list-group">
				<li>
					<label>등급</label>
					<c:if test="${member.auth != 9}">
					<input type="radio" name="auth" value="1" id="auth1"
					    <c:if test="${member.auth == 1}">checked</c:if>/>정지
					<input type="radio" name="auth" value="2" id="auth2"
					    <c:if test="${member.auth == 2}">checked</c:if>/>일반    
					</c:if>
					<c:if test="${member.auth == 9}">
					<input type="radio" name="auth" value="3"
					                    id="auth3" checked>관리
					</c:if>
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="수정">
				<input type="button" value="목록"
				      onclick="location.href='adminpage.do'">
			</div>  
			<ul class="list-group">
				<li class="list-group-item">
					<label>이름</label>${member.name}
				</li>
				<li class="list-group-item">
					<label>이메일</label>${member.email}
				</li>
				<li class="list-group-item">
					<label>우편번호</label>${member.zipcode}
				</li>
				<li class="list-group-item">
					<label>주소</label>
					${member.addr1} ${member.addr2}
				</li>
			</ul>    
		</form>
		</div>
	</div>
  </div>
 </div>
</body>
</html>