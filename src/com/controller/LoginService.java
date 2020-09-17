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

		CLASS_MEMBER_DTO dto = new CLASS_MEMBER_DTO(email, nickname, pw);
		CLASS_MEMBER_DAO dao = new CLASS_MEMBER_DAO();

		// 로그인 성공 : info안에 email,pw,tel,addr이 담겨있고(null이아님)
		// 로그인 실패 : info안에 null값이 들어가있음
		CLASS_MEMBER_DTO info = dao.login(dto); // dto에서dao로보낸다 일치하는사람있으면 info에 넣는다.(이경우 널값이 아님)

		if (info != null) {
			System.out.println("로그인 성공");
			// 로그인 성공시에는 session에 info라는 name값으로 info객체를 저장해주세요.
			HttpSession session = request.getSession();
			session.setAttribute("info", info); // scope
		} else {
			System.out.println("로그인 실패");
		}
		return "mypage_s.jsp";
	}
}
