package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.StateDTO;

public class StateDAO {
	
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	int cnt =0;
	
	
	private void getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
			String db_id = "hr";
			String db_pw = "hr";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void close() {
		try {
			if (rs != null)
				rs.close();
			if (psmt != null)
				psmt.close();
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int stateCnt(StateDTO dto) {
		getConnection();
		
		try {
			String sql = "update state_cnt set pop1 = ?, pop2 = ?, pop3 = ? where nickname = ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getPop1());
			psmt.setInt(2, dto.getPop2());
			psmt.setInt(3, dto.getPop3());
			psmt.setString(4, dto.getNickname());
			
			cnt = psmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

}
