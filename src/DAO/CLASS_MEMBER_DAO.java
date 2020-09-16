package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import com.DTO.CLASS_MEMBER_DTO;

public class CLASS_MEMBER_DAO {
	// DAO를 만드는 이유
	// 1. 중복되는 코드를 최소화하기 위해서(유지보수수월)
	// 2. 보안적으로 강화하기 위해서
	// 3. DB와 관련되는 모든 코드를 작성

	private Connection conn = null;
	private PreparedStatement pst = null;
	private ResultSet rs = null;
	int cnt = 0;

	private void getConn() {
		try {
			 Class.forName("oracle.jdbc.driver.OracleDriver");
	         // 2.DB연결
	         String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
	         String user_id = "hr";
	         String user_pw = "hr";
	         conn = DriverManager.getConnection(url, user_id, user_pw);
	         if (conn != null) {
	            System.out.println("연결 성공");
	         } else {
	            System.out.println("연결 실패");
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	}

	private void close() {
		try {
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

	public int Join(CLASS_MEMBER_DTO dto) {
		try {
			getConn();
			String sql = "insert into class_member values(?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			pst.setString(2, dto.getNickname());
			pst.setString(3, dto.getPw());

			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}
	
	public CLASS_MEMBER_DTO login(CLASS_MEMBER_DTO dto) {
		getConn();//connection
		
		CLASS_MEMBER_DTO info= null;
		try {
			String sql = "select * from  class_member where email=? and pw=?";
			
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getEmail());
			pst.setString(2, dto.getPw());
			
			rs = pst.executeQuery();
			
			while(rs.next()) { //커서가이동할수있다는 것은 로그인에 성공을 했다는것
				String email = rs.getString(1);//"email" => column명으로 써도 됨
				String nickname = rs.getString(2);
				String pw = rs.getString(2);
				
				
				info = new CLASS_MEMBER_DTO(email, nickname, pw);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(); //닫기
		}
		return info;
	}
	

	public int Delete(String id) {
		// DeleteCheck에 있는 JDBC코드를 현재 메소드로 분리

		try {
			getConn();

			String sql = "delete from web_member where id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int Update(String id, String update, String update_con) {

		try {
			getConn();

			String sql = "";
			if (update.equals("PW")) {
				sql = "update web_member set pw=? where id=?";
			} else if (update.equals("NICK")) {
				sql = "update web_member set nick=? where id=?";
			}

			pst = conn.prepareStatement(sql);
			pst.setString(1, update_con);
			pst.setString(2, id);

			cnt = pst.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;

	}

	

	public CLASS_MEMBER_DTO SelectOne(String id) {

		CLASS_MEMBER_DTO dto = null;

		try {
			getConn();

			String sql = "select * from web_member where id = ?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);

			ResultSet rs = pst.executeQuery();
			// executeUpdate = > insert/update/delete
			// 리턴되는 값 : 명령에 성공한 횟수
			// executeUpdate = > select
			// 리턴되는 값 : 검색된 데이터

			while (rs.next()) { // 이동하면서 아무것도 없는 값을 만나면 false를 넘겨준다.(while문 종료)
				String getid = rs.getString(1);
				String pw = rs.getString(2);
				String nick = rs.getString(3);

				dto = new CLASS_MEMBER_DTO(getid, pw, nick);

			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	
	public ArrayList<CLASS_MEMBER_DTO> SelectAll() {
		ArrayList<CLASS_MEMBER_DTO> list = new ArrayList<CLASS_MEMBER_DTO>();
		
		getConn();
		
		String sql = "select * from web_member";
		
		try {
			pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery(); //ResultSet은 항상 컬럼을 가리키고있다.
			
			while(rs.next()){ //이동하면서 아무것도 없는 값을 만나면 false를 넘겨준다.(while문 종료)
				String id = rs.getString(1);				
				String pw = rs.getString(2);				
				String nick = rs.getString(3);
				CLASS_MEMBER_DTO dto = new CLASS_MEMBER_DTO(id, pw, nick);
				list.add(dto);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		
		return list;
	}

	
}
