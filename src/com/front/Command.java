package com.front;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {//객체생성은자식에서 해서 부모인command로 업캐스팅~

	public String execute(HttpServletRequest request, HttpServletResponse response);//추상메소드는 중괄호없이 이름만 정의
	//execute는 필요하지만 내용은 다 다름, 알아서써~ 
}
