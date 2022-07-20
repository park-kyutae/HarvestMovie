<%--
  Created by IntelliJ IDEA.
  User: seongwoncha
  Date: 2022/07/15
  Time: 11:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>리뷰</title>
    <script type="text/javascript" ></script>
</head>
<body>

<c:forEach var="reviewVO" items="${reviewVOList}">
    멤버이름
    ${reviewVO.mem_id}
    리뷰 메세지
    ${reviewVO.review_message}
</c:forEach>

<c:if test="${result=='write'}">
    <script>
        alert('리뷰 작성이 완료되었습니다.');
    </script>
</c:if>
<c:if test="${result=='modify'}">
    <script>
        alert('리뷰 수정이 완료되었습니다.');
    </script>
</c:if>
리뷰쓰기
<input type="button" onclick="location.href='/movie/review/reviewWriteForm.do?mv_num=${param.mv_num}'">

<%--추후 인증 추가--%>
<%--추후 내 리뷰 있는지 체크--%>
<input type="button" value="내 리뷰 수정하기" onclick="location.href='reviewModifyFormAction.do?mv_num=${param.mv_num}'">
</body>
</html>
