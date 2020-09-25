drop table chat;
drop table chatinfo;

create table chat(
	chat_num number,
	nickname varchar2(100),
	chat varchar2(1000),
	likes number,
	chattime date default sysdate);
	
drop sequence chat_num;
create sequence chat_num start with 1 increment by 1;

select * from chat;

select * from chat order by chattime;

update chat set likes=1 where chat='test';

/////////////////////////////////////////////////////////////

create table chatinfo(
	info_num number,
	teacher varchar2(200),
	classname varchar2(200),
	info_date date);

select * from chatinfo;

drop sequence info_num;
create sequence info_num start with 1 increment by 1;

////////////////////////////////////////////////////////////

create table state_cnt(
	nickname varchar2(100) REFERENCES class_member(nickname),
	pop1 number,
	pop2 number,
	pop3 number
);

insert into state_cnt (nickname, pop1, pop2, pop3) values(
   's1',
   1,
   2,
   2
);

select * from state_cnt;
update state_cnt set pop1 =1, pop2=1, pop3=2 where nickname = 's1';


