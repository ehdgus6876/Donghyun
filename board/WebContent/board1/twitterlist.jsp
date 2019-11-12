<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("UTF-8");

	String username=request.getParameter("username");
	
	if(username!=null){
		session.setAttribute("user",username);
	}
	
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
ul#tweet{
	list-style: disc; list-style-position: inside; color:#AD46E0;
}
</style>
</head>
<body>
<div align="center">
<H2><img src="img//chatlogo.png" width=30% height=80></H2> <%-- 게시판 로고사진 --%>
<hr>
<form action="tweet.jsp" method="POST">
<%=session.getAttribute("login") %>
<input type="text" name="msg">
<input type="submit" name="Tweet">
</form>
<hr>
<div align="left">
<ul class="tweet">
<%
ArrayList<String>msgs =(ArrayList<String>)application.getAttribute("msgs");

if(msgs!=null){
 for(String msg : msgs){
  out.println("<li>"+msg+"</li>");
 }
}
%>
</ul>
</div>
</div>
</body>
</html>
