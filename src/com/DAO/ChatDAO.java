package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.ChatDTO;
import com.DTO.ChatinfoDTO;



public class ChatDAO {

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

	public ArrayList<ChatDTO> select() {
		ArrayList<ChatDTO> list = new ArrayList<ChatDTO>();

		getConnection();
		String sql = "select * from chat order by chattime desc";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				int chat_num = rs.getInt(1);
				String nickname = rs.getString(2);
				String chat = rs.getString(3);
				int likes = rs.getInt(4);
				String chattime = rs.getString(5);
				ChatDTO dto = new ChatDTO(chat_num, nickname, chat, likes, chattime);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

		return list;
	}

	public int classinsert(ChatDTO dto) {
		try {
			getConnection();
			String sql = "insert into chat values(?,?,?,?,sysdate)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getChat_num());
			psmt.setString(2, dto.getNickname());
			psmt.setString(3, dto.getChat());
			psmt.setInt(4, dto.getLikes());
			
			cnt = psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return cnt;
	}

	public int createChatRoom(ChatinfoDTO dto) {
		getConnection();
		
		String sql = "insert into chatinfo values(info_num.nextval, ?, ?, sysdate)";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getTeacher());
			psmt.setString(2, dto.getClassname());
			cnt = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	public int likesUpdate(ChatDTO dto) {
		getConnection();
		
		try {
			String sql = "update chat set likes=? where chat like ?";
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, dto.getLikes());
			psmt.setString(2, dto.getChat());
			
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
