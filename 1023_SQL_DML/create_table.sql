/*
번호, 이름, 주민번호, 나이, 시력, 이메일, 입력일을
저장할 수 있는 class4_info 테이블을 생성하셈여.
*/



create table Class4_info(
	num number(4),
	name varchar2(15),
	ssn char(14),
	age number(3),
	eye number(3,2),
	mail varchar2(50),
	input_date date
);


DROP TABLE CLASS4_INFO;
PURGE RECYCLEBIN;

--생성된 테이블의 구조 보기: sqlplus문
desc Class4_info;

--생성된 테이블 명 조회: SQL문
select tname from tab;

