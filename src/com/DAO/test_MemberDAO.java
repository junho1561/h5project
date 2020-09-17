package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.DTO.test_MemberDTO;

public class test_MemberDAO {
	// DAO를 만드는 이유
	// 1.중복되는 코드 최소화
	// 2.보안적으로 강화하기 위해서
	// 3.DB와 관련되는 모든 코드를 작성
	
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

	private void close() { // 연결 닫아주기 (닫을 땐 열었을 때 역순)
		
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
	
	public int join (test_MemberDTO dto) { // 회원가입
		
		int cnt = 0;
		
		getConnect();
		
		try {
			String sql = "insert into test_member values(?, ?, ?, ?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			pst.setString(2, dto.getPw());
			pst.setString(3, dto.getNickname());
			pst.setString(4, dto.getCell());
			

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

	public test_MemberDTO login (test_MemberDTO dto) {

		test_MemberDTO info = null;
		
		getConnect();

		try {
			String sql = "select * from test_member where email = ? and pw = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			pst.setString(2, dto.getPw());

			rs = pst.executeQuery();

			if (rs.next()) { // rs가 next로 이동할 수 있다는 건, 로그인에 성공했다는 의미
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String nickname = rs.getString(3);
				String cell = rs.getString(4);
				int membership = rs.getInt(5);
				
				info = new test_MemberDTO (email, pw, nickname, cell, membership);
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return info;
	}
	
//	public int update(MemberDTO dto) {
//		
//		int cnt = 0; // 실행 여부 확인 (0 이상이면 실행됐다는 뜻)
//		
//		getConnect();
//		
//		try {
//			String sql = "update web_member set pw = ?, tel = ?, addr = ? where email = ?";
//			pst = conn.prepareStatement(sql);
//			pst.setString(1, dto.getPw());
//			pst.setString(2, dto.getTel());
//			pst.setString(3, dto.getAddr());
//			pst.setString(4, dto.getEmail());
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
	public ArrayList<test_MemberDTO> SelectAll() {
		ArrayList<test_MemberDTO> list = new ArrayList();
		
		try {	
			getConnect();
		
		String sql = "select * from test_member"; 
	    pst = conn.prepareStatement(sql); 
	    ResultSet rs = pst.executeQuery();
	    
		 while(rs.next()){ //rs.next 다음 값이 있는지 참/거짓
				String email = rs.getString(1);
				String pw = rs.getString(2);
				String nickname = rs.getString(3);
				String cell = rs.getString(4);
				int membership = rs.getInt(5);
				
				test_MemberDTO dto = new test_MemberDTO (email, pw, nickname, cell, membership);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	
		return list;
	}
//	}
		
		
		public int SelectMembership (String email) {

			getConnect();
			
			int cnt = 0;
			
			try {
				String sql = "select membership from test_member where email = ?";
				pst = conn.prepareStatement(sql);
				pst.setString(1, email);
				
				cnt = pst.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return cnt;
		
		}
}
