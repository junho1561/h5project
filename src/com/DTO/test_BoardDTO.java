package com.DTO;

public class test_BoardDTO {
	
	private String question;
	private String classes;
	private String teacher;
	private int likes;
	private String class_date;
	
	
	public test_BoardDTO(String question, String classes, String teacher, int likes, String class_date) {
		this.question = question;
		this.classes = classes;
		this.teacher = teacher;
		this.likes = likes;
		this.class_date = class_date;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}
	public String getTeacher() {
		return teacher;
	}
	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getClass_date() {
		return class_date;
	}
	public void setClass_date(String class_date) {
		this.class_date = class_date;
	}
	
	

	
	
}
