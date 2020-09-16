package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.DTO.BoardDTO;

public class BoardDAO {
	
	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	
	private void getConnect() {
	      // 1. 동적로딩
	      try {
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         
	         // 2.DB연결
	         String db_url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	         String db_id = "hr";
	         String db_pw = "hr";
	         conn = DriverManager.getConnection(db_url, db_id, db_pw);
	         
	         if (conn != null) {
	            System.out.println("연결 성공");
	         } else {
	            System.out.println("연결 실패");
	         }
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }

	private void close() { // 연결 닫아주기 (닫을 땐 열었을 때의 역순)
		
		try {
			if (rs != null) { // 열려 있을 때만 닫아야 하니까 != null
				rs.close();
			}
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
			
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}
	
//	public int upload(BoardDTO dto) {
//		
//		int cnt = 0;
//		
//		getConnect();
//		
//		try { // board_num은 시퀀스이므로 .nextval을 붙여 준다.
//			String sql = "insert into test_student values(?, ?, ?, ?, ?)";
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, dto.getQuestion());
//			pst.setString(2, dto.getClasses());
//			pst.setString(3, dto.getTeacher());
//			pst.setString(4, dto.getLikes());
//			pst.setString(5, dto.getClass_date());
//			
//			cnt = pst.executeUpdate();
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return cnt;
//	}
//	
	public ArrayList<BoardDTO> viewAll () {
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		getConnect();
		
		
		try {
			String sql = "select * from test_student";
		    pst = conn.prepareStatement(sql);
		    rs = pst.executeQuery();
		    
		    while (rs.next()) {
		    	String question = rs.getString(1);
		    	String classes = rs.getString(2);
		    	String teacher = rs.getString(3);
		    	int likes = rs.getInt(4);
		    	String class_date = rs.getString(5);
		    	
		    	BoardDTO dto = new BoardDTO(question, classes, teacher, likes, class_date);
		    	list.add(dto);
		    }
		 
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
//	public BoardDTO viewOne (int num) {
//		
//		BoardDTO dto = null;
//		
//		getConnect();
//
//		try {
//			String sql = "select * from web_board where board_num = ?";
//			pst = conn.prepareStatement(sql);
//			pst.setInt(1, num);
//
//			rs = pst.executeQuery();
//
//			if (rs.next()) {
//				int board_num = rs.getInt(1);
//				String title = rs.getString(2);
//				String writer = rs.getString(3);
//				String file_name = rs.getString(4);
//				String content = rs.getString(5);
//				String board_day = rs.getString(6);
//				
//				dto = new BoardDTO(board_num, title, writer, file_name, content, board_day);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		
//		return dto;
//	}

//	public int removeBoard (int board_num) {
//		
//		getConnect();
//		
//		int cnt = 0;
//		
//		try {
//			String sql = "delete from web_board where board_num = ?";
//			pst = conn.prepareStatement(sql);
//			pst.setInt(1, board_num);
//			
//			cnt = pst.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		return cnt;	
//		
//	}
}
