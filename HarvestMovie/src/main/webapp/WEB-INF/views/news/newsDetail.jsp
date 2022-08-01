<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 뉴스 상세</title>
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
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/news.fav.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/news.reply.js"></script>
<style type="text/css">
#news_photo {
	max-width: 100%;
	height: auto;
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9">
				<%-- 메인 틀 --%>
				<div class="row d-flex justify-content-left">
					<div class="col col-sm d-flex justify-content-left">
						<h3 style="margin-top: 40px;">${news.news_title}</h3>
					</div>
				</div>
				<div class="row d-flex justify-content-left">
					<div class="col col-sm d-flex justify-content-end">
						${news.id}</div>
				</div>
				<div class="row d-flex justify-content-left">
					<div class="col col-sm d-flex justify-content-end">
						<c:if test="${!empty news.news_modifydate}">
					최근 수정일 : ${news.news_modifydate}
					</c:if>
						<c:if test="${empty news.news_modifydate}">
					작성일 : ${news.news_date}
					</c:if>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col col-sm d-flex justify-content-end">조회수 :
						${news.news_hit}</div>
				</div>
				<hr size="1" noshade="noshade" width="100%">
			</div>
			<div class="row d-flex justify-content-center">
				<div class="col col-sm-9">
					<div class="row d-flex justify-content-center">
						<div class="col col-sm my-2 d-flex justify-content-end">

							<c:if test="${user_num == news.mem_num}">
								<input type="button" value="수정"
									class="btn btn-primary btn-sm mx-1"
									onclick="location.href='newsUpdateForm.do?news_num=${news.news_num}'">
								<input type="button" value="삭제" id="delete_btn"
									class="btn btn-danger btn-sm mx-1">
								<script type="text/javascript">
									let delete_btn = document
											.getElementById('delete_btn');
									//이벤트 연결
									delete_btn.onclick = function() {
										let choice = confirm('삭제하시겠습니까?');
										if (choice) {
											location
													.replace('newsDelete.do?news_num=${news.news_num}');
										}
									};
								</script>
							</c:if>
							<input type="button" value="목록"
									onclick="location.href='newslist.do'"
									class="btn btn-dark btn-sm mx-1">
						</div>
					</div>
					<div class="row d-flex justify-content-center">
						<div class="col col-sm my-2 d-flex justify-content-center">
							<c:if test="${empty news.news_photo}">
								<div class="col col-sm d-flex justify-content-center" id="news_photo_main">
								</div>
							</c:if>
							<c:if test="${!empty news.news_photo}">
								<div class="col col-sm d-flex justify-content-center" id="news_photo_main">
									<img
										src="${pageContext.request.contextPath}/upload/${news.news_photo}"
										class="rounded img-fluid" id="news_photo">
								</div>
							</c:if>
						</div>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col col-sm-9 my-3 d-flex justify-content-center">
						<p>${news.news_content}</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9 my-2">
				<i class="bi bi-suit-heart output_fav"></i>
				<img id="output_fav"
					src="${pageContext.request.contextPath}/images/heart1.svg"
					width="30"> 좋아요 <span id="output_fcount"></span>
			</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9 card bg-light">
				<!-- 댓글 시작 -->
				<div class="col col-sm d-flex justify-content-center my-2">
				<div id="reply_div">
					<div class="col my-2">
					<span class="re-title">댓글 달기</span>
					</div>
					<form id="re_form" class="mb-4">
						<input type="hidden" name="news_num" value="${news.news_num}"
							id="news_num">
						<textarea rows="3" cols="100" name="news_re_content"
							id="news_re_content" style="resize: none;" class="rep-content form-control"
							<c:if test="${empty user_num}">disabled="disabled"</c:if>><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>
						<c:if test="${!empty user_num}">
							<div id="re_first">
								<span class="letter-count">300/300</span>
							</div>
							<div id="re_second" class="align-right">
								<input type="submit" value="등록" class="btn btn-primary btn-sm">
							</div>
						</c:if>
					</form>
				</div>
				</div>
				<!-- 댓글 목록 출력 시작 -->
				<div id="output"></div>
				<div class="paging-button" style="display: none;">
					<input type="button" value="다음글 보기">
				</div>
				<div id="loading" style="display: none;">
					<img
						src="${pageContext.request.contextPath}/images/ajax-loader.gif">
				</div>
				<!-- 댓글 목록 출력 끝 -->
				<!-- 댓글 끝 -->
			</div>
		</div>
	</div>
	<%-- 메인 틀 끝--%>
	<%-- container 끝--%>
</body>
</html>
