
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
    alert('영화를 추가했습니다.');
    //추후 수정
    location.href='${pageContext.request.contextPath}/main/movieMain.do'
</script>