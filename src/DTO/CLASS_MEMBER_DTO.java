package com.DTO;

public class CLASS_MEMBER_DTO {
	private String email;
	private String nickname;
	private String pw;
	
	
	public CLASS_MEMBER_DTO(String email, String nickname, String pw) {
		super();
		this.email = email;
		this.nickname = nickname;
		this.pw = pw;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getPw() {
		return pw;
	}


	public void setPw(String pw) {
		this.pw = pw;
	}


	

	
	
	
	
}
