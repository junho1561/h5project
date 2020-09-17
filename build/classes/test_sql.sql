

CREATE TABLE test_student(
	question VARCHAR2(1000),
	class VARCHAR2(100),
	teacher VARCHAR2(100),
	likes NUMBER,
	class_date VARCHAR2(100)
);

ALTER TABLE test_student RENAME COLUMN class TO classes;

CREATE TABLE test_member(
	email VARCHAR2(100),
	pw VARCHAR2(100),
	nickname VARCHAR2(100),
	cell VARCHAR2(100)
);

INSERT INTO test_student VALUES(
	'prefix�� ������?', 
	'�ӽŷ���', 
	'������',
	15,
	'2020. 08. 27.'
);

INSERT INTO test_student VALUES(
	'���� ���ڵ��� ��Ȯ�� �����ΰ���?', 
	'�ӽŷ���', 
	'������',
	20,
	'2020. 08. 26.'
);

INSERT INTO test_student VALUES(
	'hello?', 
	'ML', 
	'JY Son',
	20,
	'2020. 08. 26.'
);

INSERT INTO test_member VALUES(
	'aaa@gmail.com', 
	'aaa', 
	'aaa',
	'aaa-aaaa'
);

select * from test_student;
select * from test_member;








