<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>상품관리페이지</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div>
	<h2 class="text-center bg-light">상품관리</h2>
	<div class="container fliud">
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
	
</div>
</body>
</html>