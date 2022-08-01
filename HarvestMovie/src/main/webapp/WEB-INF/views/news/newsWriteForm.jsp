<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/news.js"></script>
<style type="text/css">
#label_text {
	font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="row d-flex justify-content-center">
				<div class="col col-sm my-5">
					<h4>영화 뉴스 작성</h4>
				</div>
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col col-sm-9 my-4">
					<form class="row needs-validation" novalidate method="post"
						action="newsWrite.do" enctype="multipart/form-data">
						<!-- 뉴스 제목 시작-->
						<div class="row my-2 d-flex justify-content-center">
							<div class="col col-sm ">
								<label for="news_title" class="form-label col-sm"
									id="label_text"> 뉴스 제목 </label> <input type="text"
									name="news_title" id="news_title" maxlength="50"
									class="form-control col-sm-7" placeholder="뉴스 제목 입력"
									onfocus="this.placeholder=''" onblur="this.placeholder='뉴스 제목 입력'" required>
								<div class="invalid-feedback">뉴스 제목을 입력해 주세요.</div>
							</div>
						</div>
						<!-- 뉴스 제목 끝 -->

						<!-- 뉴스 사진 시작-->
						<div class="row my-2 d-flex justify-content-center">
							<div class="col my-2 col-sm">
								<label for="news_photo" class="form-label col-sm-2"
									id="label_text"> 뉴스 사진 </label>
								<div class="row my-2 d-flex justify-content-center">
									<div class="col my-2 col-sm">
										<c:if test="${empty news.news_photo}">
											<div class="pic">
												<img
													src="${pageContext.request.contextPath}/images/blank.png"
													width="200px" height="200px" class="pic img-fluid"
													id="my-photo">
											</div>
										</c:if>
										<c:if test="${!empty news.news_photo}">
											<div class="pic">
												<img
													src="${pageContext.request.contextPath}/upload/${news.news_photo}"
													width="200px" height="200px" class="pic img-fluid"
													id="my-photo">
											</div>
										</c:if>
									</div>
								</div>
								<div class="row my-2 d-flex justify-content-center">
									<div class="col my-2 col-sm">
										<input type="file" accept="image/gif,image/jpeg"
											name="news_photo" class="form-control form-control-sm "
											required id="up_photo">
										<div class="invalid-feedback">사진을 첨부해 주세요.</div>
									</div>
								</div>
								<!-- 뉴스 사진 끝-->
								<!-- 뉴스 내용 시작-->
								<div class="row d-flex justify-content-center">
									<div class="col col-sm">
										<div class="row">
											<div class="col col-sm">
												<label for="news_content" class="form-label col-sm"
													id="label_text">뉴스 내용</label>
											</div>
										</div>
										<div class="row">
											<div class="col col-sm">
												<textarea rows="8" cols="30" name="news_content"
													id="news_content" class="form-control"
													aria-label="with textarea" placeholder="뉴스 내용 입력"
									onfocus="this.placeholder=''" onblur="this.placeholder='뉴스 내용 입력'" required></textarea>
												<div class="invalid-feedback">뉴스 내용을 입력해 주세요.</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 뉴스 내용 끝-->
							</div>
						</div>
						<div class="row">
							<div class="col d-flex justify-content-end">
								<div class="align-center">
									<input type="submit" value="등록"
										class="btn btn-primary btn-sm mx-2"> <input
										type="button" value="취소" onclick="location.href='newslist.do'"
										class="btn btn-dark btn-sm">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






