<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>상품관리</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/product.js"></script>
<script>
        console.log(${count})

    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/common/adminpage_header.jsp"/>
<div class="container-fluid">
  <div class="row flex-nowrap">
  <jsp:include page="/WEB-INF/views/member/common/adminpage_sidebar.jsp"/>
  	<div class="col-8 ma-3 pa-3">
	<h2 class="text-start bg-light">상품관리</h2>
	<div class="container fliud float-start">
	<c:if test="${count} == 0">
	<div class="result-display">
		저장된 게시물이 없음~~!~!~
	</div>
	</c:if>
	<c:if test="${count > 0}">
		<!-- On tables -->
		<table class="table table-primary table-hover text-center">
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>가격</th>
				<th>소개글</th>
				<th>수량</th>
				<th>등록일</th>
			</tr>
			<c:forEach var="product" items="${list}">
			<tr>
				<td>${product.pd_num}</td>
				<td>${product.pd_name}</td>
				<td>${product.pd_price}</td>
				<td style='width:50%;'><a style="text-decoration: none;color:black;" href="productDetail.do?pd_num=${product.pd_num}">${fn:substring(product.pd_content,0,25)}...</a></td>
				<c:if test="${product.pd_quantity == 0}">
				<td class="table-danger">품절!</td>
				</c:if>
				<c:if test="${product.pd_quantity > 0}">
				<td>${product.pd_quantity}</td>
				</c:if>
				<td>${product.pd_regdate}</td>
			</tr>
			</c:forEach>
		</table>
		<div class="text-center">
			${page}
		</div>
	</c:if>
		<div>
			<input class="btn btn-primary" type="button" value="상품 추가" onclick="location.href='insertProductForm.do'">
			<input class="btn btn-primary float-end" type="button" value="ShopMain" onclick="location.href='shopMain.do'">
		</div>
	</div>
</body>
</html>
