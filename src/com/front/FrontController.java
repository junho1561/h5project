package com.front;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.controller.AddState;
import com.controller.JoinService;
import com.controller.LoginService;
import com.controller.LogoutService;
import com.controller.addLikes;
import com.controller.classnameService;
import com.sun.xml.internal.ws.client.SenderException;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	
	private HashMap<String, Command> map;
	
	@Override
	public void init() throws ServletException {
		map = new HashMap<String, Command>(); //
		map.put("JoinService.do", new JoinService());
		map.put("LoginService.do", new LoginService());
		map.put("LogoutService.do", new LogoutService());
		map.put("classnameService.do", new classnameService());
		map.put("AddState.do", new AddState());
	}



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("프론트 컨트롤러 실행"); //Frontcontroller : .do로 오는 모든 요청을 한곳에서 관리
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();//웹어플리케이션의 이름만 가져옴
		
		String resultURL = requestURI.substring(contextPath.length() + 1); //+1해서 슬래시까지 자름
		System.out.println(resultURL);
		
		request.setCharacterEncoding("UTF-8");
		
		Command command = map.get(resultURL);// 요청한 url을 가져와서 커멘드로 객체생성 후 해쉬맵에 put
		// command 라인 : frontcontroller에서 모든요청을 처리 -> 각 요청의 처리를 다른 servlet 클래스로 보내서 처리하게 하는 방식
		
		String moveURL = command.execute(request, response);// execute메소드를 통해 기능을 수행하고 이동할 페이지의 url값을 받아온다.
		System.out.println("꺄루리리" + moveURL);
		response.sendRedirect(moveURL);//중복
	}
	

}
