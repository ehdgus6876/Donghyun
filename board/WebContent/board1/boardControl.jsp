<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="errorPage.jsp" import="board.Board,board.BoardBean.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="boardBean" class="board.BoardBean"/> <%--BoardBean클래스의 객체 생성 --%>
<jsp:useBean id="board" class="board.Board"/> <%--Board클래스의 객체생성 --%>
<jsp:setProperty name="board" property="*"/> <%--Board클래스의 set함수들실행--%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> controller </title>
</head>
<body>
<% 
	// 컨트롤러 요청 파라미터
	String action = request.getParameter("action");

	// 파라미터에 따른 요청 처리
	if(action.equals("list")) { // 게시판목록
		ArrayList<Board> datas = boardBean.getDBList(); //ArrayList의 객체로 DB에서 받아온 값을 받음 
		request.setAttribute("datas", datas); //DB에서 받아온 datas를 request객체로 set함
		pageContext.forward("boardList.jsp"); //boardList.jsp로 페이지 넘김
	}
	else if(action.equals("listAdmin")){
		ArrayList<Board> datas = boardBean.getDBList(); //ArrayList의 객체로 DB에서 받아온 값을 받음 
		request.setAttribute("datas", datas); //DB에서 받아온 datas를 request객체로 set함
		pageContext.forward("adminBoard.jsp"); //boardList.jsp로 페이지 넘김
	}
	
	else if(action.equals("insert")) { // 글 작성하기	
		if(boardBean.insertDB(board)) { //board값을 매개변수로 넘겨서 insertDB함수실행
			
			response.sendRedirect("boardControl.jsp?action=list"); //성공시, action값을 list로 갖고 boardControl.jsp로넘김
		}
		else //DB에 입력 실패
			throw new Exception("DB 입력오류"); 
	}
	else if(action.equals("insertAdmin")) { // 글 작성하기	
		if(boardBean.insertDB(board)) { //board값을 매개변수로 넘겨서 insertDB함수실행
			
			response.sendRedirect("boardControl.jsp?action=listAdmin"); //성공시, action값을 list로 갖고 boardControl.jsp로넘김
		}
		else //DB에 입력 실패
			throw new Exception("DB 입력오류"); 
	}
	else if(action.equals("read")){ //글 내용보기
		int number = Integer.parseInt(request.getParameter("num")); //몇번째 글을 선택했는지 번호 받는 변수
		Board read = boardBean.getDB(number); //번호를 넣어서 그 값의 DB를 읽어옴
		boardBean.count(number); //조회수 올리기
		request.setAttribute("read",read); //DB에서 받아온 read를 request객체로 set함
		pageContext.forward("boardRead.jsp"); //boardRead.jsp로 페이지 넘김

	}
	else if(action.equals("readAdmin")){ //글 내용보기
		int number = Integer.parseInt(request.getParameter("num")); //몇번째 글을 선택했는지 번호 받는 변수
		Board read = boardBean.getDB(number); //번호를 넣어서 그 값의 DB를 읽어옴
		boardBean.count(number); //조회수 올리기
		request.setAttribute("read",read); //DB에서 받아온 read를 request객체로 set함
		pageContext.forward("adminRead.jsp"); //boardRead.jsp로 페이지 넘김

	}
	
		else if(action.equals("edit")) { // 게시글 수정 페이지 요청인 경우
			int number = Integer.parseInt(request.getParameter("num"));//몇번째 글을 선택했는지 번호 받는 변수
			Board boardEdit = boardBean.getDB(number);//번호를 넣어서 그 값의 DB를 읽어옴
			String userId=boardEdit.getUserid(); //수정할 글의 작성자 id를 userId객체에 저장
			
			//작성자와 로그인한유저와 같은지 확인
			if(userId.equals(session.getAttribute("login"))){ //같으면 
				request.setAttribute("boardEdit",boardEdit); //DB에서 받아온 boardBean을 request객체로 set함
				pageContext.forward("boardEdit.jsp"); //boardEdit.jsp로 페이지 넘김
			}
			else { //다르면
				%>
				<script language="javascript">
				alert("작성하신 글이 아닙니다.");
				history.back();
				</script> <%
			} //에러 표시 자바스크립트
		}
		else if(action.equals("editAdmin")) { // 게시글 수정 페이지 요청인 경우
			int number = Integer.parseInt(request.getParameter("num"));//몇번째 글을 선택했는지 번호 받는 변수
			Board boardEdit = boardBean.getDB(number);//번호를 넣어서 그 값의 DB를 읽어옴
			String userId=boardEdit.getUserid(); //수정할 글의 작성자 id를 userId객체에 저장
			request.setAttribute("boardEdit",boardEdit); //DB에서 받아온 boardBean을 request객체로 set함
			pageContext.forward("adminEdit.jsp"); //boardEdit.jsp로 페이지 넘김
		}
		
		else if(action.equals("update")) { // 게시글 수정 등록 요청인 경우
				//수정되었는지확인
				if(boardBean.updateDB(board)) { //성공
					response.sendRedirect("boardControl.jsp?action=list"); //action값을 list로 boardControl.jsp로 넘김
				}
				else //실패
					throw new Exception("DB 갱신오류");
		}
		else if(action.equals("updateAdmin")) { // 게시글 수정 등록 요청인 경우
			//수정되었는지확인
			if(boardBean.updateDB(board)) { //성공
				response.sendRedirect("boardControl.jsp?action=listAdmin"); //action값을 list로 boardControl.jsp로 넘김
			}
			else //실패
				throw new Exception("DB 갱신오류");
	}
		else if(action.equals("delete")) { //게시글 삭제
			int number = Integer.parseInt(request.getParameter("num")); //삭제할 글 번호 받아서 number에 저장
			//number값의 글 삭제
			if(boardBean.deleteDB(number)) { //성공
				response.sendRedirect("boardControl.jsp?action=list"); //action값을 list로 boardControl.jsp로 넘김
			}
			else//실패
				throw new Exception("DB 삭제 오류");
		}
		else if(action.equals("deleteAdmin")) { //게시글 삭제
			int number = Integer.parseInt(request.getParameter("num")); //삭제할 글 번호 받아서 number에 저장
			//number값의 글 삭제
			if(boardBean.deleteDB(number)) { //성공
				response.sendRedirect("boardControl.jsp?action=listAdmin"); //action값을 list로 boardControl.jsp로 넘김
			}
			else//실패
				throw new Exception("DB 삭제 오류");
		}
	
	
	else { //action파라미터값이 없을때
		out.println("<script>alert('action 파라미터를 확인해 주세요!!!')</script>");
	}
%>
</body>
</html>