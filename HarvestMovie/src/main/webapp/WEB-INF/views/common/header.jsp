<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Responsive navbar-->
<nav class="navbar navbar-expand-lg sticky-top navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand"
			href="${pageContext.request.contextPath}/main/main.do">HarvestMovie</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>  
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/board/list.do">게시판</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/shop/shopMain.do">굿즈스토어</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/event/eventList.do">이벤트</a></li>
				<li class="nav-item"><a class="nav-link active"
					href="${pageContext.request.contextPath}/news/newslist.do">뉴스</a></li>
			</ul>
		</div>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
				<c:if test="${!empty user_num && user_auth == 9}">
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/member/adminPage.do">어드민페이지</a>
					</li>
				</c:if>

				<c:if test="${!empty user_num && user_auth >= 2}">
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/member/myPage.do">MY페이지</a>
					</li>
				</c:if>

				<c:if test="${!empty user_num && !empty user_photo}">
					<li class="nav-item"><img
						src="${pageContext.request.contextPath}/upload/${user_photo}"
						width="25" height="25" class="my-photo"></li>
				</c:if>

				<c:if test="${!empty user_num && empty user_photo}">
					<li class="nav-item"><img
						src="${pageContext.request.contextPath}/images/face.png"
						width="25" height="25" class="my-photo"></li>
				</c:if>

				<c:if test="${!empty user_num}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarScrollingDropdown"
						role="button"><span>${user_id}</span></a>
						<ul class="dropdown-menu dropdown-menu-end"	aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
					<li class="nav-item"><a
						class="nav-link active"
						href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
					</li>
				</c:if>
				<c:if test="${empty user_num}">
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/member/registerUserForm.do">회원가입</a>
					</li>
					<li class="nav-item"><a class="nav-link active"
						href="${pageContext.request.contextPath}/member/loginUserForm.do">로그인</a>
					</li>
				</c:if>
			</ul>
		</div>

	</div>
</nav>

<!-- header 끝 -->
<!-- 모바일에서 화면 축소/확대 방지 좀더 네이티브앱 처럼 느껴짐) -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>