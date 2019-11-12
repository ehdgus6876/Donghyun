<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<button type="button" onclick="location.href='bigMain.jsp' " ><img src="img//top.png" width="900" height="100"> </button><br><br>

user: <%=session.getAttribute("login") %>님 현재접속자수: <%=application.getAttribute("nowUser") %>  &nbsp;&nbsp; <%--로그인유저알려줌(세션값으로 설정된값을 받아옴) --%> <a href="memberControl.jsp?action=delete&admin=notadmin&userid=<%=session.getAttribute("login")%>"></a>

<button type="button" onclick="javascript:document.getElementById('main').src='about.html';"><img src="img//info.PNG"width="150" height="50"> </button> <%--서비스화면으로 이동 --%>
<button type="button" onclick="javascript:document.getElementById('main').src='twitterlist.jsp';"><img src="img//chat.png"width="150" height="48"> </button>
<button type="button" onclick="javascript:document.getElementById('main').src='boardControl.jsp?action=list '"><img src="img//board.PNG"width="150" height="48"> </button> <%--게시판으로 이동하기위해 list값인 action파라미터를 boardControl.jsp로 넘김--%>
<button type="button" onclick="location.href='firstscreen.html' "><img src="img//logout.png"width="150" height="48"> </button> <%--로그아웃(첫화면으로 이동) --%>
<br>

<iframe id="main" src="main.jsp" scrolling=no name=ce width=100% height=800 frameborder=0 style="border-width:0px; border-color:white; border-style:solid;">
 </iframe>
 
<HR>
<img src="img//ulsan.jpg" width=20% height=30> <p>



</center>


</body>
</html>