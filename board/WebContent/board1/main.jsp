<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" errorPage="errorPage.jsp"%>
<jsp:useBean id="login" class="board.Member" scope="application" /> <%--MemberŬ���� ��ü�� login���� --%>
<jsp:setProperty property="*" name="login"/> <%--set���ֱ�--%>
<html>
<head>
<style type="text/css">
button {border:0 none;padding:0;margin:0;background:transparent;*overflow:visible;cursor:pointer;}
button::-moz-focus-inner {border:0;padding:0;}  

</style> <%--��ư �׵θ� ���ִ� style��Ʈ --%>

<meta charset="EUC-KR">
<title></title>

</head> 
<body> <%-- �α��� �� ����ȭ�� --%>
<center>

<div class="w3-content w3-section" sstyle="width: 80%; padding: 0px; margin: 0px"" >
      <img class="mySlides" src="img//mainimage.jpg" style="width: 100%">
      <img class="mySlides" src="img//mainimage1.jpg" style="width: 100%">
      <img class="mySlides" src="img//mainimage2.jpg" style="width: 100%">
      <img class="mySlides" src="img//mainimage3.jpg" style="width: 100%">
      
</div>

   <script>
      //�����̵��
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