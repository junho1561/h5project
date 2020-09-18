package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.CLASS_MEMBER_DAO;
import com.DTO.CLASS_MEMBER_DTO;
import com.front.Command;

public class JoinService implements Command{

	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//controller에있는 로그인기능 옮겨줌->회원가입할때 이제 frontController에서 실행됨 (join서블릿하나 줄어듬)
		String email = request.getParameter("email");
		String nickname = request.getParameter("nickname");
		String pw = request.getParameter("pw");
		int job = Integer.parseInt(request.getParameter("job"));
//		int studentlevel = Integer.parseInt(request.getParameter("studentlevel"));
		
		
		CLASS_MEMBER_DTO dto = new CLASS_MEMBER_DTO(email, nickname, pw, job);
		CLASS_MEMBER_DAO dao = new CLASS_MEMBER_DAO();
		int cnt = dao.Join(dto);	
		
		if(cnt>0) {
			System.out.println("회원가입 성공");
		}else {
			System.out.println("회원가입 실패");
		}
		return "Login.jsp";// 주소를 리턴 
	}

	
}
