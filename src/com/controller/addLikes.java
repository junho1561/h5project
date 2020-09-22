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
 * Servlet implementation class addLikes
 */
@WebServlet("/addLikes")
public class addLikes extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int likes = Integer.parseInt(request.getParameter("likes"));
		
		com.DTO.ChatDTO dto = new com.DTO.ChatDTO(likes);
		com.DAO.ChatDAO dao = new com.DAO.ChatDAO();
		int cnt = dao.likesUpdate(dto);
		
		if (cnt > 0) {
			dao.likesUpdate(dto);
			System.out.println("likes update ����");
		}else {
			System.out.println("likes update ����");
		}
		

	}

}

