<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>구매내역</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/product.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row mb-2">
		<hr>
		<h2>구매 내역</h2>
			<c:forEach var="list" items="${list}">
			<div class="col-md-6">
				<input type="hidden" id="pd_num" value="${list.ordersVO.pd_num}">
				<input type="hidden" id="ord_num" value="${list.ordersVO.ord_num}">
				<div
					class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
					<div class="col-auto d-none d-lg-block">
						<img class"bd-placeholder-img" width="200" height="250" src="${pageContext.request.contextPath}/upload/${list.productVO.pd_photo}">

					</div>						
					<div class="col p-4 d-flex flex-column position-static">
						<strong class="d-inline-block mb-2 text-primary">상품번호 : ${list.ordersVO.pd_num}</strong>
						<h3 class="mb-0">${list.productVO.pd_name}</h3>
						<div class="mb-1 text-muted">구매 날짜 : ${list.ordersVO.ord_regdate}</div>
						<p class="card-text mb-auto">${fn:substring(list.productVO.pd_content,0,26)}...</p>
						<button class="btn btn-sm btn-cancel" id="btn-cancel" data-ord="${list.ordersVO.ord_num}">주문 취소</button>
					</div>
					
				</div>
			</div>
			</c:forEach>
			<hr>
			
		</div>
	</div>
</body>
</html>