<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div module="Attend_calendarPackage">
    <!--@css(/css/module/attend/calendarPackage.css)-->
    <div module="attend_calendarhead">
        <!--
            $login_page = /member/login.html
        -->
        <div class="inner">
            <p class="date">{$year}.{$month}</p>
            <p class="prev"><a href="{$prev_month}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_prev.gif" alt="이전 달" /></a></p>
            <p class="next"><a href="{$next_month}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_next.gif" alt="다음 달" /></a></p>
        </div>
    </div>
    <table module="attend_calendar" border="1" summary="">
        <!--
            $login_page = /member/login.html
        -->
        <caption>출석이벤트 달력</caption>
        <colgroup>
            <col style="width:15%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:14%;" />
            <col style="width:15%;" />
        </colgroup>
        <thead>
            <tr>
                <th scope="col" class="sun"><span>SUN</span></th>
                <th scope="col"><span>MON</span></th>
                <th scope="col"><span>TUE</span></th>
                <th scope="col"><span>WED</span></th>
                <th scope="col"><span>THU</span></th>
                <th scope="col"><span>FRI</span></th>
                <th scope="col" class="sat"><span>SAT</span></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><p>{$sun}</p></td>
                <td><p>{$mon}</p></td>
                <td><p>{$the}</p></td>
                <td><p>{$wed}</p></td>
                <td><p>{$thu}</p></td>
                <td><p>{$fri}</p></td>
                <td><p>{$sat}</p></td>
            </tr>
            <tr>
                <td><p>{$sun}</p></td>
                <td><p>{$mon}</p></td>
                <td><p>{$the}</p></td>
                <td><p>{$wed}</p></td>
                <td><p>{$thu}</p></td>
                <td><p>{$fri}</p></td>
                <td><p>{$sat}</p></td>
            </tr>
        </tbody>
    </table>
    <div module="attend_button">
        <!--
            $login_page = /member/login.html
        -->
        <a href="#none" onclick="{$action_attend}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_attend.gif" alt="출석체크" /></a>
        <div class="{$attendSecurityLayer}" style="display:none; left:300px; top:700px; text-align:left;">
            <h3>스팸 출석체크 방지 문자 입력</h3>
            <div class="content">
                <fieldset>
                    <legend>보안문자 입력</legend>
                    <p class="form">
                        <img src="{$secure_img}" alt="보안문자" />
                        {$form.secure_text}
                    </p>
                    <p class="description"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/board/ico_warning.gif" alt="" /> 왼쪽의 문자를 공백없이 입력하세요.(대소문자구분)</p>
                </fieldset>
            </div>
            <div class="btnArea">
                <a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_security_ok.gif" alt="확인" onclick="{$action_capcha_do}"/></a>
                <a href="#none"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/calendar/btn_security_cancel.gif" alt="취소" onclick="{$action_capcha_undo}" /></a>
            </div>
            <div class="close"><a href="#none" onclick="$('.attendSecurityLayer').hide();"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/common/btn_close.png" alt="닫기" /></a></div>
        </div>
    </div>
</div>
</body>
</html>