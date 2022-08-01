<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>상품수정</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div>
		<div class="container">
			<div class="py-5 text-center">
				<h2>상품수정</h2>
			</div>
			
			<form action="productUpdate.do" class="needs-validation" id="productUpdate_form" method="post" enctype="multipart/form-data">
				<input type="hidden" name="pd_num" value="${product.pd_num}">
				<div class="mb-3">
   					<label for="pd_name" class="form-label">상품명</label>
    				<input type="text" class="form-control" id="pd_name" name="pd_name" value="${product.pd_name}" aria-describedby="nameHelp" required>
    				<div class="valid-feedback">
						Looks good!
					</div>
  				</div>
  				<div class="mb-3">
   					<label for="pd_price" class="form-label">상품가격</label>
    				<input type="text" class="form-control" id="pd_price" name="pd_price" value="${product.pd_price}" aria-describedby="priceHelp">
  				</div>
  				<div class="mb-3">
   					<label for="pd_quantity" class="form-label">수량</label>
    				<input type="text" class="form-control" id="pd_quantity" name="pd_quantity" value="${product.pd_quantity}" aria-describedby="quantityHelp">
  				</div>
  				<div class="input-group">
					<span class="input-group-text">상품 소개</span>
					<textarea class="form-control" aria-label="With textarea" name="pd_content" id="pd_content">${product.pd_content}</textarea>
				</div>
				<br>
				<div class="mb-3">
					<label for="pd_photo" class="form-label">사진 첨부파일</label>
					<input class="form-control form-control-sm pic-btn" id="pd_photo" type="file" name="pd_photo" accept="image/gif,image/png,image/jpeg" required>
					<c:if test="${!empty product.pd_photo}">
					<span id="file_detail">
						(${product.pd_photo})파일이 등록되어 있습니다. 
					</span>
					<script type="text/javascript">
					$(function(){
						//이벤트 연결
						if($('#pd_photo').on('click',function(){
							$('#file_detail').hide();
						})){
						}
						
//								$('#pd_photo').click(function(){
//						});
					});
					</script>
					</c:if>
					
				</div>
			
				<div class="d-flex justify-content-end px-1">
					<input type="submit" class="btn btn-secondary mx-2" value="수정">
					<input type="button" class="btn btn-outline-secondary" value="취소" onclick="window.history.back()">
				</div>
			</form>
		</div>
	</div>
</body>
</html>