<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${check}">
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/member/common/mypage_header.jsp"/>
<div class="container-fluid">
  <div class="row flex-nowrap">
  <jsp:include page="/WEB-INF/views/member/common/mypage_sidebar.jsp"/>
  <h2>회원탈퇴 완료</h2>
		<div class="result-display">
			<div class="align-center">
				회원탈퇴가 완료되었습니다.
				<p>
				<input type="button" value="홈으로"
				   onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
			</div>
		</div>
	</div>
</div>
</body>
</html>
</c:if>
<c:if test="${!check}">
	<script>
		alert('입력한 정보가 정확하지 않습니다!');
		history.go(-1);
	</script>
</c:if>