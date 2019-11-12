<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="java.util.*, board.BoardBean.*, board.Board"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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




 <style>
.button {
   border: 1px solid #f74af7;
   background: #ffffff;
   background: -webkit-gradient(linear, left top, left bottom, from(#ffffff), to(#ffffff));
   background: -webkit-linear-gradient(top, #ffffff, #ffffff);
   background: -moz-linear-gradient(top, #ffffff, #ffffff);
   background: -ms-linear-gradient(top, #ffffff, #ffffff);
   background: -o-linear-gradient(top, #ffffff, #ffffff);
   background-image: -ms-linear-gradient(top, #ffffff 0%, #ffffff 100%);
   padding: 4.5px 9px;
   -webkit-border-radius: 6px;
   -moz-border-radius: 6px;
   border-radius: 6px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #d3e5f0 0 1px 0;
   color: #01090f;
   font-size: 14px;
   font-family: helvetica, serif;
   text-decoration: none;
   vertical-align: middle;
   }
.button:hover {
   border: 1px solid #ff36ff;
   text-shadow: #d6e3eb 0 1px 0;
   background: #f5a6f1;
   background: -webkit-gradient(linear, left top, left bottom, from(#e357ff), to(#f5a6f1));
   background: -webkit-linear-gradient(top, #e357ff, #f5a6f1);
   background: -moz-linear-gradient(top, #e357ff, #f5a6f1);
   background: -ms-linear-gradient(top, #e357ff, #f5a6f1);
   background: -o-linear-gradient(top, #e357ff, #f5a6f1);
   background-image: -ms-linear-gradient(top, #e357ff 0%, #f5a6f1 100%);
   color: #fff;
   }
.button:active {
   text-shadow: #cee0eb 0 1px 0;
   border: 1px solid #de56e3;
   background: #f55aed;
   background: -webkit-gradient(linear, left top, left bottom, from(#ef9bf2), to(#f5a6f1));
   background: -webkit-linear-gradient(top, #ef9bf2, #f55aed);
   background: -moz-linear-gradient(top, #ef9bf2, #f55aed);
   background: -ms-linear-gradient(top, #ef9bf2, #f55aed);
   background: -o-linear-gradient(top, #ef9bf2, #f55aed);
   background-image: -ms-linear-gradient(top, #ef9bf2 0%, #f55aed 100%);
   color: #fff;
   }
</style> <!-- 버튼 css -->


</head>
<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" /> <%-- ArrayList클래스의 객체생성 --%>
<center>
<button type="button" onclick="location.href='bigAdmin.jsp' " ><img src="img//top.png" width="900" height="100"> </button><br><br>

<font face="돋움체" color="red">관리자모드  </font>&nbsp;&nbsp; 
<button type="button" onclick="location.href='boardControl.jsp?action=listAdmin'"><img src="img//board.PNG"width="150" height="48"> </button> <%--게시판으로 이동하기위해 list값인 action파라미터를 boardControl.jsp로 넘김--%>
<button type="button" onclick="location.href='adminMember.jsp'"><img src="img//admin.png"width="150" height="48"> </button> <%--회원관리화면으로 이동 --%>
<button type="button" onclick="location.href='firstscreen.html' "><img src="img//logout.png"width="150" height="48"> </button> <%--로그아웃(첫화면으로 이동) --%>
<br>

<body>
<div align="center">  <%--가운데정렬 --%>
<H2><img src="img//board1.png" width=30% height=80></H2> <%-- 게시판 로고사진 --%>
<form name=form1 method=post action=boardControl.jsp> <%--action값을 list로 해서 boardControl.jsp로 값넘김 --%>
<input type=hidden name="action" value="listAdmin">
</form>
		<table border="1" > <%--게시판 테이블 --%>
			<tr><th>번호</th><th>제 목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
			<%
				for(Board  board : (ArrayList<Board>)datas){ //ArrayList의 값을 다 받아올때 까지 반복
			%>
			  <tr>
			   <td><a href="boardControl.jsp?num=<%=board.getNum()%>&action=readAdmin"> <%=board.getNum() %></a></td> <%--선택하면 num값과 action을 boardConrol.jsp로 넘김 --%>
				<td><%=board.getTitle() %></td>
				<td><%=board.getUserid() %></td>
				<td><%=board.getCount() %></td>
				<td><%=board.getDate() %></td>
			  </tr>
			 <%
				}
			 %>
			 
			 </table>
			 <a href="adminWrite.jsp" class="btn btn-primary pull-right">작성</a>
			 

			 
			 <tr>
			 	<td conlspan="7"><br/>
			 	<form name="search" method ="post">
			 	<select name="keyField">
			 		<option value="0"> ----선택----</option>
			 		<option value="userid">아이디</option>
			 		<option value="date">날짜</option>
			 		<option value="main">제목</option>
			 	</select>
			 	<input type="text" name="keyWord"/>
			 	<input type="button" value="검색" onClick="searchCheck(form)" />
			 	
			 	</form>
			 	</td>
			 </tr>
			 	


</div>
<HR>
  <img src="img//ulsan.jpg" width=20% height=30>
</body>
</center>

</html>