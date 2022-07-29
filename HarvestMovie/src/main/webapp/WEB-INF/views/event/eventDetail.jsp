<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글상세</title>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/eventBoard.fav.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
    <div class="row 제목">
    <h2>${event.event_title}</h2>
    </div>
    <div class="row 회원 상세정보">
        <div class="프로필 col-md-3">
        <c:if test="${!empty event.photo}">
				<img src="${pageContext.request.contextPath}/upload/${event.photo}" width="40" height="40" class="my-photo">
				</c:if>
				<c:if test="${empty event.photo}">
				<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
				</c:if>
        </div>
        <div class="id, 작성일, 출처 col-md-3">
        	${event.id}<br>
				조회 : ${event.event_hit}
        </div>
    </div>
    <div class="row 첨부파일">
    	<c:if test="${!empty event.event_filename}">
		<div>
			<img src="${pageContext.request.contextPath}/upload/${event.event_filename}">
		</div>
		</c:if>
    </div>
    <div class="row 본문">
    	<p>
			${event.event_content}
		</p>
    </div>
    <div class="row 하단바">
        <div class="글쓰기 수정 col-md-2"></div>
        <div class="목록 이전글 다음글 col-md-3"></div>
    </div>
    <div class="row 페이지"></div>
    <div class="row 댓글"></div>
</div>

<!-- --------------------------------------------------------------------- -->

<div>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<div>
		<h2>${event.event_title}</h2>
		<ul>
			<li>
				<c:if test="${!empty event.photo}">
				<img src="${pageContext.request.contextPath}/upload/${event.photo}" width="40" height="40" class="my-photo">
				</c:if>
				<c:if test="${empty event.photo}">
				<img src="${pageContext.request.contextPath}/images/face.png" width="40" height="40" class="my-photo">
				</c:if>
			</li>
			<li>
				${event.id}<br>
				조회 : ${event.event_hit}
			</li>
		</ul>
		<hr size="1" noshade="noshade" width="100%">
		<c:if test="${!empty event.event_filename}">
		<div>
			<img src="${pageContext.request.contextPath}/upload/${event.event_filename}">
		</div>
		</c:if>
		<p>
			${event.event_content}
		</p>
		<hr size="1" noshade="noshade" width="100%">
		<ul>
			<li>
				<%-- 좋아요 --%>
				<img id="output_fav" src="${pageContext.request.contextPath }/images/likes.png" width="50">
				좋아요
				<span id="output_fcount"></span>
			</li>
			<li>
				<c:if test="${!empty event.event_modify_date }">
				최근 수정일 : ${event.event_modify_date }
				</c:if>
				작성일 : ${event.event_reg_date }
				<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
				<c:if test="${user_num == event.mem_num }">
					<input type="button" value="수정" onclick="location.href='eventUpdateForm.do?event_board_num=${event.event_board_num}'">
					<input type="button" value="삭제" id="delete_btn">
					<script type="text/javascript">
						let delete_btn = document.getElementById('delete_btn');
						//이벤트 연결
						delete_btn.onclick=function(){
							let choice=confirm('삭제하시겠습니까?');
							if(choice){
								location.replace('eventDelete.do?event_board_num=${event.event_board_num}');
							}
						};
					</script>
				</c:if>
			</li>	
		</ul>
		<!-- 댓글 시작 -->
		<div id="reply_div">
			<span>댓글 달기</span>
			<form id="re_form">
				<input type="hidden" name="event_board_num" value="${event.event_board_num}" id="event_board_num">
			</form>
		</div>
		<!-- 댓글 끝 -->
	</div>
</div>
</body>
</html>





