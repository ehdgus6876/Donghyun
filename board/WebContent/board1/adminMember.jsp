<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="java.util.*, board.MemberBean.*, board.Member" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css" >
button {border:0 none;padding:0;margin:0;background:transparent;*overflow:visible;cursor:pointer;}
button::-moz-focus-inner {border:0;padding:0;}  

</style> <%--버튼 테두리 없애는 style시트 --%>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Admin member</title>
</head>
<body>
<jsp:useBean id="memberBean" class="board.MemberBean"/> <%--BoardBean클래스의 객체 생성 --%>
<jsp:setProperty name="memberBean" property="*"/> <%--Board클래스의 set함수들실행--%>

<center>

<button type="button" onclick="location.href='bigAdmin.jsp' " ><img src="img//top.png" width="900" height="100"> </button><br><br>

<font face="돋움체" color="red">관리자모드  </font>&nbsp;&nbsp; 
<button type="button" onclick="location.href='boardControl.jsp?action=listAdmin'"><img src="img//board.PNG"width="150" height="48"> </button> <%--게시판으로 이동하기위해 list값인 action파라미터를 boardControl.jsp로 넘김--%>
<button type="button" onclick="location.href='adminMember.jsp'"><img src="img//admin.png"width="150" height="48"> </button> <%--회원관리화면으로 이동 --%>
<button type="button" onclick="location.href='firstscreen.html' "><img src="img//logout.png"width="150" height="48"> </button> <%--로그아웃(첫화면으로 이동) --%>
<br>
<%ArrayList<Member> members = memberBean.getMemberList(); %>
	<table border="1"> <%--전체 회원목록 게시판 --%>
			<tr><th>아이디</th><th>비밀번호</th><th>전화번호</th><th>이메일</th><th>접속수</th><th>회원탈퇴</th></tr>
			<%
				for(Member  member : (ArrayList<Member>)members){ //ArrayList의 값을 다 받아올때 까지 반복
			%>
			  <tr>
				<td><%=member.getUserid() %></td>
				<td><%=member.getPasswd() %></td>
				<td><%=member.getTel() %></td>
				<td><%=member.getEmail() %></td>
				<td><%=member.getCount() %></td>
				<td><a href='memberControl.jsp?action=delete&admin=admin&userid=<%=member.getUserid() %>'>삭제</a></td>
			  
			  </tr>
			 <%
				}
			 %>
	</table>
	<HR>
   <img src="img//ulsan.jpg" width=20% height=30> <p>
</center>

</body>
</html>