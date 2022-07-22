<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>굿즈샵</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<div>
		<%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
		<section class="py-5 text-center container">
			<div class="row py-lg-5">
      			<div class="col-lg-6 col-md-8 mx-auto">
        			<h1 class="fw-light">GoodsShop</h1>
        			<p class="lead text-muted">귀여움의 정의가 궁금할 땐 Harvest 굿즈를 보세요</p>
        			<p>
          				<a href="${pageContext.request.contextPath}/main/main.do" class="btn btn-outline-secondary">Harvest Movie Main</a>
        			</p>
      			</div>
    		</div>
  		</section>
  		<div class="album py-4 bg-light">
			<div class="container-fluid">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-8">
					<c:forEach var="product" items="${productList}">
					<div class="col pb-5">
						<div class="card shadow-sm">
							<a href="#" class="">
								<div class="image-block"></div>
								<img class="ratio" style="--bs-aspect-ratio: 100%;" src="${pageContext.request.contextPath}/upload/${product.pd_photo}">
							</a>
						</div>
						<div>
							<a href="#" style="text-decoration: none;">	
								<span style="font-size:13px;color:#000000;">${product.pd_name}</span>
							</a>
							<div class="d-flex justify-content-between align-items-center">
              				 	<div class="btn-group">
                  					<button type="button" class="btn btn-sm btn-outline-secondary">View</button>
                  					<button type="button" class="btn btn-sm btn-outline-secondary">Edit</button>
                				</div>
                			<small class="text-muted">${product.pd_price}원</small>
              				</div>
						</div>
					</div>
					</c:forEach>
				</div>
				<%-- <c:if test="${!empty user_num && user_auth == 3}"> --%>
				<div class="row">
					<input type="button" class="btn btn-secondary my-2" value="상품관리" onclick="location.href='productManagement.do'">
				</div>
				<%--  </c:if> --%>
			</div>
		</div>	
	</div>
</body>
</html>