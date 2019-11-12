<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="board.BoardBean.*, board.Board"%>



<!DOCTYPE HTML>

<html>
<head> <%-- 게시글 내용보기 --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:useBean id="read" scope="request" class="board.Board" /> <%-- Board클래스의 객체read생성 --%>
<title></title>


<link rel="stylesheet" href="board.css" type="text/css" media="screen" />
</head>
<body>

<div align="center">
<H2><img src="img//board1.png" width=30% height=80></H2> <%-- 게시판 로고사진 --%>
<HR>
[<a href=boardControl.jsp?action=list>목록으로</a>] <P> <%-- 게시판목록으로 가는 링크 --%>
<form name=form1 method=post action="boardControl.jsp"> <%--수정버튼을누르면 boardControl.jsp로이동 --%>
<input type=hidden name="action" value="edit"> <%-- action값을 edit로 넘김 --%>
<input type=hidden name="num" value=<%=read.getNum() %> > <%-- 몇번째 글을 보는 중인지 번호 넘김 --%>
<table border="1"> <%-- 게시글 내용 테이블 --%>
  <tr>
    <th>제 목</th>
    <td><%=read.getTitle() %></td>
  </tr>
  <tr>
    <th>작성자</th>
    <td><%=read.getUserid() %></td>
  </tr>
  <tr>
    <th>내 용</th>
    <td><%=read.getContents() %></td>
  </tr>  
  <tr>
    <th>작성일</th>
    <td><%=read.getDate() %></td>
  </tr> 
  <tr>
    <td colspan=2 align=center><input type=submit value="수정"><input type=reset value="취소"></td>
</tr>
</table>


<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>답글</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table>
     <tr>
      <td>&nbsp;</td>
      <td align="center">제목</td>
      <td><input name="subject" size="50" maxlength="100"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">이름</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
    <tr>
      <td>&nbsp;</td>
      <td align="center">비밀번호</td>
      <td><input name="name" size="50" maxlength="50"></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr>
      <td>&nbsp;</td>
      <td align="center">내용</td>
      <td><textarea name="contents" cols="50" rows="13"></textarea></td>
      <td>&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4"></td></tr>
     <tr align="center">
      <td>&nbsp;</td>
      <td colspan="2"><input type=button value="등록">
       <input type=button value="취소">
      <td>&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>

        </form>    
          </div>





</body>
</html>