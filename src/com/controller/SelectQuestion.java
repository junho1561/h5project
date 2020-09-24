package com.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.QuestionDAO;
import com.DTO.QuestionDTO;
import com.google.gson.Gson;

@WebServlet("/selectQuestion")
public class SelectQuestion extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		QuestionDAO dao = new QuestionDAO();
		ArrayList<QuestionDTO> list = dao.topQ1();
		Gson gson = new Gson();
		String value = gson.toJson(list);
		response.getWriter().print(value);
	
	}

}
