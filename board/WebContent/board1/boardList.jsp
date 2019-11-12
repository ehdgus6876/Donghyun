<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="java.util.*, board.BoardBean.*, board.Board"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<!DOCTYPE HTML>
<html>
<head> <%-- 게시판 목록 출력 페이지 --%>
<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="../widget-scroller.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
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
<script type="text/javascript">
   $(document).ready(function(){ 
      $("#gcTable").tablesorter();
   });
</script>

<jsp:useBean id="datas" scope="request" class="java.util.ArrayList" /> <%-- ArrayList클래스의 객체생성 --%>

<body>
<div align="center">  <%--가운데정렬 --%>

<form name=form1 method=post action=boardControl.jsp> <%--action값을 list로 해서 boardControl.jsp로 값넘김 --%>
<input type=hidden name="action" value="list">
</form>

		<table id="gcTable" class="tablesorter" border="1" > <%--게시판 테이블 --%>
			<tr><th>번호</th><th>제 목</th><th>작성자</th><th>조회수</th><th>작성일</th></tr>
			<%
				for(Board  board : (ArrayList<Board>)datas){ //ArrayList의 값을 다 받아올때 까지 반복
			%>
			  <tr>
			   <td><a href="boardControl.jsp?num=<%=board.getNum()%>&action=read"> <%=board.getNum() %></a></td> <%--선택하면 num값과 action을 boardConrol.jsp로 넘김 --%>
				<td><%=board.getTitle() %></td>
				<td><%=board.getUserid() %></td>
				<td><%=board.getCount() %></td>
				<td><%=board.getDate() %></td>
			  </tr>
			 <%
				}
			 %>
	
		</table>
	<br>
  	
    <!--  검색 부분 -->
    <br>
    <div id="searchForm">
        <form>
            <select name="opt">
                <option value="0">제목</option>
                <option value="1">내용</option>
                <option value="2">제목+내용</option>
                <option value="3">글쓴이</option>
            </select>
            <input type="text" size="20" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
    </div>
</div>    
 <p><button type="button" class="button" onclick="location='boardWriting.jsp'">작성</button> <%-- 글작성페이지로 이동링크 --%>
<img src="img//ulsan.jpg" width=20% height=30> <%--꼬리말 로고사진 --%>
</body>
</html>



