package com.DTO;

public class ChatDTO {
	private int chat_num;
	private String nickname;
	private String chat;
	private int likes;
	private String chattime;
	
	
	
	public ChatDTO(int likes) {
		this.likes = likes;
	}

	public ChatDTO(int chat_num, String nickname, String chat, int likes) {
		this.chat_num = chat_num;
		this.nickname = nickname;
		this.chat = chat;
		this.likes = likes;
	}

	public ChatDTO(int chat_num, String nickname, String chat, int likes, String chattime) {
		this.chat_num = chat_num;
		this.nickname = nickname;
		this.chat = chat;
		this.likes = likes;
		this.chattime = chattime;
	}
	
	
	
	public int getChat_num() {
		return chat_num;
	}
	public void setChat_num(int chat_num) {
		this.chat_num = chat_num;
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
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getChattime() {
		return chattime;
	}
	public void setChattime(String chattime) {
		this.chattime = chattime;
	}
	
	
	

}