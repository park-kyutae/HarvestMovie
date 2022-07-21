<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 뉴스</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/news.js"></script>
</head>
<body>
<div class="page-main">
		<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<div class="content-main">
				<h2>영화 뉴스</h2>
				
				<c:if test="${count == 0}">
						<div class="result-display">
								표시할 게시물이 없습니다.
						</div>
				</c:if>
				<c:if test="${count > 0}">
						<table>
								<tr>
										<th>글번호</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
								</tr>
								<c:forEach var="board" items="${list}">
								<tr>
										<td>${board.news_num}</td>
										<td><a href="detail.do?news_num=${board.news_num}">${board.news_title}</a></td>
										<td>${board.news_id}</td>
										<td>${board.news_date}</td>
										<td>${board.news_hit}</td>
								</tr>
								</c:forEach>
						</table>
						<div class="align-center">
								${page}
						</div>
				</c:if>
				<div class="list-space align-right">
						<c:if test="${!empty user_num }">
						<input type="button" value="글쓰기" onclick="location.href='newsWriteForm.do'">
						</c:if>
						<input type="button" value="목록" onclick="location.href='newslist.do'">
						<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
				</div>
		</div>
</div>
</body>
</html>