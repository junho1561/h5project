package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DTO.ChatDTO;
import com.google.gson.Gson;

/**
 * Servlet implementation class AddChat
 */
@WebServlet("/AddChat")
public class AddChat extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int chat_num = Integer.parseInt(request.getParameter("chat_num"));
		String nickname = request.getParameter("nickname");
		String chat = request.getParameter("chat");
		
		com.DAO.ChatDAO dao = new com.DAO.ChatDAO();
		
		if (chat.length() > 0) {
			com.DTO.ChatDTO dto = new com.DTO.ChatDTO(chat_num,nickname, chat, 0);
			dao.classinsert(dto);
			System.out.println("chat insert 성공");
		}else {
			System.out.println("chat insert 실패");
		}
		
		ArrayList<ChatDTO> list = dao.select();
		Gson gson = new Gson();
		String value = gson.toJson(list);
		response.getWriter().print(value);

	}

}
