package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.DTO.keywordDTO;

public class keywordDAO {

	private Connection conn;
	private PreparedStatement pst;
	private ResultSet rs;
	int cnt = 0;

	private void getConn() {
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

	public ArrayList<keywordDTO> keywordselect() {
        
        ArrayList<keywordDTO> keywordlist = new ArrayList<keywordDTO>();
        
        getConn();
        
        try {
           String sql = "SELECT DISTINCT keyword from keyword"; 
            pst = conn.prepareStatement(sql);
            
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
           	 
               String keyword = rs.getString(1);
               
               keywordDTO dto = new keywordDTO(keyword);
               keywordlist.add(dto);
               System.out.println(keywordlist.get(0).getKeyword());
            }
         
        } catch (Exception e) {
           e.printStackTrace();
        } finally {
           close();
        }
        return keywordlist;
        
     }
}
