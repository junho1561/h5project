drop table chat;
drop table chatinfo;

create table chat(
	chat_num number,
	nickname varchar2(100),
	chat varchar2(1000),
	likes number,
	chattime date default sysdate,
	CONSTRAINT chat_num_pk PRIMARY KEY (chat_num));

create sequence chat_num start with 1 increment by 1;

select * from chat;

select * from chat order by chattime desc;

/////////////////////////////////////////////////////////////

create table chatinfo(
	info_num number,
	teacher varchar2(200),
	classname varchar2(200),
	info_date date,
	CONSTRAINT info_num_fk FOREIGN KEY (info_num)
    REFERENCES chat(chat_num));

select * from chatinfo;

create sequence info_num start with 1 increment by 1;


