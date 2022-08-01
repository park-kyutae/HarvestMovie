<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 글쓰기</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/eventBoard.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
    <div class="row 게시판 만들기">
   	 <h2>이벤트 게시판 글쓰기</h2>
    </div>
    <form id="write_form" action="eventWrite.do" 
		   method="post" enctype="multipart/form-data">
    <div class="row 제목">
				<div>
					<label for="event_title" class="form-label">제목</label>
					<input class="form-control" placeholder="제목을 입력하세요."
						type="text" name="event_title" 
					      id="event_title" maxlength="50">
				</div>
				<div>
					<label for="event_filename" class="form-label">파일</label>
					<input type="file" name="event_filename" 
					 id="event_filename" class="form-control"
					 accept="image/gif,image/png,image/jpeg">
				</div>
				<br>
				<div>
					<label for="event_content" class="form-label">내용</label>
					<textarea class="form-control" rows="5" 
						placeholder="내용을 입력하세요."
						name="event_content"
					     id="event_content"></textarea>
				</div>
				
			
			<div style="text-align:right">
				<br><br>
				<input type="submit" value="등록">
				<input type="button" value="목록" 
				             onclick="location.href='eventList.do'">
			</div>
		
    </div>
    </form>

</div>




<!-- ---------------------------------------------------- -->



<%-- <div class="page-main">
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div class="content-main">
		<h2>게시판 글쓰기</h2>
		<form id="write_form" action="eventWrite.do" 
		   method="post" enctype="multipart/form-data">
			<ul>
				<li>
					<label for="event_title">제목</label>
					<input type="text" name="event_title" 
					      id="event_title" maxlength="50">
				</li>
				<li>
					<label for="event_content">내용</label>
					<textarea rows="5" cols="30" name="event_content"
					     id="event_content"></textarea>
				</li>
				<li>
					<label for="event_filename">파일</label>
					<input type="file" name="event_filename" 
					 id="event_filename" 
					 accept="image/gif,image/png,image/jpeg">
				</li>
			</ul>
			<div class="align-center">
				<input type="submit" value="등록">
				<input type="button" value="목록" 
				             onclick="location.href='eventList.do'">
			</div>
		</form>
	</div>
</div> --%>


</body>
</html>






