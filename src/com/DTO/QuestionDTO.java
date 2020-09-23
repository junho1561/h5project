package com.DTO;

public class QuestionDTO {
   
   private String nickname;
   private String question;
   private String classname;
   private String teacher;
   private String classdate;
   private int likes;
   
   

   public QuestionDTO(String question, int likes) {
      this.question = question;
      this.likes = likes;
   }



   public QuestionDTO(String nickname, String question, String classname, String teacher, String classdate,
         int likes) {
      super();
      this.nickname = nickname;
      this.question = question;
      this.classname = classname;
      this.teacher = teacher;
      this.classdate = classdate;
      this.likes = likes;
   }



   public QuestionDTO(String question, String classname, String teacher, String classdate, int likes) {
      super();
      this.question = question;
      this.classname = classname;
      this.teacher = teacher;
      this.classdate = classdate;
      this.likes = likes;
   }



   public String getNickname() {
      return nickname;
   }



   public void setNickname(String nickname) {
      this.nickname = nickname;
   }



   public String getQuestion() {
      return question;
   }



   public void setQuestion(String question) {
      this.question = question;
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



   public String getClassdate() {
      return classdate;
   }



   public void setClassdate(String classdate) {
      this.classdate = classdate;
   }



   public int getLikes() {
      return likes;
   }



   public void setLikes(int likes) {
      this.likes = likes;
   }
   
   
   
   
   

}