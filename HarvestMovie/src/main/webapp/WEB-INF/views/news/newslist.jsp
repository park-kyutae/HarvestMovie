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
<style type="text/css">
#alink_red {
	text-decoration: none;
	color: red;
	font-weight: bold;
}
#alink {
	text-decoration: none;
	color: black;
	font-weight: bold;
}
#main_link {
	text-decoration: none;
	color: black;
}
#atag {
  text-decoration: none;
  color: black;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 500px;
  height: 30px;
  font-weight: bold;
  display: block;
  font-size: 16pt;
}
#acon {
  text-decoration: none;
  color: gray;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  width: 500px;
  height: 20px;
  font-weight: bold;
  display: block;
  font-size: 10pt;
}
#news_photo_main{
	width:255px;
    height:144px;
    overflow:hidden;
    margin:0;
}

#news_photo{
	width:100%;
    height:100%;
    object-fit:cover;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="container">
		<%--상단바 시작--%>
			<%--상단바 끝--%>

		<%--영화 뉴스 목록 시작--%>
		<%--페이지 제목--%>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9 my-5">
				<h2><a href="${pageContext.request.contextPath}/news/newslist.do" id="main_link">영화 뉴스</a></h2>
			</div>
		</div>
		<%--페이지 제목--%>
		<%--최신글--%>
		<div class="row d-flex justify-content-center">
			<div class="col col-sm-9 my-2 d-flex justify-content-end">
				<div class="col col-sm mx-1 d-flex justify-content-end">
					<a href="${pageContext.request.contextPath}/news/newslist.do" id="alink_red" class="mx-2">최신글</a>
					<a href="${pageContext.request.contextPath}/news/newslistview.do" id="alink">조회수</a>
				</div>
			</div>
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
		<c:if test="${count > 0}">
		<c:forEach var="news" items="${list}">
		<div class="row d-flex justify-content-center my-3">
		<c:if test="${empty news.news_photo}">
			<div class="col col-sm-2" id="news_photo_main">
					<a href="newsDetail.do?news_num=${news.news_num}"><img src="${pageContext.request.contextPath}/images/blank.png" class="rounded img-fluid" id="news_photo"></a>
			</div>
		</c:if>
		<c:if test="${!empty news.news_photo}">
			<div class="col col-sm-2" id="news_photo_main">
					<a href="newsDetail.do?news_num=${news.news_num}"><img src="${pageContext.request.contextPath}/upload/${news.news_photo}" class="rounded img-fluid" id="news_photo"></a>
			</div>
		</c:if>
			<div class="col col-sm-5">
				<div class="row">
					<div class="col col-sm"><a href="newsDetail.do?news_num=${news.news_num}" id="atag">${news.news_title}</a></div>
				</div>
				<div class="row">
					<div class="col text-muted"><a href="newsDetail.do?news_num=${news.news_num}" id="acon">${news.news_content}</a></div>
				</div>
				<div class="row">
					<div class="col" style="font-size: 10pt; color: gray">${news.news_date}</div>
				</div>
			</div>
			<div class="col col-sm-2">
				<div class="row ">
					<div class="col d-flex justify-content-center">
					<img src="${pageContext.request.contextPath}/images/eye-fill.svg" class="mx-2">
					${news.news_hit}
					</div>
				</div>
			</div>
			</div>
			
			</c:forEach>
			</c:if>
			
			<%--게시판 목록--%>
			<%--영화 뉴스 목록 끝--%>

			<div class="row d-flex justify-content-center">
				<div class="col d-flex justify-content-center">${page}</div>
			</div>
			<div class="row d-flex justify-content-center my-3">
				<div class="col col-sm-9">
					<div class="col d-flex justify-content-end">
					<c:if test="${user_num >3}">
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
						<select name="keyfield" class="form-select form-select-sm">
							<option value="1">제목</option>
							<option value="2">작성자</option>
							<option value="3">내용</option>
						</select>
					</li>
					<li class="list-group-item"><input type="search" size="16" name="keyword" id="keyword"
						value="${param.keyword}" class="form-control form-control-sm"></li>
					<li class="list-group-item "><input type="submit" value="검색" class="btn btn-secondary btn-sm"></li>
				</ul>
			</form>
			</div>
			</div>
		</div>
</body>
</html>