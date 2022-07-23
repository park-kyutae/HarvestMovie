<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 'write'}">
    <script>
        alert('리뷰를 작성했습니다.');
        location.href = '/movie/review/review.do?mv_num=${param.mv_num}';

    </script>
</c:if>
<c:if test="${result == 'modify'}">
    <script>
        alert('수정을 완료했습니다.');
        location.href = '/movie/review/review.do?mv_num=${param.mv_num}';
    </script>
</c:if>
<c:if test="${result == 'duplicated'}">
    <script>
        alert('리뷰를 이미 작성하셨습니다.');
        location.href = '/movie/review/review.do?mv_num=${param.mv_num}';
    </script>
</c:if>
<c:if test="${result == 'delete'}">
    <script>
        alert('리뷰를 삭제했습니다.');
        location.href = '/movie/review/review.do?mv_num=${param.mv_num}';
    </script>
</c:if>
<c:if test="${result == 'not_exist'}">
    <script>
        alert('리뷰가 존재하지 않습니다.');
        location.href = '/movie/review/review.do?mv_num=${param.mv_num}';
    </script>
</c:if>