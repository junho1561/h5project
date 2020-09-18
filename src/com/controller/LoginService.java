package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CLASS_MEMBER_DAO;
import com.DTO.CLASS_MEMBER_DTO;
import com.front.Command;

public class LoginService implements Command{
   
   public String execute(HttpServletRequest request, HttpServletResponse response) {

      String email = request.getParameter("email");
      String pw = request.getParameter("pw");
      
      
      CLASS_MEMBER_DTO dto = new CLASS_MEMBER_DTO(email, pw);
      CLASS_MEMBER_DAO dao = new CLASS_MEMBER_DAO();

      CLASS_MEMBER_DTO info = dao.login(dto); // dto에서dao로보낸다 일치하는사람있으면 info에 넣는다.(이경우 널값이 아님)

      String a = null;
      if (info != null) {
            System.out.println("로그인 성공");
            if(info.getJob() == 1) {
               HttpSession session = request.getSession();
               session.setAttribute("info", info); // scope
               a = "mypage_t.jsp";
            }else if(info.getJob() == 2){
               HttpSession session = request.getSession();
               session.setAttribute("info", info); // scope
               a =  "mypage_s.jsp";
            }
         } else {
            System.out.println("로그인 실패");
         }
      return a;
   }
}