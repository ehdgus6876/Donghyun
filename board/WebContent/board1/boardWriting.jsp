<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="java.util.Date, java.text.*"%>
<!DOCTYPE HTML>
<html>
<head> <%-- 게시글 작성 화면 페이지 --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 작성</title>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" /> <%-- 게시판 디자인 board.css --%>
<link href='http://fonts.googleapis.com/css?family=Oleo+Script' rel='stylesheet' type='text/css'>
</head>
<body>
<div align="center">
<H2><img src="img//board1.png" width=50% height=90> </H2>
<HR>
[<a href=boardControl.jsp?action=list>목록으로</a>] <P> <%-- 목록으로 가는 링크 --%>
<form name=form1 method=post action=boardControl.jsp> <%-- 입력받은 값을 boardControl.jsp로 넘김 --%>
<input type=hidden name="action" value="insert"> <%-- action파라미터는 insert값을 가지고 넘김 --%>
<table border="1">
  <tr>
    <th>제 목</th>
    <td><input type="text" name="title" maxlength="100"></td>
  </tr>
  <tr>
    <th>내 용</th>
    <td><textarea name="contents" rows="5" cols="40"></textarea></td>
  </tr>  
  <tr>
    <td colspan=2 align=center><input type=submit value="작성"><input type=reset value="취소"></td>
</tr>
</table>
<%Date now = new Date(); //날짜를 위한 객체생성
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<input type=hidden name="date" value=<%=sdf.format(now) %>> <%--날짜도 같이 파라미터로 넘김 대신 보이지않게 hidden타입으로 적힘 --%>
<input type=hidden name="userid" value=<%=session.getAttribute("login") %>> <%--ID도 같이 파라미터로 넘김 대신 보이지않게 hidden타입으로 적힘 --%>
</form>
<HR>
<img src="img//ulsan.jpg" width=20% height=30> <%--꼬리말 로고사진 --%>

</div>
</body>
</html>