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
