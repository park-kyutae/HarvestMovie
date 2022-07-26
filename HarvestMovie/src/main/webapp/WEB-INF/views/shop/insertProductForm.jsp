<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>상품추가</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/product.js"></script>
</head>
<body>
	<div>
		<div class="container">
			<div class="py-5 text-center">
				<h2>상품추가</h2>
			</div>
			
			<form action="insertProduct.do" id="insertProduct_form" method="post" enctype="multipart/form-data" >
				<div class="mb-3">
   					<label for="pd_name" class="form-label">상품명</label>
    				<input type="text" class="form-control" id="pd_name" name="pd_name" placeholder="상품명" aria-describedby="nameHelp">
  				</div>
  				<div class="mb-3">
   					<label for="pd_price" class="form-label">상품가격</label>
    				<input type="text" class="form-control" id="pd_price" name="pd_price" placeholder="상품가격" aria-describedby="priceHelp">
  				</div>
  				<div class="mb-3">
   					<label for="pd_quantity" class="form-label">수량</label>
    				<input type="text" class="form-control" id="pd_quantity" name="pd_quantity" placeholder="수량" aria-describedby="quantityHelp">
  				</div>
  				<div class="input-group">
					<span class="input-group-text">상품 소개</span>
					<textarea class="form-control" aria-label="With textarea" name="pd_content" id="pd_content"></textarea>
				</div>
				<div class="mb-3">
					<label for="pd_photo" class="form-label">사진 첨부파일</label>
					<input class="form-control form-control-sm" id="pd_photo" type="file" name="pd_photo" accept="image/gif,image/png,image/jpeg">
				</div>
			
				<div class="d-flex justify-content-end px-1">
					<input type="submit" class="btn btn-secondary mx-2" value="등록">
					<input type="button" class="btn btn-outline-secondary" value="취소" onclick="location.href='productManagement.do'">
				</div>
			</form>
		</div>
	</div>
</body>
</html>