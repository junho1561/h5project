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

		String nickname = request.getParameter("nickname");
		String chat = request.getParameter("chat");
		String classname = request.getParameter("classname");
		String teacher = request.getParameter("teacher");
		String chattime = request.getParameter("chattime");
		com.DAO.ChatDAO dao = new com.DAO.ChatDAO();
		if ( nickname.length() > 0 && chat.length() > 0) {
			com.DTO.ChatDTO dto = new com.DTO.ChatDTO(nickname, chat, classname, teacher, chattime);
			dao.insert(dto);
		}
		
		ArrayList<ChatDTO> list = dao.select();
		Gson gson = new Gson();
		String value = gson.toJson(list);
		response.getWriter().print(value);

	}

}
