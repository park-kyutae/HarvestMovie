<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${result == 'modify_main'}">
    <script>
        alert('메인 영화를 수정 했습니다.');
        location.href = '/movie/movieDetail.do?mv_num=${param.mv_num}';
        //TODO 경로 통일
    </script>

</c:if>
<c:if test="${result == 'write'}">

    <script type="text/javascript">
        alert('영화를 추가했습니다.');
        //추후 수정
        location.href = '/main/main.do'
    </script>
</c:if>
<c:if test="${result == 'delete'}">

    <script type="text/javascript">
        alert('영화를 삭제했습니다.');
        //추후 수정
        location.href = '/main/main.do'
    </script>
</c:if>
<c:if test="${result == 'try_login'}">

    <script type="text/javascript">
        alert('로그인이 필요합니다.');
        //추후 수정
        history.go(-1);
    </script>
</c:if>
<c:if test="${result == 'wrong_id'}">

    <script type="text/javascript">
        alert('아이디가 잘못되었습니다.');
        //추후 수정
        history.go(-1);
    </script>
</c:if>
<c:if test="${result == 'modify'}">

    <script type="text/javascript">
        alert('영화를 수정하였습니다.');
        location.href = '/main/main.do'
    </script>
</c:if>