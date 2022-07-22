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
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css"> --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/news.js"></script>
</head>
<body>

	<div class="container">

		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9">영화 뉴스</div>
		</div>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9 d-flex justify-content-end">최신글 조회수</div>
		</div>
		<div class="row  d-flex justify-content-center">
			<div class="col col-sm-2">
				<img src="${pageContext.request.contextPath}/images/face.png"
					width="100">
			</div>
			<div class="col col-sm-7">
				<div class="row ">
					<div class="col ">제목</div>
				</div>
				<div class="row ">
					<div class="col ">날짜</div>
				</div>
			</div>
			
			
			<form id="search_form" action="newslist.do" 
		                                    method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">내용</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" 
					  name="keyword" id="keyword"
					  value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="검색">
				</li>
			</ul>
		</form>

		</div>
</body>
</html>
<%-- <div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<h2>영화 뉴스</h2>
		
		<div align="right">
		최신글 조회수
		</div>
		<c:if test="${count == 0}">
		<div class="result-display">
			표시할 게시물이 없습니다.
		</div>
		</c:if>
		
		<table>
			<tr>
				<td ><img src="${pageContext.request.contextPath}/images/face.png" width="100" >${news.new_photo}</td>
				<td align="left">
				<a href="${pageContext.request.contextPath}/newsdetail.do?news_num=${news.news_num}">제목${news.new_title}</a>
				<br>
				작성일${news.news_date}
				</td>
				<td align="center">사진${news.new_like}</td>
			</tr>
			<tr>
				<td><img src="${pageContext.request.contextPath}/images/face.png" width="100px">${news.new_photo}</td>
				<td align="left">
				제목${news.new_title}
				<br>
				작성일${news.news_date}
				</td>
				<td align="center">사진${news.new_like}</td>
			</tr>
			<tr>
				<td><img src="${pageContext.request.contextPath}/images/face.png" width="100px">${news.new_photo}</td>
				<td align="left">
				제목${news.new_title}
				<br>
				작성일${news.news_date}
				</td>
				<td align="center">사진${news.new_like}</td>
			</tr>
		</table>
		<div class="align-center">
			${page}
		</div>
		<div class="list-space align-right">
		   <!-- <c:if test="${!empty user_num}"> --> 
			
			 <!-- </c:if>  -->  
			 <input type="button" value="글쓰기"
			   onclick="location.href='newsWriteForm.do'">
			<input type="button" value="목록"
			       onclick="location.href='newslist.do'"> 
			<input type="button" value="홈으로"
			 onclick="location.href='${pageContext.request.contextPath}/main/main.do'">         
		</div>
		<form id="search_form" action="newslist.do" 
		                                    method="get">
			<ul class="search">
				<li>
					<select name="keyfield">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">내용</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" 
					  name="keyword" id="keyword"
					  value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="검색">
				</li>
			</ul>
		</form>
	</div>
</div> --%>







