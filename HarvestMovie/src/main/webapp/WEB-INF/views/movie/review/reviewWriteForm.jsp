<%--
  Created by IntelliJ IDEA.
  User: seongwoncha
  Date: 2022/07/18
  Time: 9:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>영화 리뷰 작성</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/review.js"></script>
<body>
<form action="reviewWrite.do?mv_num=${param.mv_num}" method="post">
    <textarea name="review_message" id="review_message" cols="30" rows="10"></textarea>
    <input type="button" id="review_cancel" value="취소">
    <input type="submit" id="review_submit">

</form>
</body>
</html>
