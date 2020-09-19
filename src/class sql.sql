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
   '������ �Ķ���Ͱ� �����?',
   '�ӽŷ���',
   '������');
   
insert into question (nickname, question, classname, teacher) values(
   's1',
   '�� �ڵ尡 �� �̷��� �� �ɱ��?',
   '�ӽŷ���',
   '������');
   
insert into question (nickname, question, classname, teacher, likes, classdate) values(
   's1',
   '�� �ڵ尡 �� �̷��� �� �ɱ��?',
   '�ӽŷ���',
   '������',
   5,
   sysdate 
   );
   
insert into question (nickname, question, classname, teacher, likes, classdate) values(
   't1',
   '���� �ӽ��� ���׽�ų �� �������?',
   '�ӽŷ���',
   '������',
   100,
   sysdate 
);

select * from question;
   
   

