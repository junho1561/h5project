drop table class_member;

//////////////////////////////////////////

CREATE TABLE class_member(
email varchar2(100) unique,
nickname varchar2(20), 
pw varchar2(20) not null,
job number(10) not null,
studentlevel number(10) default 0,
CONSTRAINT class_nickname PRIMARY KEY (nickname));
   


select * from class_member;


INSERT INTO CLASS_MEMBER (email, nickname, pw, job) VALUES(
   'juhee0086@gmail.com',
   'd',
   '0086',
   '2');
INSERT INTO CLASS_MEMBER (email, nickname, pw, job) VALUES(
   '11',
   '1',
   '1111',
   '1');

///////////////////////////////////////////

drop table question;

--CREATE TABLE question(
--   nickname VARCHAR2(20),
--   question VARCHAR2(3000) not null,
--   classname  VARCHAR2(100) not null,
--   teacher VARCHAR2(100) not null,
--   classdate VARCHAR2(100) not null,
--   likes NUMBER(20) default 0)

CREATE TABLE question(
   nickname VARCHAR2(20),
   question VARCHAR2(3000) not null,
   classname VARCHAR2(100) not null,
   teacher VARCHAR2(100) not null,
   classdate VARCHAR2(100) not null,
   likes NUMBER(20),
   CONSTRAINT question_nickname_fk FOREIGN KEY (nickname)
   REFERENCES class_member(nickname));
   
select * from question;

insert into question (nickname, question, classname, teacher) values(
   'd',
   '최적의 파라미터가 뭘까요?',
   '머신러닝',
   '손지영');

insert into question (nickname, question, classname, teacher, classdate, likes) values(
   '1',
   'test question',
   'test classname',
   'test teacher',
   sysdate,
   0
   );
////////////////////////////////////////

drop table chat;

--CREATE TABLE chat(
--   nickname VARCHAR2(20) ,
--   chat VARCHAR2(3000) not null,
--   classname  VARCHAR2(100) not null,
--   teacher VARCHAR2(100) ,
--   chattime DATE default sysdate)
  

CREATE TABLE chat(
   nickname VARCHAR2(20) ,
   chat VARCHAR2(3000) not null,
   classname  VARCHAR2(100) not null,
   teacher VARCHAR2(100) ,
   chattime DATE default sysdate,
   CONSTRAINT chat_nickname_fk FOREIGN KEY (nickname)
   REFERENCES class_member(nickname));
   
insert into chat (nickname, chat, classname, teacher) values(
   'd',
   'test',
   '머신러닝',
   '손지영'
   );
   
insert into chat (nickname, chat, classname, teacher) values(
   '11',
   'test',
   'testclassname',
   'testteacher'
   );
   
select * from chat;

select * from chat order by chattime desc;

////////////////////////////////////////////

drop table keyword;

CREATE TABLE keyword(
   nickname VARCHAR2(20),
   title VARCHAR2(100),
   keyword  VARCHAR2(100),
   CONSTRAINT keyword_nickname_fk FOREIGN KEY (nickname)
    REFERENCES class_member(nickname));
    
insert into keyword (nickname, title, keyword) values(
   'd',
   'test',
   'test');

select * from keyword;
