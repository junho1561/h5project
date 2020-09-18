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
      String nickname = request.getParameter("nickname");
      String pw = request.getParameter("pw");
      int job = Integer.parseInt(request.getParameter("job"));
      int studentlevel = Integer.parseInt(request.getParameter("studentlevel"));

      CLASS_MEMBER_DTO dto = new CLASS_MEMBER_DTO(email, nickname, pw, job, studentlevel);
      CLASS_MEMBER_DAO dao = new CLASS_MEMBER_DAO();

      // �α��� ���� : info�ȿ� email,pw,tel,addr�� ����ְ�(null�̾ƴ�)
      // �α��� ���� : info�ȿ� null���� ������
      CLASS_MEMBER_DTO info = dao.login(dto); // dto����dao�κ����� ��ġ�ϴ»�������� info�� �ִ´�.(�̰�� �ΰ��� �ƴ�)

      String a = null;
      if (info != null) {
            System.out.println("�α��� ����");
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
            System.out.println("�α��� ����");
         }
      return a;
   }
}