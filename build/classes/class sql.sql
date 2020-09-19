drop table class_member;

//////////////////////////////////////////


create table class_member(
email varchar2(100) primary key,
nickname varchar2(20) unique, 
pw varchar2(20) not null,
job number(10) not null,
studentlevel number(10) default 0);


select * from class_member;


INSERT INTO CLASS_MEMBER (email,nickname,pw,job) VALUES(
	'juhee0086@gmail.com',
	'd',
	'0086',
	'1'
);


CREATE TABLE question(
question_seq NUMBER,
nickname VARCHAR2(100) NOT NULL, 
question VARCHAR2(3000) NOT NULL,
class VARCHAR2(100) NOT NULL,
teacher VARCHAR2(100) DEFAULT 0,
likes INT,
classdate DATE,
CONSTRAINT question_question_seq_pk PRIMARY KEY(question_seq),
CONSTRAINT question_nickname_fk FOREIGN KEY(nickname) REFERENCES class_member(nickname) 
);

SELECT * FROM question;



