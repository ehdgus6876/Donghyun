<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="board.Board, board.BoardBean.*" import="java.util.Date, java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> <%--수정화면페이지 --%>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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



<center>
<button type="button" onclick="location.href='bigAdmin.jsp' " ><img src="img//top.png" width="900" height="100"> </button><br><br>

<font face="돋움체" color="red">관리자모드  </font>&nbsp;&nbsp; 
<button type="button" onclick="location.href='boardControl.jsp?action=listAdmin'"><img src="img//board.PNG"width="150" height="48"> </button> <%--게시판으로 이동하기위해 list값인 action파라미터를 boardControl.jsp로 넘김--%>
<button type="button" onclick="location.href='adminMember.jsp'"><img src="img//admin.png"width="150" height="48"> </button> <%--회원관리화면으로 이동 --%>
<button type="button" onclick="location.href='firstscreen.html' "><img src="img//logout.png"width="150" height="48"> </button> <%--로그아웃(첫화면으로 이동) --%>
<br>

<script type="text/javascript">
	function delcheck() { 
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="deleteAdmin";
			document.form1.submit();
		}
		else
			return;
	}
</script> <%--삭제할 것인지 확인하는 자바스크립트 함수 --%>

<jsp:useBean id="boardEdit" scope="request" class="board.Board" /> <%--Board클래스의 객체생성 --%>



<div align="center">


<form name=form1 method=post action=boardControl.jsp> <%--수정버튼누르면 값들을 boardControl.jsp로 넘김 --%>
<input type=hidden name="action" value="updateAdmin"> <%--action값을 update로 넘김 --%>
<input type=hidden name="num" value=<%=boardEdit.getNum() %>> <%--선택한 숫자값도 같이 넘김 --%>

<table border="1">
  <tr>
    <th>제 목</th>
    <td><input type="text" name="title" maxlength="100" value=<%=boardEdit.getTitle() %>></td>
  </tr>
  <tr>
    <th>내 용</th>
    <td><textarea name="contents" rows="5" cols="40"><%=boardEdit.getContents() %></textarea>
    	</td>
  </tr> 
  <tr>
    <td colspan=2 align=center><input type=submit value="수정"><input type=reset value="취소"><input type="button" value="삭제" onClick="delcheck()"></td>
</tr>
</table>
[<a href=boardControl.jsp?action=listAdmin>목록으로</a>] <p> <%--게시판목록으로 이동링크 --%>
<%Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<input type=hidden name="date" value=<%=sdf.format(now) %>> <%--수정한 날짜도 넘김 --%>
<input type=hidden name="userid" value=<%=session.getAttribute("login") %>> <%--작성자id도 넘김 --%>
</form>


   <HR>
   <img src="img//ulsan.jpg" width=30% height=50> <p>
   

</div>
</center>
</body>
</html>