/*
��ȣ, �̸�, �ֹι�ȣ, ����, �÷�, �̸���, �Է�����
������ �� �ִ� class4_info ���̺��� �����ϼ���.
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

--������ ���̺��� ���� ����: sqlplus��
desc Class4_info;

--������ ���̺� �� ��ȸ: SQL��
select tname from tab;

