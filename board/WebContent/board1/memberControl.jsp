<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.Member, board.MemberBean.*, java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="memberBean" class="board.MemberBean"/> <%-- MemberBean클래스의 객체생성 --%>
<jsp:useBean id="member" class="board.Member"/> <%-- Member클래스의 객체생성 --%>
<jsp:setProperty name="member" property="*"/> <%-- 초기화 --%>
<% 
	String action = request.getParameter("action"); // 컨트롤러 요청 파라미터

	// 파라미터에 따른 요청 처리
	
	if(action.equals("join")) {	// 회원가입
		int result=memberBean.joinUp(member); //멤버빈즈의 joinup()함수의 리턴값을 받는 result변수
		
		if(member.getUserid().equals("donghyun")){
			%>
			<script language="javascript">
 			alert("사용할 수 없는 ID입니다. \n \n 다시 입력하십시오");
 			history.back();
			</script> <%
		}
		else if(result==1){ //회원가입완료
			pageContext.forward("firstscreen.html");
			
		}
		else if(result==-2){ //등록된 id가 있을경우%>
			<script language="javascript">
 			alert("이미 등록된 ID입니다. \n \n 다시 입력하십시오");
 			history.back();
			</script> <% //오류알람뜨는 자바스크립트
		}
		else {
			%>
			<script language="javascript">
			alert("회원가입오류!");
			history.back();
		</script> <% //오류알람뜨는 자바스크립트
		}
	}
	else if(action.equals("login")){
		if(member.getUserid().equals("donghyun")&&member.getPasswd().equals("ehfhfh12")){
			session.setAttribute("login", member.getUserid()); //세션값주기
			pageContext.forward("bigAdmin.jsp"); //main.jsp로 페이지넘기기
		}
		else if(memberBean.login(member)){ //member객체를 매개변수로 넘겨주고 결과값이 true면 로그인 성공
				session.setAttribute("login", member.getUserid()); //세션값주기
				memberBean.loginCount(member);
				pageContext.forward("bigMain.jsp"); //main.jsp로 페이지넘기기
			}
			else{ //로그인실패%>
				<script language="javascript">
				alert("ID나 PASSWORD가 틀렸습니다.");
				history.back();
				</script> <% //오류알람뜨는 자바스크립트
			}
		
		
	}
	else if(action.equals("delete")){ //회원탈퇴
		String deleteID = request.getParameter("userid");
		String admin = request.getParameter("admin");
		if(memberBean.deleteUser(deleteID)){ //삭제 성공하면
			if(admin.equals("admin")){
				%>
				<script language="javascript">
				alert("회원을 탈퇴시켰습니다.");	
			</script> <%
			pageContext.forward("adminMember.jsp"); //adminMember.jsp로 페이지넘기기
			}
			else{
				%>
				<script language="javascript">
				alert("탈퇴하셨습니다.");	
			</script> <%
			pageContext.forward("userDeleteForm.html"); //main.jsp로 페이지넘기기
			}
		}
		else{ 
			//로그인실패%>
			<script language="javascript">
			alert("탈퇴하다 오류가 발생했습니다.");
			history.back();
		</script> <%//오류알람뜨는 자바스크립트
		}
	}	
%>