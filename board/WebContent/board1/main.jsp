<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="errorPage.jsp"%>
<jsp:useBean id="login" class="board.Member" scope="application" /> <%--Member클래스 객체로 login생성 --%>
<jsp:setProperty property="*" name="login"/> <%--set해주기--%>
<html>
<head>
<style type="text/css">
button {border:0 none;padding:0;margin:0;background:transparent;*overflow:visible;cursor:pointer;}
button::-moz-focus-inner {border:0;padding:0;}  

</style> <%--버튼 테두리 없애는 style시트 --%>

<meta charset="EUC-KR">
<title></title>

</head> 
<body> <%-- 로그인 후 메인화면 --%>
<center>

<div class="w3-content w3-section" sstyle="width: 80%; padding: 0px; margin: 0px"" >
      <img class="mySlides" src="img//mainimage.jpg" style="width: 100%">
      <img class="mySlides" src="img//mainimage1.jpg" style="width: 100%">
      <img class="mySlides" src="img//mainimage2.jpg" style="width: 100%">
      <img class="mySlides" src="img//mainimage3.jpg" style="width: 100%">
      
</div>

   <script>
      //슬라이드쇼
      var myIndex = 0;
      carousel();

      function carousel() {
         var i;
         var x = document.getElementsByClassName("mySlides");
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         myIndex++;
         if (myIndex > x.length) {
            myIndex = 1
         }
         x[myIndex - 1].style.display = "block";
         setTimeout(carousel, 2000); // Change image every 2 seconds
      }
   </script>
   
   
</center>
	
</body>
</html>