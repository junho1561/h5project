package com.DTO;

public class CLASS_MEMBER_DTO {
	private String email;
	private String nickname;
	private String pw;
	private int job;
	private int studentlevel;
	
	
	public CLASS_MEMBER_DTO(String email, String nickname, String pw, int job, int studentlevel) {
		this.email = email;
		this.nickname = nickname;
		this.pw = pw;
		this.job = job;
		this.studentlevel = studentlevel;
	}
	
	public CLASS_MEMBER_DTO(String email, String nickname, String pw, int job) {
		this.email = email;
		this.nickname = nickname;
		this.pw = pw;
		this.job = job;
	}

	public CLASS_MEMBER_DTO(String email, String pw) {
		this.email = email;
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


	public int getJob() {
		return job;
	}


	public void setJob(int job) {
		this.job = job;
	}


	public int getStudentlevel() {
		return studentlevel;
	}


	public void setStudentlevel(int studentlevel) {
		this.studentlevel = studentlevel;
	}

	
	
	


	
	
	
	
}
