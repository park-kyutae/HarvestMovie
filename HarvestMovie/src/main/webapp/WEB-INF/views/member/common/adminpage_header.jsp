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
<title>상단바</title>
</head>
<body>
<div class="container-fluid">
  <div class="row bg-primary text-white">
    <div class="col-12">
		<h1>어드민페이지</h1>
	</div>
   <div class="d-flex col-2 m-4 justify-content-end">
    <c:if test="${!empty user_num && !empty user_photo}">
	<img src="${pageContext.request.contextPath}/upload/${user_photo}" width="150" height="150" class="rounded-circle">
	</c:if>

	<c:if test="${!empty user_num && empty user_photo}">
	<img src="${pageContext.request.contextPath}/images/face.png" width="150" height="150" class="rounded-circle">
	</c:if>
    </div>
    <div class="col-6 py-auto"><span>${user_name}<br>계정 생성일: ${user_date}</div>
  </div>
 </div>
</body>
</html>