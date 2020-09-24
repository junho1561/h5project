
package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.DTO.QuestionDTO;

public class QuestionDAO {
   
   private Connection conn;
   private PreparedStatement pst;
   private ResultSet rs;
   int cnt = 0;
   
   
   
   private void getConn() {
         // 1. �����ε�
         try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            
            // 2.DB����
            String db_url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
            String db_id = "hr";
            String db_pw = "hr";
            conn = DriverManager.getConnection(db_url, db_id, db_pw);
            
            if (conn != null) {
               System.out.println("���� ����");
            } else {
               System.out.println("���� ����");
            }
            
         } catch (Exception e) {
            e.printStackTrace();
         }
      }

   private void close() { // ���� �ݾ��ֱ� (���� �� ������ ���� ����)
      
      try {
         if (rs != null) { // ���� ���� ���� �ݾƾ� �ϴϱ� != null
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
   
   
      
   public ArrayList<QuestionDTO> viewQ(String nickname) {
      
      ArrayList<QuestionDTO> list = new ArrayList<QuestionDTO>();
      
      getConn();
      
      try {
         String sql = "select * from question where nickname = ?"; 
          pst = conn.prepareStatement(sql);
          
          pst.setString(1, nickname);
          
          ResultSet rs = pst.executeQuery();
          while (rs.next()) {
             String question = rs.getString(2);
//             System.out.println("��" + question);
             String classname = rs.getString(3);
             String teacher = rs.getString(4);
             String classdate = rs.getString(5);
             int likes = rs.getInt(6);
             
             QuestionDTO dto = new QuestionDTO(question, classname, teacher, classdate, likes);
             list.add(dto);
          }
       
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         close();
      }
      return list;
      
   }
   
   public ArrayList<QuestionDTO> topQ1() {
         
         ArrayList<QuestionDTO> list = new ArrayList<QuestionDTO>();
         
         getConn();
         
         try {
            String sql = "SELECT DISTINCT question FROM questions"; 
             pst = conn.prepareStatement(sql);
             
             ResultSet rs = pst.executeQuery();
             
             while (rs.next()) {
            	 
                String question = rs.getString(1);
                
                QuestionDTO dto = new QuestionDTO(question);
                list.add(dto);
             }
          
         } catch (Exception e) {
            e.printStackTrace();
         } finally {
            close();
         }
         return list;
         
      }


}