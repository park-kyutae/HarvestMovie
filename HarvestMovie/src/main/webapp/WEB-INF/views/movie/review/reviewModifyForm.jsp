<%--
  Created by IntelliJ IDEA.
  User: seongwoncha
  Date: 2022/07/20
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>리뷰 수정</title>
</head>
<body>
<form action="reviewModifyAction.do?mv_num=${param.mv_num}" method="post">
    <textarea name="review_modify"
              id="review_modify" cols="30"
              rows="10">${reviewVO.review_message}</textarea>
    <input type="submit" value="완료">
    <input type="button" value="취소" onclick="history.go(-1)">
</form>
</body>
</html>
