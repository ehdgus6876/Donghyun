<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%> <%-- 에러페이지내용 --%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<body>
<div align="center">
<H2>로그인 에러</H2>
<HR>
<table cellpadding=5 width=400>
<tr width=100% bgcolor="pink"><td>
페이지 처리중 에러가 발생 했습니다.<BR>
관리자에게 문의해 주세요..<BR>
빠른시일내 복구하겠습니다.
<HR>
에러내용 : <%= exception%> <%-- 에러내용 출력 --%>
<HR>

</td>
</tr>
</table>
</div>
</body>
</HTML>