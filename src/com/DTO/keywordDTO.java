package com.DTO;

public class keywordDTO {
	private String nickname;
	private String classname;
	private String keyword;
	
	public keywordDTO(String keyword) {
		super();
		this.keyword = keyword;
	}
	

	public keywordDTO(String nickname, String classname, String keyword) {
		super();
		this.nickname = nickname;
		this.classname = classname;
		this.keyword = keyword;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getClassname() {
		return classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
	
	
}
