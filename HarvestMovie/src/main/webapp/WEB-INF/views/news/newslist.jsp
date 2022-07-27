<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 뉴스</title>
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
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<%--상단바 시작--%>
			<%--상단바 끝--%>

		<%--영화 뉴스 목록 시작--%>
		<%--페이지 제목--%>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9">
				<h2>영화 뉴스</h2>
			</div>
		</div>
		<%--페이지 제목--%>
		<%--최신글--%>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9 d-flex justify-content-end">최신글 조회수</div>
		</div>
		<div class="row d-flex justify-content-center">
			<br>
			</div>
		<%--최신글--%>
		<%--게시판 목록--%>
		<c:if test="${count == 0}">
		<div class="row">
			<div class="col d-flex justify-content-center">
					표시할 게시물이 없습니다.
			</div>
		</div>
		</c:if>
		<div class="row d-flex justify-content-center">
			<br>
		</div>
		<c:if test="${count > 0}">
		<c:forEach var="news" items="${newsList}">
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-2 overflow-visible">
				<img src="${pageContext.request.contextPath}/upload/${news.news_photo}"
					width="100" height="100">
			</div>
			<div class="col col-sm-6">
				<div class="row">
					<div class="col "><a href="newsDetail.do?news_num=${news.news_num}">${news.news_title}</a></div>
				</div>
				<div class="row">
					<div class="col ">${news.news_date}</div>
				</div>
			</div>
			<div class="col col-sm-1">
				<div class="row ">
					<div class="col d-flex justify-content-center">${news.news_hit}</div>
				</div>
			</div>
			</div>
			
			<div class="row d-flex justify-content-center">
			<br>
			</div>
			</c:forEach>
			</c:if>
			
			<%--게시판 목록--%>
			<%--영화 뉴스 목록 끝--%>

			<div class="row d-flex justify-content-center">
				<div class="col d-flex justify-content-center">${page}</div>
			</div>
			<div class="row d-flex justify-content-center">
			<div class="col col-sm-9">
				<div class="col d-flex justify-content-end">
				<c:if test="${!empty user_num}">
					<input type="button" value="작성"
						onclick="location.href='newsWriteForm.do'" class="col col-sm-1 btn btn-secondary btn-sm mx-1">
				</c:if>  
					<input type="button" value="목록"
						onclick="location.href='newslist.do'" class="col col-sm-1 btn btn-secondary btn-sm mx-1">
					<input type="button" value="홈으로"
						onclick="location.href='${pageContext.request.contextPath}/main/main.do'"
						class="col col-sm-1 btn btn-secondary btn-sm mx-1">
				</div>
			</div>
			</div>
			<div class="row d-flex justify-content-center">
			<br>
			</div>
			<div class="row d-flex justify-content-center">
			<div class="col col-sm-9">
				<form id="search_form" action="newslist.do" method="get" class="d-flex justify-content-center">
				<ul class="list-group list-group-horizontal" >
					<li class="list-group-item">
						<select name="keyfield">
							<option value="1">제목</option>
							<option value="2">작성자</option>
							<option value="3">내용</option>
						</select>
					</li>
					<li class="list-group-item"><input type="search" size="16" name="keyword" id="keyword"
						value="${param.keyword}"></li>
					<li class="list-group-item"><input type="submit" value="검색"></li>
				</ul>
			</form>
			</div>
			</div>
		</div>
</body>
</html>