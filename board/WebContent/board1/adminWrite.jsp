<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="java.util.*, board.BoardBean.*, board.Board,java.util.Date, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="text/html", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<title></title>
 <style>
.mySlides {
   display: none;
   text-align: center;
}
</style>

<style type="text/css" >
button {border:0 none;padding:0;margin:0;background:transparent;*overflow:visible;cursor:pointer;}
button::-moz-focus-inner {border:0;padding:0;}  

</style> <%--버튼 테두리 없애는 style시트 --%>
<body>




<br>


</head>
<body>
<center>
<button type="button" onclick="location.href='bigAdmin.jsp' " ><img src="img//top.png" width="900" height="100"> </button><br><br>

<font face="돋움체" color="red">관리자모드  </font>&nbsp;&nbsp; 
<button type="button" onclick="location.href='boardControl.jsp?action=listAdmin'"><img src="img//board.PNG"width="150" height="48"> </button> <%--게시판으로 이동하기위해 list값인 action파라미터를 boardControl.jsp로 넘김--%>
<button type="button" onclick="location.href='adminMember.jsp'"><img src="img//admin.png"width="150" height="48"> </button> <%--회원관리화면으로 이동 --%>
<button type="button" onclick="location.href='firstscreen.html' "><img src="img//logout.png"width="150" height="48"> </button> <%--로그아웃(첫화면으로 이동) --%>
<br>

<div align="center">
<H2><img src="img//board1.png" width=50% height=90> </H2>
<form name=form1 method=post action=boardControl.jsp> <%-- 입력받은 값을 boardControl.jsp로 넘김 --%>
<input type=hidden name="action" value="insertAdmin"> <%-- action파라미터는 insert값을 가지고 넘김 --%>
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
[<a href=boardControl.jsp?action=listAdmin>목록으로</a>] <P> <%-- 목록으로 가는 링크 --%>
<%Date now = new Date(); //날짜를 위한 객체생성
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<input type=hidden name="date" value=<%=sdf.format(now) %>> <%--날짜도 같이 파라미터로 넘김 대신 보이지않게 hidden타입으로 적힘 --%>
<input type=hidden name="userid" value=<%=session.getAttribute("login") %>> <%--ID도 같이 파라미터로 넘김 대신 보이지않게 hidden타입으로 적힘 --%>
</form>


</div>

 	
   <HR>
 <img src="img//ulsan.jpg" width=20% height=30> <%--꼬리말 로고사진 --%>
   


</center>
</body>
</html>