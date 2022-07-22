<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/news.js"></script>
</head>
<body>
<div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<h2>영화 뉴스 작성</h2>
		<form id="write_form" action="newsWrite.do" 
		   method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label for="news_title">제목</label>
					<input type="text" name="news_title" 
					      id="news_title" maxlength="50">
				</li>
				<li>
					<label for="news_content">내용</label>
					<textarea rows="5" cols="30" name="news_content"
					     id="news_content"></textarea>
				</li>
				<li>
					<label for="news_photo">기사 이미지</label>
					<input type="file" name="news_photo" 
					 id="news_photo" 
					 accept="image/gif,image/png,image/jpeg">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="목록" 
				             onclick="location.href='newslist.do'">
			</div>
		</form>
	</div>
</div>
</body>
</html>






