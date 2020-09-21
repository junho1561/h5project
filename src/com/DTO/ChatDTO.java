package com.DTO;

public class ChatDTO {
	private String nickname;
	private String chat;
	private String classname;
	private String teacher;
	private String chattime;
	
	public ChatDTO(String nickname, String chat, String classname, String teacher, String chattime) {
		this.nickname = nickname;
		this.chat = chat;
		this.classname = classname;
		this.teacher = teacher;
		this.chattime = chattime;
	}
	public ChatDTO(String nickname, String chat) {
		this.nickname = nickname;
		this.chat = chat;
	}
	

	
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getChat() {
		return chat;
	}

	public void setChat(String chat) {
		this.chat = chat;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getChattime() {
		return chattime;
	}

	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
	
	
	
}