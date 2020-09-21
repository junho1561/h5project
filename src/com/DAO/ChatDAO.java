package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.ChatDTO;



public class ChatDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

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
				String nickname = rs.getString(1);
				String chat = rs.getString(2);
				String classname = rs.getString(3);
				String teacher = rs.getString(4);
				String chattime = rs.getString(5);
				ChatDTO dto = new ChatDTO(nickname, chat, classname, teacher, chattime);
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

	public void insert(ChatDTO dto) {

		try {
			getConnection();
			String sql = "insert into chat (nickname,chat) values(?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getNickname());
			psmt.setString(2, dto.getChat());
			psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}

	}

}
