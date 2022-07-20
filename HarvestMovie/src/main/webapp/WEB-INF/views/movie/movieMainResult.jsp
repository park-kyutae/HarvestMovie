<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 'modify'}">
<script>
   alert('메인 영화를 수정 했습니다.');
   location.href = 'movieDetail.do?mv_num=${param.mv_num}';
//TODO 경로 통일
</script>
</c:if>