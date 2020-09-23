package com.DTO;

public class StateDTO {
	
	private String nickname;
	private int pop1;
	private int pop2;
	private int pop3;
	
	
	public StateDTO(String nickname, int pop1, int pop2, int pop3) {
		this.nickname = nickname;
		this.pop1 = pop1;
		this.pop2 = pop2;
		this.pop3 = pop3;
	}
	
	public StateDTO(int pop1, int pop2, int pop3) {
		this.pop1 = pop1;
		this.pop2 = pop2;
		this.pop3 = pop3;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPop1() {
		return pop1;
	}
	public void setPop1(int pop1) {
		this.pop1 = pop1;
	}
	public int getPop2() {
		return pop2;
	}
	public void setPop2(int pop2) {
		this.pop2 = pop2;
	}
	public int getPop3() {
		return pop3;
	}
	public void setPop3(int pop3) {
		this.pop3 = pop3;
	}
	
}
