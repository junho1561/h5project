package com.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.ChatDAO;
import com.DTO.ChatDTO;
import com.DTO.ChatinfoDTO;
import com.front.Command;

public class classnameService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		
		String teacher = request.getParameter("teacher");
		String classname = request.getParameter("classname");
		
		ChatinfoDTO dto = new ChatinfoDTO( teacher, classname);
		
		ChatDAO dao = new ChatDAO();
		// 채팅방 개설 메소드
		int cnt = dao.createChatRoom(dto);
		
		if(cnt > 0) {
			System.out.println("채팅방 개설 완료");
		}else {
			System.out.println("채팅방 개설 실패");
		}
		
		return "chat.jsp?cnt="+cnt;
	}

}