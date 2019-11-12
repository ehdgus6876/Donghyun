package board;

import java.sql.*;
import java.util.ArrayList;

public class MemberBean {

	//데이터베이스 연결관련 변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	//데이터베이스 연결관련 정보를 문자열로 선언
	String jdbc_driver = "com.mysql.jdbc.Driver";
	String jdbc_url = "jdbc:mysql://localhost/jspdb?characterEncoding=UTF-8&serverTimezone=UTC";
	
	
	void connect() { //연결함수
		try {
			Class.forName(jdbc_driver); //JDBC드라이버 로드

			conn = DriverManager.getConnection(jdbc_url,"root","ehfhfh12"); //데이터베이스 연결정보를 이용해 Connection 인스턴스 확보
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	void disconnect() { //연결끊기 함수
		if(pstmt != null) {
			try {
				pstmt.close(); //사용한 자원 반납
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} 
		if(conn != null) {
			try {
				conn.close(); //연결끊기
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean login(Member member){ //로그인함수
		connect(); //db연결
		String sql = "select * from member"; //member테이블에서 값을 가져올 sql문
		try {
				
			pstmt = conn.prepareStatement(sql); 
			ResultSet rs = pstmt.executeQuery(); //select를 수행하면 데이터정보가 ResultSet클래스의 인스턴스로 반환됨
			
			while(rs.next()){ //마지막 데이터까지 반복
				if(member.getUserid().equals(rs.getString(1))&&member.getPasswd().equals(rs.getString(2))){ //db값이랑 입력받은 값이랑 같은지 비교
					
					return true; //같으면 true리턴
				}
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return false; //틀릴경우
	}
	
	
	public void loginCount(Member member){
		
		connect(); //db연결
		String sql = "update member set count=count+1 where userid=?"; //member테이블에서 값을 가져올 sql문
		
		try {
			
			pstmt = conn.prepareStatement(sql); 
			pstmt.setString(1,member.getUserid());
			pstmt.executeUpdate();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public int joinUp(Member member) { //회원가입 함수
		connect(); //db연결
		String sql ="insert into member(userid,passwd,tel) values(?,?,?)"; //입력받은 데이터를 db로 넣을 sql문
		
		try { //Connection클래스의 인스턴스로 부터 sql문 작성을 위한 Statement준비
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,member.getUserid());
			pstmt.setString(2,member.getPasswd());
			pstmt.setString(3,member.getTel());
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			 disconnect();
	         // 아이디 중복일 시
	         if(e.getMessage().contains("Duplicate")) {
	            return -2;
	         }
	         // 그외의 문법적 오류
	         return -1;
		}
		finally { 
			disconnect();
		}
		return 1; //insert성공
	}
	
	public boolean deleteUser(String id) { //회원탈퇴함수
		connect(); //연결
		
		String sql ="delete from member where userid=?"; //userid값인 row를 삭제하는 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id); //userid값을 알려줌
			pstmt.executeUpdate(); //db를 update
		} catch (SQLException e) {
			e.printStackTrace();
			return false; //실패
		}
		finally {
			disconnect();
		}
		return true; //성공적
	}
	
	public ArrayList<Member> getMemberList() { //회원정보리스트 가져오기
		connect(); //�뿰寃�
		ArrayList<Member> members = new ArrayList<Member>(); //ArrayList생성
		
		String sql = "select * from member order by count desc"; //count별로 내림차순으로 정렬해서 보여주기
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); //select臾몄쓣 �닔�뻾�븯硫� �뜲�씠�꽣�젙蹂닿� ResultSet�겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡� 諛섑솚�맖
			while(rs.next()) { //留덉�留됰뜲�씠�꽣源뚯� 諛섎났
				Member member = new Member(); //Board�겢�옒�뒪�쓽 board媛앹껜�깮�꽦
				
				//board�쓽 �븘�뱶�뱾�쓣 set�븿
				member.setUserid(rs.getString("userid"));
				member.setPasswd(rs.getString("passwd"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				member.setCount(rs.getInt("count"));
				members.add(member); //board瑜� datas�뿉 異붽�
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return members; //datas媛앹껜 由ы꽩
	}
	public Member getMember(String userid) { //회원정보리스트 가져오기
		connect(); //�뿰寃�
		
		Member member = new Member();
		String sql = "select * from member where userid=?"; //count별로 내림차순으로 정렬해서 보여주기
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			ResultSet rs = pstmt.executeQuery(); //select臾몄쓣 �닔�뻾�븯硫� �뜲�씠�꽣�젙蹂닿� ResultSet�겢�옒�뒪�쓽 �씤�뒪�꽩�뒪濡� 諛섑솚�맖
			while(rs.next()) { //留덉�留됰뜲�씠�꽣源뚯� 諛섎났
				 //Board�겢�옒�뒪�쓽 board媛앹껜�깮�꽦
				
				//board�쓽 �븘�뱶�뱾�쓣 set�븿
				member.setUserid(rs.getString("userid"));
				member.setPasswd(rs.getString("passwd"));
				member.setTel(rs.getString("tel"));
				member.setEmail(rs.getString("email"));
				member.setCount(rs.getInt("count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return member; //datas媛앹껜 由ы꽩
	}

	
}