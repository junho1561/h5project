
create table chatinfo(
	info_num number,
	teacher varchar2(200),
	classname varchar2(200),
	info_date date
)

create sequence info_num start with 1 increment by 1;

create table chat(
	chat_num number,
	nickname varchar2(100),
	chat varchar2(1000),
	likes number,
	chattime date
)

create sequence chat_num start with 1 increment by 1;

drop table chat;

select * from chat;