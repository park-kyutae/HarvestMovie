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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/eventBoard.reply.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/event.css" type="text/css">

</head>
<body>

 <jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container col-md-7">
<br><br><%-- <br>
<div>
<a style="color:rgb(0,0,0); text-decoration:none;" href="${pageContext.request.contextPath}/event/eventList.do">
<h2 style="font-style: italic">이벤트 게시판</h2>
</a>
</div> --%>
<br><br>
<br>
<!--  <hr size="5" noshade="noshade" width="100%">
 <hr size="5" noshade="noshade" width="100%"> -->
    <div style="text-align:left; font-weight : 900; " class="row 제목">
    <h2>${event.event_title}</h2>
    </div>
   
    <div style="text-align:center" class="row 회원 상세정보 bg-dark text-white bg-opacity-50">
    	
    	 <hr size="5" noshade="noshade" width="100%" color="black">
        <div class="프로필 col-md-3">
        <c:if test="${!empty event.photo}">
				<img src="${pageContext.request.contextPath}/upload/${event.photo}" width="90" height="100" class="my-photo">
				</c:if>
				<c:if test="${empty event.photo}">
				<img src="${pageContext.request.contextPath}/images/face.png" width="90" height="100" class="my-photo">
				</c:if>
        </div>
        <br>
        
        
        <div class="id, 작성일, 출처 col-md-7" style="text-align:left">
        	${event.id}<br>
				<div>조회 : ${event.event_hit}</div>
				<div>작성일 : ${event.event_reg_date }</div>
				<div><c:if test="${!empty event.event_modify_date }">
				최근 수정일 : ${event.event_modify_date }
				</c:if></div>
        </div>
        <div><br></div>
    </div>
    <br><br>
    
    <div class="row 첨부파일">
    	<c:if test="${!empty event.event_filename}">
		<div style="text-align:center">
			<img src="${pageContext.request.contextPath}/upload/${event.event_filename}"  class="rounded" style="max-width: 80%; height: auto;">
		</div>
		</c:if>
    </div>
    <div class="row 본문">
    	<p>
			${event.event_content}
		</p>
    </div>
  	<br>
    <div class="row 하단바">
        <div class="좋아요 글쓰기 수정 col-md-12">
       		    <div>
				<%-- 좋아요 --%>
				<img id="output_fav" src="${pageContext.request.contextPath }/images/hand-thumbs-up.svg" width="25">
				좋아요
				<span id="output_fcount"></span>
		   		</div>
				<%-- 로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능 --%>
				<div class="row-end float-end">
				<c:if test="${user_num == event.mem_num || user_auth == 9}">
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
				</div>
        </div>
        <div class="목록 이전글 다음글 col-md-12" style="text-align:center" >
        <input type="button" value="목록" class="btn btn-dark"
			       onclick="location.href='eventList.do'"> 
		<input type="button" value="홈으로" class="btn btn-dark"
			 onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
        
        </div>
    </div>
    <br>
    
    
   
    <div class="row">
     <hr size="1" noshade="noshade" width="100%">
    	<div class="bg-secondary  bg-opacity-25" >
    	
			<span class="re-title">댓글 달기</span>
			<form id="re_form">
				<input type="hidden" name="event_board_num" value="${event.event_board_num}" id="event_board_num">
				<textarea rows="3"  style="width:100%;" name="event_re_content" 
				  id="event_re_content" class="rep-content"
				  <c:if test="${empty user_num}">disabled="disabled"</c:if>
				  ><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>
				<c:if test="${!empty user_num}">
				<div style="text-align:right" id="re_first">
					<span class="letter-count">300/300</span>
					<div id="re_second" class="align-right">
					<input type="submit" value="전송">
				</div>
				</div>
				</c:if>
				
			</form>
			 <hr size="5" noshade="noshade" width="100%">
			<br>
			
		</div>
		
		
		
		<!-- 댓글 목록 출력 시작 -->
	
		<div class="bg-secondary  bg-opacity-25 col-md-12 text-center" id="output"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</div>
		<!-- 댓글 목록 출력 끝 -->
		<!-- 댓글 끝 -->
    
    </div>
    
    <div>
    <br><br>
    </div>
    
</div>




<!-- --------------------------------------------------------------------- -->
<%-- 
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div>
	
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
				좋아요
				<img id="output_fav" src="${pageContext.request.contextPath }/images/hand-thumbs-up.svg" width="50">
				좋아요
				<span id="output_fcount"></span>
			</li>
			<li>
				<c:if test="${!empty event.event_modify_date }">
				최근 수정일 : ${event.event_modify_date }
				</c:if>
				작성일 : ${event.event_reg_date }
				로그인한 회원번호와 작성자 회원번호가 일치해야 수정, 삭제 가능
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
			<span class="re-title">댓글 달기</span>
			<form id="re_form">
				<input type="hidden" name="event_board_num" value="${event.event_board_num}" id="event_board_num">
				<textarea rows="3" cols="50" name="event_re_content" 
				  id="re_content" class="rep-content"
				  <c:if test="${empty user_num}">disabled="disabled"</c:if>
				  ><c:if test="${empty user_num}">로그인해야 작성할 수 있습니다.</c:if></textarea>
				<c:if test="${!empty user_num}">
				<div id="re_first">
					<span class="letter-count">300/300</span>
				</div>
				<div id="re_second" class="align-right">
					<input type="submit" value="전송">
				</div>
				</c:if>
			</form>
		</div>
		<!-- 댓글 목록 출력 시작 -->
		<div id="output"></div>
		<div class="paging-button" style="display:none;">
			<input type="button" value="다음글 보기">
		</div>
		<div id="loading" style="display:none;">
			<img src="${pageContext.request.contextPath}/images/ajax-loader.gif">
		</div>
		<!-- 댓글 목록 출력 끝 -->
		<!-- 댓글 끝 -->
	</div>
</div> --%>
</body>
</html>





