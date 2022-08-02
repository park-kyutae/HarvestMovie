<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
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

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/event.css" type="text/css">
</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="container col-md-7">
	<br><br><br><br>
    <div class="row">
			
    	<h2>커뮤니티</h2>
    </div>
    <br><br>
    
    <div>
    	<c:if test="${count == 0}">
		<div >
			표시할 게시물이 없습니다.
		</div>
		</c:if>
		<c:if test="${count > 0}">
		<div>
		<table class="table table-hover">
		  <thead>
			<tr style="border-bottom:7px solid #444">
				<th scope="col" width=70px>글번호</th>
				<th scope="col">제목</th>
				<th scope="col" width=70px>작성자</th>
				<th scope="col" width=100px>작성일</th>
				<th scope="col" width=100px>조회</th>
				<!-- <th scope="col" width=70px>추천</th> -->
			</tr>
		   </thead>
		   </tbody>
			<c:forEach var="event" items="${list}">
			<tr>
				<td>${event.event_board_num}</td>
				<td><a href="eventDetail.do?event_board_num=${event.event_board_num}">${event.event_title}</a></td>
				<td>${event.id}</td>
				<td>${event.event_reg_date}</td>
				<td>${event.event_hit}</td>
				<!-- <td>숫자</td> -->
			</tr>
			</c:forEach>
			</tbody>
		</table>
		</div>
		</c:if>
    </div>
    <div class="row">
        <div class="col-xs-4">
        	<div >
		    <c:if test="${!empty user_num}">
			<input type="button" value="글쓰기" class="btn btn-dark btn-sm"
			   onclick="location.href='eventWriteForm.do'">
		 	</c:if>  
			
			<input type="button" value="홈으로" class="btn btn-dark btn-sm"
			 onclick="location.href='${pageContext.request.contextPath}/main/main.do'">        
			 <div class="row-end float-end">  
        
        <form action="eventList.do" method="get" class="contentBox">
        
					<select name="keyfield">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">내용</option>
					</select>
					
					<input type="search" size="16" 
					  name="keyword" value="${param.keyword}">
					 
					<input type="submit" class="btn btn-dark btn-sm" value="검색">
		</form>
        
    </div> 
		</div>
        </div>
      </div>
      
    <c:if test="${count > 0}">
    <div class="text-center">
				${page}
	</div>
	</c:if>
    
</div>

<%-- <div >
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div >
		<h2>이벤트 게시판</h2>
		<form action="eventList.do" method="get">
			<ul >
				<li>
					<select name="keyfield">
						<option value="1">제목</option>
						<option value="2">작성자</option>
						<option value="3">내용</option>
					</select>
				</li>
				<li>
					<input type="search" size="16" 
					  name="keyword" value="${param.keyword}">
				</li>
				<li>
					<input type="submit" value="검색">
				</li>
			</ul>
		</form>
		<div >
		    <c:if test="${!empty user_num}">
			<input type="button" value="글쓰기"
			   onclick="location.href='eventWriteForm.do'">
		 	</c:if>  
			<input type="button" value="목록"
			       onclick="location.href='eventList.do'"> 
			<input type="button" value="홈으로"
			 onclick="location.href='${pageContext.request.contextPath}/main/main.do'">         
		</div>
		<c:if test="${count == 0}">
		<div >
			표시할 게시물이 없습니다.
		</div>
		</c:if>
		<c:if test="${count > 0}">
		<div>
		<table class="table">
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:forEach var="event" items="${list}">
			<tr>
				<td>${event.event_board_num}</td>
				<td><a href="eventDetail.do?event_board_num=${event.event_board_num}">${event.event_title}</a></td>
				<td>${event.id}</td>
				<td>${event.event_reg_date}</td>
				<td>${event.event_hit}</td>
			</tr>
			</c:forEach>
		</table>
		<div class="text-center">
			${page}
		</div>
		</div>
		</c:if>
	</div>
</div> --%>
</body>
</html>









