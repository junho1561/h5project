package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ChatDAO;
import com.DTO.ChatDTO;
import com.google.gson.Gson;

@WebServlet("/SelectChat")
public class SelectChat extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		com.DAO.ChatDAO dao = new ChatDAO();
		ArrayList<ChatDTO> list = dao.select();
		Gson gson = new Gson();
		String value = gson.toJson(list);
		response.getWriter().print(value);
	
	}

}
