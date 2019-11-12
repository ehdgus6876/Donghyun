<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="board.Board, board.BoardBean.*" import="java.util.Date, java.text.*"%>
<!DOCTYPE HTML>
<html>
<head> <%--수정화면페이지 --%>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />

<script type="text/javascript">
	function delcheck() { 
		result = confirm("정말로 삭제하시겠습니까 ?");
	
		if(result == true){
			document.form1.action.value="delete";
			document.form1.submit();
		}
		else
			return;
	}
</script> <%--삭제할 것인지 확인하는 자바스크립트 함수 --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글: 수정</title>
</head>

<jsp:useBean id="boardEdit" scope="request" class="board.Board" /> <%--Board클래스의 객체생성 --%>

<body>
<div align="center">
<H2><img src="img//board1.png" width=30% height=80>  </H2> <%--게시판 로고사진 --%>
<HR>
[<a href=boardControl.jsp?action=list>목록으로</a>] <p> <%--게시판목록으로 이동링크 --%>
<form name=form1 method=post action=boardControl.jsp> <%--수정버튼누르면 값들을 boardControl.jsp로 넘김 --%>
<input type=hidden name="action" value="update"> <%--action값을 update로 넘김 --%>
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
<%Date now = new Date();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); %>
<input type=hidden name="date" value=<%=sdf.format(now) %>> <%--수정한 날짜도 넘김 --%>
<input type=hidden name="userid" value=<%=session.getAttribute("login") %>> <%--작성자id도 넘김 --%>
</form>
<HR>
<img src="img//ulsan.jpg" width=20% height=30>
</div>
</body>
</html>