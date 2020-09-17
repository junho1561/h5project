package com.DTO;

public class test_MemberDTO {
	
	private String email;
	private String pw;
	private String nickname;
	private String cell;
	private int membership;
	
	public test_MemberDTO(String email, String pw, String nickname, String cell, int membership) {
		this.email = email;
		this.pw = pw;
		this.nickname = nickname;
		this.cell = cell;
		this.membership = membership;
	}
	
	public test_MemberDTO(String email) {
		this.email = email;
	}

	


	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getCell() {
		return cell;
	}
	public void setCell(String cell) {
		this.cell = cell;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
	

	
}
