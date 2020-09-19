drop table class_member;

//////////////////////////////////////////


create table class_member(
email varchar2(100) primary key,
nickname varchar2(20) unique, 
pw varchar2(20) not null,
job number(10) not null,
studentlevel number(10) default 0);


select * from class_member;
select * from question where nickname = 's1';

INSERT INTO CLASS_MEMBER (email,nickname,pw,job) VALUES(
	'juhee0086@gmail.com',
	'd',
	'0086',
	'1'
);




drop table question;

CREATE TABLE question(
   nickname VARCHAR2(20),
   question VARCHAR2(3000) not null,
   classname  VARCHAR2(100) not null,
   teacher VARCHAR2(100) not null,
   likes NUMBER(20) default 0,
   classdate DATE default sysdate,
   CONSTRAINT question_nickname_fk FOREIGN KEY (nickname)
   REFERENCES class_member(nickname));
   

select * from question where nickname = 's1';
insert into question (nickname, question, classname, teacher) values(
   'd',
   '최적의 파라미터가 뭘까요?',
   '머신러닝',
   '손지영');
   
insert into question (nickname, question, classname, teacher) values(
   's1',
   '아 코드가 왜 이렇게 안 될까요?',
   '머신러닝',
   '김현진');
   
insert into question (nickname, question, classname, teacher, likes, classdate) values(
   's1',
   '아 코드가 왜 이렇게 안 될까요?',
   '머신러닝',
   '김현진',
   5,
   sysdate 
   );
   
insert into question (nickname, question, classname, teacher, likes, classdate) values(
   't1',
   '제가 머신을 러닝시킬 수 있을까요?',
   '머신러닝',
   '손지영',
   100,
   sysdate 
);

select * from question;
   
   

