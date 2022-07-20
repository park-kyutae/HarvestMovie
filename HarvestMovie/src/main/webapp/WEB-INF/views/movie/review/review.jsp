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
<%--TODO 평론가 인증 마크 추가--%>
-----내리뷰----<br>
멤버이름 <br>
${myReviewVO.mem_id}<br>
리뷰 메세지 <br>
${myReviewVO.review_message} <br>

<c:forEach var="reviewVO" items="${reviewVOList}">
    멤버이름 <br>
    ${reviewVO.mem_id}<br>
    리뷰 메세지 <br>
    ${reviewVO.review_message} <br>
</c:forEach>
리뷰쓰기
<input type="button" onclick="location.href='/movie/review/reviewWriteForm.do?mv_num=${param.mv_num}'" value="리뷰 작성">

<%--추후 인증 추가--%>
<%--추후 내 리뷰 있는지 체크--%>
<input type="button" value="내 리뷰 수정하기" onclick="location.href='reviewModifyForm.do?mv_num=${param.mv_num}'">
<input type="button" value="내 리뷰 삭제하기" onclick="location.href='reviewDelete.do?mv_num=${param.mv_num}'">
</body>
</html>
