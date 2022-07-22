<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 'modify_main'}">
<script>
   alert('메인 영화를 수정 했습니다.');
   location.href = 'movieDetail.do?mv_num=${param.mv_num}';
//TODO 경로 통일
</script>

    </c:if>
<c:if test="${result == 'write'}">

<script type="text/javascript">
    alert('영화를 추가했습니다.');
    //추후 수정
    location.href='movieMain.do'
</script>
    </c:if>