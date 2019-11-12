package board;

import java.sql.*;
import java.util.*;
import board.Board;

public class BoardBean {
	
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
	
	public boolean insertDB(Board board) { //db로 insert하는 함수
		connect(); //db연결
				
		String sql ="insert into boardlist(title,userid,contents,date) values(?,?,?,?)"; //insert하는 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			//insert해줄 ?값 채우기
			pstmt.setString(1,board.getTitle());
			pstmt.setString(2,board.getUserid());
			pstmt.setString(3,board.getContents());
			pstmt.setString(4,board.getDate());
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
	
	public boolean updateDB(Board board) { //업데이트
		connect(); //연결
		
		String sql ="update boardlist set title=?, userid=?, contents=?, date=? where num=?"; //num값인 조건인 row를 update하는 sql문	
		 
		try {
			pstmt = conn.prepareStatement(sql);
			
			//?값을 순서대로 채우기
			pstmt.setString(1,board.getTitle());
			pstmt.setString(2,board.getUserid());
			pstmt.setString(3,board.getContents());
			pstmt.setString(4,board.getDate());
			pstmt.setInt(5,board.getNum());
			pstmt.executeUpdate(); //db를 update
		} catch (SQLException e) {
			e.printStackTrace();
			return false; //실패적
		}
		finally {
			disconnect();
		}
		return true; //성공적
	}
	
	public boolean deleteDB(int num) { //삭제하기 
		connect(); //연결
		
		String sql ="delete from boardlist where num=?"; //num값인 row를 삭제하는 sql문
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num); //num값을 알려줌
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
	
	public ArrayList<Board> getDBList() { //전체 게시판 목록을 가져오는 함수
		connect(); //연결
		ArrayList<Board> datas = new ArrayList<Board>(); //ArrayList로 타입은 Board클래스인 datas객체 생성
		
		String sql = "select * from boardlist order by num desc"; //num값 순서대로 select하는 sql문
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery(); //select문을 수행하면 데이터정보가 ResultSet클래스의 인스턴스로 반환됨
			while(rs.next()) { //마지막데이터까지 반복
				Board board = new Board(); //Board클래스의 board객체생성
				
				//board의 필드들을 set함
				board.setNum(rs.getInt("num"));
				board.setTitle(rs.getString("title"));
				board.setUserid(rs.getString("userid"));
				board.setCount(rs.getInt("count"));
				board.setDate(rs.getString("date"));
				datas.add(board); //board를 datas에 추가
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return datas; //datas객체 리턴
	}
	public Board getDB(int num) { //특정 게시글을 가져오는 함수
		connect(); //연결
		
		String sql = "select * from boardlist where num=?"; //num값인 row를 가져오는 sql문
		Board board = new Board(); //Board클래스의 board객체생성
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,num); //num값을 알려줌
			ResultSet rs = pstmt.executeQuery(); //select문을 수행하면 데이터정보가 ResultSet클래스의 인스턴스로 반환됨
			
			rs.next();
			board.setNum(rs.getInt("num"));
			board.setTitle(rs.getString("title"));
			board.setUserid(rs.getString("userid"));
			board.setCount(rs.getInt("count"));
			board.setDate(rs.getString("date"));
			board.setContents(rs.getString("contents"));
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			disconnect();
		}
		return board;
	}
	public boolean count(int num){ //조회수올리는 함수
		connect(); //연결
		String countSql = "update boardlist set count=(count+1) where num=?"; //num값인 row의 count를 1증가하는 sql문
		try {
			pstmt = conn.prepareStatement(countSql);
			pstmt.setInt(1,num);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false; //실패
		}
		finally {
			disconnect();
		}
		return true; //성공
	}
	

}
