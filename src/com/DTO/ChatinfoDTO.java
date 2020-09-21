package com.DTO;

public class ChatinfoDTO {
	
			private int info_num;
			private String teacher;
			private String classname;
			private String info_date;
			
			
			
			public ChatinfoDTO(String teacher, String classname) {
				this.teacher = teacher;
				this.classname = classname;
			}

			public ChatinfoDTO(int info_num, String teacher, String classname, String info_date) {
				this.info_num = info_num;
				this.teacher = teacher;
				this.classname = classname;
				this.info_date = info_date;
			}
			
			public int getInfo_num() {
				return info_num;
			}
			public void setInfo_num(int info_num) {
				this.info_num = info_num;
			}
			public String getTeacher() {
				return teacher;
			}
			public void setTeacher(String teacher) {
				this.teacher = teacher;
			}
			public String getClassname() {
				return classname;
			}
			public void setClassname(String classname) {
				this.classname = classname;
			}
			public String getInfo_date() {
				return info_date;
			}
			public void setInfo_date(String info_date) {
				this.info_date = info_date;
			}
			
			
		
}
