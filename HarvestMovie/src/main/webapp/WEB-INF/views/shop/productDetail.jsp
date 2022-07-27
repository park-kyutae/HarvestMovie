<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
<title>굿즈 상세 페이지</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/product.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<input type="hidden" id="pd_num" value="${product.pd_num}"/>

	<div>
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="container">
			<div class="py-5 text-center">
				<h2>상품 상세페이지</h2>
			</div>
			<div class="row featurette">
				<div class="col-md-7 order-md-2">
					<h2 class="featurette-heading">
						<span class="text-muted text-center">${product.pd_name}</span>
					</h2>
					<p class="lead">${product.pd_content}</p>
					<div class="col">
						<figure>
							<blockquote class="blockquote">
							<c:if test="${product.pd_quantity eq 0}">
								<p>품절 되었습니다. 재입고를 기다려주세요.</p>
							</c:if>
							<c:if test="${product.pd_quantity ne 0}">
								<p>수량 : ${product.pd_quantity}</p>
							</c:if>	
							</blockquote>
							<c:if test="${product.pd_quantity eq 0}">
							<button id="btn-disable" class="btn btn-secondary" disabled>구매불가</button>
							</c:if>
							<c:if test="${product.pd_quantity ne 0}">
							<button id="btn-order" class="btn btn-secondary" onclick="">구매하기</button>
							</c:if>
							<c:if test="${!empty user_num && user_auth == 9}">
							  <input type="hidden" name="pd_num" value="${product.pd_num}">     
							<button id="btn-modify" name="btn-modify" class="btn btn-primary" onclick="location.href='productUpdateForm.do?pd_num=${product.pd_num}'">수정</button>
							<button id="btn_delete" name="btn_delete" class="btn btn-danger">삭제</button>
							<script type="text/javascript">
								let btn_delete = document.getElementById('btn_delete');
								//이벤트 연결
								btn_delete.onclick=function(){
								let choice = confirm('삭제하시겠습니까???');
									if(choice){
										location.replace('productDelete.do?pd_num=${product.pd_num}');
									}
								};
							</script>
							</c:if> 
							<div class="d-md-flex justify-content-md-end">  
								<button id="btn-list" name="btn-list" class="btn btn-secondary" onclick="location.href='shopMain.do'">목록</button>
							</div>  
						</figure>
					</div>
				</div>
				<div class="col-md-5 order-md-1">
					<img class="mb-5" width="500px" height="700px"
						src="${pageContext.request.contextPath}/upload/${product.pd_photo}">
				</div>
			</div>

		</div>
	</div>
</body>
</html>