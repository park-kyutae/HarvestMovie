<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 뉴스 글쓰기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
	crossorigin="anonymous"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/news.js"></script>
</head>
<body>
<div class="container">
	<div class="row d-flex justify-content-center">
		<div class="col col-sm-12">
			<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		</div>
	</div>
	 <br>
	 <div class="row d-flex justify-content-center">
	 	<div class="col col-sm-12 ">
	 		<h4 class="mb-3">영화 뉴스 글쓰기</h4>
	 		<div class="col col-sm-12 d-flex justify-content-center">
	 		<div class="row d-flex justify-content-center">
					<br>
				</div>
	 			<form class="row needs-validation col-sm-9" novalidate method="post" action="newsWrite.do" enctype="multipart/form-data">
	 		<div class="col d-flex justify-content-center">
	 					<label for="news_title" class="form-label col-sm-1">뉴스 제목</label>
	 					<input type="text" name="news_title" 
					      id="news_title" maxlength="50" class="form-control"  required>
			     		 <div class="invalid-feedback">
                          뉴스 제목을 입력해 주세요.
                  		</div>
	 		</div>
	 		<div class="row d-flex justify-content-center">
					<br>
				</div>
	 		<div class="d-flex justify-content-left">
	 			<label for="news_photo" class="form-label col-sm-1">뉴스 사진</label>
	 			<c:if test="${empty news.news_photo}">
					<div class="news_photo">
						<img src="${pageContext.request.contextPath}/images/img_not_exist.jpg" width="200px" class="pic">
					</div>
				</c:if>
	 			<c:if test="${!empty news.news_photo}">
					<div class="news_photo">
						<img src="${pageContext.request.contextPath}/upload/${news.news_photo}" width="200px" class="pic">
					</div>
				</c:if>
				<div class="row d-flex justify-content-center">
					<br>
				</div>
	 		</div>
	 		<div class="d-flex justify-content-left">
	 		<div class="row mx-5">
                  	<div class="col mx-2">
                  	 <input type="file" accept="image/gif,image/jpeg" name="news_photo"
                  class="form-control form-control-sm" required id="up_photo">
                  <div class="invalid-feedback">
                          사진을 첨부해 주세요.
                  </div>
                  	</div>
                  </div>
	 		</div>
	 		<div class="row d-flex justify-content-center">
					<br>
				</div>
	 		<div class="	d-flex justify-content-center">
	 			<label for="news_content" class="form-label col-sm-1">뉴스 내용</label>
	 			<textarea rows="5" cols="30" name="news_content"
					     id="news_content" class="form-control" aria-label="With textarea" required></textarea>
			      <div class="invalid-feedback">
                          뉴스 내용을 입력해 주세요.
                  </div>
	 		</div>
	 	</form>
	 		</div>
	 </div>
	<div class="row">
		<div class="col d-flex justify-content-end">
			<form id="write_form" action="newsWrite.do" 
		   method="post" enctype="multipart/form-data">
			<div class="align-center">
				<input type="submit" value="등록" class="btn btn-secondary btn-sm mx-2">
				<input type="button" value="목록" 
				             onclick="location.href='newslist.do'" class="btn btn-outline-secondary btn-sm">
			</div>
		</form>
		</div>
	 	</div>
	</div>
</div>
</body>
</html>






